#include <iostream>
using namespace std;

int a[1001]={0};
int p=0,s=0;
int tmp=0;
int hfm(int n){
	if(n==1){
		return 0;
	}
	for(int i=n-1;i>=1;i--){
		if(a[n]>a[i]){
			tmp=a[n];
			a[n]=a[i];
			a[i]=tmp;
		}
	}
	for(int i=n-2;i>=1;i--){
		if(a[n-1]>a[i]){
			tmp=a[n-1];
			a[n-1]=a[i];
			a[i]=tmp;
		}
	}
	p=a[n]+a[n-1];
	s=s+p;
	a[n-1]=p;
	hfm(n-1);
	return s;
} 
int main(){
	int n=0,i=0;
	cin >> n;
	for(i=1;i<=n;i++){
		cin >> a[i];
	}
	cout << hfm(n) << endl;
	return 0;
}
