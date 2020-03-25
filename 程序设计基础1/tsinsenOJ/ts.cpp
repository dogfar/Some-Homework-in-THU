#include <iostream>
#include <fstream>
using namespace std;

int main(){
	ifstream fin("op.in");
	int m,n,k,l,d;
	fin >> m >> n >> k >> l >> d;
	cout << m << " " << n << " " << k << " " << l << " " << d << endl;
	int seat[2001][4];
	for(int i=0;i<d;i++){
		for(int j=0;j<4;j++){
			fin >> seat[i][j];
			cout << seat[i][j] << " ";
			if(j==3)cout << endl;
		}
	}
	return 0;
}
