#include <iostream>
#include <cstring>
using namespace std;

int main(){
	int ans=0;
	int count=1;
	int tmp=0;
	char input[101];
    cin >> input;
    int l=strlen(input);
    for(int i=l-2;i>=0;i--){
    	if(input[i]!='+' && input[i]!='-'){
    		tmp=tmp+(input[i]-'0')*count;
    		count=count*10;
		}
		if(input[i]=='+'){
			ans=ans+tmp;
			tmp=0;
			count=1;
		}
		if(input[i]=='-'){
			ans=ans-tmp;
			tmp=0;
			count=1;
		}
		if(i==0 && input[i]!='+'){
			ans=ans+tmp;
			tmp=0;
			count=1;
		}
	}
	cout << ans << endl;
	return 0;
} 
