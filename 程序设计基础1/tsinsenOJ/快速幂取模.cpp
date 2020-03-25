#include <iostream>
using namespace std;

long long int ans=1;
long long int a,b,c;
int ksm(){
	a=a%c;
	while(b!=0){
		if(b&1)ans=(ans*a)%c;
		b>>=1;
		a=(a*a)%c;
	}
	return ans;
} 
int main(){
	long long int tmp1,tmp2; 
	cin >> a >> b >> c;
	tmp1=a;
	tmp2=b;
	ksm();
	cout << tmp1 << "^" << tmp2 << " mod " << c << "=" << ans << endl;
	return 0; 
}
