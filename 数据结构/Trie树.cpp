#include <cstdio>
#define ull unsigned long long 
using namespace std;

int n,k,con=0;
struct node{
	int child[2];
}trie[30600000];//建树 
struct nd{
	int num;
	int next;
}linknd[500002];//队列 
ull t[500000];//存下来数，否则不知道该删哪一个 
int root=1,cnt=1;
void insert(ull x,int id){//插入 
	int tmp=1;
	for(int i=63;i>=0;i--){
		int bit=(x>>i)&1;
		if(trie[tmp].child[bit]==0)trie[tmp].child[bit]=++cnt;
		tmp=trie[tmp].child[bit];
	}
	if(trie[tmp].child[0]==0){//新数字 
		con++;
		trie[tmp].child[0]=con,trie[tmp].child[1]=con;//叶子的左右孩子放链表头尾 
		linknd[con].num=id;
	}
	else{
		con++;//老数字 
		linknd[con].num=id;
		linknd[trie[tmp].child[1]].next=con;//队列里插入 
		trie[tmp].child[1]=con;
	}
} 
void del(ull x,int id){
	int tmp=1;
	int tmpstack[66],head=0;
	tmpstack[0]=1;
	for(int i=63;i>=0;i--){
		int bit=(x>>i)&1;
		tmp=trie[tmp].child[bit];
		head++,tmpstack[head]=tmp;
	}//先到底看看叶子节点啥情况 
	if(trie[tmp].child[0]!=trie[tmp].child[1]){//之前就有重复的 
		trie[tmp].child[0]=linknd[trie[tmp].child[0]].next;
	}
	else{//删完这轮就没了 
		trie[tmp].child[0]=0,trie[tmp].child[1]=0;
		head--;
		while(head>=0){
			int t=63-head;
			int b=(x>>t)&1;
			trie[tmpstack[head]].child[b]=0;//节点左右孩子都没了那它也没了 
			if(trie[tmpstack[head]].child[b^1]!=0)break;
			else head--;
		}
	}
}
int query(ull x){
	int tmp=1;
	for(int i=63;i>=0;i--){
		int bit=(x>>i)&1;
		if(trie[tmp].child[bit^1]>0)tmp=trie[tmp].child[bit^1];//向反方向走 
		else tmp=trie[tmp].child[bit];
	}
	return linknd[trie[tmp].child[0]].num;
}
int main(){
	setvbuf(stdin,new char[1<<20],_IOFBF,1<<20);
	setvbuf(stdout,new char[1<<20],_IOFBF,1<<20);
	for(int i=0;i<=500000;i++){
		linknd[i].next=-1;
		linknd[i].num=-1;
	}
	scanf("%d %d",&n,&k);
	int flag=1,inputnum=k+1;
	for(int i=1;i<=k+1;i++){
		scanf("%llu",&t[i]);//建树 
		insert(t[i],i);
	}
	while(flag<=n){//动态维护
		if(inputnum<n){
			scanf("%llu",&t[++inputnum]);
			insert(t[inputnum],inputnum); 
		}
		if(flag>k+1){
			del(t[flag-k-2],flag-k-2);
		}
		printf("%d\n",query(t[flag])-1);
		flag++;
	}
	return 0;
}
