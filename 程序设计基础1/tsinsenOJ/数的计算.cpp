#include <iostream>
using namespace std;
int mem[1001];
int half(int n){
	int sum1=0;
	if(n==1){
		return 0;
	}
	if(mem[n]>0){
		return mem[n];
	}
	int p=n/2;
	sum1=sum1+p;
	for(int i=1;i<=p;i++){
		sum1=sum1+half(i);
	}
	mem[n]=sum1;
	return sum1;
} 
int main(){
	int n=0;
	cin >> n;
	cout << half(n)+1 << endl;
	return 0; 
}
