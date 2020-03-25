#include <iostream>
#include <fstream>
using namespace std;

int pep[10003]={0};
int flag=0;
int flag2=0;
void findmin(int m){
	int min1=10000001;
	for(int i=1;i<=m;i++){
		if(min1>pep[i]){
			min1=pep[i];
			flag=i;
		}
	}
}
void findmax(int m){
	int max1=0;
	for(int i=1;i<=m;i++){
		if(max1<pep[i]){
			max1=pep[i];
			flag2=i;
		}
	}
}
int main(){
	int n,m;
	cin >> n >> m;
	for(int i=1;i<=n;i++){
		cin >> pep[i];
	}
	for(int i=m+1;i<=n;i++){
		findmin(m);
		pep[flag]=pep[flag]+pep[i];
	}
	findmax(m);
	cout << pep[flag2] << endl;
	return 0;
} 
