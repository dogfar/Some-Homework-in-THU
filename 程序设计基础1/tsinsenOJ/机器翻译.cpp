#include <iostream>
#include <cstring>
using namespace std;

int main(){
	int m=0,n=0,i=0,j=0,p=0,sum=0;
	bool cha=true;
	cin >> m >> n;
	int a[1000]; 
	int b[1000];
	for(i=0;i<=1000;i++){
		a[i]=-1;
		b[i]=-1;
	}
	for(i=0;i<=n-1;i++){
		cin >> a[i];
		cha=true;
		for(j=0;j<=m-1;j++){
			if(a[i]==b[j]){
				cha=false;
				break; 
			}
		}
		if(cha==true){
			p=sum%m;
			sum=sum+1;	
			b[p]=a[i]; 
		}		
	}
	cout << sum << endl;
	return 0;
} 
