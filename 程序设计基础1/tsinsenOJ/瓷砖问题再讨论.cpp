#include <iostream>
using namespace std;

int take[99]={0};
int num=0;
int sum1=0;

void Try(int i,int s){
	int j;
	for(j=3;j>=1;j--){
		if(i>=j){
			if(take[s-1]==1 && j==1){
				break;
			}
			take[s]=j;
			if(i==j){
				num++;
				for(int k=1;k<=s;k++){
					if(take[k]==1){
						sum1++;
					}
				}
			}
			if(i>j){
				Try(i-j,s+1);
			}
		}
	}
} 
int main(){
	int h=0;
	cin >> h;
	Try(h,1);
	cout << num << endl;
	cout << sum1 << endl;
	return 0;
}
