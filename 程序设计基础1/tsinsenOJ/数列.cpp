#include <iostream>
using namespace std;

int main(){
	int k,n,ans=0;
	cin >> k >> n;
	int binary[10]={1,2,4,8,16,32,64,128,256,512};
	for(int i=9;i>=0;i--){
		if(n>=binary[i] && i!=0){
			n-=binary[i];
			int tmp=1;
			for(int j=1;j<=i;j++){
				tmp=tmp*k;
			}
			ans=ans+tmp;
		}
		if(n>=binary[i] && i==0){
			ans=ans+1;
		}
	}
	cout << ans << endl;
	return 0;
}
