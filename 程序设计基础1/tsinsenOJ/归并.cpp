#include <iostream>
//×ÏÊéP226 
using namespace std;

int n;
int num[40005];
int tmp[40005];
int count=0;
void merge(int bg,int ed){
	if(ed-bg>1){
		int m=bg+(ed-bg)/2;
		int p=bg,q=m,i=bg;
		merge(bg,m);
		merge(m,ed);
		while(p<m || q<ed){
			if(q>=ed||(p<m && num[p]<=num[q]))tmp[i++]=num[p++];
			else {
				tmp[i++]=num[q++];
				count=count+m-p;
			}
		}
		for(int i=bg;i<ed;i++){
			num[i]=tmp[i];
		}
	}
} 
int main(){
	cin >> n ;
	for(int i=0;i<n;i++){
		cin >> num[i];
	}
	merge(0,n);
	cout << count << endl;
	return 0;
}
