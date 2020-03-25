#include <iostream>
using namespace std;

int phi[40001];
void phitable(int n){
	for(int i=1;i<=n;i++){
		phi[i]=0;
	}
	phi[1]=1;
	for(int i=2;i<=n;i++){
		if(!phi[i]){
			for(int j=i;j<=n;j+=i){
				if(!phi[j])phi[j]=j;
				phi[j]=phi[j]/i*(i-1);
			}
		}
	}
}
int main(){
	int n;
	int ans=1;
	cin >> n;
	int sum=0;
	phitable(n-1);
	phitable(n-1);
	if(n==1)cout << "0" << endl;
	else{
	for(int i=2;i<=n-1;i++){
		ans=ans+2*(phi[i]);
	}
	cout << ans+2 << endl;
}
	return 0;
} 
