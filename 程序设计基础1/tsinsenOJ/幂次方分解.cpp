#include <iostream>
using namespace std;

int two[15];
int ans[15];
int count=0;
char anschar[15][20]={"2(0)","2","2+2(0)","2(2)","2(2)+2(0)","2(2)+2","2(2)+2+2(0)",
"2(2+2(0))","2(2+2(0))+2(0)","2(2+2(0))+2","2(2+2(0))+2+2(0)","2(2+2(0))+2(2)",
"2(2+2(0))+2(2)+2(0)","2(2+2(0))+2(2)+2"};
void fenjie(int n){
	int i=15;
	for(int i=15;i>0;i--){
	    if(two[i]>n && two[i-1]<=n && i>0){
		count++;
		ans[count]=i-1;
		n=n-two[i-1];
	}
}
} 
int main(){
	int n;
	two[0]=1;
	for(int i=1;i<16;i++){
		two[i]=2*two[i-1];
	}
	cin >> n;
	fenjie(n);
	for(int i=1;i<=count;i++){
		if(i<count){
			if(ans[i]<=1)cout << anschar[ans[i]] << "+";
			if(ans[i]>1)cout << "2(" << anschar[ans[i]-1] << ")" << "+";
		}
		if(i==count){
			if(ans[i]<=1)cout << anschar[ans[i]] << endl;
			if(ans[i]>1)cout << "2(" << anschar[ans[i]-1] << ")" << endl;
		}
	}
	return 0;
}
