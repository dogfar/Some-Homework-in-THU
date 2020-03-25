#include <iostream>
#include <queue>
using namespace std;

const int dx[]={1,0,-1,0};
const int dy[]={0,-1,0,1};
int map[501][501];
int ans[25000];
int node[25000][3]; 
int r,c;
char ch[25002];
void bfs(){
	int head=0,tail=1;
	node[1][1]=1;
	node[1][2]=1;
	ans[1]=-1;
	while(head<tail){
		head++;
		for(int i=1;i<=4;i++){
			int x=node[head][1],y=node[head][2];
			if(y+dy[i-1]<=0 || y+dy[i-1]>c){
				continue;
			}
			if(x+dx[i-1]<=0 || x+dx[i-1]>r){
				continue;
			}
			int p=x+dx[i-1],q=y+dy[i-1];
			if(map[p][q]==1){
				continue;
			}
			tail=tail+1;
			node[tail][1]=p;
			node[tail][2]=q;
			x=p;
			y=q;
			ans[tail]=ans[head]+1;
			map[x][y]=1;
			if(x==r && y==c){
				cout << ans[tail] << endl;
				return;
			}
		}
	}
	return;
}
int main(){
	cin >> r >> c;
	for(int i=1;i<=r;i++){
		for(int j=1;j<=c;j++){
			cin >> ch[i];
			if(ch[i]=='0'){
				map[i][j]=-1;
			}
			else{
				map[i][j]=1;
			}
		}
	}
	map[1][1]=1;
	bfs();
	return 0;
}

