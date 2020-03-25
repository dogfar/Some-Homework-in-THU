#include <iostream>
#include <algorithm>
#include <memory.h>
#include <stdio.h>
using namespace std;

int dp[1005][1005];
int a[1005][1005];
int n;
int solve(int x,int y){ 
	if(dp[x][y]>=0)return dp[x][y];
	else dp[x][y]=a[x][y]+(x==n?0:max(solve(x+1,y),solve(x+1,y+1)));
	return dp[x][y];
}
int main(){
	memset(dp,-1,sizeof(dp));
	scanf("%d",&n);
	for(int i=1;i<=n;i++){
		for(int j=1;j<=i;j++){
			scanf("%d",&a[i][j]);
		}
	}
	printf("%d\n",solve(1,1));
}
