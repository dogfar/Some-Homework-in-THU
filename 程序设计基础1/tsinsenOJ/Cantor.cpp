#include <iostream>
using namespace std;

int main(){
	int sum=0,i=0,n=0,p=0,det=0;
	cin >> n;
	for(i=1;i<=n;i++){
		if(n>=i*(i+1)/2 && n<(i+1)*(i+2)/2){
			p=i;
			break;
		}
	}
	det=n-(p+1)*p/2;
	if(det!=0){
		if(p%2==0){
		   cout << p+2-det << "/" << det << endl;
	    }
	    else{
		   cout << det << "/" << p+2-det << endl;
	    }
	}
	if(det==0){
		if(p%2==0)
		cout << p << "/" << 1 << endl;
		else{
			cout << 1 << "/" << p << endl;
		}
	}
	return 0;
} 
