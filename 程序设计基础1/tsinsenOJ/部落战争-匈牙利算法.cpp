#include <iostream>
#include <memory.h>
using namespace std;
char map[55][55];
int m,n,r,c,count=0;
bool link[2505][2505]={false};
int arrival[2505]={0};
bool checked[2505]={false};

int cc(int i,int j){
	return (i-1)*n+j;
} 
bool search(int x){
	for(int j=1;j<=m*n;j++){
		if(link[x][j]==true && checked[j]==false){
			checked[j]=true;
			if(arrival[j]==0 || search(arrival[j])){
				arrival[j]=x;
				return true;
			}
		}
	//	cout << checked[j] << endl;
	}
	return false;
}
int main(){
	cin >> m >> n >> r >> c;
	int dx[4]={r,r,c,c};
	int dy[4]={c,-c,-r,r};
	for(int i=1;i<=m;i++){
		for(int j=1;j<=n;j++){
			cin >> map[i][j];
		}
	}
	for(int i=1;i<=m;i++){
		for(int j=1;j<=n;j++){
			if(map[i][j]=='.'){
				int tmp1=cc(i,j);
				for(int k=0;k<=3;k++){
					if(i+dx[k]<=m && j+dy[k]>0 && j+dy[k]<=n && map[i+dx[k]][j+dy[k]]=='.'){
						int tmp2=cc(i+dx[k],j+dy[k]);
						link[tmp1][tmp2]=true;
//						cout << tmp1 << " " << tmp2 << endl; 
					} 
				}
			}
		}
	}
	for(int i=1;i<=m;i++){
		for(int j=1;j<=n;j++){
			if(map[i][j]=='.'){
				count++;
				memset(checked,0,sizeof(checked));
				int tmp=cc(i,j);
				if(search(tmp))count--;
			}
		}
	}
	cout << count << endl;
	return 0;
}

