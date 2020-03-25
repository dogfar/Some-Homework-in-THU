#include <iostream>
using namespace std;

int main(){
	int i,j,N,p,q,a,b,c,d;
	cin >> N;
	cin >> i;
	cin >> j;
	for (p=1;p<=N;p++){
		cout << "(" << i << "," << p << ")";
		if(p==N){
			cout << endl;
		}
	}
	for (q=1;q<=N;q++){
		cout << "(" << q << "," << j << ")";
		if(q==N){
			cout << endl;
		}
	}
	if (i<j){
		for(a=1;a+j-i<=N;a++){
		cout << "(" << a << "," << a+j-i << ")"; 
		if(a+j-i==N){
			cout << endl;
		}
	}
	}
	else{
		for(b=1;b<=N;b++){
			cout << "(" << b+i-j << "," << b << ")";
			if(b+i-j==N){
				cout << endl;
				break;
			}
		}
	}
	if(i+j<N+1){
		for (c=i+j-1;c>=1;c=c-1){
			cout << "(" << c << "," << i+j-c << ")";
			if (c==1){
				cout << endl;
			}
		}
	}
	else{
		for (d=N;d>=1;d=d-1){
			cout << "(" << d << "," << i+j-d << ")";
			if(i+j-d==N){
				cout << endl;
				break; 
			}
		}
	}
	return 0;
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

