#include <iostream>
using namespace std;

int sum=0;
int temp=0;
int a[5]={0};
int blackhole(int n){
	a[1]=n/1000;
	a[2]=(n-1000*a[1])/100;
	a[3]=(n-1000*a[1]-100*a[2])/10;
	a[4]=(n-1000*a[1]-100*a[2]-10*a[3]);
	for(int i=1;i<=3;i++){
		for(int j=1;j<=4-i;j++){
		    if(a[j]>a[j+1]){
		    	temp=a[j];
		    	a[j]=a[j+1];
		    	a[j+1]=temp;
			}	
		}
	}
	int m=1000*a[4]+100*a[3]+10*a[2]+a[1]-1000*a[1]-100*a[2]-10*a[3]-a[4];
	if(m!=6174){
		sum=sum+1;
		blackhole(m);
	}
	return sum;
} 
int main(){
	int n=0;
	cin >> n;
	cout << blackhole(n)+1 << endl;
	return 0;
}
