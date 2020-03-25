#include <iostream>
#include <queue>
#include <cstring>
using namespace std;

const int dx[]={+1,0,0,-1};
const int dy[]={0,-1,+1,0};
char directions[]={'D','L','R','U'};
char mazeinput[501][501];
int maze[501][501];
int n,m;
struct point{
	int x;
	int y;
	string path; 
};
void bfs(){
	queue<point> Q;
	point c={1,1};
	Q.push(c);
	while (!Q.empty()){
		point t=Q.front();
		if(t.x==n && t.y==m){
			cout << maze[t.x][t.y] << endl;
			cout << t.path << endl;
			return; 
		}
		int dis=1+maze[t.x][t.y];
		for(int attempt=0; attempt<4;attempt++){
			int x=t.x+dx[attempt];
			if(x<=0 || x>n){
				continue;
			}
			int y=t.y+dy[attempt];
			if(y<=0 || y>m){
				continue;
			}
			if(maze[x][y]!=0 || (x==1 && y==1)){
				continue;
			}
			maze[x][y]=dis;
			point c;
			c.x=x,c.y=y;
			c.path=t.path+directions[attempt];
			Q.push(c);
		}
		Q.pop();
	}
}
int main(){
	cin >> n >> m;
	for(int i=0;i<n;i++){
		cin >> mazeinput[i];
	}
	for(int i=0;i<n;i++){
		for(int j=0;j<m;j++){
			maze[i+1][j+1]=mazeinput[i][j]-48;
		}
	}
	bfs();
	return 0;
}
