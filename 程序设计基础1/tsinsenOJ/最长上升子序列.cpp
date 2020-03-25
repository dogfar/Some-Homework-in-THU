#include <iostream>
using namespace std;

int d[1001]; 
int lis(int A[], int n){
	//int *d=new int[n];
	int len=1;
	for(int i=0;i<n;i++){
		d[i]=1;
		for(int j=0;j<i;j++){
			if(A[j]<=A[i] && d[j]+1>d[i]){
				d[i]=d[j]+1;
				if(d[i]>len){
					len=d[i];
				}
			}
		}
	}
	return len;
}
int main(){
	int N=0;
	int A[1001];
	cin >> N;
	for(int i=0;i<N;i++){
		cin >> A[i];
	}
	cout << lis(A,N) << endl;
}
