#include <iostream>
using namespace std;

int main(){
	int n=0,j=0,m=0,i=0;
	int sum=0,p=0;
	int A[5001][3];
	int B[5001][3]; 
	int temp=0;
	int temp1=0;
	cin >> n >> m;
	for(i=1;i<=n;i++){
		cin >> A[i][1] >> A[i][2];
		B[i][1]=A[i][1];
		B[i][2]=A[i][2];
	}
	m=m+m/2;
	for(i=1;i<=n-1;i++){
		for(j=1;j<=n-i;j++){
			if(A[j][2]<A[j+1][2]){
				temp=A[j][2];
				A[j][2]=A[j+1][2];
				A[j+1][2]=temp;
				temp1=A[j][1];
				A[j][1]=A[j+1][1];
				A[j+1][1]=temp1;
			}
			//排完分数后接着排序号，直接插在冒泡里，不要到最后再排序号 
			if(A[j][2]==A[j+1][2]){
				if(A[j][1]>A[j+1][1]){
			       temp=A[j][1];
				   A[j][1]=A[j+1][1];
				   A[j+1][1]=temp;
				}
			}
		}
	}
	for(i=m;i<=n;i++){
		if(A[i][2]<A[m][2]){
			sum=i;
			break;
		}
	}
	cout << A[m][2] << " " << sum-1 << endl;
	for(i=1;i<=sum-1;i++){
		cout << A[i][1] << " " << A[i][2] << endl;
	}
	return 0;
} 
