#include <cstdio>
#include <cstring>
using namespace std;

int ans=0,n,m,k;
char str1[501005]="";
char str2[501005]="";
int dp[2][501005];
int now=0,pre=1;
void swap(){
	int tmp=now;
	now=pre;
	pre=tmp;
}
int getmax(int x,int y){
	if(x>=y)return x;
	else return y;
}
int getmin(int x,int y){
	if(x<=y)return x;
	else return y;
}
int main(){
	setvbuf(stdin,new char[1<<20],_IOFBF,1<<20);
	setvbuf(stdout,new char[1<<20],_IOFBF,1<<20);
	scanf("%d%d%d",&n,&m,&k);
	scanf("%s",&str1);
	scanf("%s",&str2);
	memset(dp,0,sizeof(dp));
	for(int i=0;i<n;i++){
		swap();
		int s=getmax(0,i-k);
		int e=getmin(m-1,i+k);
		for(int j=s;j<=e;j++){
			if(str1[i]==str2[j]){
				dp[now][j+1]=dp[pre][j]+1;
			}
			else{
				dp[now][j+1]=getmax(dp[now][j],dp[pre][j+1]);
			}
		}
	}
	int t=n+m-2*dp[now][m];
	if(t>k)printf("%d\n",-1);
	else printf("%d\n",t);
	return 0;
}
