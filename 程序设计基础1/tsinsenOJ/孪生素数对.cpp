#include <iostream>
#include <cmath>
using namespace std;

int main(){
	long long a,b,i,j,p;
	int q = 0;
	bool A=true,B=true;
	cin >> a >> b;
	if(a<=1){
		a=2;
    }
	for(i=a;i<=b-2;i++){
		for(j=2;j*j<=i;j++){
			if (i%j==0){
				A=false;
			}
		}
		for (p=2;p*p<=i+2;p++){
			if((i+2)%p==0){
				B=false;
			}
		}
		if (A && B){
			cout << i << " " << i+2 << endl;
			q=q+1;
		}
		A=true;
		B=true;
	}
	if(q==0){
		cout << "-1" << endl;
	}
	return 0;
} 
