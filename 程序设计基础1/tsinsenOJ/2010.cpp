#include <iostream>
#include <algorithm>
#include <cstring>
#include <string>
using namespace std;

string num[21]={"zero","one","two","three","four","five","six","seven","eight","nine","ten","eleven"
,"twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen","twenty"};
string s1="a";
string s2="both";
string s3="another";
string s4="first";
string s5="second";
string s6="third";
int main(){
	int count=0;
	int n[6];
	string s[6];
	for(int i=0;i<=5;i++){
		cin >> s[i];
		for(int j=0;j<=20;j++){
			if(strcmp(s[i].c_str(),num[j].c_str())==0){
				n[count]=j;
				count++;
				break;
			}
		}
		if(strcmp(s[i].c_str(),s1.c_str())==0 || strcmp(s[i].c_str(),s4.c_str())==0){
			n[count]=1;
			count++;
			continue;
		}
		if(strcmp(s[i].c_str(),s2.c_str())==0 || strcmp(s[i].c_str(),s5.c_str())==0){
			n[count]=2;
			count++;
			continue;
		}
		if(strcmp(s[i].c_str(),s3.c_str())==0 || strcmp(s[i].c_str(),s6.c_str())==0){
			n[count]=3;
			count++;
			continue;
		}
	}
	if(count==0)cout << "0" << endl;
	else{
	for(int i=0;i<count;i++){
		n[i]=(n[i]*n[i])%100;
	}
	sort(n,n+count);
	int flag=0;
	for(int i=0;i<count;i++){
		if(n[i]!=0){
			if(n[i]<10 && flag!=0)cout << "0" << n[i];
			if(n[i]<10 && flag==0){
				cout << n[i];
				flag++;
			}
			if(n[i]>=10){
				cout << n[i];
				flag++;
			}
		}
		if(i==count-1)cout << endl;
	}
}
	return 0;
}
