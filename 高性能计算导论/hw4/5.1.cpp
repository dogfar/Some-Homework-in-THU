//Compile: g++ -g -Wall -fopenmp -o 5.1 5.1.cpp
//Run: 5.1 num_of_threads

#include <stdio.h>
#include <cstdlib>
#include <stdlib.h>
#include <omp.h>
#include <time.h>
using namespace std;
double min_meas,max_meas;
int data_count;
double* data;
int bin_count;
double* bin_maxes;
int* bin_num;

void get_data(int* data_count,double* min_meas,double* max_meas,int* bin_count){
	printf("Please Enter data_count:");
	scanf("%d",data_count);
	printf("Please Enter min_meas and max_meas:");
	scanf("%lf %lf",min_meas,max_meas);
	printf("Please Enter bin_count:");
	scanf("%d",bin_count);
}
void gen_data(){
	 srand(2);
     for (int i = 0; i < data_count; i++){
     	data[i] = min_meas + (max_meas - min_meas)*rand()/((double) RAND_MAX);
     }
     double bin_width = (max_meas - min_meas) / bin_count; 
     for (int i = 0; i < bin_count; i++) {
         bin_maxes[i] = min_meas + (i+1)*bin_width;
      }
}
int find_bin(int idx){
	for(int i=0;i<bin_count;i++){
		if(i==0){
			if(data[idx]>=min_meas && data[idx]<bin_maxes[i])return i;
		}
		else{
			if(data[idx]>=bin_maxes[i-1] && data[idx]<bin_maxes[i])return i;
		}
	}
}
void cal(){
	int my_rank=omp_get_thread_num();
	int thread_count=omp_get_num_threads();
	int local_cnt=data_count/thread_count;
	int a=local_cnt*my_rank;
	int b=local_cnt*(my_rank+1);
	for(int i=a;i<b;i++){
		int tmpbin=find_bin(i);
#pragma omp critical  
		bin_num[tmpbin]++;
	}
}
int main(int argc,char* argv[]){
	int thread_count=strtol(argv[1],NULL,10);
	get_data(&data_count,&min_meas,&max_meas,&bin_count);

	clock_t start=clock();
	data=(double*)malloc(data_count*sizeof(double));
	bin_maxes=(double*)malloc(bin_count*sizeof(double));
	bin_num=(int*)malloc(bin_count*sizeof(int));
	for(int i=0;i<bin_count;i++)bin_num[i]=0;
	gen_data();
#pragma omp parallel num_threads(thread_count)
	cal();

	clock_t end=clock();
	double t=(double)(end-start)/CLOCKS_PER_SEC;
	printf("Usage : %lf s\n",t);
	printf("\n");
	for (int i = 0; i < bin_count; i++) {
      double bin_max = bin_maxes[i];
      double bin_min = (i == 0) ? min_meas: bin_maxes[i-1];
      printf("%.3f-%.3f:\t", bin_min, bin_max);
      for (int j = 0; j < bin_num[i]; j++)
         printf("X");
      printf("\n");
   }
}