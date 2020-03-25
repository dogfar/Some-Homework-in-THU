#include <iostream>
using namespace std;

int main(){
	bool A=false;
	char ans[7][10]={"Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"};
	char word[9][3][10];
	char week[7][3]={"MO","TU","WE","TH","FR","SA","SU"};
	for(int i=0;i<8;i++){
		cin >> word[i][1] >> word[i][2];
		if(word[i][1][0]>=97)word[i][1][0]=word[i][1][0]-32;
		if(word[i][1][1]>=97)word[i][1][1]=word[i][1][1]-32;
		if(word[i][2][1]>=97)word[i][2][1]=word[i][2][1]-32;
		if(word[i][2][0]>=97)word[i][2][0]=word[i][2][0]-32;
	}
	for(int i=0;i<7;i++){
		for(int j=0;j<8;j++){
			if((word[j][1][0]==week[i][0] && word[j][1][1]==week[i][1])
			+(word[j][2][0]!=week[i][0] || word[j][2][1]!=week[i][1])!=1)break;
			if(j==7){
				cout << ans[i] << endl;
				A=true;
			}
		}
		if(A==true) break;
	}
	return 0;
} 
