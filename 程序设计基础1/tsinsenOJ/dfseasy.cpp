#include <iostream>
#include <memory.h>
using namespace std;

char pic[105][105];
int map[105][105];
int m,n;

void dfs(int x,int y,int id){
	if(x<0 || y<0 || pic[x][y]=='*' || x>=m || y>=n)return;
	if(map[x][y]>0)return;
	map[x][y]=id;
	for(int i=-1;i<=1;i++){
		for(int j=-1;j<=1;j++){
			if(i!=0 || j!=0)dfs(x+i,j+y,id);
		}
	}
} 
int main(){
	while(cin >> m >> n && m!=0 && n!=0){
		for(int i=0;i<m;i++){
			for(int j=0;j<n;j++){
				cin >> pic[i][j]; 
			}
		}
		memset(map,0,sizeof(map));
		int count=0;
		for(int i=0;i<m;i++){
			for(int j=0;j<n;j++){
				if(pic[i][j]=='@' && map[i][j]==0)dfs(i,j,++count);
			}
		}
		cout << count << endl;
	}
	return 0;
}
