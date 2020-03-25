#include <iostream>
#include <stack>
#include <memory.h>
using namespace std;

const int dx[]={-1,0,0,1};
const int dy[]={0,-1,1,0};
int ans=0;
int bgx,bgy,n,m;
char map[1005][1005];
int tmp[1005][1005];
struct cell{
	int x;
	int y;
	int num;
};
stack <cell> S;
void dfs(){
	cell t=S.top();
	int dis=1+t.num;
	for(int i=0;i<4;i++){
		int x=t.x+dx[i];
		if(x<=0 || x>n)continue;
		int y=t.y+dy[i];
		if(y<=0 || y>m)continue;
		if(map[x][y]==map[t.x][t.y] || tmp[x][y]==2)continue;
		tmp[x][y]=2;
		if(dis>ans)ans=dis;
		cell c={x,y,dis};S.push(c);
		dfs();
	}
	tmp[t.x][t.y]=0;S.pop();
} 
int main(){
	cin >> n >> m ;
	for(int i=1;i<=n;i++){
		for(int j=1;j<=m;j++){
			cin >> map[i][j];
		}
	}
	while(m>0){
		m--;
		cin >> bgx >> bgy;
		tmp[bgx][bgy]=2;
		cell c={bgx,bgy,1};
		S.push(c);
		dfs();
		cout << ans << endl;
		memset(tmp,0,sizeof(tmp));
	}
	return 0;
}
