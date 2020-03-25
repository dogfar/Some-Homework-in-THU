#include <stdio.h>
#include <string>
using namespace std;
int ans[250001];
int node[250001][3],map[1001][1001]; 
int dx[5]={1,0,-1,0};
int dy[5]={0,-1,0,1};
int n=0,m=0;
int x,y=0;
int f=0,k=0;
char ch[1000];
int bfs()
{
    int head=0,tail=1;
    node[1][1]=1;
	node[1][2]=1;
    ans[1]=-1;
    while (head<tail) 
    {
        head=head+1;
        for (int i=1;i<=4;i++)
        {
            f=dx[i-1];k=dy[i-1];x=node[head][1];y=node[head][2];
            while (map[x+f][y+k]==0&&x+f>0&&x+f<n+1&&y+k>0&&y+k<m+1)
            {
                tail=tail+1;
                node[tail][1]=x+f;
                node[tail][2]=y+k;
                ans[tail]=ans[head]+1;
                x=x+f;
                y=y+k;
                map[x][y]=1;
                if (x==n&&y==m)
                {
                    printf("%d\n",ans[tail]);
                    return 0;
                }
            }   
        }
    }
    return 0;
}
int main()
{
    scanf("%d%d\n",&n,&m);
    map[1][1]=1;
    for (int i=1;i<=n;i++)
    {
        for (int j=1;j<=m;j++)
        {
            scanf("%c",&ch);
            if (ch[0]=='\n') scanf("%c",&ch);
            if (ch[0]=='*') map[i][j]=1;
        }
    }   
    bfs();
    return 0;
}
