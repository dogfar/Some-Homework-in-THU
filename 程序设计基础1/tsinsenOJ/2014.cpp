#include <iostream>
#include <algorithm>
using namespace std;

int pri[7];
int num[1000][7];
int count0[8];
int main(){
	int n;
	cin >> n;
	for(int i=0;i<7;i++){
		cin >> pri[i];
	}
	for(int i=0;i<=n-1;i++){
		int count=0;
		for(int j=0;j<7;j++){
			cin >> num[i][j];
			for(int k=0;k<7;k++){
				if(num[i][j]==pri[k]){
					count++;
					break;
				}
			}
		}
		count0[7-count]++;
	}
	for(int i=0;i<7;i++){
		cout << count0[i] << " ";
		if(i==6)cout << endl;
	}
	return 0;
}
