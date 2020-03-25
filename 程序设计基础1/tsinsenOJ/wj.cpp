#include <stdio.h>
#include <string>
using namespace std;
int ans[25000],node[25000][3],map[501][501]; 
int dx[5]={1,0,-1,0};
int dy[5]={0,-1,0,1};
int r=0,c=0,y=0,x=0;
char ch[1000];
int bfs()
{
    int head=0,tail=1;
    node[1][1]=1; node[1][2]=1;
    ans[1]=-1;
    while (head<tail) 
    {
        head=head+1;
        for (int i=0;i<=3;i++)
        {
            x=node[head][1];
			y=node[head][2];
            while (map[x+dx[i]][y+dy[i]]==0 && x+dx[i]>0&&x+dx[i]<=r&&y+dy[i]>0&&y+dy[i]<=c)
            {
                tail=tail+1;
                node[tail][1]=x+dx[i];
                node[tail][2]=y+dy[i];
                ans[tail]=ans[head]+1;
                x=x+dx[i];
                y=y+dy[i];
                map[x][y]=1;
                if (x==r&&y==c)
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
    scanf("%d%d\n",&r,&c);
    for (int i=1;i<=r;i++)
    {
        for (int j=1;j<=c;j++)
        {
            scanf("%c",&ch);
            if (ch[0]=='\n') scanf("%c",&ch);
            if (ch[0]=='*') map[i][j]=1;
        }
    }   
    bfs();
    return 0;
}

