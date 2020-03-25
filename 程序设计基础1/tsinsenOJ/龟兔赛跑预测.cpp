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
//这道题提交了很多遍都是80，与标程对照后发现错误：m不等于时间，若兔子每次等乌龟赶2秒每秒4米，而此时乌龟距离终点只有4米，如果一味输出m则会多一秒！ 
