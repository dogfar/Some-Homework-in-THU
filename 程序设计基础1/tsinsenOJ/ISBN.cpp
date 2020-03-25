#include <iostream>
using namespace std;

int main(){
	int a[10];
	char MO; 
	int i=0,p=0,m=0;
	scanf("%1d-%1d%1d%1d-%1d%1d%1d%1d%1d-%1c",&a[1],&a[2],&a[3],&a[4],&a[5],&a[6],&a[7],&a[8],&a[9],&MO); 
	for(i=1;i<=9;i++){
		p=p+a[i]*i;
	}
	m=p%11;
	if(m<10){
		if(m==(MO-'0')){
			cout << "Right" << endl;
		}
		else{
			cout << a[1] << "-" << a[2] << a[3] << a[4] << "-" << a[5] << a[6] << a[7] << a[8] << a[9] << "-" << m << endl;
		}
	}
	else{
		if(MO=='X'){
			cout << "Right" << endl;
		}
		else{
			cout << a[1] << "-" << a[2] << a[3] << a[4] << "-" << a[5] << a[6] << a[7] << a[8] << a[9] << "-" << 'X' << endl;
		}
	}
	return 0;
} 
