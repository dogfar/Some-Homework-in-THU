#include "kth.h"
#include <cstdio>

int num1[500001],num2[500001],num3[500001];
int size=1,tmpk,tmpn;
struct node{
	int x,y,z,tag;
}heap[6000002];
void swap(int &x,int &y){
	int tmp=x;
	x=y;
	y=tmp;
}
void swapnode(node &x,node &y){
	node tmp=x;
	x=y;
	y=tmp;
}
void qs1(int num[],int l,int r){//分别对ABC进行快排
	if(l>=r)return;
	int i=l,j=r,tmp;
    int flag=num[r];
	while(i<j){
		while(i<j && compare(num1[i],1,1,flag,1,1))i++;
		while(i<j && !compare(num1[j],1,1,flag,1,1))j--;
		if(i<=j)swap(num[i],num[j]);
	}
	num[r]=num[j];
	num[j]=flag;
	qs1(num,l,i-1);
	qs1(num,i+1,r);
} 
void qs2(int num[],int l,int r){
	if(l>=r)return;
	int i=l,j=r,tmp;
    int flag=num[r];
	while(i<j){
		while(i<j && compare(1,num2[i],1,1,flag,1))i++;
		while(i<j && !compare(1,num2[j],1,1,flag,1))j--;
		if(i<=j)swap(num[i],num[j]);
	}
	num[r]=num[j];
	num[j]=flag;
	qs2(num,l,i-1);
	qs2(num,i+1,r);
} 
void qs3(int num[],int l,int r){
	if(l>=r)return;
	int i=l,j=r,tmp;
    int flag=num[r];
	while(i<j){
		while(i<j && compare(1,1,num3[i],1,1,flag))i++;
		while(i<j && !compare(1,1,num3[j],1,1,flag))j--;
		if(i<=j)swap(num[i],num[j]);
	}
	num[r]=num[j];
	num[j]=flag;
	qs3(num,l,i-1);
	qs3(num,i+1,r);
} 
bool cmp(int x1,int y1,int z1,int u1,int v1,int w1){
	return compare(num1[x1],num2[y1],num3[z1],num1[u1],num2[v1],num3[w1]);
}
void goup(int index){//堆的上浮操作
	while(index>1){
		if(cmp(heap[index].x,heap[index].y,heap[index].z,
		heap[index>>1].x,heap[index>>1].y,heap[index>>1].z)){
		   	swapnode(heap[index],heap[index>>1]);
			index>>=1;	
		}
		else return;
	}
}
void godown(int index){//堆的下沉操作
	while((index<<1)<=size){
		int tmp=index<<1;
		if(tmp<size && cmp(heap[tmp+1].x,heap[tmp+1].y,heap[tmp+1].z,
		heap[tmp].x,heap[tmp].y,heap[tmp].z)){
			tmp++;
		}
		if(cmp(heap[tmp].x,heap[tmp].y,heap[tmp].z,
		heap[index].x,heap[index].y,heap[index].z)){
			swapnode(heap[index],heap[tmp]);
			index=tmp;
		}
		else return;
	}
}
void push(int x1,int y1,int z1,int tag){//插入
	if(x1>tmpn || y1>tmpn || z1>tmpn)return;
	heap[++size].x=x1,heap[size].y=y1,heap[size].z=z1,heap[size].tag=tag;
	goup(size);	
}
node pop(){//取堆顶
	node tmpnode=heap[1];
	swapnode(heap[1],heap[size]);
	size--;
	godown(1);
	return tmpnode;
}
void get_kth(int n, int k, int *x, int *y, int *z) {
	int tmpx=0,tmpy=0,tmpz=0,tmptag=0;
	tmpk=k,tmpn=n;
	for(int i=1;i<=n;i++){
		num1[i]=i,num2[i]=i,num3[i]=i;
	}
	qs1(num1,1,n),qs2(num2,1,n),qs3(num3,1,n);
	heap[1].x=1,heap[1].y=1,heap[1].z=1,heap[1].tag=0;
	while(k--){
		node t=pop();
		tmpx=t.x,tmpy=t.y,tmpz=t.z,tmptag=t.tag;
		if(tmptag==0){//打标签
			push(tmpx+1,tmpy,tmpz,0);
			push(tmpx,tmpy+1,tmpz,1);
			push(tmpx,tmpy,tmpz+1,2);
			continue;
		}
		if(tmptag==1){
			push(tmpx,tmpy+1,tmpz,1);
			push(tmpx,tmpy,tmpz+1,2);
			continue;
		}
		if(tmptag==2){
			push(tmpx,tmpy,tmpz+1,2);
			continue;
		}
	}
	*x=num1[tmpx],*y=num2[tmpy],*z=num3[tmpz];
}