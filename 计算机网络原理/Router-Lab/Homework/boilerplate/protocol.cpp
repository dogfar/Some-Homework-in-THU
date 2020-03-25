#include "rip.h"
#include <stdint.h>
#include <stdlib.h>
#include <cstdio>

/*
  在头文件 rip.h 中定义了如下的结构体：
  #define RIP_MAX_ENTRY 25
  typedef struct {
    // all fields are big endian
    // we don't store 'family', as it is always 2(response) and 0(request)
    // we don't store 'tag', as it is always 0
    uint32_t addr;
    uint32_t mask;
    uint32_t nexthop;
    uint32_t metric;
  } RipEntry;

  typedef struct {
    uint32_t numEntries;
    // all fields below are big endian
    uint8_t command; // 1 for request, 2 for response, otherwsie invalid
    // we don't store 'version', as it is always 2
    // we don't store 'zero', as it is always 0
    RipEntry entries[RIP_MAX_ENTRY];
  } RipPacket;

  你需要从 IPv4 包中解析出 RipPacket 结构体，也要从 RipPacket 结构体构造出对应的 IP 包
  由于 Rip 包结构本身不记录表项的个数，需要从 IP 头的长度中推断，所以在 RipPacket 中额外记录了个数。
  需要注意这里的地址都是用 **大端序** 存储的，1.2.3.4 对应 0x04030201 。
*/

/**
 * @brief 从接受到的 IP 包解析出 Rip 协议的数据
 * @param packet 接受到的 IP 包
 * @param len 即 packet 的长度
 * @param output 把解析结果写入 *output
 * @return 如果输入是一个合法的 RIP 包，把它的内容写入 RipPacket 并且返回 true；否则返回 false
 * 
 * IP 包的 Total Length 长度可能和 len 不同，当 Total Length 大于 len 时，把传入的 IP 包视为不合法。
 * 你不需要校验 IP 头和 UDP 的校验和是否合法。
 * 你需要检查 Command 是否为 1 或 2，Version 是否为 2， Zero 是否为 0，
 * Family 和 Command 是否有正确的对应关系，Tag 是否为 0，
 * Metric 转换成小端序后是否在 [1,16] 的区间内，
 * Mask 的二进制是不是连续的 1 与连续的 0 组成等等。
 */

bool pdmask(uint32_t mask){
	uint32_t reversemask = 0;
	reversemask = ((mask & 0xff) << 24) + ((mask & 0xff00) << 8) + ((mask & 0xff0000) >> 8) + ((mask & 0xff000000) >> 24);
	reversemask = ~ reversemask;
	while(reversemask){
		if ((reversemask & 0x1) == 0x1){
			reversemask = reversemask >> 1;
		} 
		else return false;
	}
	return true;
}
bool disassemble(const uint8_t *packet, uint32_t len, RipPacket *output) {
	int total_length = packet[3];
	if (total_length > len)return false;
	int iplen = (packet[0] & 0xf);
	int start = (iplen << 2) + 8;
	if (packet[start]!=1 && packet[start]!=2)return false;
	if (packet[start+1] != 2)return false;
	if (packet[start+2] || packet[start+3])return false;
	int tries = (total_length - 8 - iplen)/20;
	output->numEntries = tries;
	output->command = packet[start];
	for(int i=0;i<tries;i++){
		int zero = start + 4 + i*20;
		int family = (packet[zero] << 8) + packet[zero+1];
		if (!((packet[start] == 1 && family == 0) || (packet[start] == 2 && family == 2)))return false;
		int tag = (packet[zero+2] << 8) + packet[zero+3];
		if(tag)return false;
		output->entries[i].addr = (packet[zero+7] << 24) + (packet[zero+6] << 16) + (packet[zero+5] << 8) +packet[zero+4];
		uint32_t tmpmask = (packet[zero+11] << 24) + (packet[zero+10] << 16) + (packet[zero+9] << 8) +packet[zero+8];
		if(!(pdmask(tmpmask)))return false;
		output->entries[i].mask = tmpmask;
		output->entries[i].nexthop = (packet[zero+15] << 24) + (packet[zero+14] << 16) + (packet[zero+13] << 8) + packet[zero+12];
		uint32_t metric = (packet[zero+16] << 24) + (packet[zero+17] << 16) + (packet[zero+18] << 8) + packet[zero+19];
		if(!(0 < metric && metric < 17))return false;
		output->entries[i].metric = (packet[zero+19] << 24) + (packet[zero+18] << 16) + (packet[zero+17] << 8) + packet[zero+16];
	}
	return true;
}

/**
 * @brief 从 RipPacket 的数据结构构造出 RIP 协议的二进制格式
 * @param rip 一个 RipPacket 结构体
 * @param buffer 一个足够大的缓冲区，你要把 RIP 协议的数据写进去
 * @return 写入 buffer 的数据长度
 * 
 * 在构造二进制格式的时候，你需要把 RipPacket 中没有保存的一些固定值补充上，包括 Version、Zero、Address Family 和 Route Tag 这四个字段
 * 你写入 buffer 的数据长度和返回值都应该是四个字节的 RIP 头，加上每项 20 字节。
 * 需要注意一些没有保存在 RipPacket 结构体内的数据的填写。
 */
uint32_t assemble(const RipPacket *rip, uint8_t *buffer) {
	int length = rip->numEntries * 20 + 4;
	buffer[0] = rip->command;
	buffer[1] = 2;
	buffer[2] = 0;
	buffer[3] = 0;
	for(int i=0;i<rip->numEntries;i++){
		int start = i*20+4;
		buffer[start] = 0;
		if(rip->command == 1)buffer[start+1] = 0;
		else if (rip->command == 2)buffer[start+1] = 2;
		buffer[start+2] = 0;
		buffer[start+3] = 0;
		uint32_t a = rip->entries[i].addr;
		for(int j=0; j<4;j++){
			buffer[start+4+j] = a & 0xff;
			a = a >> 8;			
		}
		uint32_t ma = rip->entries[i].mask;
		for(int j=0; j<4;j++){
			buffer[start+8+j] = ma & 0xff;
			ma = ma >> 8;
		}
		uint32_t n = rip->entries[i].nexthop;
		for(int j=0; j<4;j++){
			buffer[start+12+j] = n & 0xff;
			n = n >> 8;
		}
		uint32_t me = rip->entries[i].metric;
		for(int j=0; j<4; j++){
			buffer[start+16+j] = me & 0xff;
			me = me >> 8;
		}
	}
	return length;
}
