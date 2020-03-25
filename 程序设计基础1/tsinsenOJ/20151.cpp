#include <iostream>
using namespace std;

int s[40][40]={0};
int N=0;
void put(int num,int m,int k){
	if(num==N*N)return;
	else{
		if(m==1 && k!=N){
			s[N][k+1]=num+1;
			put(num+1,N,k+1);
		}
		if(m!=1 && k==N){
			s[m-1][1]=num+1;
			put(num+1,m-1,1);
		}
		if(m==1 && k==N){
			s[m+1][k]=num+1;
			put(num+1,m+1,k);
		}
		if(m!=1 && k!=N){
			if(s[m-1][k+1]==0){
				s[m-1][k+1]=num+1;
				put(num+1,m-1,k+1);
			}
			else{
				s[m+1][k]=num+1;
				put(num+1,m+1,k);
			}
		}
	}
}

int main(){
	cin >> N;
	s[1][N/2+1]=1;
	put(1,1,N/2+1);
	for(int i=1;i<=N;i++){
		for(int j=1;j<=N;j++){
			if(j<N)cout << s[i][j] << " ";
			if(j==N)cout << s[i][j] << endl;
		}
	}
	return 0;
} 
