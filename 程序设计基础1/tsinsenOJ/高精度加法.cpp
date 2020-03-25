
  #include <iostream>
#include <cstring>
using namespace std;

int main(){
	char A[200]={'0'},B[200]={'0'};
	cin >> A;
	cin >> B;
	int A1[200]={0},B1[200]={0},C[200]={0};
	int i=0,n=0,L1=0,L2=0,p=0,r=0,s=0;
	L1=strlen(A),L2=strlen(B);
	for(i=L1;i<=200;i++){
		A[i]='0';
	}
	for(i=L2;i<=200;i++){
		B[i]='0';
	}
	for(i=0;i<L1/2;i++){
		n=A[i];
		A[i]=A[L1-i-1];
		A[L1-i-1]=n;
	}
	for(i=0;i<L2/2;i++){
		n=B[i];
		B[i]=B[L2-i-1];
		B[L2-i-1]=n;	
	}
	for(i=0;i<=L1-1;i++){
		A1[i]=A[i]-'0';
    }
    for(i=0;i<=L2-1;i++){
		B1[i]=B[i]-'0';
	}
	for(i=0;i<=200;i++){
		C[i]=p+B1[i]+A1[i];
		p=C[i]/10;
		if(C[i]>=10){
			C[i]=C[i]%10;
		}
	}
	for(i=110;i>=0;i--){
		if(C[i]!=0){
			r=i;
			break;
		}
	}
	for(i=0;i<=r/2;i++){
		s=C[i];
		C[i]=C[r-i];
		C[r-i]=s;
	}
	for(i=0;i<=r;i++){
		cout << C[i];
		if(i==r){
			break;
		}
	}
	return 0;
} 

