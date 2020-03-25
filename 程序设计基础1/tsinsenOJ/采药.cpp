#include <iostream>
using namespace std;

struct goods{
	int time;
	int value;
}medicine[101];
int v[1001][101]={0};
int cut(int n,int t,goods *p){
	if(n<=0)return 0;
	if(v[t][n]>0)return v[t][n];
	int max1=cut(n-1,t,p);
	if(t>=p[n].time){
		int value0=cut(n-1,t-p[n].time,p)+p[n].value;
		if(value0>max1)max1=value0;
	}
	v[t][n]=max1;
	return max1;
}
int main(){
	int tl,n;
	cin >> tl >> n;
	for(int i=1;i<=n;i++){
		cin >> medicine[i].time >> medicine[i].value;
	}
	cout << cut(n,tl,medicine) << endl;
	return 0;
}
