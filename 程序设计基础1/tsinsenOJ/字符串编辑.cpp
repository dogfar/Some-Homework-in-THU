#include <iostream>
#include <cstring>
using namespace std;

int main(){
	int i=0,j=0,p=0,l=0;
	char A[41]={0};
	char B[40]={0};
	char ORDER[5];
	gets(A);
	l=strlen(A);
	for(i=0;i<=l-1;i++){
		B[i]=A[i];
	}
	gets(ORDER);
	if(ORDER[0]=='D'){
		for(i=0;i<=l-1;i++){
			if(A[i]==ORDER[2]){
				A[i]='\0';
				p=i;
				break;
			}
		}
		cout << A;
		for(i=p+1;i<=l-1;i++){
			cout << B[i] ;
			if(i==l-1){
				cout << endl;
			}
		}
	}
	if(ORDER[0]=='R'){
		for(i=0;i<=l-1;i++){
			if(A[i]==ORDER[2]){
				A[i]=ORDER[4];
			}
		}
		cout << A << endl;
	}
	if(ORDER[0]=='I'){
		for(i=l-1;i>=0;i--){
			if(A[i]==ORDER[2]){
				for(j=l;j>=i+1;j--){
					A[j]=A[j-1];
				}
				A[i]=ORDER[4];
				break;
			}
		}
		cout << A << endl;
	}
	return 0;
} 
