#include <iostream>
#include <cstring>
using namespace std;

char INPUT[104];
bool son=true;
int s; 
int repeat(int n,int l){
	if(n==0){
		return 0;
	}
	s=n/2;
	for(int i=1;i<=l+1-n;i++){
		son=true;
		for(int j=0;j<s;j++){
			if(INPUT[i+j]!=INPUT[i+j+s]){
			son=false;
			break;
		   }
		}
		if(son==true){
		   return n;
		} 
	}
    if(son==false){
		repeat(n-2,l);
	}
} 
int main(){
	int i,p;
	cin >> INPUT;
	p=strlen(INPUT);
	for(i=p-1;i>=0;i--){
		INPUT[i+1]=INPUT[i];
	}
	if(p%2==1){
		cout << repeat(p-1,p) << endl;
	}
	if(p%2==0){
		cout << repeat(p,p) << endl;
	} 
	return 0;
}
