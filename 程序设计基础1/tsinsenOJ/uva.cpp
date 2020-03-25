#include <iostream>
#include <cstring> 
#include <stdlib.h>
using namespace std;

int main(){
	long long int m=2147483647;
	char ex[15]={"2147483647"};
	char num1[100000];
	char op;
	char num2[100000];
	string str;
	while(cin >> str){
		int tmp=0;
		int l=sizeof(str);
		for(int i=0;i<l;i++){
			if(str[i]=='+' || str[i]=='*'){
				op=str[i];
				tmp=i;
				break;
			}
		}
		for(int i=0;i<tmp;i++){
			num1[i]=str[i];
		}
		for(int i=0;i<l-tmp;i++){
			num2[i]=str[tmp+1+i];
		}
		cout << num1 << op << num2 << endl;
		bool A=true;
		bool B=true;
		if(strlen(num1)>10){
			A=false;
			cout << "first number too big" << endl;
		}
		if(strlen(num1)==10 && strcmp(num1,ex)>0){
			A=false;
			cout << "first number too big" << endl;
		}
		if(strlen(num2)>10){
			B=false;
			cout << "second number too big" << endl;
		}
		if(strlen(num2)==10 && strcmp(num2,ex)>0){
			cout << "second number too big" << endl;
			B=false;
		}
		if(!A || !B)cout << "result too big" << endl;
		else{
			if(op=='+'){
				int m1=atoi(num1);
				int m2=atoi(num2);
				if(m-m1<m2)cout << "result too big" << endl;
			}
			if(op=='*'){
				int m1=atoi(num1);
				int m2=atoi(num2);
				if(m/m1<m2)cout << "result too big" << endl;
			}
		}
		memset(num1,0,sizeof(num1));
		memset(num2,0,sizeof(num2));
	}
	return 0;
}
