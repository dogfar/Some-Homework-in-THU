#include "rip.h"
#include "router.h"
#include "router_hal.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <vector>
using namespace std;

extern vector<RoutingTableEntry> r;
extern bool validateIPChecksum(uint8_t *packet, size_t len);
extern unsigned int givechecksum(uint8_t *packet, size_t len);
extern void update(bool insert, RoutingTableEntry entry);
extern bool query(uint32_t addr, uint32_t *nexthop, uint32_t *if_index, uint32_t *metric);
extern bool forward(uint8_t *packet, size_t len);
extern uint32_t bigtosmall(uint32_t x);
extern bool disassemble(const uint8_t *packet, uint32_t len, RipPacket *output);
extern uint32_t assemble(const RipPacket *rip, uint8_t *buffer);
extern vector<RoutingTableEntry> r;

uint32_t calmask(uint32_t len) {
	if (len == 32)
		return 0xffffffff;
	else if (len == 0){
		return 0;
	}
	return bigtosmall(~((1 << (32-len)) - 1));
}
void filloutput(uint8_t *output, uint32_t total_length) {
	output[0] = 0x45, output[1] = 0x00;
	output[2] = total_length >> 2;
	output[3] = total_length & 0x3;
	output[4] = output[5] = 0;
	output[6] = output[7] = 0;
	output[8] = 0x01;
	output[9] = 0x11;
	output[20] = 0x02 = output[22] = 0x02;
	output[21] = 0x08 = output[23] = 0x08;
	output[26] = output[27] = 0;
}
void filladdr(uint8_t *output, in_addr_t src, in_addr_t dest) {
	for(i = 0; i < 4; i++){
		output[12+i] = (src >> (i * 8)) & 0xff;
		output[16+i] = (dest >> (i * 8)) & 0xff;
	}
}
uint8_t packet[2048];
uint8_t output[2048];
in_addr_t addrs[N_IFACE_ON_BOARD] = {0x0103a8c0, 0x0101a8c0, 0x0102000a, 0x0103000a};
int main(int argc, char *argv[]) {
	int res = HAL_Init(1, addrs);
	if (res < 0) {
		return res;
	}
	for (uint32_t i = 0; i < N_IFACE_ON_BOARD; i++) {
		RoutingTableEntry entry = {
			.addr = addrs[i], // big endian
			.len = 24,        // small endian
			.if_index = i,    // small endian
			.nexthop = 0,      // big endian, means direct
			.metric = bigtosmall(1u)
		};
		update(true, entry);
	}
	for (uint32_t k = 0; k < N_IFACE_ON_BOARD; k++) {
		RipPacket rip;
		macaddr_t dest_mac;
		rip.command = rip.numEntries = 1;
		rip.entries[0].addr = rip.entries[0].mask = 0;
		rip.entries[0].metric = bigtosmall(16u);
		rip.entries[0].nexthop = 0;
		uint32_t total_length = 32 + rip.numEntries * 20;
		filloutput(output, total_length);
		filladdr(output, addrs[k], 0x090000e0);
		unsigned int checksum = givechecksum(output, total_length);
		output[10] = checksum & 0xff;
		output[11] = ((checksum & 0xff00) >> 8);
		output[24] = (total_length - 20) >> 2;
		output[25] = (total_length - 20) & 0x3;
		uint32_t rip_len = assemble(&rip, &output[28]);
		if (!(HAL_ArpGetMacAddress(k, 0x090000e0, dest_mac)))
			HAL_SendIPPacket(k, output, rip_len + 28, dest_mac);
		else{
			printf("dsc not found\n");
		}
	}
	uint64_t last_time = 0;
	while (1) {
		uint64_t time = HAL_GetTicks();
		if (time > last_time + 5 * 1000) {
			for (uint32_t k = 0; k < N_IFACE_ON_BOARD; k++) {
				bool cutpatch = false;
				int patchindex = 0;
				while (!cutpatch) {
					RipPacket rip;
					macaddr_t dest_mac;
					rip.command = 2;
					rip.numEntries = 0;
					for (int i = patchindex; i < r.size(); i++) {
						if (i == r.size() - 1)
							cutpatch = true;
						if (r[i].if_index == k)
							continue;
						else {
							rip.entries[rip.numEntries].metric = r[i].metric;
							rip.entries[rip.numEntries].nexthop = r[i].nexthop;
							rip.entries[rip.numEntries].addr = r[i].addr & calmask(r[i].len);
							rip.entries[rip.numEntries].mask = calmask(r[i].len);
							rip.numEntries++;
							if (rip.numEntries == 25) {
								patchindex = i + 1;
								break;
							}
						}
					}
					uint32_t total_length = 32 + rip.numEntries * 20;
					filloutput(output, total_length);
					filladdr(output, addrs[k], 0x090000e0);
					unsigned int checksum = givechecksum(output, total_length);
					output[10] = checksum & 0xff;
					output[11] = ((checksum & 0xff00) >> 8);
					output[24] = (total_length - 20) >> 2;
					output[25] = (total_length - 20) & 0x3;
					uint32_t rip_len = assemble(&rip, &output[28]);
					if (!(HAL_ArpGetMacAddress(k, 0x090000e0, dest_mac)))
					{
						HAL_SendIPPacket(k, output, rip_len + 28, dest_mac);
					}
					else
						printf("dsc not found\n");
				}
			}
			printf("5s Timer\n");
			last_time = time;
		}
		int mask = (1 << N_IFACE_ON_BOARD) - 1;
		macaddr_t src_mac, dest_mac;
		in_addr_t src_addr, dest_addr, my_addr;
		my_addr = 0x090000e0;
		int if_index;
		res = HAL_ReceiveIPPacket(mask, packet, sizeof(packet), src_mac, dest_mac, 1000, &if_index);
		if (res == HAL_ERR_EOF) {
			printf("HAL_ERR_EOF\n");
			break;
		}
		else if (res < 0) {
			printf("res<0\n");
			return res;
		}
		else if (res == 0 || res > sizeof(packet)) {
			continue;
		}
		if (!validateIPChecksum(packet, res)) {
			printf("Invalid checksum\n");
			continue;
		}
		src_addr = (packet[15] << 24) + (packet[14] << 16) + (packet[13] << 8) + packet[12];
		dest_addr = (packet[19] << 24) + (packet[18] << 16) + (packet[17] << 8) + packet[16];
		bool dest_myself = false;
		for (int i = 0; i < N_IFACE_ON_BOARD; i++) {
			if ((memcmp(&dest_addr, &addrs[i], sizeof(in_addr_t)) == 0) || memcmp(&dest_addr, &my_addr, sizeof(in_addr_t)) == 0) {
				dest_myself = true;
				break;
			}
		}
		if (dest_myself) {
			RipPacket rip;
			if (disassemble(packet, res, &rip)) {
				if (rip.command == 1) {
					if (rip.numEntries != 1) {
						printf("numEntries not equals 1\n");
						continue;
					}
					if (bigtosmall(rip.entries[0].metric) != 16) {
						printf("metric not equals 16\n");
						continue;
					}
					bool cutpatch = false;
					int patchindex = 0;
					while (!cutpatch) {
						RipPacket rip_es;
						rip_es.command = 2;
						rip_es.numEntries = 0;
						for (int i = patchindex; i < r.size(); i++) {
							if (i == r.size() - 1)
								cutpatch = true;
							if ((r[i].addr & calmask(r[i].len)) != (src_addr & calmask(r[i].len))) {
								if (r[i].if_index == if_index)
									continue;
								rip_es.entries[rip_es.numEntries].nexthop = r[i].nexthop;
								rip_es.entries[rip_es.numEntries].metric = r[i].metric;
								rip_es.entries[rip_es.numEntries].addr = r[i].addr&calmask(r[i].len);
								rip_es.entries[rip_es.numEntries].mask = calmask(r[i].len);
								rip_es.numEntries++;
								if (rip_es.numEntries == 25) {
									patchindex = i + 1;
									break;
								}
							}
						}
						uint32_t total_length = 32 + rip_es.numEntries * 20;
						filloutput(output, total_length);
						filladdr(output, addrs[if_index], src_addr);
						unsigned int checksum = givechecksum(output, total_length);
						output[10] = checksum & 0xff;
						output[11] = ((checksum & 0xff00) >> 8);
						output[24] = (total_length - 20) >> 2;
						output[25] = (total_length - 20) & 0x3;
						uint32_t rip_len = assemble(&rip_es, &output[20 + 8]);
						HAL_SendIPPacket(if_index, output, rip_len + 20 + 8, src_mac);
					}
				}
				else {
					bool updated = false;
					for (int i = 0; i < rip.numEntries; i++) {
						uint32_t curMetric = rip.entries[i].metric;
						uint32_t addr = rip.entries[i].addr;
						uint32_t mask = rip.entries[i].mask;
						uint32_t len = __builtin_popcount(mask);
						uint32_t nexthop = rip.entries[i].nexthop;
						if (nexthop == 0) {
							nexthop = src_addr;
						}
						curMetric = bigtosmall(curMetric);
						curMetric = min(curMetric + 1, 16u);
						//查路由表
						bool found = false;
						for (int j = 0; j < r.size(); j++) {
							if (len == r[j].len) {
								if ((r[j].addr & calmask(r[j].len)) == (calmask(len) & addr)) {
									found = true;
									if (curMetric >= 16 && nexthop == r[j].nexthop) {
										RoutingTableEntry del;
										del.addr = addr;
										del.len = len;
										update(false, del);
										break;
									}
									if (curMetric < bigtosmall(r[j].metric)) {
										//update
										updated = true;
										r[j].addr = addr;
										r[j].metric = bigtosmall(curMetric);
										r[j].nexthop = nexthop;
										r[j].if_index = if_index;
									}
									break;
								}
							}
						}
						if (!found && curMetric < 16) {
							updated = true;
							RoutingTableEntry tmp;
							tmp.addr = addr;
							tmp.len = len;
							tmp.metric = bigtosmall(curMetric);
							tmp.if_index = if_index;
							tmp.nexthop = src_addr;
							update(true, tmp);
						}
					}
					if (updated) {
						for (int k = 0; k < N_IFACE_ON_BOARD; k++) {
							bool cutpatch = false;
							int patchindex = 0;
							while (!cutpatch) {
								RipPacket rip;
								macaddr_t dest_mac;
								rip.command = 2;
								rip.numEntries = 0;
								for (int i = patchindex; i < r.size(); i++) {
									if (i == r.size() - 1)
										cutpatch = true;
									if (r[i].if_index == k)
										continue;
									rip.entries[rip.numEntries].metric = r[i].metric;
									rip.entries[rip.numEntries].nexthop = r[i].nexthop;
									rip.entries[rip.numEntries].addr = r[i].addr&calmask(r[i].len);
									rip.entries[rip.numEntries].mask = calmask(r[i].len);
									rip.numEntries++;
									if (rip.numEntries == 25) {
										patchindex = i + 1;
										break;
									}
								}
								uint32_t total_length = 32 + rip.numEntries * 20;
								filloutput(output, total_length);
								filladdr(output, addrs[k], 0x090000e0);
								unsigned int checksum = givechecksum(output, total_length);
								output[10] = checksum & 0xff;
								output[11] = ((checksum & 0xff00) >> 8);
								output[24] = (total_length - 20) >> 2;
								output[25] = (total_length - 20) & 0x3;
								uint32_t rip_len = assemble(&rip, &output[28]);
								if (HAL_ArpGetMacAddress(k, 0x090000e0, dest_mac) == 0) {
									HAL_SendIPPacket(k, output, rip_len + 28, dest_mac);
								}
								else
									printf("dsc not found\n");
							}
						}
					}
				}
			}
			else {
				printf("disassemble validation is wrong with addr=%x, dest_addr=%x\n", src_addr, dest_addr);
			}
		}
		else {
			uint32_t dest, nexthop, metric;
			if (query(dest_addr, &nexthop, &dest, &metric)) {
				macaddr_t dest_mac;
				if (nexthop == 0) {
					nexthop = dest_addr;
				}
				if (!(HAL_ArpGetMacAddress(dest, nexthop, dest_mac))) {
					memcpy(output, packet, res);
					bool valid = forward(output, res);
					if (!valid) {
						printf("wrong checksum or ttl = 0");
						continue;
					}
					else {
						HAL_SendIPPacket(dest, output, res, dest_mac);
					}
				}
				else {
					printf("ARP not found for %x\n", nexthop);
				}
			}
			else {
				printf("IP not found from %x for %x \n", src_addr, dest_addr);
			}
		}
	}
	return 0;
}
