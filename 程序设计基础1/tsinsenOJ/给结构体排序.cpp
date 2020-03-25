#include <iostream>
#include <algorithm>
using namespace std;

struct node{
	int price;
	int amount;
}milk[5001];
bool cmp(node a,node b){
	if(a.price!=b.price){
		return a.price<b.price;
	}
	else return a.amount>b.amount;
}
int main(){
	int N,M;
	int ans=0;
	cin >> N >> M;
	for(int i=0;i<=M-1;i++){
		cin >> milk[i].price >> milk[i].amount;
	}
	sort(milk,milk+M,cmp);
	for(int i=0;i<=M-1;i++){
		if(N>=milk[i].amount){
			N-=milk[i].amount;
			ans+=milk[i].price*milk[i].amount;
		}
		else{
			ans+=milk[i].price*N;
			break;
		}
	}
	cout << ans << endl;
	return 0;
}
