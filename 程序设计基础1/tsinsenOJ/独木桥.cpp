#include <iostream>
#include <algorithm>
using namespace std;

int main(){
	int l,n;
	cin >> l >> n;
	int max1=0;
	int min1=0;
	int loc[5001];
	if(l==0 || n==0){
		cout << "0 0" << endl;
		return 0;
	}
	else{
		for(int i=1;i<=n;i++){
	    cin >> loc[i];
		int left=loc[i];
		int right=l+1-loc[i];
		if(left<right){
			if(left>min1)min1=left;
			if(right>max1)max1=right;
		}
		if(right<=left){
			if(right>min1)min1=right;
			if(left>max1)max1=left;
		}
	}
	}
	cout << min1 << " " << max1 << endl;
	return 0;
}

