#include <iostream>
using namespace std;

int n,m;
int count=0;
int process[50];
int data[50];
bool pd(int n){
	for(int i=2;i*i<=n;i++){
		if(n%i==0)return false;
	}
	return true;
}
void choose(int start,int picked){
	if(picked==m){
		int ans=0;
		for(int i=0;i<m;i++){
			ans=ans+process[i];
		}
		if(pd(ans))count++;
	}
	else{
		int max=n-m+picked;
		for(int i=start;i<=max;i++){
			process[picked]=data[i];
			choose(i+1,picked+1);
		}
	}
}
int main(){
	cin >> n >> m;
	for(int i=0;i<n;i++){
		cin >> data[i];
	}
	choose(0,0);
	cout << count << endl;
	return 0;
}
