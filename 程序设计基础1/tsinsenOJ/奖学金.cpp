#include <iostream>
using namespace std;

int main(){
	int a[301][6]={0};
	int t=0;
	int i=0,j=0,tmp=0,n=0;
	cin >> n;
	for(i=1;i<=n;i++){
		a[i][1]=i;
	}
	for(i=1;i<=n;i++){
		for(j=2;j<=4;j++){
			cin >> a[i][j];
		}
		a[i][5]=a[i][2]+a[i][3]+a[i][4];
	}
	for(i=1;i<=n-1;i++){
		for(j=1;j<=n-i;j++){
			if(a[j][5]<a[j+1][5]){
				tmp=a[j][5];
				a[j][5]=a[j+1][5];
				a[j+1][5]=tmp;
				tmp=a[j][1];
				a[j][1]=a[j+1][1];
				a[j+1][1]=tmp;
				tmp=a[j][2];
				a[j][2]=a[j+1][2];
				a[j+1][2]=tmp;
			}
		}
	}
	for(i=1;i<=4;i++){
		if(a[i][5]==a[i+1][5]){
			if(a[i][2]<a[i+1][2]){
				tmp=a[i][1];
				a[i][1]=a[i+1][1];
				a[i+1][1]=tmp;
			}
		}
    }
	for(i=1;i<=5;i++){
		cout << a[i][1] << " " << a[i][5] << endl;
	}
	return 0;
} 
