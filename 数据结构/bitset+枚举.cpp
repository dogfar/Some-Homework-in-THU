#include <cstdio>
#include <cstring>
using namespace std;

char bitmap[2097160];
char bm[2097160];
int cnt=1,tmphash=0,fin=0;
bool ans[25];
bool test(int k){//�����ڲ��� 
	return bitmap[k>>3] & ( 0x80 >> (k & 0x07));
}
bool tt(int k){
	return bm[k>>3] & ( 0x80 >> (k & 0x07));
}
void set(int k){//���� 
	bitmap[k>>3] |= (0x80 >> (k & 0x07) );
}
void st(int k){
	bm[k>>3] |= (0x80 >> (k & 0x07) );
}
bool compare(int l){
	int ct=0;
	int s=1,hash=tmphash;
	while(s<=cnt-l && ct<1<<l){
		if(!tt(hash)){//ת��10���Ƶ�hash 
			ct++,st(hash);
		}
		hash-=test(s)<<(l-1);//�����ڽ��Ĵ��Ƴ� 
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
		tmp=getchar();//�������getchar��������� 
		cnt++;
	}
	for(int i=1;i<=24;i++){//ö�ٳ��� 
		tmphash=tmphash<<1;
		tmphash+=test(i);
		memset(bm,0,sizeof(bm));//bm��ÿ�η�ͬһ���ȵ�����λͼ������++������ 
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
