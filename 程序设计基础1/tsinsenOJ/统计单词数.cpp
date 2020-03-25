#include <iostream>
#include <cstring>
#include <stdio.h>
#include <cmath>
using namespace std;

int main(){
	int i=0,j=0,m=0,la=0,lb=0,sum=0,ans=0,sums=0;
	bool SAME=true;
	char A[1000000];
	char B[10];
	gets(B);
	gets(A);
	la=strlen(A);lb=strlen(B);
	for(i=0;i<=la-1;i++){
		if(B[0]==A[i] || abs(B[0]-A[i])==32){
			if(A[i+lb]!=' '){
				SAME=false;
			}
			if(i>0 && A[i-1]!=' '){
				SAME=false;
			}
			for(j=1;j<=lb-1;j++){
				if(abs(B[j]-A[i+j])!=32 && B[j]!=A[i+j]){
					SAME=false;
				}
			}
			if(SAME){
				sum=sum+1;
				if(sum==1){
					ans=i;
				}
			}
		}
		SAME=true;
	}
	if(sum>0){
		cout << sum << " " << ans << endl;
	}
	else{
		cout << "-1" << endl;
	}
	return 0;	
} 
