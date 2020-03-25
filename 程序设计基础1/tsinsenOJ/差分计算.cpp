#include <iostream>
using namespace std;

int a[31];
int s=0;
int cf(int n){
	s=s+a[n];
	if(n==1){
		return 0;
	}
	for(int i=1;i<=n-1;i++){
		a[i]=a[i+1]-a[i];
	}
	cf(n-1);
	return s;
}
int main(){
	int n=0,i=0;
	cin >> n;
	for(i=1;i<=n;i++){
		cin >> a[i];
	}
	cout << cf(n) << endl;
	return 0;
}
