#include <iostream>
#include <memory.h>
#include <cmath>
using namespace std;

int main(){
	int n=0,i=0,p=0,s=0;
	cin >> n;
	int a[n];
	memset(a,0,sizeof(a));
	for(i=1;i<=n;i++){
		cin >> a[i];
	}
	cin >> p;
	for(i=1;i<=n;i++){
		if(p==a[i]){
			cout << i << endl; 
			break;
		}
		else {
			s=s+1;
		}
	}
	if(s==n){
		cout << -1 << endl;
	}
	return 0;
} 
