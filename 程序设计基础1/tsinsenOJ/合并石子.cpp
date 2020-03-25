#include <iostream>
using namespace std;

const int sup=2000000000;
int stone[1001];
int m[1001][1001];
int sum=0;
int tmp=0;
int find_min(int n){
	for(int i=1;i<=n;i++){
		for(int j=i;j<=n;j++){
			if(i==j){
				m[i][j]=0;
			}
			if(j==i+1){
				m[i][j]=stone[i]+stone[j];
			}
			if(j!=i && j!=i+1){
				m[i][j]=sup;
			}
		}
	}
	for(int s=1;s<=n-1;s++){
		for(int i=1;i<=n-s;i++){
			int j=i+s;
			sum=0;
			for(int k=i;k<=j;k++){
				sum=sum+stone[k];
			}
			for(int k=i;k<=j-1;k++){
				tmp=m[i][k]+m[k+1][j]+sum;
				if(tmp<m[i][j]){
					m[i][j]=tmp;
				}
			}
		}
	}
	return m[1][n];
}
int main(){
	int n=0;
	cin >> n;
	for(int i=1;i<=n;i++){
		cin >> stone[i];
	}
	cout << find_min(n) << endl;
//	for(int i=1;i<=n;i++){
//		for(int j=i;j<=n;j++){
//			cout << m[i][j] << " ";
//			if(j==n){
//				cout << endl;
//			}
//		}
//	}
	return 0;
}
 
