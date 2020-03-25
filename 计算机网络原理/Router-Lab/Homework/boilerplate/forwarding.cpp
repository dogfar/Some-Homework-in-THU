#include <stdint.h>
#include <stdlib.h>

/**
 * @brief 进行转发时所需的 IP 头的更新：
 *        你需要先检查 IP 头校验和的正确性，如果不正确，直接返回 false ；
 *        如果正确，请更新 TTL 和 IP 头校验和，并返回 true 。
 *        你可以从 checksum 题中复制代码到这里使用。
 * @param packet 收到的 IP 包，既是输入也是输出，原地更改
 * @param len 即 packet 的长度，单位为字节
 * @return 校验和无误则返回 true ，有误则返回 false
 */
bool validateIPChecksumcopy(uint8_t *packet, size_t len) {
	
	unsigned int checksum = 0;
	unsigned short cksum = 0;
	unsigned int answer = (packet[11] << 8) + packet[10];
	packet[10] = 0;
	packet[11] = 0;
	int iplen = (packet[0] % 16) << 2;
	for(int i = 0; i < iplen; i+=2){
		checksum += ((packet[i+1] << 8) + packet[i]);
	}
	while(checksum >> 16){
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
unsigned int givechecksum(uint8_t *packet, size_t len){
	unsigned int checksum = 0;
	unsigned short cksum = 0;
	int iplen = (packet[0] % 16) << 2;
	for(int i = 0; i < iplen; i+=2){
		checksum += ((packet[i+1] << 8) + packet[i]);
	}
	while(checksum >> 16){
		checksum = (checksum & 0xffff) + (checksum >> 16);
		checksum += (checksum >> 16);
	}
	cksum = ~checksum;
	return cksum;
}
bool forward(uint8_t *packet, size_t len) {
	if(!validateIPChecksumcopy(packet, len)){
		return false;
	}
	unsigned int checksum = 0;
	unsigned short cksum = 0;
	packet[8]--;
	int iplen = (packet[0] % 16) << 2;
	for(int i=0; i<iplen; i+=2){
		checksum += ((packet[i+1] << 8) + packet[i]);
	}
	while(checksum >> 16){
		checksum = (checksum & 0xffff) + (checksum >> 16);
		checksum += (checksum >> 16);
	}
	cksum = ~checksum;
	packet[10] = (cksum & 0xff);
	packet[11] = (cksum >> 8) & 0xff;
	return true;
}
