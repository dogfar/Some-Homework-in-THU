#include <iostream>
using namespace std;

int main(){
	int n;
	cin >> n;
	long long int f[20];
	f[1]=1;
	for(int i=2;i<=n+1;i++){
		f[i]=(4*i-6)*f[i-1]/i;
	}
	cout << f[n+1] << endl;
	return 0;
} 
