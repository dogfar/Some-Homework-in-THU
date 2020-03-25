#include <iostream>
#include <queue>
#include <stack>
using namespace std;

const int dx[]={-1,0,0,1};
const int dy[]={0,-1,1,0};
int map[6][6];
int n,m,t;
int bgx,bgy,edx,edy;
int count=0;
struct cell{
	int x;
	int y;
}; 
stack <cell> s;
void dfs(){
	cell t=s.top();
	for(int i=0;i<=3;i++){
		int x=t.x+dx[i];
		if(x<=0 || x>n)continue;
		int y=t.y+dy[i];
		if(y<=0 || y>n)continue;
		if(map[x][y]==1)continue;
		if(x==edx && y==edy)count++;
		else{
			map[x][y]=1;
			cell c={x,y};
			s.push(c);
			dfs();
			map[x][y]=0;
		}
	}
	s.pop();
}
int main(){
	for(int i=1;i<=n;i++){
		for(int j=1;j<=m;j++){
			map[i][j]=0;
		}
	}
	cin >> n >> m >> t;
	cin >> bgx >> bgy >> edx >> edy;
	int tx[25],ty[25];
	for(int i=1;i<=t;i++){
		cin >> tx[i] >> ty[i];
		map[tx[i]][ty[i]]=1;
	}
	map[bgx][bgy]=1;
	cell c={bgx,bgy};
	s.push(c);
	dfs();
	cout << count << endl;
	return 0;
}
