#include <iostream>
#include <cstring>
using namespace std;

char input[101]={0};
char ans[10000];
void deal1(int m,int n){
	bool change=false;
	int count=0;
	int l1=strlen(input);
	int i=0;
	while(i<=l1-1){
		if(input[i]=='-'){
			if((input[i-1]>='0' && input[i+1]<='9' && input[i-1]<input[i+1])||
			    input[i-1]>='a' && input[i+1]<='z' && input[i-1]<input[i+1]){
			    	change=true;
				if(n==1){
					for(char p=input[i-1]+1;p<=input[i+1]-1;p++){
						for(int q=1;q<=m;q++){
							ans[count]=p;
							count++;
						}
					}
				}
				if(n==2){
					for(char p=input[i+1]-1;p>=input[i-1]+1;p--){
						for(int q=1;q<=m;q++){
							ans[count]=p;
							count++;
						}
					}
				}
			}
		}
		if(change==false){
			ans[count]=input[i];
			count++;
		}
		change=false;
		i++;
	}
}
void deal2(int m,int n){
	int count=0;
	int l1=strlen(input);
	int i=0;
	bool change=false;
	while(i<=l1-1){
		if(input[i]=='-'){
			if(input[i-1]>='0' && input[i+1]<='9' && input[i-1]<input[i+1]){
				change=true;
				if(n==1){
					for(char p=input[i-1]+1;p<=input[i+1]-1;p++){
						for(int q=1;q<=m;q++){
							ans[count]=p;
							count++;
						}
					}
				}
				if(n==2){
					for(char p=input[i+1]-1;p>=input[i-1]+1;p--){
						for(int q=1;q<=m;q++){
							ans[count]=p;
							count++;
						}
					}
				}
			}
			if(input[i-1]>='a' && input[i+1]<='z' && input[i-1]<input[i+1]){
				change=true;
				if(n==1){
					for(char p=input[i-1]-31;p<=input[i+1]-33;p++){
						for(int q=1;q<=m;q++){
							ans[count]=p;
							count++;
						}
					}
				}
				if(n==2){
					for(char p=input[i+1]-33;p>=input[i-1]-31;p--){
						for(int q=1;q<=m;q++){
							ans[count]=p;
							count++;
						}
					}
				}
			}
		}
		if(change==false){
			ans[count]=input[i];
			count++;
		}
		change=false;
		i++;	
	}
}
void deal3(int m){
	int count=0;
	int l1=strlen(input);
	int i=0;
	bool change=false;
	while(i<=l1-1){
		if(input[i]=='-'){
			if((input[i-1]>='0' && input[i+1]<='9' && input[i-1]<input[i+1])||
			    input[i-1]>='a' && input[i+1]<='z' && input[i-1]<input[i+1]){
			    	change=true;
			    	for(char p=input[i-1]+1;p<=input[i+1]-1;p++){
						for(int q=1;q<=m;q++){
							ans[count]='*';
							count++;
						}
					}
				}
		}
		if(change==false){
			ans[count]=input[i];
			count++;
		}
		change=false;
		i++;	
    }
}
int main(){
	int p1,p2,p3;
	cin >> p1 >> p2 >> p3;
	cin >> input;
	int l=strlen(input);
	for(int i=0;i<=l-1;i++){
		if(input[i]=='-'){
			if(input[i-1]+1==input[i+1]){
				for(int j=i;j<=l-1;j++){
					input[j]=input[j+1];
				}
			}
		}
	}
	if(p1==1){
		deal1(p2,p3);
	}
	if(p1==2){
		deal2(p2,p3);
	}
	if(p1==3){
		deal3(p2);
	}
	cout << ans << endl;
	return 0;
} 
