#include <cstdio>
#include <cstring>
using namespace std;

char bitmap[2097160];
char bm[2097160];
int cnt=1,tmphash=0,fin=0;
bool ans[25];
bool test(int k){//看看在不在 
	return bitmap[k>>3] & ( 0x80 >> (k & 0x07));
}
bool tt(int k){
	return bm[k>>3] & ( 0x80 >> (k & 0x07));
}
void set(int k){//插入 
	bitmap[k>>3] |= (0x80 >> (k & 0x07) );
}
void st(int k){
	bm[k>>3] |= (0x80 >> (k & 0x07) );
}
bool compare(int l){
	int ct=0;
	int s=1,hash=tmphash;
	while(s<=cnt-l && ct<1<<l){
		if(!tt(hash)){//转换10进制的hash 
			ct++,st(hash);
		}
		hash-=test(s)<<(l-1);//可由邻近的串推出 
		hash=hash<<1;
		hash+=test(s+l);
		s++;
	}
	if(ct==1<<l)return true;
	else return false;
}
int main(){
	setvbuf(stdin,new char[1<<20],_IOFBF,1<<20);
	setvbuf(stdout,new char[1<<20],_IOFBF,1<<20);
	char tmp;
	tmp=getchar();
	while(tmp!='\n'){
		if(tmp=='1')set(cnt);
		tmp=getchar();//读入必须getchar否则过不了 
		cnt++;
	}
	for(int i=1;i<=24;i++){//枚举长度 
		tmphash=tmphash<<1;
		tmphash+=test(i);
		memset(bm,0,sizeof(bm));//bm是每次放同一长度的数的位图，长度++则清零 
		if(!compare(i)){ 
			for(int j=0;j<1<<i;j++){
				if(!tt(j)){
					for(int k=1;k<=i;k++){
						ans[k]=j&1;
						j=j>>1;
					}
					for(int k=i;k>=1;k--)printf("%d",ans[k]);
					return 0;
				}
			}
		}
	}
	return 0;
}
