#include <iostream>
#include <cmath>
using namespace std;

int main(){
	int a=0,b=0,i=0,j=0,d=0;
	cin >> a >> b;
	for(i=a;i<=b;i++){
	cout << i << "=";
	j=2;d=i;
	while (j<=i){
		if(i%j!=0){
			j=j+1;
		}
		else{
			i=i/j;
			if(i==1){
				cout << j << endl;
				} 
				else{
					cout << j << "*";
				}
		}
	} 
	i=d;
}
 return 0;
}
