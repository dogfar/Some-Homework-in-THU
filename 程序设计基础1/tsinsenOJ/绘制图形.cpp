#include <iostream>
using namespace std;

int a[31][31];
int meiyisi(int bg,int n,int sum){
	if(n<=0){
		return 0;
	}
	for(int i=bg;i<=n-1;i++){
		sum=sum+1;
		a[bg][i]=sum;
	}
	for(int i=bg;i<=n-1;i++){
		sum=sum+1;
		a[i][n]=sum;
	}
	for(int i=n;i>=bg+1;i--){
		sum=sum+1;
		a[n][i]=sum;
	}
	for(int i=n;i>=bg+1;i--){
		sum=sum+1;
		a[i][bg]=sum;
	}
	meiyisi(bg+1,n-1,sum);
} 
int main(){
	int n=0,i=0,j=0;
	cin >> n;
	meiyisi(1,n,0);
	if(n%2==1){
		a[(n+1)/2][(n+1)/2]=n*n;
	}
	for(i=1;i<=n;i++){
		for(j=1;j<=n;j++){
			if(j<=n-1){
				cout << a[i][j] << " "; 
			}
			if(j==n){
				cout << a[i][j] << endl;
			}
		}
	}
	return 0;
}
