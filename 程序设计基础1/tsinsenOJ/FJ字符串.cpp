//1.�ݹ� 2.���ú��� FJ�ַ��� 
#include <iostream>
#include <cstring>
using namespace std;

void str(int a){
	if(a==1){
		cout << "A" ;
	}
	if(a>1){
		str(a-1);
		cout <<(char)('A'+a-1);
		str(a-1);
	}
}
int main(){
	int n=0;
	cin >> n;
	str(n);
	cout << endl;
	return 0; 
}
