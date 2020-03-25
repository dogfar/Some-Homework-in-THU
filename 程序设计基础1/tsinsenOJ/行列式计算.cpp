#include <iostream>
//longdouble 提高精度 原先精度不够 总是差一个点 
using namespace std;

long double a[10][10]={0};
bool A=false;
double ans=1;
int sum=0; 
double tmp;
int lieling(int bg,int n){
	A=false;
	if(bg==n){
		if(sum%2==1){
		for(int m=1;m<=n;m++){
			ans=ans*a[m][m];
		}
		return ans*(-1);
	}
	if(sum%2==0){
		for(int m=1;m<=n;m++){
			ans=ans*a[m][m];
		}
		return ans;
	}
}
    if(a[bg][bg]!=0){
    	A=true;
	}
	if(a[bg][bg]==0){
		for(int i=n;i>=bg+1;i--){
			if(a[i][bg]!=0){
				A=true;
				sum=sum+1;
				for(int j=bg;j<=n;j++){
					tmp=a[i][j];
					a[i][j]=a[bg][j];
					a[bg][j]=tmp;
				}
			}
		}
	}
	if(A==true){
	for(int i=bg+1;i<=n;i++){
		for(int j=n;j>=bg;j--){
			a[i][j]=a[i][j]-(a[bg][j]*a[i][bg]/a[bg][bg]);
		}
	}
}
    if(A==false){
    	ans=0;
    	return ans;
	}
	lieling(bg+1,n);
}
int main(){
	int n=0,i=0,j=0;
	long double ans=1;
	cin >> n;
	for(i=1;i<=n;i++){
		for(j=1;j<=n;j++){
			cin >> a[i][j];
		}
	}
	cout << lieling(1,n) << endl;
	return 0;
}
