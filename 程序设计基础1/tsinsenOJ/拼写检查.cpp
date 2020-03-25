#include <iostream>
#include <cstring>
using namespace std;

char word[22]={0};
char wordlist[101][22]={0};
bool ans=0;
bool same=0;
void judgesame(int m){
	int l1=strlen(word);
    int l2=strlen(wordlist[m]);
    if(l1==l2 && strcmp(word,wordlist[m])==0){
    	cout << wordlist[m] << endl;
    	ans=1;
	}
	return;
}
void judge(int m){
	int l1=strlen(word);
    int l2=strlen(wordlist[m]);
	if(l1==l2){
		int sum=0;
		for(int i=0;i<l1;i++){
			if(word[i]!=wordlist[m][i]){
				sum++;
			}
		}
		if(sum==1){
			cout << wordlist[m] << endl;
			ans=1;
			return;
		}
	}
	if(l1-l2==1){
	bool A=true;
		for(int i=0;i<l1;i++){
			if(word[i]!=wordlist[m][i]){
				for(int j=i+1;j<=l1-1;j++){
					word[j-1]=word[j];
				}
				break;
			}
		}
		for(int i=0;i<l2;i++){
			if(word[i]!=wordlist[m][i]){
		       A=false;
		       break;
			}
		}
		if(A){
		   cout << wordlist[m] << endl;
		   ans=1;
		   return;	
		}
	}
	if(l2-l1==1){
	bool B=true;
	for(int i=0;i<l2;i++){
		if(word[i]!=wordlist[m][i]){
			for(int j=l1-1;j>=i;j--){
				word[j+1]=word[j];
			}
			word[i]=wordlist[m][i];
			break;
		}
	}
	for(int i=0;i<l2;i++){
		if(word[i]!=wordlist[m][i]){
			B=false;
			break;
		}
	}
	if(B){
		cout << wordlist[m] << endl;
		ans=1;
		return;
	}
	}
}
int main(){
	int n;
	cin >> word;
	cin >> n;
	for(int i=1;i<=n;i++){
		cin >> wordlist[i];
	}
	for(int i=1;i<=n;i++){
		judgesame(i);
		if(ans){
			break; 
		}
	}
	if(!ans){
	for(int k=1;k<=n;k++){
		judge(k);
		if(ans){
			break;
		}
	}
}
	if(ans==0){
		cout << "NOANSWER" << endl;
	}
	return 0;
} 
