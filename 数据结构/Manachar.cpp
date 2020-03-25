#include <cstdio>
#include <cstring>
using namespace std;

long long int ans=0;
char str[20000005];
int next[20000005];
int dp[20000005];

void kmp(int l){//KMP算法 
	next[1]=0;
	int j1=0,j2=0;
	for(int i=2;i<=l;i++){
		while(j1>0 && str[j1+1]!=str[i])j1=next[j1];//失配跳回上一个next 
		if(str[j1+1]==str[i])j1++;//否则向前挪一位 
		next[i]=j1;
	}
}
int main(){
	setvbuf(stdin,new char[1<<20],_IOFBF,1<<20);
	setvbuf(stdout,new char[1<<20],_IOFBF,1<<20);
	scanf("%s",str+1);
	int l=strlen(str+1);
	kmp(l);//求next数组 
	for(int i=1;i<=l;i++){
		dp[i]=dp[next[i]]+1;//转移方程 
		ans+=(long long int)dp[i]; //答案可能爆int 
	}
	printf("%lld",ans);
	return 0;
}
