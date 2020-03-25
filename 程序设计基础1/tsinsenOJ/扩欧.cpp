#include<iostream>
using namespace std;

int ans=0;
int a,b;
int x,y;
void exgcd(int a,int b){
	if(b==0){
		x=1;
		y=0; 
	} 
	else{
		exgcd(b,a%b);
		int tmp=x;
		x=y;
		y=tmp-a/b*y;
	}
}
int main(){
	cin >> a >> b;
	exgcd(a,b);
	cout << (x+b)%b << endl;
	return 0;
} 
