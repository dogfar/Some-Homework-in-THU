#include <cstdio>
#include <cstring>
#define M 7200001
using namespace std;

struct node{
	char c='\0';
	int prev;
	int next;
};
node line[14400005];
int n,cur;
int left,right,releft,reright,head=0;
int indexl,indexr;
int t,t0;
char basic[3200005];
char func,changeline,dir,text;
int tmpr=0,tmpl=0;

int main(){
	setvbuf(stdin,new char[1<<20],_IOFBF,1<<20);
	setvbuf(stdout,new char[1<<20],_IOFBF,1<<20);
	scanf("%s",&basic);
	int l=strlen(basic);
	for(int i=1;i<=l;i++){
		line[i].c=basic[i-1];
		line[i+M].c=basic[i-1];
	}
	line[0].prev=-1,line[l].next=-1,line[M+l].prev=-1,line[M].next=-1;
	for(int i=0;i<l;i++)line[i].next=i+1;
	for(int i=1;i<=l;i++)line[i].prev=i-1;
	for(int i=M;i<M+l;i++)line[i].prev=i+1;
	for(int i=M+1;i<=M+l;i++)line[i].next=i-1;
	cur=l,left=0,right=l,releft=M,reright=M+l;
	indexl=0,indexr=l;
	scanf("%d",&n);
	while(n--){
		scanf("%c",&changeline);
		scanf("%c",&func);
		if(func=='<'){
			scanf(" %c",&dir);
			if(dir=='L'){
				if(line[left].prev==-1){
					printf("F\n");
					continue;
				}
				else{
					left=line[left].prev;
					indexl--;
					releft=line[releft].next;
					printf("T\n");
					continue;
				}
			}
			if(dir=='R'){
				if(line[right].prev==-1){
					printf("F\n");
					continue;
				}
				else{
					right=line[right].prev;
					indexr--;
					reright=line[reright].next;
					printf("T\n");
					continue;
				}
			} 
		}
		if(func=='>'){
			scanf(" %c",&dir);
			if(dir=='L'){
				if(line[left].next==-1){
					printf("F\n");
					continue;
				}
				else{
					left=line[left].next;
					indexl++;
					releft=line[releft].prev;
					printf("T\n");
					continue;
				}
			}
			if(dir=='R'){
				if(line[right].next==-1){
					printf("F\n");
					continue;
				}
				else{
					right=line[right].next;
					indexr++;
					reright=line[reright].prev;
					printf("T\n");
					continue;
				}
			}
		}
		if(func=='I'){
			scanf(" %c %c",&dir,&text);
			printf("T\n");
			cur++;
			line[cur].c=text;
			line[M+cur].c=text;
			if(dir=='L'){
				if(line[left].next!=-1){
					t0=line[releft].prev;
					line[t0].next=M+cur;
					line[M+cur].prev=t0;
					line[releft].prev=M+cur;
					line[M+cur].next=releft;
					if(releft==reright)reright=M+cur;
					releft=M+cur;
					t=line[left].next;
					line[t].prev=cur;
					line[cur].next=t;
					line[left].next=cur;
					line[cur].prev=left;
					if(right==left)right=cur;
					left=cur;
					if(indexr>=indexl)indexr++;
					indexl++;
					continue;
				}
				line[M+cur].prev=-1;
				line[releft].prev=M+cur;
				line[M+cur].next=releft;
				if(reright==releft)reright=M+cur;
				releft=M+cur;
				line[left].next=cur;
				line[cur].next=-1;
				line[cur].prev=left;
				if(right==left)right=cur;
				left=cur;
				if(indexr>=indexl)indexr++;
				indexl++;
				continue; 
			}
			if(dir=='R'){
				if(line[right].next!=-1){
					t0=line[reright].prev;
					line[t0].next=M+cur;
					line[M+cur].prev=t0;
					line[reright].prev=M+cur;
					line[M+cur].next=reright;
					if(releft==reright)releft=M+cur;
					reright=M+cur;
					t=line[right].next;
					line[t].prev=cur;
					line[cur].next=t;
					line[right].next=cur;
					line[cur].prev=right;
					if(left==right)left=cur;
					right=cur;
					if(indexl>=indexr)indexl++;
					indexr++;
					continue;
				}
				line[reright].prev=M+cur;
				line[M+cur].prev=-1;
				line[M+cur].next=reright;
				if(releft==reright)releft=M+cur;
				reright=M+cur;
				line[right].next=cur;
				line[cur].next=-1;
				line[cur].prev=right;
				if(left==right)left=cur;
				right=cur;
				if(indexl>=indexr)indexl++;
				indexr++;
				continue; 
			} 
		}
		if(func=='D'){
			scanf(" %c",&dir);
			if(dir=='L'){
				if(line[left].next==-1){
					printf("F\n");
					continue;
				}
				else{
					if(right==line[left].next){
						right=left;
						reright=releft;
					}
					if(line[line[left].next].next!=-1){
						t=line[line[left].next].next;
						t0=line[line[releft].prev].prev;
						line[t].prev=left;
						line[left].next=t;
						line[t0].next=releft;
						line[releft].prev=t0;
						if(indexr>indexl)indexr--;
						printf("T\n");
						continue;
					}
					line[left].next=-1;
					line[releft].prev=-1;
					if(indexr>indexl)indexr--;
					printf("T\n");
					continue;
				}
			}
			if(dir=='R'){
				if(line[right].next==-1){
					printf("F\n");
					continue;
				}
				else{
					if(left==line[right].next){
						left=right;
						releft=reright;
					}
					if(line[line[right].next].next!=-1){
						t=line[line[right].next].next;
						t0=line[line[reright].prev].prev;
						line[t].prev=right;
						line[right].next=t;
						line[t0].next=reright;
						line[reright].prev=t0;
						if(indexl>indexr)indexl--;
						printf("T\n");
						continue;
					}
					line[right].next=-1;
					line[reright].prev=-1;
					if(indexl>indexr)indexl--;
					printf("T\n");
					continue;
				}
			}
		}
		if(func=='R'){
			if(indexl>=indexr){
				printf("F\n");
				continue;
			}
			else{
				printf("T\n");
				tmpr=line[releft].prev;
				tmpl=line[left].next;
				if(line[right].next!=-1){
					line[line[right].next].prev=line[releft].prev;
					line[line[reright].prev].next=line[left].next;
				}
				line[line[left].next].prev=line[reright].prev;
				line[line[releft].prev].next=line[right].next;
				line[left].next=reright;
				line[reright].prev=left;
				line[right].next=releft;
				line[releft].prev=right;
				right=tmpr;
				reright=tmpl;
				continue;
			}
		}
		if(func=='S'){
			while(line[head].next!=-1){
				head=line[head].next;
				printf("%c",line[head].c);
			}
			head=0;
			printf("\n");
			continue; 
		}
	} 
	return 0;
}
