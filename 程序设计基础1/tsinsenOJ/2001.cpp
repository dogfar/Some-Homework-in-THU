#include <iostream>
using namespace std;

bool pd(int m,int n){
	int count0=0;
	if(m>n){
		int tmp=0;
		tmp=m;
		m=n;
		n=tmp;
	}
	for(int i=1;i*i<=m;i++){
		if(m%i!=0)continue;
		else{
			int v=m/i;
			if(n%i==0)count0++;
			if(n%v==0)count0++;
		}
	}
	if(count0==1)return true;
	else return false;
}
int main(){
	int p,q;
	int count=0;
	cin >> p >> q;
	if(q%p!=0){
		cout << "0" << endl;
		return 0;
	}
	int s=q/p;
	for(int i=1;i<=s;i++){
		if(s%i!=0)continue;
		else{
			int j=s/i;
			if(pd(i,j))count++;
		}
	}
	cout << count+2 << endl;
	return 0;
}
