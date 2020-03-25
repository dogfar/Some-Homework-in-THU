#include <iostream>
using namespace std;

int n,bgl,mxl;
int song[51];
int tune[51][1001];
int max1=0;
void music(int k,int p){
	int count=0;
	for(int i=0;i<=mxl;i++){
		for(int j=1;j<=p;j++){
			if(tune[k-1][j]+song[k]==i || tune[k-1][j]-song[k]==i){
				count++;
				tune[k][count]=i;
				break;
			}
		}
    }
    if(count==0){
    	printf("%d",-1);
    	return;
	}
	else{
        if(k<n)music(k+1,count);
        if(k==n){
			for(int i=1;i<=count;i++){
				if(tune[n][i]>max1){
				   max1=tune[n][i];
			    }
			}
			printf("%d\n",max1);
			return;
		}
	}
} 
int main(){
	scanf("%d%d%d",&n,&bgl,&mxl);
	for(int i=1;i<=n;i++){
		scanf("%d",&song[i]);
	}
	tune[0][1]=bgl;
	music(1,1);
	return 0;
}
