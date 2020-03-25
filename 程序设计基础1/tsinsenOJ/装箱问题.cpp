#include <iostream>
using namespace std;

int total=0,n=0;
int weight[31];
int record[31][20001];
int load(int n,int m,int *p){
	if(n<0)return 0;
	if(record[n][m]>0)return record[n][m];
	int max=load(n-1,m,p);
	if(m>=weight[n]){
		int tmp=load(n-1,m-weight[n],p)+weight[n];
		if(max<tmp)max=tmp;
	}
	record[n][m]=max;
	return max;
}
int main(){
	cin >> total >> n;
	weight[0]=0;
	for(int i=1;i<=n;i++){
		cin >> weight[i];
	}
	cout << total-load(n,total,weight) << endl;
	return 0;
}
