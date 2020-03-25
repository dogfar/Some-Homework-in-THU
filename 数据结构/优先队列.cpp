#include <cstdio>
#include <cstring>
using namespace std;

long long int days=0,ans=0;
struct node{
	long long int sday;
	long long int eday;
	long long int num;
}queue[1000002];
struct node2{
	int index;
	long long int num;
}queue2[1000002];
int head2=0,tail2=0;
int findpos(int l,int r,int key){
	if(r-l<=1){
		if(key>queue2[l].num)return l;
		if(key<=queue2[r].num)return r+1;
		return r;
	}
	else{
		int mid=(l+r)/2;
		if(queue2[mid].num==key)return mid;
		if(queue2[mid].num>key)return findpos(mid,r,key);
		if(queue2[mid].num<key)return findpos(l,mid,key);
	}
}
int head=0,tail=0;
int main(){
	setvbuf(stdin, new char[1 << 20], _IOFBF, 1 << 20);
	setvbuf(stdout, new char[1 << 20], _IOFBF, 1 << 20);
	int n;
	char changeline;
	scanf("%d",&n);
	n=n<<1;
	scanf("%c",&changeline);
	int now=0,nowmax=0;
	while(n>0){
		n--;
		char s[30]="";
		gets(s);
		int l=strlen(s);
		int flag=l;
		for(int i=0;i<l;i++){
			if(s[i]==' '){
				flag=i;
				break;
			}
		}
		long long int tmp1=0,tmp2=0;
		if(flag<l){
			for(int i=0;i<flag;i++)tmp1=tmp1*10+s[i]-'0';
			for(int i=flag+1;i<l;i++)tmp2=tmp2*10+s[i]-'0';
			days+=tmp1;
			int t=findpos(head2,tail2,tmp2);
			queue2[t].num=tmp2;
			queue2[t].index=tail;
			tail2=t;
			queue[tail].num=tmp2;
			if(tmp2>nowmax){
				queue[tail].sday=days;
				nowmax=tmp2;
				queue[now].eday=days;
				if(tail>head)ans+=(queue[now].eday-queue[now].sday)*queue[now].num;
				now=tail;
				tail++;
				continue;
			}
			else{
				tail++;
				continue;
			}
		}
		else{
			for(int i=0;i<l;i++)tmp1=tmp1*10+s[i]-'0';
			days+=tmp1;
			if(head==now){
				queue[head].eday=days;
				ans+=(queue[head].eday-queue[head].sday)*queue[head].num;
				head++;
				head2++;
				nowmax=queue2[head2].num;
				now=queue2[head2].index;
				queue[now].sday=days;
				continue;
			}
			else{
				head++;
				continue;
			}
		}
	}
	printf("%lld\n",ans);
	return 0;
} 
