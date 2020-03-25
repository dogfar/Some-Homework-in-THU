#include <iostream>
#include <algorithm>
#include <iomanip>
using namespace std;

double e[105][105];
double e0[105][105];
int n,m;
double cal(){
	for(int i=1;i<=n+1;i++){
		for(int j=1;j<=n+1;j++){
			if(e[n+1][i]>e[n+1][j]+e[j][i])e[n+1][i]=e[n+1][j]+e[j][i];
		}
	}
	double tmp=0;
	for(int i=1;i<=n+1;i++){
		for (int j=i;j<=n+1;j++){
			if(e0[i][j]<50000){
				if((e[n+1][i]+e[n+1][j]+e0[i][j])/2>tmp){
					tmp=(e[n+1][i]+e[n+1][j]+e0[i][j])/2;
				}
			}
			else{
				if(e[n+1][i]>tmp)tmp=e[n+1][i];
				if(e[n+1][j]>tmp)tmp=e[n+1][j];
			}
		}
	}
	return tmp;
}
int main(){
	cin >> n >> m;
	for(int i=0;i<=n+2;i++){
		for(int j=0;j<=n+2;j++){
			if(i!=j)e[i][j]=50005;
			else e[i][j]=0;
		}
	}
	for(int i=1;i<=m;i++){
		int x=0,y=0;
		cin >> x >> y;
		cin >> e[x][y];
		e[y][x]=e[x][y];	
	}
	for(int i=1;i<=n+1;i++){
		for(int j=1;j<=n+1;j++){
			e0[i][j]=e[i][j]; 
		}
	}
	for(int k=1;k<=n;k++){
		for(int i=1;i<=n;i++){
			for(int j=1;j<=n;j++){
				if(e[i][j]>e[i][k]+e[k][j])e[i][j]=e[i][k]+e[k][j];
			}
		}
	}
	double ans=50005;
	for(int i=1;i<=n;i++){
		double tmp=0;
		for(int k1=1;k1<n;k1++){
			for(int k2=k1+1;k2<=n;k2++){
				if(e0[k1][k2]>0 && e0[k1][k2]<50000){
					if((e0[k1][k2]+e[i][k1]+e[i][k2])/2>tmp)tmp=(e0[k1][k2]+e[i][k1]+e[i][k2])/2;
				}
				if(e0[k1][k2]>50000){
					if(e[i][k1]>tmp)tmp=e[i][k1];
					if(e[i][k2]>tmp)tmp=e[i][k2];
				}
			}
		}
		if(tmp<ans)ans=tmp;
		tmp=0;
    }
    for(int i=1;i<n;i++){
    	for(int j=i+1;j<=n;j++){
    		if(e0[i][j]<50000){
    			int s=e0[i][j]/0.25;
    			for(int k=1;k<s;k++){
    				e[i][n+1]=k*0.25;e[n+1][i]=k*0.25;
    				e0[i][n+1]=k*0.25;e0[n+1][i]=k*0.25;
    				e[j][n+1]=e0[i][j]-k*0.25;e[n+1][j]=e[j][n+1];
    				e0[j][n+1]=e[j][n+1];e0[n+1][j]=e[n+1][j];
    				if(cal()<ans)ans=cal();
    				for(int i=1;i<=n;i++){
    					e[n+1][i]=50005;e[i][n+1]=50005;
    					e0[n+1][i]=50005;e0[i][n+1]=50005;
					}
				}
			}
		}
	} 
	cout << setiosflags(ios::fixed) << setprecision(2) << ans << endl;
	return 0;
} 
