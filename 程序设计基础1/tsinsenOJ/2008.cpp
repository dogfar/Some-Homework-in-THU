#include <iostream>
#include <algorithm>
using namespace std;

struct node{
	int num;
	int index;
};
bool cmp(node a,node b){
	return a.num>b.num;
}
int main(){
	int m,n,k,l,d;
	cin >> m >> n >> k >> l >> d;
	node countl[1001];
	node counth[1001];
	int h[1001];
	int s[1001];
	for(int i=0;i<=1000;i++){
		countl[i].num=0;
		counth[i].num=0;
		countl[i].index=i;
		counth[i].index=i;
	}
	int seat[2000][4];
	for(int i=0;i<d;i++){
		for(int j=0;j<4;j++){
			cin >> seat[i][j];
		}
	}
	for(int i=0;i<d;i++){
		if(seat[i][0]==seat[i][2]){
			if(seat[i][1]>seat[i][3])countl[seat[i][3]].num++;
			else countl[seat[i][1]].num++;
		}	
		if(seat[i][1]==seat[i][3]){
			if(seat[i][0]>seat[i][2])counth[seat[i][2]].num++;
			else counth[seat[i][0]].num++;
		}
	}
	sort(countl,countl+1001,cmp);
	sort(counth,counth+1001,cmp);
	for(int i=0;i<k;i++){
		h[i]=counth[i].index;
	}
	for(int i=0;i<l;i++){
		s[i]=countl[i].index;
	}
	sort(h,h+k);
	sort(s,s+l);
	for(int i=0;i<k;i++){
		cout << h[i] << " ";
		if(i==k-1)cout << endl;
	}
	for(int i=0;i<l;i++){
		cout << s[i] << " ";
		if(i==l-1)cout << endl;
	}
	return 0;
} 
