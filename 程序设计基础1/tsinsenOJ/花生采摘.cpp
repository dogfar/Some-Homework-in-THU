#include <iostream>
#include <cmath>
using namespace std;

struct node{
	int hang;
	int lie;
	int num;
}peanut[401];
int main(){
	int m,n,k;
	node tmp;
	int count=0;
	int total=0;
	int s=0;
	cin >> m >> n >> k;
	for(int i=1;i<=m;i++){
		for(int j=1;j<=n;j++){
			count++;
			peanut[count].hang=i;
			peanut[count].lie=j;
			cin >> peanut[count].num;
		}
	}
	for(int i=1;i<=count-1;i++){
		for(int j=1;j<=count-i;j++){
			if(peanut[j].num<peanut[j+1].num){
				tmp=peanut[j];
				peanut[j]=peanut[j+1];
				peanut[j+1]=tmp;
			}
		}
	}
	for(int i=1;i<=count;i++){
		if(i==1){
			if(k>2*(peanut[i].hang)){
				total=total+peanut[i].num;
				k=k-peanut[i].hang-1;
			}
			else break;
		}
		if(i>=2){
			s=abs(peanut[i].hang-peanut[i-1].hang)+
			abs(peanut[i].lie-peanut[i-1].lie);
			if(k>=s+1+peanut[i].hang){
				total=total+peanut[i].num;
				k=k-s-1;
			}
			else break;
		}
	}
	cout << total << endl;
	return 0;
}
