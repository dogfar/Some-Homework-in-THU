#include <cstdio>
#include <string.h>
#include <fstream>
using namespace std;

int n,m;
char str[500005];
bool singledog[500005];//是否有孤立点，特判减少强连通分量数目 
int from[1200005],to[1200005];//保存原有边信息 

int cnt=0;
int point[500005];
int dq[1000005];
int head=500001,tail=500001;//deque指针 
int dis[500005];//距离 初始化max 
bool vised[500005];//0-1BFS所需 

int dfn[500005],low[500005];
int stack[500005],top=0,cursor=1,ans=0;
int color[500005],newpoint[500005];//记录强连通分量信息 
bool ifvis[500005];
bool qv[500005];
int q[10000005];
int qdis[500005];
int qhead=0,qtail=0;//tarjan与SPFA所需 

struct node{//边 
	int v,next,w;
}edge[1200005];

void addline(int u,int v,int w){//邻接表建立边 
	cnt++;
	edge[cnt].v=v;
	edge[cnt].w=w;
	edge[cnt].next=point[u];
	point[u]=cnt;
}
void bfs(){
	for(int i=0;i<500005;i++){dis[i]=500001;vised[i]=0;}
	dis[1]=0;
	dq[tail]=1;
	tail++;
	while(head<tail){
		int tmp=dq[head];
		head++;
		if(singledog[tmp])continue;
		if(vised[tmp])continue;
		for(int i=point[tmp];i>0;i=edge[i].next){//松弛 
			if(dis[edge[i].v]>dis[tmp]+edge[i].w){
				dis[edge[i].v]=dis[tmp]+edge[i].w;
				if(edge[i].w==1){
					dq[tail]=edge[i].v;
					tail++;
				}
				else{
					head--;
					dq[head]=edge[i].v;
				}//按情况进队 
			}
		}
		vised[tmp]=1;//搜过了 
	}
}
void tarjan(int u){//tarjan求所有强连通分量 
	dfn[u]=cursor,low[u]=cursor;
	cursor++;
	top++;
	stack[top]=u,ifvis[u]=true;
	for(int i=point[u];i>0;i=edge[i].next){
		int tpv=edge[i].v;
		if(dfn[tpv]==0){
			tarjan(tpv);
			if(low[u]>low[tpv])low[u]=low[tpv];
		}
		else if(ifvis[tpv]==true && dfn[tpv]<low[u])low[u]=dfn[tpv];
	}
	if(dfn[u]==low[u]){
		ans++;
		ifvis[u]=false;
		color[u]=ans;
		if(str[u-1]=='m')newpoint[ans]++;
		while(stack[top]!=u){
			color[stack[top]]=ans;
			if(str[stack[top]-1]=='m')newpoint[ans]++;
			ifvis[stack[top--]]=false;
		}
		top--;
	}
}
void search(){//SPFA求最大距离 
	q[qtail]=color[1];
	qdis[color[1]]+=newpoint[color[1]];
	qtail++;
	while(qhead<qtail){
		int tmphead=q[qhead];
		qhead++;
		qv[tmphead]=0;
		for(int i=point[tmphead];i>0;i=edge[i].next){
			if(qdis[edge[i].v]<qdis[tmphead]+newpoint[edge[i].v]){//松弛 
				qdis[edge[i].v]=qdis[tmphead]+newpoint[edge[i].v];
				int tv=edge[i].v;
				if(qv[tv]==0){
					q[qtail]=tv;
					qtail++;
					qv[tv]=true;
				}
			}
		}
	}
}
int main(){
	setvbuf(stdin, new char[1 << 20], _IOFBF, 1 << 20);
	setvbuf(stdout, new char[1 << 20], _IOFBF, 1 << 20);
	scanf("%d %d",&n,&m);
	scanf("%s",&str);
	memset(edge,0,sizeof(edge));
	memset(dq,0,sizeof(dq));
	memset(q,0,sizeof(q));
	memset(color,0,sizeof(color));
	memset(newpoint,0,sizeof(newpoint));
	memset(dfn,0,sizeof(dfn));
	memset(low,0,sizeof(low));
	memset(stack,0,sizeof(stack));//初始化 
	for(int i=0;i<500005;i++){point[i]=-1,singledog[i]=1;}
	int inputx,inputy;
	for(int i=1;i<=m;i++){
		scanf("%d %d",&inputx,&inputy);
		from[i]=inputx+1,to[i]=inputy+1;
		if(from[i]==to[i])continue;
		else{
			int inputw=0;
			if(str[inputy]=='M')inputw=1;
			singledog[inputx+1]=0,singledog[inputy+1]=0;
			addline(from[i],to[i],inputw);//建图 
		}
	}
	bfs();//0-1BFS,输出时特判起点 
	if(str[0]=='M')printf("%d\n",dis[n]+1);
	else printf("%d\n",dis[n]);
	for(int i=1;i<=n;i++){
		if(dfn[i]==0 && singledog[i]==0)tarjan(i);//tarjan算法 
	}
	for(int i=0;i<500005;i++)point[i]=-1;
	cnt=0;
	memset(edge,0,sizeof(edge));
	for(int i=0;i<500005;i++){
		qdis[i]=-1;
		qv[i]=false;
	}
	qdis[color[1]]=0;
	for(int i=1;i<=m;i++){
		if(from[i]==to[i])continue;
		if(color[from[i]]!=color[to[i]]){
			addline(color[from[i]],color[to[i]],0);//缩点后建立新边 
		}
	}
	search();//SPFA 
	if(n==1&&str[0]=='m')printf("1");
	else printf("%d",qdis[color[n]]);
	return 0;
}
