#include <iostream>
#include "Point.h"
#include "Strategy.h"
#include "Judge.h"
#include <time.h>
#include <cmath>
#define maxnum 8000000
#define maxepoch 600000
#define maxn 12

using namespace std;

struct node{
	int ls,rs;
	int father;
	int value;
	int visitnum;
	int tmpx,tmpy;
	int user;
	node(){
		ls=-1,rs=0;
		father=0,value=0,visitnum=0,tmpx=0,tmpy=0,user=0;
	}
}treenode[maxnum];

int reward[maxnum],topcopy[maxn];

int **boardcopy;

int nox,noy,m,n,treecnt=0;

int choose(int idx){
	double base=-500000;
	int ans=-1;
	for(int i=treenode[idx].ls;i<=treenode[idx].rs;i++){
		double uct=0;
		if(treenode[idx].user==1){
			uct=(double)(treenode[i].value+1.0)/((double)treenode[i].visitnum+0.00001)+0.7*sqrt(2*log((double)treenode[treenode[i].father].visitnum+1.001)/((double)treenode[i].visitnum+0.0001));
		}
		else uct=-(double)(treenode[i].value-1.0)/((double)treenode[i].visitnum+0.00001)+0.7*sqrt(2*log((double)treenode[treenode[i].father].visitnum+1.001)/((double)treenode[i].visitnum+0.0001));
		if(uct>base || ans==-1){
			ans=i,base=uct;
		}
	}
	playchess(ans);
	return ans;
}
void playchess(int idx){
	boardcopy[treenode[idx].tmpx][treenode[idx].tmpy]=treenode[idx].user;
	topcopy[treenode[idx].tmpy]--;
	if(topcopy[treenode[idx].tmpy]-1==nox && treenode[idx].tmpy==noy)topcopy[treenode[idx].tmpy]--;
}
void playchesspoint(int x,int y,int userid){
	boardcopy[x][y]=userid;
	topcopy[y]--;
	if(topcopy[y]-1==nox && y==noy)topcopy[y]--;
}
int calrewardpt(int x,int y,int userid){
	if(userid==2 && machineWin(x,y,m,n,boardcopy))return 1;
	if(userid==1 && userWin(x,y,m,n,boardcopy))return -1;
	if(isTie(n,topcopy))return 0;
	return -3;
}
int calreward(int idx){
	if(treenode[idx].user==2 && machineWin(treenode[idx].tmpx,treenode[idx].tmpy,m,n,boardcopy))return 1;
	if(treenode[idx].user==1 && userWin(treenode[idx].tmpx,treenode[idx].tmpy,m,n,boardcopy))return -1;
	if(isTie(n,topcopy))return 0;
	return -3;
}
void expand(int cnt,int u,int fath,int tpx,int tpy){
	treenode[cnt].ls=-1,treenode[cnt].rs=0;
	treenode[cnt].father=fath;
	treenode[cnt].value=0,treenode[cnt].visitnum=0;
	treenode[cnt].tmpx=tpx;
	treenode[cnt].tmpy=tpy;
	treenode[cnt].user=u;
	reward[cnt]=-3;
}
extern "C" __declspec(dllexport) Point* getPoint(const int M, const int N, const int* top, const int* _board, 
	const int lastX, const int lastY, const int noX, const int noY){
	clock_t start=clock();
	int x = -1, y = -1;
	int** board = new int*[M];
	for(int i = 0; i < M; i++){
		board[i] = new int[N];
		for(int j = 0; j < N; j++){
			board[i][j] = _board[i * N + j];
		}
	}
	boardcopy=new int*[M];
	for(int i=0;i<M;i++){
		boardcopy[i]=new int[N];
	}
	treecnt=0;
	m=M,n=N,nox=noX,noy=noY;
	memset(treenode,0,sizeof(treenode));
	memset(reward,0,sizeof(reward));
	treenode[0].user=1,reward[0]=-3;
	treenode[0].ls=-1,treenode[0].rs=0;
	for(int epoch=0;epoch<maxepoch;epoch++){
		if((double)(clock()-start)/ CLOCKS_PER_SEC >2.6)break;
		for(int i=0;i<M;i++){
			for(int j=0;j<N;j++){
				boardcopy[i][j]=board[i][j];
			}
		}
		for(int i=0;i<N;i++){
			topcopy[i]=top[i];
		}
		/*_____________________________*/
		int root=0;
		int now=root;
		while(treenode[now].ls!=-1 )now=choose(now);
		if(treenode[now].visitnum==0)reward[now]=calreward(now);
		if(reward[now]==-3){
			treenode[now].ls=treecnt+1;
			for(int i=0;i<N;i++){
				if(topcopy[i]>0){
					treecnt++;
					expand(treecnt,3-treenode[now].user,now,topcopy[i]-1,i);
				}
			}
			treenode[now].rs=treecnt;
			/****ROLLOUT****/
			int ran=rand()%(treenode[now].rs-treenode[now].ls+1)+treenode[now].ls;
			now=ran;
			playchess(ran);
			int rew=calreward(ran);
			reward[ran]=rew;
			int u=treenode[now].user;
			while(rew==-3){
				int nxty=rand()%n;
				while(topcopy[nxty]==0)nxty=rand()%n;
				int nxtx=topcopy[nxty]-1;
				playchesspoint(nxtx,nxty,u);
				rew=calrewardpt(nxtx,nxty,u);
				u=3-u;
			}
			while(now!=root){
				treenode[now].value+=rew;
				treenode[now].visitnum++;
				now=treenode[now].father;
			}
			if(now==root){
				treenode[now].value+=rew;
				treenode[now].visitnum++;
			}
		}
		/*_____________________________________________________________*/
		else{
			int tmpre=reward[now];
			while(now!=root){
				treenode[now].value+=tmpre;
				treenode[now].visitnum++;
				now=treenode[now].father;
			}
			if(now==root){
				treenode[root].value+=tmpre;
				treenode[root].visitnum++;
			}
		}
	}
	double b=-1e6;
	int ans=-1;
	for(int i=treenode[0].ls;i<=treenode[0].rs;i++){
		double ucb=(double)treenode[i].value/(double)treenode[i].visitnum;
		if(ucb>b || ans==-1){
			ans=i;
			b=ucb;
		}
	}
	x=treenode[ans].tmpx;
	y=treenode[ans].tmpy;
	clearArray(M,N,boardcopy);
	clearArray(M, N, board);
	return new Point(x, y);
}


extern "C" __declspec(dllexport) void clearPoint(Point* p){
	delete p;
	return;
}


void clearArray(int M, int N, int** board){
	for(int i = 0; i < M; i++){
		delete[] board[i];
	}
	delete[] board;
}

