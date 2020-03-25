#include <iostream>
using namespace std;

int fib[21];
int n=0;
int suma=0,sumk=0;
void fibonacci(){
	fib[0]=0;
	fib[1]=1;
	for(int i=2;i<=16;i++){
		fib[i]=fib[i-1]+fib[i-2];
	}
	if(n>=5){
		for(int i=0;i<=n-5;i++){
			suma=suma+fib[i];
		}
		for(int i=1;i<=n-4;i++){
			sumk=sumk+fib[i];
		}
	}
}
int main(){
	int a,m,x;
	cin >> a >> n >> m >> x;
	int train[21];
	train[1]=a;
	train[2]=a;
	train[3]=2*a;
	train[n-1]=m;
	if(n>=5){
        fibonacci();
	    int k=0;
	    k=(train[n-1]-train[3]-suma*a)/sumk;
	    if(x<=3)cout << train[x] << endl;
	    if(x>3){
	    	for(int i=4;i<=x;i++){
		       train[i]=train[i-1]+fib[i-4]*a+fib[i-3]*k;
	        }
	        cout << train[x] << endl;
		}
    }
    if(n<5){
    	cout << train[x] << endl;
	}
	return 0;
} 
