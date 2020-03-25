#include <iostream>
#include <cstring>

using namespace std;

int main(){
	int n=0,i=0,p=0;
	double k=0.0;
	char A[1000];
	cin >> A;
	n=strlen(A);
	for(i=0;i<=n;i++){
		if (71==A[i] || 67==A[i]){
			p=p+1;
		}
	}
	k=p*100.0/n+0.5;
	cout << (int)(k) << endl;
	return 0; 
} 
