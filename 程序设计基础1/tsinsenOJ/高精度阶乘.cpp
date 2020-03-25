#include <iostream>
#include <cstring>
using namespace std;

int main(){
	int i=0,n=0,j=0,p=0,m=0;
	int A[2600]={0};
	A[0]=1;
	cin >> n;
	for(i=2;i<=n;i++){
		for(j=0;j<2600;j++){
			A[j]=p+A[j]*i;
			p=A[j]/10;
			if(A[j]>=10){
				A[j]=A[j]%10;
			}	
		}
	}
	for(i=2599;i>=0;i--){
		if(A[i]!=0){
			m=i;
			break;
		}
	}
	for(i=m;i>=0;i--){
		cout << A[i];
		if(i==0){
			cout << endl;
		}
	}
	return 0;
} 
