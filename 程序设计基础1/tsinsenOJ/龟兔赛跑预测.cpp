#include <iostream>
using namespace std;

int main(){
	int v1=0,v2=0,t=0,s=0,l=0;
	int m=0,st=0,sr=0;
	cin >> v1 >> v2 >> t >> s >> l;
	while(st<l && sr<l){
		sr=sr+v1;
		st=st+v2;
		m=m+1;
		if(sr-st>=t && sr<l){
			st=st+s*v2;
			m=m+s;
		}
	}
	if(st>sr){
		cout << "T" << endl;
		cout << l/v2 << endl;
	}
	if(st<sr){
		cout << "R" << endl;
		cout << m << endl;
	}
	if(st==sr){
		cout << "D" << endl;
		cout << m << endl;
	}
	return 0;
} 
//������ύ�˺ܶ�鶼��80�����̶��պ��ִ���m������ʱ�䣬������ÿ�ε��ڹ��2��ÿ��4�ף�����ʱ�ڹ�����յ�ֻ��4�ף����һζ���m����һ�룡 
