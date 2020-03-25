#include <cstdio>
using namespace std;

int num[500003];
int n,m,opt,tmp1,tmp2;
struct segment{
	int l,r;
	int sum,lmax,rmax,max;
}t[2000003],ans;
int mx(int x,int y){
	if(x>y)return x;
	else return y;
}
void pushup(int cnt){//在一个节点里维护sum/lmax/rmax/max 
	int ls=cnt<<1,rs=cnt<<1|1;
	t[cnt].sum=t[ls].sum+t[rs].sum;
	t[cnt].lmax=mx(t[ls].lmax,t[ls].sum+t[rs].lmax);
	t[cnt].rmax=mx(t[rs].rmax,t[rs].sum+t[ls].rmax);
	t[cnt].max=mx(t[ls].max,mx(t[rs].max,t[ls].rmax+t[rs].lmax));
}//上浮更新操作 
void bulid(int cnt,int l,int r){
	t[cnt].l=l,t[cnt].r=r;
	if(l==r){
		t[cnt].sum=num[l];
		t[cnt].max=t[cnt].lmax=t[cnt].rmax=num[l];//在叶子节点插入值 
		return;
	}
	int mid=(l+r)>>1;
	bulid(cnt<<1,l,mid);
	bulid(cnt<<1|1,mid+1,r);
	pushup(cnt);//然后向上回溯更新 
}//建树 
void change(int cnt,int x,int y){
	int ls=t[cnt].l,rs=t[cnt].r;
	if(ls==rs){
		t[cnt].sum=y;
		t[cnt].max=t[cnt].lmax=t[cnt].rmax=y;//直到找到叶子节点... 
		return;
	}
	int mid=(ls+rs)>>1;
	if(x<=mid)change(cnt<<1,x,y);
	else change(cnt<<1|1,x,y);
	pushup(cnt);//然后回溯，向上更新 
}//修改 
segment ask(int cnt,int l,int r){
	int ls=t[cnt].l,rs=t[cnt].r;
	if(ls==l && rs==r)return t[cnt];
	int mid=(ls+rs)>>1;
	if(r<=mid)return ask(cnt<<1,l,r);
	if(l>mid)return ask(cnt<<1|1,l,r);//首先找到跨过中点的区间 
	segment ltree=ask(cnt<<1,l,mid),rtree=ask(cnt<<1|1,mid+1,r);
	ans.sum=ltree.sum+rtree.sum;
	ans.lmax=mx(ltree.lmax,ltree.sum+rtree.lmax);
	ans.rmax=mx(rtree.rmax,rtree.sum+ltree.rmax);
	ans.max=mx(ltree.max,mx(rtree.max,ltree.rmax+rtree.lmax));//按公式找到max 
	return ans;
}
int getans(segment k){
	return k.max;
}
int main(){
	setvbuf(stdin,new char[1<<20],_IOFBF,1<<20);
	setvbuf(stdout,new char[1<<20],_IOFBF,1<<20);
	scanf("%d %d",&n,&m);
	for(int i=1;i<=n;i++)scanf("%d",&num[i]);
	bulid(1,1,n);
	while(m--){
		scanf("%d %d %d",&opt,&tmp1,&tmp2);
		if(!opt){
			change(1,tmp1,tmp2);
			continue;
		}
		int k=getans(ask(1,tmp1,tmp2));
		if(k<=0)printf("%d\n",0);
		else printf("%d\n",k);
	}
	return 0;
}
