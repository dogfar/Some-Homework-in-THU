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
		sum=(m-i)*(n-i)+sum; //�����θ���������ȳ��ȵ��߶� ������� ����m*N��m>n�����߳�Ϊһ�ĸ���m �� n������1*1�������ξ���mn����2*2�ĳ����ξ���m-1 * n-1���� 
	}
	det=m*n*(m+1)*(n+1)/4-sum; //���о��εĸ����������������������������߶γ˻�������3�����ӣ���4�����㣬����6����n�����Ӿ���1+2+������+n 
	cout << sum << " " << det << endl;
} 
