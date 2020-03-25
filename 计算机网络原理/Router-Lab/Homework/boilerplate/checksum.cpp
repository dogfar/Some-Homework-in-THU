#include <stdint.h>
#include <stdlib.h>
#include <cstdio>

/**
 * @brief 进行 IP 头的校验和的验证
 * @param packet 完整的 IP 头和载荷
 * @param len 即 packet 的长度，单位是字节，保证包含完整的 IP 头
 * @return 校验和无误则返回 true ，有误则返回 false
 */
bool validateIPChecksum(uint8_t *packet, size_t len) {
	
	unsigned int checksum = 0;
	unsigned short cksum = 0;
	unsigned int answer = (packet[11] << 8) + packet[10];
	packet[10] = 0;
	packet[11] = 0;
	int iplen = (packet[0] % 16) << 2;
	for(int i = 0; i < iplen; i+=2){
		checksum += ((packet[i+1] << 8) + packet[i]);
	}
	while (checksum >> 16){
		checksum = (checksum & 0xffff) + (checksum >> 16);
		checksum += (checksum >> 16);
	}
	cksum = ~checksum;
	if(cksum == answer){
		return true;
	}
	else {
		return false;
	}
}
