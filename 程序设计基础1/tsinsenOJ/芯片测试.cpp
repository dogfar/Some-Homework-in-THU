#include <iostream>
using namespace std;
//оƬ���� �õıȻ��Ķ� ����ÿ��1��0���һ���� 0��һ���һ���� 

int main(){
	int i,j,n;
	int sum1=0;
	int sum0=0;
	int sum=0;
	int ans[401];
	cin >> n;
	int a[21][21];
	for(i=1;i<=n;i++){
		for(j=1;j<=n;j++){
			cin >> a[i][j];
		}
	}
	for(j=1;j<=n;j++){
		for(i=1;i<=n;i++){
			if(a[i][j]==1)
			sum1++;
			if(a[i][j]==0)
			sum0++;
		}
		if(sum1>sum0){
			sum++;
			ans[sum]=j;
		}
		sum1=0;
		sum0=0;
	}
	for(i=1;i<=sum;i++){
		if(i<=sum-1)
		cout << ans[i] << " ";
		if(i==sum)
		cout << ans[i] << endl;
	}
	return 0;
} 
