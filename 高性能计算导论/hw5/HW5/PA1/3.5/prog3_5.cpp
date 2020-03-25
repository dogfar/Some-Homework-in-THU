#include <mpi.h>
#include <iostream>
#include <ctime>
#include <stdio.h>
#include <stdlib.h>
#include <cmath>
#include <omp.h>
using namespace std;

void serial(int n, double **matrix, double *vector, double **result);
void gen(int n, double ***matrix, double **vector);
void print(int n, double **matrix, double *vector);
void free(int n, double **matrix, double *vector) ;
void run(int n, int comm_sz,int my_rank,MPI_Comm comm);

int main(int argc, char* argv[]) { 
	if (argc < 2) {
		cout << "Usage: "<<argv[0]<<" n" << endl;
		return -1;
	}
	int my_rank, comm_sz;
    	MPI_Comm comm;
	MPI_Init(NULL,NULL);
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


void run(int n, int comm_sz,int my_rank,MPI_Comm comm) {
	double start,start2,finish,finish2,t1,t2;
	double duration1,duration2,duration3;
	double **matrix, *vector;
	matrix = new double*[n];
	if(my_rank==0){
		gen(n,&matrix,&vector);
		start=MPI_Wtime();
	}
	double* ans_vec=new double[n];
	double* loc_ans_vec=new double[n];
	double* loc_vec=new double[n];
	int local_n=n/comm_sz;
	double **local_A;
	local_A=new double*[n];
	for(int i=0;i<n;i++){
		local_A[i]=new double[local_n];
	}
	if(my_rank==0){
		for(int i=0;i<n;i++){
			loc_vec[i]=vector[i];
		}
	}
	for(int i=0;i<n;i++){
		ans_vec[i]=0;
		loc_ans_vec[i]=0;
	}
	MPI_Bcast(loc_vec,n,MPI_DOUBLE,0,comm);
//***********************************************************
	if(my_rank==0)start2=MPI_Wtime();
	for(int i=0;i<n;i++){
		MPI_Scatter(matrix[i],local_n,MPI_DOUBLE,local_A[i],local_n,MPI_DOUBLE,0,comm);
	}
	MPI_Barrier(comm);
	if(my_rank==0)finish2=MPI_Wtime();
//***********************************************************
//	if(my_rank==0)t1=omp_get_wtime();
//	#pragma omp parallel for num_threads(8)
	for(int local_j=0;local_j<n;local_j++){
		for (int local_i=0;local_i<local_n;local_i++){
			loc_ans_vec[local_j]+=local_A[local_j][local_i]*loc_vec[my_rank*local_n+local_i];
		}
	}
//	if(my_rank==0)t2=omp_get_wtime();
	MPI_Reduce(loc_ans_vec,ans_vec,n,MPI_DOUBLE,MPI_SUM,0,MPI_COMM_WORLD);
	if(my_rank==0){
//		printf("%lf\n", t2-t1);
		finish=MPI_Wtime();
		duration1=(double)(finish-start);
		double delta=0;
		double *result;
		start=MPI_Wtime();
		serial(n,matrix,vector,&result);
		finish=MPI_Wtime();
		duration3=(double)(finish-start);
		start2=MPI_Wtime();
		#pragma omp parallel for num_threads(8)
		for(int i=0;i<n;i++){
			delta+=abs(ans_vec[i]-result[i])*abs(ans_vec[i]-result[i]);
		}
		finish2=MPI_Wtime();
		duration2=(double)(finish2-start2);
		delta=sqrt(delta);
		printf("Parallel Time-- %f s\n",duration1);
		printf("Calculate delta Time-- %f s\n",duration2);
		printf("Serial Time-- %f s\n",duration3);
		printf("Ratio--%lf \n",duration3/duration1);
		printf("delta: %f\n",delta);
	}
        MPI_Finalize();
}
