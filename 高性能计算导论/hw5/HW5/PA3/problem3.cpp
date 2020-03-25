//Compile: g++ -Ofast -fopenmp -o p3 problem3.cpp
//Run: ./p3 <num_threads> <N>

#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <string.h>
#include <time.h>

#define MAX_INT 200000

void Gen_data(int num[],int n){
	srand((unsigned)time(NULL));
	for (int idx=0;idx<n;idx++)num[idx]=(rand()%MAX_INT)+1;
}
void Cnt_Sort(int f[],int n,int thread_cnt){
	int *tmp=(int *)malloc(n*sizeof(int));
	#pragma omp parallel for num_threads(thread_cnt)
	for(int i=0;i<n;i++){
		int cnt=0;
		for(int j=0;j<n;j++){
			if((f[j]<f[i]) || (f[j]==f[i] && j<i))cnt++;
		}
		tmp[cnt]=f[i];
	}
	#pragma omp parallel for num_threads(thread_cnt)
	for(int i=0;i<n;i++)f[i]=tmp[i];

	delete[] tmp;
}
void Serial_Sort(int f[],int n){
	int *tmp=(int *)malloc(n*sizeof(int));
	for(int i=0;i<n;i++){
		int cnt=0;
		for(int j=0;j<n;j++){
			if((f[j]<f[i]) || (f[j]==f[i] && j<i))cnt++;
		}
		tmp[cnt]=f[i];
	}
	memcpy(f,tmp,n*sizeof(int));
	delete[] tmp;
}
int cmp(const void* a, const void* b){
	return *(const int*)a - *(const int*)b;
}
int main(int argc, char* argv[]){
	int *num;
	int n,thread_cnt;
	double start,end;
	double t1,t2,t3;
	thread_cnt=strtol(argv[1], NULL, 10);
	n=strtol(argv[2], NULL, 10);
	num=(int*)malloc(n*sizeof(int));

	int *foruse;
	foruse=(int*)malloc(n*sizeof(int));
	Gen_data(num,n);
	int i;
	//SERIAL
	memcpy(foruse,num,n*sizeof(int));
	start=omp_get_wtime();
	Serial_Sort(foruse,n);
	end=omp_get_wtime();
	t1=(double)(end-start);
	printf("Serial Time: %lf s\n",t1);

	//Qsort
	memcpy(foruse,num,n*sizeof(int));
	start=omp_get_wtime();
	qsort(foruse,n,sizeof(int),cmp);
	end=omp_get_wtime();
/*	for(int i=0;i<n;i++){
		printf("%d ",foruse[i]);
	}
	printf("\n");*/
	t2=(double)(end-start);
	printf("Qsort Time: %lf s\n",t2);

	//PARALLEL
	memcpy(foruse,num,n*sizeof(int));
	start=omp_get_wtime();
	Cnt_Sort(foruse,n,thread_cnt);
	end=omp_get_wtime();
/*	for(int i=0;i<n;i++){
		printf("%d ",foruse[i]);
	}
	printf("\n");*/
	t3=(double)(end-start);
	printf("Parallel Time: %lf s\n",t3);

	printf("Ratio: %lf\n",t1/t3);
	return 0;
}