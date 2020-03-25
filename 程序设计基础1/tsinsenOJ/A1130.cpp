#include <iostream>
using namespace std;

int sum=0;
int half(int n){
	if(n==1){
		return 0;
	}
	int p=n/2;
	sum=sum+p;
	for(int i=1;i<=p;i++){
		half(i);
	}
	return sum;
} 
int main(){
	int n=0;
	cin >> n;
	cout << half(n)+1 << endl;
	return 0; 
}
