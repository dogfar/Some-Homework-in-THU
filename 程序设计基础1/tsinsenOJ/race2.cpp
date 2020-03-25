#include <iostream>
#include <algorithm>
#include <memory.h>
using namespace std;

struct node{
	int index;
	int score;
}q[100001];
bool cmp(node a,node b){
	if(a.score!=b.score)return a.score>b.score;
	else return a.index<b.index;
}
bool cmp2(node a,node b){
	return a.index<b.index;
}
int tmp[100001];
int main(){
	int t=0;
	cin >> t;
	while(t>0){
		t--;
		int count=-1;
		memset(tmp,0,sizeof(tmp));
		int n;
		cin >> n;
		for(int i=0;i<n;i++){
			cin >> tmp[i];
		}
		sort(tmp,tmp+n);
		int flag=0;
		for(int i=0;i<n;i++){
			bool A=true;
			if(tmp[i]>flag){
				A=false;
				flag=tmp[i];
				count++;
				q[count].index=0;
				q[count].score=0;
				q[count].index=tmp[i];
				q[count].score++;
			}
			if(A){
				q[count].score++;
			}
		}
		sort(q,q+count+1,cmp);
		for(int i=0;i<=count;i++){
			if(i<count){
				if(q[i].score>q[i+1].score){
					cout << i+1 << endl;
					sort(q,q+i+1,cmp2);
					for(int j=0;j<=i;j++){
						if(j<i)cout << q[j].index << " ";
						if(j==i)cout << q[j].index << endl;
					}
					break;
				}
			}
			if(i==count){
				cout << "-1" << endl;
				break;
			}
		}
	}
	return 0;
}
