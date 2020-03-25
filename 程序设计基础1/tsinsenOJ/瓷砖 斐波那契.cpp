#include <iostream>
#include <cmath>
using namespace std;

int main(){
	int n=0;
	cin >> n;
	int a=0,b=1;
	for (int i=1;i<=n;i=i+1){
		b=a+b;
		a=b-a;
	}
	cout << b << endl;
	return 0;
} 
