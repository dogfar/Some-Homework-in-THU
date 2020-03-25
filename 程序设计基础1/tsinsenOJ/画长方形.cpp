#include <iostream>
using namespace std;

int main(){
	int i=0,j=0;
	int n=0,m=0;
	cin >> n >> m;
	char ANS[26][26];
	for(i=m-1;i<=n-1;i++){
		for(j=0;j<=m-1;j++){
			ANS[i][j]=65+i-j;
		}
	}
	for(i=0;i<=m-2;i++){
		for(j=0;j<=i;j++){
			ANS[i][j]=65+i-j;
		}
		for(j=i+1;j<=m-1;j++){
			ANS[i][j]=65+j-i;
		}
	}
	for(i=0;i<=n-1;i++){
		for(j=0;j<=m-1;j++){
			cout << ANS[i][j];
			if(j==m-1){
				cout << endl;
			}
		}
	}
	return 0;
} 
