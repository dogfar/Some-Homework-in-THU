#include <iostream>
#include <memory.h>
using namespace std;

int map[25][25];
long long int rc[25][25];
void hc(int x,int y){
	map[x+1][y-2]=-1;
	map[x+2][y-1]=-1;
	map[x+2][y+1]=-1;
	map[x+1][y+2]=-1;
	map[x-1][y+2]=-1;
	map[x-2][y+1]=-1;
	map[x-2][y-1]=-1;
	map[x-1][y-2]=-1;
} 
long long int pd(int n,int m){
	if(n<0 || m <0)return 0;
	if(n==0 && m==0)return 1;
	if(map[n][m]<0)return 0;
	if(rc[n][m]>0)return rc[n][m];
	long long int count=0;
	count=count+pd(n-1,m)+pd(n,m-1);
	rc[n][m]=count;
	return count;
}
int main(){
	for(int i=0;i<25;i++){
		for(int j=0;j<25;j++){
			map[i][j]=0;
			rc[i][j]=0;
		}
	}
	int n,m,x,y;
	cin >> n >> m >> x >> y;
	hc(x,y);
	cout << pd(n,m) << endl;
	return 0;
}
