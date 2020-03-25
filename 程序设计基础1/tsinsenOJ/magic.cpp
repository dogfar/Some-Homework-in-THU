#include <iostream>
#include <algorithm>
using namespace std;

int main(){
	int n,m;
	cin >> n >> m;
	int num[10000];
	for(int i=0;i<n;i++){
		cin >> num[i];
	}
	for(int i=1;i<=m;i++){
		next_permutation(num,num+n);
	}
	for(int i=0;i<=n-1;i++){
		cout << num[i] << " ";
		if(i==n-1)cout << num[i] << endl;
	}
	return 0;
}
