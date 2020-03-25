#include <iostream>
#include <cmath>
using namespace std;

int main(){
	int m=0,n=0,i=0,p=0,sum=0,det=0;
	cin >> m >> n;
	if (m<n){
	p=m;
	m=n;
	n=p;	
	}
	for(i=0;i<=n-1;i++){
		sum=(m-i)*(n-i)+sum; //正方形个数：找相等长度的线段 个数相乘 比如m*N，m>n，两边长为一的各有m 和 n个，那1*1的正方形就有mn个，2*2的长方形就是m-1 * n-1个。 
	}
	det=m*n*(m+1)*(n+1)/4-sum; //所有矩形的个数，等于两边所有能连起来的线段乘积，比如3个格子，有4个顶点，能连6条；n个格子就是1+2+。。。+n 
	cout << sum << " " << det << endl;
} 
