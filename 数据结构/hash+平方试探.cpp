#include <cstdio>
#include <cstring>
#include "crc.h"
#define mod 39999983
using namespace std; 

int n,cnt=0,opt,headq=0,tailq=0,ls=0;
unsigned char s[12];
char sym[20]={"0123456789tsinghua"};
char cipher[4001000][12];
char salt[6];
char codequeue[2100000];//queue以便插入新密码 
long long int crc[4001000],code;
int hashmap[40000000]; 

void calc(){//前期计算准备，建立基础hashtable 
	int l=0;
	ls=strlen(salt);
	for(int i=0;i<18;i++){//长度为1的串 
		memset(s,0,sizeof(s));
		s[0]=sym[i];
		for(int t=0;t<ls;t++)s[t+1]=salt[t];
		l=ls+1,cnt++;
		cipher[cnt][0]=s[0];
		crc[cnt]=crc32(s,l);
	}
	for(int i=0;i<18;i++){//2 
		for(int j=0;j<18;j++){
			memset(s,0,sizeof(s));
			s[0]=sym[i],s[1]=sym[j];
			for(int t=0;t<ls;t++)s[t+2]=salt[t];
			l=ls+2,cnt++;
			cipher[cnt][0]=s[0],cipher[cnt][1]=s[1];
			crc[cnt]=crc32(s,l);
		}
	}
	for(int i=0;i<18;i++){//3 
		for(int j=0;j<18;j++){
			for(int k=0;k<18;k++){
				s[0]=sym[i],s[1]=sym[j],s[2]=sym[k];
				for(int t=0;t<ls;t++)s[t+3]=salt[t];
				l=ls+3,cnt++;
				for(int t=0;t<3;t++)cipher[cnt][t]=s[t];
				crc[cnt]=crc32(s,l);
			}
		}
	}
	for(int i=0;i<18;i++){//4 
		for(int j=0;j<18;j++){
			for(int k=0;k<18;k++){
				for(int m=0;m<18;m++){
					s[0]=sym[i],s[1]=sym[j],s[2]=sym[k],s[3]=sym[m];
					for(int t=0;t<ls;t++)s[t+4]=salt[t];
					l=ls+4,cnt++;
					for(int t=0;t<4;t++)cipher[cnt][t]=s[t];
					crc[cnt]=crc32(s,l);
				}
			}
		}
	}
	for(int i=0;i<18;i++){//5 
		for(int j=0;j<18;j++){
			for(int k=0;k<18;k++){
				for(int m=0;m<18;m++){
					for(int p=0;p<18;p++){
						s[0]=sym[i],s[1]=sym[j],s[2]=sym[k],s[3]=sym[m],s[4]=sym[p];
						for(int t=0;t<ls;t++)s[t+5]=salt[t];
						l=ls+5,cnt++;
						for(int t=0;t<5;t++)cipher[cnt][t]=s[t];
						crc[cnt]=crc32(s,l);
					}
				}
			}
		}
	}
}
void hash(long long int s,int id){//直接取模当作hash 
	int h=s%mod,k=0,r=h;
	while(hashmap[r]>0){//如果冲突了 
		k++;r=(h+k*k)%mod;//平方试探 
	}
	hashmap[r]=id;
}
int fd(long long int s){
	int h=s%mod,k=0,r=h,cnt=0;
	int rec=0;
	while(hashmap[r]>0){
		if(crc[hashmap[r]]==s){
			cnt++;
			if(cnt>1)break;
			rec=hashmap[r];
		}
		k++;r=(h+k*k)%mod;
	}
	if(cnt>1)return -2;//duplicate 
	if(cnt==0)return -1;//No 
	return rec;
}
int main(){
	setvbuf(stdin,new char[1<<20],_IOFBF,1<<20);
	setvbuf(stdout,new char[1<<20],_IOFBF,1<<20);
	scanf("%d",&n);
	scanf("%s",&salt);
	calc();
	for(int i=1;i<=cnt;i++){
		hash(crc[i],i);
	}
	while(n--){
		scanf("%d",&opt);
		if(!opt){//查找 
			scanf("%lld",&code);
			int index=fd(code);
			if(index==-1){
				printf("No\n");
				continue;
			}
			if(index==-2){
				printf("duplicate\n");
				continue;
			}
			printf("%s\n",cipher[index]);
			codequeue[++tailq]=cipher[index][0];
			if(tailq-headq>6)headq++;
			continue;
		}
		else{//插入新密码 
			cnt++;
			memset(s,0,sizeof(s));
			for(int i=0;i<7;i++){
				cipher[cnt][i]=codequeue[headq+i];
				s[i]=codequeue[headq+i];
			}
			for(int i=7;i<ls+7;i++){
				s[i]=salt[i-7];
			}
			crc[cnt]=crc32(s,ls+7);
			hash(crc[cnt],cnt);
		}
	}
	return 0;
}
