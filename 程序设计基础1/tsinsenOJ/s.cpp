#include <iostream>
using namespace std;

int main(){
	int n;
	cin >> n;
	int m;
	int count=0;
	int cnt=-1;
	while(scanf("%d",&m)==1){
		cnt++;
		for(int i=1;i<=m;i++){
			count++;
			if(count<n){
				if(cnt%2==0)cout << "0";
				else cout<<"1";
			}
			if(count==n){
				count=0;
				if(cnt%2==0)cout<< "0" << endl;
				else cout << "1" << endl;
			}
		}
		m=0;
	}
	return 0;
} 
