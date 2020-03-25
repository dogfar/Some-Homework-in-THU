#include <iostream>
using namespace std;

int main(){
	int bg,ed,lth,count=0;
	bool A=false;
	cin >> bg >> ed >> lth;
	char alp[100]="0abcdefghijklmnopqrstuvwxyz";
	char jam[26];
	cin >> jam;
		while(jam[lth-1]<=alp[ed]){
			if(jam[lth-1]<alp[ed]){
				A=true;
				jam[lth-1]++;
				cout << jam << endl;
				count++;
			}
			if(jam[lth-1]==alp[ed] && !A){
				for(int i=lth-2;i>=0;i--){
					if(jam[i]<alp[ed-(lth-1-i)]){
						jam[i]++;
						for(int j=i+1;j<=lth-1;j++){
							jam[j]=jam[j-1]+1;
						}
						break;
					}
				}
				cout << jam << endl;
				count++;
			}
			A=false;
		    if(count==5 || jam[0]==alp[ed+1-lth])break;
	}
	return 0;
} 
