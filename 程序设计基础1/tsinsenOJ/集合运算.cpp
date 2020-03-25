#include <iostream>
using namespace std;

int main(){
	int m=0,n=0,i=0,j=0,sum=0,sum2=0,temp=0;
	int A[1001]={0},B[1001]={0};
	int J[1001]={0},BING[3000]={0},BU[1001]={0};
	bool fou=true;
	cin >> m;
	for(i=0;i<=m-1;i++){
		cin >> A[i];
	}
	cin >> n;
	for(i=0;i<=n-1;i++){
		cin >> B[i];
	}
	for(i=0;i<=m-1;i++){
		for(j=0;j<=n-1;j++){
			if(A[i]==B[j]){
				sum=sum+1;
				J[sum]=A[i];
				break;
			}
			
		}
	}
	for(i=1;i<=sum-1;i++){
		for(j=1;j<=sum-i;j++){
			if(J[j]>J[j+1]){
				temp=J[j];
				J[j]=J[j+1];
				J[j+1]=temp;
			}
		}
	}
	if(sum>0){
	for(i=1;i<=sum;i++){
		if(i<=sum-1){
			cout << J[i] << " ";
		}	
		if(i==sum){
		    cout << J[sum] << endl;
	    }
	}
}
    if (sum==0){
    	cout << endl;
	} 
	for(i=0;i<=m-1;i++){
		for(j=1;j<=sum;j++){
			if(A[i]==J[j]){
				fou=false;
			}
		}
		if(fou==true){
			sum2=sum2+1;
			BU[sum2]=A[i];
		}
		fou=true;
	}
	for(i=1;i<=sum2-1;i++){
		for(j=1;j<=sum2-i;j++){
			if(BU[j]>BU[j+1]){
				temp=BU[j];
				BU[j]=BU[j+1];
				BU[j+1]=temp;
			}
		}
	}
	for(i=1;i<=sum2;i++){
		BING[i]=BU[i];
	}
	for(i=sum2+1;i<=sum2+n;i++){
		BING[i]=B[i-sum2-1];
	}
	for(i=1;i<=sum2+n-1;i++){
		for(j=1;j<=sum2+n-i;j++){
			if(BING[j]>BING[j+1]){
				temp=BING[j];
				BING[j]=BING[j+1];
				BING[j+1]=temp;
			}
		}
	}
	if(sum2+n>0){
	for(i=1;i<=sum2+n;i++){
		if(i<=sum2+n-1){
			cout << BING[i] << " ";
		}
		if(i==sum2+n){
			cout << BING[i] << endl;
		}
	}
}
    if(sum2>0){
	for(i=1;i<=sum2;i++){
		if(i<=sum2-1){
			cout << BU[i] << " " ;
		}
		if(i==sum2){
			cout << BU[i] << endl;
		}
	}
}
	return 0;
} 
