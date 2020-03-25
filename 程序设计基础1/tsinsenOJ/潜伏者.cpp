#include <iostream>
#include <cstring>
using namespace std;

int main(){
	int i=0,j=0;
	int l1=0,l2=0;
	int flag=0;
	char example[101];
	char yuanwen[101];
	char mima[101];
	char ans[101]={0};
	bool S2=false;
	bool huyi=true;
	cin >> example;
	cin >> yuanwen;
	cin >> mima;
	l1=strlen(example);
	l2=strlen(mima);
	for(i=65;i<=90;i++){
		for(j=0;j<=l1-1;j++){
			if(yuanwen[j]==i){
				S2=true;
				break;
			}
		}
		if(S2==false){
			cout << "Failed" << endl;
			flag=1;
			break;
		}
		S2=false;
	}
	if(flag==0){
		for(i=0;i<=l1-2;i++){
			for(j=i+1;j<=l1-1;j++){
				if(yuanwen[i]==yuanwen[j]){
					if(example[i]!=example[j]){
						huyi=false;
						break;
					}
				}
				if(example[i]==example[j]){
					if(yuanwen[i]!=yuanwen[j]){
						huyi=false;
						break;
					}
				}
			}
			if(huyi==false){
				cout << "Failed" << endl;
				break;
			}
		}
	}
	if(flag==0 && huyi==true){
		for(i=0;i<=l2-1;i++){
			for(j=0;j<=l1-1;j++){
				if(mima[i]==example[j]){
					ans[i]=yuanwen[j];
					break;
				}
			}
		}
		cout << ans << endl; 
	}
	return 0;
} 
