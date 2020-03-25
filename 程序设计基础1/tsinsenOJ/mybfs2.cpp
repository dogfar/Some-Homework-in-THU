#include <iostream>
#include <queue>
#include <memory.h>
using namespace std;
const int dx[]={-2,-1,+1,+2,+2,+1,-1,-2};
const int dy[]={+1,+2,+2,+1,-1,-2,-2,-1};
int bgx,bgy;
int n,m;
int map[401][401];
struct cell{
	int x;
	int y;
};
void bfs(){
	queue <cell> Q;
	map[bgx][bgy]=0;
	cell c={bgx,bgy};
	Q.push(c);
	while(!Q.empty()){
		cell t=Q.front();
		int dist=1+map[t.x][t.y];
		for(int i=0;i<8;i++){
			int x=t.x+dx[i];
			if(x<=0 || x>n)continue;
			int y=t.y+dy[i];
			if(y<=0 || y>m)continue;
			if(map[x][y]>=0)continue;
			map[x][y]=dist;
			cell c={x,y};
			Q.push(c);
		}
		Q.pop();
	}
} 
int main(){
	memset(map,-1,sizeof(map));
	cin >> n >> m >> bgx >> bgy;
	bfs();
	for(int i=1;i<=n;i++){
		for(int j=1;j<=m;j++){
			printf("%-5d",map[i][j]);
		}
		cout << endl;
	}
	return 0;
}
