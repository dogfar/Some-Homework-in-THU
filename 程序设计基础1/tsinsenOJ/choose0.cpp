#include <iostream>
#include <stdio.h>
using namespace std;

int n,m;
int process[100];
void choose(int start,int picked){
    if(picked==m){
        for(int j=0;j<m;j++){
            printf("%3d",process[j]);
            if(j==m-1){
                cout << endl;
                return;
            }
        }
    }
    else{
        int max=n-m+picked+1;
        for(int i=start;i<=max;i++){
            process[picked]=i;
            choose(i+1,picked+1);
        }
    }
}
int main(){
    cin >> n >> m;
    choose(1,0);
    return 0;
}
