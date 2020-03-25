#include <iostream>
#include <cstring>
using namespace std;

int main(){
	char INPUT[1002];
	char son[1000][1000];
	char t[6];
	int n,i,j,l;
	cin >> INPUT;
	cin >> n;
	l=strlen(INPUT); 
	for(i=1;i<=l-n+1;i++){
		for(j=0;j<=n-1;j++){
			son[i][j]=INPUT[i-1+j];
		}
	}
	for(i=1;i<=l-n;i++){
		for(j=1;j<=l-n+1-i;j++){
			if(strcmp(son[j],son[j+1])>0){
				strcpy(t,son[j]);
				strcpy(son[j],son[j+1]);
				strcpy(son[j+1],t);
			}
		}
	}
	for(i=1;i<=l-n+1;i++){
		if(i<l-n+1){
			cout << son[i] << " ";
		}
		if(i==l-n+1){
			cout << son[i] << endl;
		}
	}
	return 0;
} 
