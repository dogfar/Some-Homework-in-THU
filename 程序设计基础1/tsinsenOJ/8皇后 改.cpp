#include <iostream>
using namespace std;

int pos[8];
int map[8][8];
int count=1;
int sum;
int max1=0; 
bool attack(int x, int y){
	if(pos[x]==pos[y]){
		return true;
	}
	if(pos[x]+x==pos[y]+y || pos[x]-x==pos[y]-y){
		return true;
	}
	return false;
}
void queen(int n){
	for(int i=0;i<8;i++){
		pos[n]=i;
		bool attacked=false;
		for(int j=0;j<n;j++){
			if(attack(j,n)==true){
				attacked=true;
				break;
			}
		} 
		if(attacked){
			continue;
		}
		sum=sum+map[n][i]; 
		if(n==7){
			if(sum>max1)
				max1=sum;
		}
		else{
			queen(n+1);
		}
		sum=sum-map[n][i];
	}
}
int main(){
	for(int i=0;i<8;i++){
		for(int j=0;j<8;j++){
			cin >> map[i][j];
		}
	}
	queen(0);
/**	for(int i=1;i<count;i++){
		if(sum[i]>max){
			max=sum[i];
		}
	}*/
	cout << max1 << endl;
	return 0;
} 
