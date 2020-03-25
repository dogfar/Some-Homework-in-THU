#include "temperature.h"
#include <cstdio>

using namespace std;

int c[1205][1205];//树状数组 
int a[1205][1205];//原数组 
int N,M;
int lowbit[1205]; //低位的1 

void calc(){
	for(int i=0;i<1205;i++){
		a[0][i]=0;
		a[i][0]=0;
		c[i][0]=0;
		c[0][i]=0;
		lowbit[i]=i&(0-i);
	} 
} 
void countforc(int x,int y,int **temp){
	for(int i=x;i>=x-lowbit[x]+1;i--){
		for(int j=y;j>=y-lowbit[y]+1;j--){
			c[x][y]+=temp[i][j];//建立二维数组 
		}
	}
}
void init(int n, int m, int **temp) {
	N=n;
	M=m;
	calc();//初始化 
    for(int i=1;i<=n;i++){
    	for(int j=1;j<=m;j++){
    		a[i][j]=temp[i][j]; 
    		countforc(i,j,temp);
		}
	}
}
int sum(int x,int y){
	int ans=0;
	for(int i=x;i>0;i-=lowbit[i]){
		for(int j=y;j>0;j-=lowbit[j]){
			ans+=c[i][j];//获得以(1,1)到（x,y)的矩阵和 
		}
	}
	return ans;
}
int query(int x1, int y1, int x2, int y2) {//按二维前缀和方式获取答案 
    int qans=0; 
    if(x1!=x2 && y1!=y2){
    	qans=sum(x2,y2)-sum(x2,y1-1)-sum(x1-1,y2)+sum(x1-1,y1-1);
    	qans/=(x2-x1+1)*(y2-y1+1);
    	return qans;
	}
	else{
		if(x1==x2){
			for(int i=y1;i<=y2;i++)qans+=a[x1][i];
			qans/=y2-y1+1;
			return qans;
		}
		if(y1==y2){
			for(int i=x1;i<=x2;i++)qans+=a[i][y1];
			qans/=x2-x1+1;
			return qans;
		}
	}
}

void change(int x, int y, int temp) {//单点修改 
    int delta=temp-a[x][y];
    a[x][y]=temp;
    for(int i=x;i<=N;i+=lowbit[i]){
    	for(int j=y;j<=M;j+=lowbit[j]){
    		c[i][j]+=delta; 
		}
	}
}
