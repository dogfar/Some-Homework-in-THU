//1��a��b�������10007��������ȡģ����LINE 23 24)
//2��ansֱ�ӳˣ���Ҫ�������mul,����֮��ȡģ���鷳�� 

#include <iostream>
using namespace std;

int ch[1000][1000]={0};

int choose(int n,int k){
	if(n==0 || n==k){
		return 1;
	}
	if(ch[k][n]>0){
		return ch[k][n];
    }
	ch[k][n]=(choose(n-1,k-1)+choose(n,k-1))%10007;
	return ch[k][n];
}
int main(){
	int a=0,b=0,k=0,m=0,n=0;
	int mul1=1,mul2=1;
	cin >> a >> b >> k >> n >> m;
	a=a%10007;
	b=b%10007;
	int i=0,ans=0;
	ans=choose(n,k);
	for(i=1;i<=m;i++){
		ans=(ans*b)%10007;
	} 
	for(i=1;i<=n;i++){
		ans=(ans*a)%10007;
	}
	cout << ans << endl;
	return 0;
}
