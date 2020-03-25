//Complie: g++ -g -Wall -lpthread -o pt pt.cpp
//Run: pt maxn


#include <stdio.h>
#include <pthread.h>

int n,maxn,m=0;//maxn: max num of threads
struct data{
	int num;
	long long int fib[101];
}Data;

long long int calc(int k){
	if(k<=2)return Data.fib[k];
	else{
		return calc(k-1)+calc(k-2);
	}
}
void* cal(void* rk){
	pthread_t th1;
	pthread_t th2;
	int k=*(int*)rk;
	int k1=k-1;
	int k2=k-2;
	if(k<=2)return NULL;
	else{
		if(m<maxn){
			if(k1>2 && Data.fib[k1]==0){
				int r1 = pthread_create(&th1, NULL, cal, &k1);
				m++;
				pthread_join(th1,NULL);
			}
			if(k2>2 && Data.fib[k2]==0){
				int r2 = pthread_create(&th2, NULL, cal, &k2);
				m++;
				pthread_join(th2,NULL);
			}
			Data.fib[k]=Data.fib[k1]+Data.fib[k2];
			m--; 
		}
		else{
			cal(&k1);
			cal(&k2);
			Data.fib[k]=Data.fib[k1]+Data.fib[k2];
			m--;
		}
	}
	return NULL;
}
int main(){
	for(int i=0;i<=100;i++){
		Data.fib[i]=0;
	}
	printf("Please enter the num which is less than 50:\n");
	scanf("%d",&n);
	printf("Please enter max num of threads:\n");
	scanf("%d",&maxn);

	Data.fib[0]=0;
	Data.fib[1]=1;
	Data.fib[2]=1;
	if(n<=2){
		if(n>0){
			printf("1\n");
			return 0;
		}
		else{
			printf("0\n");
			return 0;
		}
	}
	else{
		pthread_t th;
		int r0 = pthread_create(&th, NULL, cal, &n);
		m++;
		pthread_join(th,NULL);
		printf("%lld\n",Data.fib[n]);
		return 0;
	}
}
