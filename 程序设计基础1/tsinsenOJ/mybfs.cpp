#include <iostream>
#include <queue>
using namespace std;

int n,m,ans;
char map[1002][1002];
char tmp[1002][1002];
const int dx[]={-1,0,1,0};
const int dy[]={0,1,0,-1};
struct cell{
	int x;
	int y;
	int dis;
}; 
void bfs(int p,int q){
	queue<cell> Q;
	cell c={p,q,1};
	map[p][q]='A';
	Q.push(c);
	while(!Q.empty()){
		cell t=Q.front();
		int dist=1+t.dis;
		for(int i=0;i<=3;i++){
			int x=t.x+dx[i];
			if(x>n || x<=0)continue;
			int y=t.y+dy[i];
			if(y>n || y<=0)continue;
			if(map[x][y]==map[t.x][t.y])continue;
			if(map[x][y]=='A')continue;
			ans=dist;
			map[x][y]='A';
			cell k={x,y,dist};
			Q.push(k);
		}
		Q.pop();
	}
	
}
int main(){
	cin >> n >> m;
	for(int i=1;i<=n;i++){
		for(int j=1;j<=n;j++){
			cin >> map[i][j];
			tmp[i][j]=map[i][j];
		}
	}
	while(m>0){
		m--;
		int bgx,bgy;
		cin >> bgx >> bgy;
		bfs(bgx,bgy);
		cout << ans+1 << endl;
		for(int i=1;i<=n;i++){
			for(int j=1;j<=n;j++){
				map[i][j]=tmp[i][j];
			}
		}
	}
	return 0;
}
