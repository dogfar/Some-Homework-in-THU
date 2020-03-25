#include <cstdio>
using namespace std;

long long int x[200005],y[200005];

void qs(long long int num[],int l,int r){
	if(l>=r)return;
	else{
		int i=l,j=r;
		long long int tmp;
		long long int flag=num[r];
		while(i<j){
			while(i<j && num[i]<flag){
				i++;
			}
			while(i<j && num[j]>=flag){
				j--;
			}
			if(i<=j){
				tmp=num[i];
				num[i]=num[j];
				num[j]=tmp;
			}
		}
		num[r]=num[j];
		num[j]=flag;
		qs(num,l,i-1);
		qs(num,i+1,r);
	}
}
int binsearch(int l,int r,long long int tpx,long long int tpy){
	if(r-l<=1){
		if(tpy*x[r]+tpx*y[r]-x[r]*y[r]==0)return r+1; 
		else return l+1;
	}
	else{
		int mid=(l+r)>>1;
		long long int mid1,mid2,mid3;
		mid1=tpy*x[mid],mid2=tpx*y[mid],mid3=x[mid]*y[mid];
		if(mid1+mid2-mid3==0)return mid+1;
		if(mid1+mid2-mid3>0)return binsearch(mid,r,tpx,tpy);
		else return binsearch(l,mid,tpx,tpy);		
	}
}
int main(){
	setvbuf(stdin,new char[1<<20],_IOFBF,1<<20);
	setvbuf(stdout,new char[1<<20],_IOFBF,1<<20);
	int n;
	scanf("%d",&n);
	for (int i=0;i<n;i++){
		scanf("%lld",&x[i]);
	}
	for (int i=0;i<n;i++)scanf("%lld",&y[i]);
	qs(x,0,n-1);
	qs(y,0,n-1);
	int t;
	scanf("%d",&t);
	while(t){
		t--;
		long long int tmpx,tmpy;
		scanf("%lld %lld",&tmpx,&tmpy);
		long long int tmp1,tmp2,tmp3;
		tmp1=tmpy*x[0];
		tmp2=tmpx*y[0];
		tmp3=x[0]*y[0];
		if(tmp1+tmp2-tmp3<0){
			printf("%d\n",0);
			continue;
		}
		tmp1=tmpy*x[n-1];
		tmp2=tmpx*y[n-1];
		tmp3=x[n-1]*y[n-1];
		if(tmp1+tmp2-tmp3>=0){
			printf("%d\n",n); 
			continue;
		}
		printf("%d\n",binsearch(0,n-1,tmpx,tmpy));
	}
	return 0;
}
 
