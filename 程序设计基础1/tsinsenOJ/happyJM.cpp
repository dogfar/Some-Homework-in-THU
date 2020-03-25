#include <iostream>
using namespace std;

int N,m;
int record[25][30000]={0};
struct goods{
	int price;
	int happiness;
	int th;
}item[25];
int happy(goods *p,int n,int m){
	if(n<=0)return 0;
	if(record[n][m]>0)return record[n][m];
	int max=happy(p,n-1,m);
	if(m>=p[n].price) {
		int tmp=happy(p,n-1,m-p[n].price)+p[n].th;
		if(max<tmp)max=tmp;
	}
	record[n][m]=max;
	return max;
}
int main(){
	cin >> N >> m;
	for(int i=1;i<=m;i++){
		cin >> item[i].price;
		cin >> item[i].happiness;
		item[i].th=item[i].happiness*item[i].price;
	}
	cout << happy(item,m,N) << endl;
	return 0;
} 
