#include "sort.h"
#include <cstdio>

void swap(int x,int y){
	int tmp=x;
	x=y;
	y=tmp;
}
int flag[6],record[5];
void compareformerge(int *a,int i1,int i2,int i3,int *mx,int *mi){
	int tmpmax,tmpmin;//改写成返回i1 i2 i3第几个数 
	compare(a[flag[i1]],a[flag[i2]],a[flag[i3]],&tmpmax,&tmpmin);
	if(tmpmax==tmpmin){
		*mx=i1,*mi=i2;
		return;
	}
	if(a[flag[i1]]==tmpmax)*mx=i1;
	else{
		if(a[flag[i2]]==tmpmax)*mx=i2;
		else *mx=i3;
	} 
	if(a[flag[i1]]==tmpmin)*mi=i1;
	else{
		if(a[flag[i2]]==tmpmin)*mi=i2;
		else *mi=i3;
	}
}
void merge(int *a,int first,int mid1,int mid,int mid2,int last,int tmp[]){
	flag[1]=first,flag[2]=mid1+1,flag[3]=mid+1,flag[4]=mid2+1,flag[5]=1000005;
	record[1]=mid1,record[2]=mid,record[3]=mid2,record[4]=last;
	int mx,mi,k=0; 
	compareformerge(a,1,2,3,&mx,&mi);
	int tmp0=mi,tmp1;
	compareformerge(a,tmp0,4,4,&tmp1,&mi);
	while(flag[1]<=record[1] && flag[2]<=record[2] && flag[3]<=record[3] && flag[4]<=last){
		tmp[k++]=a[flag[mi]++];
		int cnt=0,num[5];
		for(int i=1;i<=4;i++){
			if(i!=mx)num[++cnt]=i;
		}
		if(flag[1]<=record[1] && flag[2]<=record[2] && flag[3]<=record[3] && flag[4]<=last)compareformerge(a,num[1],num[2],num[3],&mx,&mi);
		else break;//四路归并 
	} 
	int stk[5],cnt2=0;
	for(int i=1;i<=4;i++)stk[i]=5;
	for(int i=1;i<=4;i++){
		if(flag[i]<=record[i])stk[++cnt2]=i;
	} 
	while(flag[stk[1]]<=record[stk[1]] && flag[stk[2]]<=record[stk[2]] && flag[stk[3]]<=record[stk[3]]){
		compareformerge(a,stk[1],stk[2],stk[3],&mx,&mi);//只剩3路 
		tmp[k++]=a[flag[mi]++];
	}
	cnt2=0;
	for(int i=1;i<=4;i++)stk[i]=5;
	for(int i=1;i<=4;i++){
		if(flag[i]<=record[i])stk[++cnt2]=i;
	}
	while(flag[stk[1]]<=record[stk[1]] && flag[stk[2]]<=record[stk[2]]){
		compareformerge(a,stk[1],stk[2],stk[2],&mx,&mi);//只剩2路 
		tmp[k++]=a[flag[mi]++];
	}
	while(flag[stk[1]]<=record[stk[1]]){
		tmp[k++]=a[flag[stk[1]]++];
	}
	while(flag[stk[2]]<=record[stk[2]]){
		tmp[k++]=a[flag[stk[2]]++];
	}//只剩1路，全塞进去 
	for(int i=0;i<k;i++)a[first+i]=tmp[i];
}
void merge_sort(int *a,int first,int last,int tmp[]){
	if(first<last){
		if(last-first<=2){//长度小于等于3 特判 
			if(last-first==1){
				int tmx,tmi;
				compare(a[first],a[last],a[last],&tmx,&tmi);
				a[first]=tmi;
				a[last]=tmx;
			}
			else if(last-first==2){
				int tmx2,tmi2;
				compare(a[first],a[first+1],a[last],&tmx2,&tmi2);
				if(a[first]!=tmx2 && a[first]!=tmi2)a[first+1]=a[first];
				else if(a[last]!=tmx2 && a[last]!=tmi2)a[first+1]=a[last];
				a[first]=tmi2;
				a[last]=tmx2;
			}
		}
		else{//四路归并 
			int mid=(first+last)>>1;
			int mid1=(first+mid)>>1,mid2=(mid+last)>>1;
			merge_sort(a,first,mid1,tmp);
			merge_sort(a,mid1+1,mid,tmp);
			merge_sort(a,mid+1,mid2,tmp);
			merge_sort(a,mid2+1,last,tmp);
			merge(a,first,mid1,mid,mid2,last,tmp);
		}
	}
}
void sort(int n,int limit,int *a){
	int *p=new int[n];
	return merge_sort(a,0,n-1,p);
} 
