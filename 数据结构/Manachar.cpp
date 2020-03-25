#include <cstdio>
#include <cstring>
using namespace std;

long long int ans=0;
char str[20000005];
int next[20000005];
int dp[20000005];

void kmp(int l){//KMP�㷨 
	next[1]=0;
	int j1=0,j2=0;
	for(int i=2;i<=l;i++){
		while(j1>0 && str[j1+1]!=str[i])j1=next[j1];//ʧ��������һ��next 
		if(str[j1+1]==str[i])j1++;//������ǰŲһλ 
		next[i]=j1;
	}
}
int main(){
	setvbuf(stdin,new char[1<<20],_IOFBF,1<<20);
	setvbuf(stdout,new char[1<<20],_IOFBF,1<<20);
	scanf("%s",str+1);
	int l=strlen(str+1);
	kmp(l);//��next���� 
	for(int i=1;i<=l;i++){
		dp[i]=dp[next[i]]+1;//ת�Ʒ��� 
		ans+=(long long int)dp[i]; //�𰸿��ܱ�int 
	}
	printf("%lld",ans);
	return 0;
}
