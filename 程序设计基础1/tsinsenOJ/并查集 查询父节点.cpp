#include <iostream>
#include <cstdio>
using namespace std;
int fa[3001],n,m;
int record[3001]={0};
int father(int k)
{
    int kk=k;
    while (fa[kk]!=kk)
        kk=fa[kk];
    int i;
    while (fa[k]!=k)
    {
        i=k;
        k=fa[k];
        fa[i]=kk;
    }
    return kk;
}
int main()
{
	int n,m;
	cin >> n >> m;
	for(int i=1;i<=n;i++)fa[i]=i;
	while(m--){
		int x,y;
		cin >> x >> y;
		fa[father(x)]=father(y);
	}
	int count=0,tmp=0;
	for(int i=1;i<=n;i++){
		record[i]=father(i);
	}
	for(int i=1;i<=n-1;i++){
		for(int j=1;j<=n-i;j++){
			if(record[j]>record[j+1]){
				tmp=record[j];
				record[j]=record[j+1];
				record[j+1]=tmp;
			}
		}
	}
	for(int i=1;i<=n;i++){
		if(record[i]!=record[i-1])count++;
	}
	cout << count << endl;
    return 0;
} 
