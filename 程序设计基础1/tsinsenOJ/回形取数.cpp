#include <iostream>
using namespace std;

int a[201][201];
int sum=0;
int qs(int m,int n,int bg,int p,int q){
	for(int i=bg;i<=m-1;i++){
		sum++;
		if(sum==p*q){
		cout << a[i][bg] << endl;
		return 0;
	}
		else
		cout << a[i][bg] << " ";
	}
	for(int i=bg;i<=n-1;i++){
		sum++;
		if(sum==p*q){
		cout << a[m][i] << endl;
		return 0;
	}
		else
		cout << a[m][i] << " ";
	}
	for(int i=m;i>=bg+1;i--){
		sum++;
		if(sum==p*q){
		cout << a[i][n] << endl;
		return 0;
	}
		else
		cout << a[i][n] << " ";
	}
	for(int i=n;i>=bg+1;i--){
		sum++;
		if(sum==p*q){
		cout << a[bg][i] << endl;
		return 0;
	}
		else
		cout << a[bg][i] << " ";
	}
	if((p*q-sum)!=1)
	qs(m-1,n-1,bg+1,p,q);
	else{
		cout << a[(m+1)/2][(n+1)/2] << endl;
		return 0;
	}
} 
int main(){
	int i=0,j=0;
	int n=0,m=0,p=0,q=0;
	cin >> m >> n;
	for(i=1;i<=m;i++){
		for(j=1;j<=n;j++){
			cin >> a[i][j];
		}
	} 
	p=m,q=n;
	qs(m,n,1,p,q);
	return 0;
}
