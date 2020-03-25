#include <iostream>
using namespace std;

int main(){
	int i=0,j=0,n=0,m=0;
	int temp=0;
	int a[51][101];
	int b[51][101];
	cin >> n >> m;
	for(i=1;i<=n;i++){
		for(j=1;j<=m;j++){
			cin >> a[i][j];
			b[i][j]=a[i][j];
			if(a[i][j]==0){
				a[i][j]=101;
				b[i][j]=101;
			}
		}
	}
	for(i=1;i<=m;i++){
		for(j=2;j<=n;j++){
			if(a[j][i]<a[1][i]){
				temp=a[j][i];
				a[j][i]=a[1][i];
				a[1][i]=temp;
			}
		}
	}
	for(i=1;i<=m;i++){
		if(a[1][i]==101){
			cout << "0" << " "; 
		}
		else{
		    for(j=n;j>=1;j--){
			   if(b[j][i]==a[1][i]){
				  cout << j << " ";
				  break;
			   }
		    }
		    if(i==m){
			   cout << endl;
		    }
	    }
	}
	return 0;
} 
