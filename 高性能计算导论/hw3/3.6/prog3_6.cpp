#include <mpi.h>
#include <iostream>
#include <ctime>
#include <stdio.h>
#include <stdlib.h>
#include <cmath>
#include <memory.h>
using namespace std;

void serial(int n, double **matrix, double *vector, double **result);
void gen(int n, double ***matrix, double **vector);
void print(int n, double **matrix, double *vector);
void free(int n, double **matrix, double *vector) ;
void run(int n,int comm_sz,int my_rank,MPI_Comm comm);

int main(int argc, char* argv[]) { 
	if (argc < 2) {
		cout << "Usage: "<<argv[0]<<" n" << endl;
		return -1;
	}
	int my_rank, comm_sz;
    	MPI_Comm comm;
	MPI_Init(NULL, NULL);
	comm = MPI_COMM_WORLD;
	MPI_Comm_size(comm, &comm_sz);
	MPI_Comm_rank(comm, &my_rank);

	int n = atoi(argv[1]);
	run(n,comm_sz,my_rank,comm);
}

void serial(int n, double **matrix, double *vector, double **result){
	/*
	 * It is a serial algorithm to 
	 * get the true value of matrix-vector multiplication
	 * please calculation the difference between true value and the value you obtain
	 *
	 */
	(*result) = new double[n];
	for(int i = 0; i < n; i++) {
		(*result)[i] = 0.0;
	}

	for (int i = 0; i < n; i++) {
		double temp = 0.0;
		for (int j = 0; j < n; j++) {
			temp += matrix[i][j] * vector[j];
		}
		(*result)[i] = temp;
	}
}

void gen(int n, double ***matrix, double **vector) {
     /*
      *  generate random matrix and vector,
      *  In order to debug conveniently, you can define a const matrix and vector
      *  but I will check your answer based on random matrix and vector
      */
	(*matrix) = new double*[n];
	srand((unsigned)time(0));
	for(int i = 0; i < n; i++) {
		(*matrix)[i] = new double[n];
		for(int j = 0; j < n; j++) {
			(*matrix)[i][j] = -1 + rand() * 1.0 / RAND_MAX * 2;
		}
	}
	(*vector) = new double[n];
	for(int i = 0; i < n; i++) {
		(*vector)[i] = -1 + rand() * 1.0 / RAND_MAX * 2;
	}
}

void print(int n, double **matrix, double *vector) {
	for(int i = 0; i < n; i++) {
		cout << vector[i] << endl;
	}
	for(int i = 0; i < n; i++) {
		for(int j = 0; j < n; j++) {
			cout << matrix[i][j] << " ";
		}
		cout << endl;
	}
}

void free(int n, double **matrix, double *vector) {
	delete[] vector;
	for(int i = 0; i < n; i++)
		delete[] matrix[i];
	delete[] matrix;
}


void run(int n,int comm_sz,int my_rank,MPI_Comm comm) {
	double start,start2,finish,finish2;
	double duration1,duration2,duration3;

	double **matrix,*vector;
	vector=new double[n];
	matrix=new double*[n];
	for(int i=0;i<n;i++){
		matrix[i]=new double[n];
	} 
	if(my_rank==0){
		gen(n,&matrix,&vector);
		start=MPI_Wtime();
	}
	int sc=sqrt(comm_sz);
	int local_n=n/sqrt(comm_sz);
	double* ans_vec=new double[n];
	double* loc_send_vec=new double[n];
	double* A=new double[n*n];
	double* loc_ans_vec=new double[local_n];
	double* loc_vec=new double[local_n];
	double* local_A=new double[n*n/comm_sz];
	memset(ans_vec,0,sizeof(ans_vec));
	memset(loc_send_vec,0,sizeof(loc_send_vec));
	memset(loc_ans_vec,0,sizeof(loc_ans_vec));
	memset(A,0,sizeof(A));
	int* count=new int[comm_sz];
	int* offset=new int[comm_sz];
	int *count2=new int[comm_sz];
	int *offset2=new int[comm_sz];
	offset2[0]=0;
	for(int i=0;i<comm_sz;i++){
		count2[i]=local_n*local_n;
		if(i>0)offset2[i]=offset2[i-1]+local_n*local_n;
	}
	for(int i=0;i<sc;i++){
		offset[i*sc]=0;
		for(int j=0;j<sc;j++){
			count[i*sc+j]=local_n;
			if(j>=1){
				offset[i*sc+j]=offset[i*sc+j-1]+local_n;
			}
		}
	}
	if(my_rank==0)start2=MPI_Wtime();
	MPI_Scatterv(vector,count,offset,MPI_DOUBLE,loc_vec,local_n,MPI_DOUBLE,0,comm);
	if(my_rank==0){
		for(int i=0;i<sc;i++){
			for(int j=0;j<sc;j++){
				for(int row=0;row<local_n;row++){
					for(int col=0;col<local_n;col++){
						A[(i*sc+j)*local_n*local_n+row*local_n+col]=matrix[i*local_n+row][j*local_n+col];
					}
				}
			}
		}
	}
	MPI_Barrier(MPI_COMM_WORLD);
	MPI_Scatterv(A,count2,offset2,MPI_DOUBLE,local_A,local_n*local_n,MPI_DOUBLE,0,comm);
	if(my_rank==0)finish2=MPI_Wtime();
	for(int i=0;i<local_n;i++){
		for(int j=0;j<local_n;j++){
			loc_ans_vec[i]+=local_A[i*local_n+j]*loc_vec[j];
		}
	}
	for(int i=0;i<sc;i++){
		for(int j=0;j<sc;j++){
			if(my_rank==(i*sc+j)){
				memcpy(loc_send_vec+i*local_n,loc_ans_vec,local_n*sizeof(double));
			}
		}
	}
	MPI_Reduce(loc_send_vec,ans_vec,n,MPI_DOUBLE,MPI_SUM,0,MPI_COMM_WORLD);
	if(my_rank==0){
		finish=MPI_Wtime();
		duration1=(double)(finish-start);
		duration2=(double)(finish2-start2);
		start=MPI_Wtime();
		double *result;
		result=new double[n];
		double delta=0;
		serial(n,matrix,vector,&result);
		finish=MPI_Wtime();
		duration3=(double)(finish-start);
		for(int i=0;i<n;i++){
			delta+=abs(ans_vec[i]-result[i])*abs(ans_vec[i]-result[i]);
		}
		delta=sqrt(delta);
		printf("Parallel Time-- %f s\n",duration1);
		printf("Distribute Time-- %f s\n",duration2);
		printf("Serial Time-- %f s\n",duration3);
		printf("delta: %f\n",delta);
		
	}
        MPI_Finalize();
}
