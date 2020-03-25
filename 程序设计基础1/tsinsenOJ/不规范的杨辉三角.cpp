#include <iostream>
using namespace std;

int main(){
	int ans[35][35]={0};
	int i=0,j=0,n=0;
	cin >> n;
	for(i=1;i<=n;i++){
		ans[i][1]=1;
	}
	for(i=2;i<=n;i++){
		for(j=2;j<=i;j++){
			ans[i][j]=ans[i-1][j]+ans[i-1][j-1];
		}
	}
	for(i=1;i<=n;i++){
		for(j=1;j<=i;j++){
			if(j<i){
				cout << ans[i][j] << " ";
			}
			if(j==i){
				cout << ans[i][j] << endl;
			}
		}
	}
	return 0;
} 
