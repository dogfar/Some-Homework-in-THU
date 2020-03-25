#include <iostream>
using namespace std;

int a[9][9];
int posblack[9];
int poswhite[9];
int sum=0;
bool blackattack(int x,int y){
	if(posblack[x]==posblack[y])return true;
	if(posblack[x]-x==posblack[y]-y || posblack[x]+x==posblack[y]+y)return true;
	return false;
}
bool whiteattack(int x,int y){
	if(poswhite[x]==poswhite[y])return true;
	if(poswhite[x]-x==poswhite[y]-y || poswhite[x]+x==poswhite[y]+y)return true;
	return false;
}
void queenwhite(int k,int n){
	for(int i=1;i<=n;i++){
		if(a[k][i]==0)continue;
		else{
			poswhite[k]=i;
			bool attacked=false;
			for(int j=1;j<k;j++){
				if(whiteattack(j,k)){
					attacked=true;
					break;
				}
			}
			if(attacked)continue;
			a[k][i]=0;
			if(k==n){
				sum++;
			}
			else{
				queenwhite(k+1,n);
			}
			a[k][i]=1;
		}
	}
}
void queenblack(int k,int n){
	for(int i=1;i<=n;i++){
		if(a[k][i]==0)continue;
		else{
			posblack[k]=i;
			bool attacked=false;
			for(int j=1;j<k;j++){
				if(blackattack(j,k)==true){
					attacked=true;
					break;
				}
			}
			if(attacked)continue;
			a[k][i]=0;
			if(k==n)queenwhite(1,n);
			else{
				queenblack(k+1,n);
			}
			a[k][i]=1;
		}
	}
}
int main(){
	int n;
	cin >> n;
	for(int i=1;i<=n;i++){
		for(int j=1;j<=n;j++){
			cin >> a[i][j];
		}
	}
	queenblack(1,n);
	cout << sum << endl;
	return 0;
} 
