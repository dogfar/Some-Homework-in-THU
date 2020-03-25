//Compile: gcc -Ofast -fopenmp -o p4 problem4.c
//Run: ./p4 <N> <num_threads. <chunk_size>

#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <time.h>

double** A;
double* s;
int* b;
int num_threads,n;

void gen(double*** A, int** b, int n) {
    int i,j;
    (*A) = (double**)malloc(sizeof(double*) * n);
    (*b) = (int*)malloc(sizeof(int) * n);
    srand((unsigned)time(0));
    for(i = 0; i < n; i++) {
        (*A)[i] = (double*)malloc(sizeof(double) * n);
        for(j = 0; j < n; j++) {
            (*A)[i][j] = -100 + rand() * 1.0 / RAND_MAX * 200;
        }
    }
    for( i = 0 ; i < n; i++) {
        (*b)[i] = rand() % n + 1;
    }
}

void print(double** A, int* b, int n) {
    int i, j;
    printf("A:\n");
    for(i = 0; i < n; i++) {
        for(j = 0; j < n; j++) {
            printf("%f ", A[i][j]);
        }
        printf("\n");
    }
    printf("b;\n");
    for(i = 0; i < n; i++) {
        printf("%d\n", b[i]);
    }
}

void printResult(double* s, int n) {
    int i;
    for(i = 0; i < n; i++) {
        printf("%f\n", s[i]);
    }
}

void freeRes(double** A, int*b, double* s, int n) {
    int i;
    free(s);
    free(b);
    for(i = 0; i < n; i++) {
        free(A[i]);
    }
    free(A);
}
double getA(int idx,int limit){
	int i,ans;
	for (i=0;i<limit;i++){
		ans+=A[idx][i];
	}
	return ans;
}

void static_omp(int chunk_size){
	int i;
#   pragma omp parallel for num_threads(num_threads)
//       schedule(static,chunk_size)   
	for(i=0;i<n;i++){
		s[i]=getA(i,b[i])*1.0/b[i];
	}
}

void dynamic_omp(int chunk_size){
	int i;
#   pragma omp parallel for num_threads(num_threads)\
        schedule(dynamic,chunk_size)   
	for(i=0;i<n;i++){
		s[i]=getA(i,b[i])*1.0/b[i];
	}
}


	
int main(int argc, char* argv[])
{
    int i, j, chunk;

    // get problem size n and number of threads from command line
    if(argc < 3) {
        printf("Usage: ./target n size.\n");
    }
    n = atoi(argv[1]);
    num_threads = atoi(argv[2]);
	chunk = atoi(argv[3]);

    gen(&A, &b, n);
    s = (double*)malloc(sizeof(double) * n);
    double t1=omp_get_wtime();
    static_omp(chunk);

    double t2=omp_get_wtime();
    printf("Static Time: %lfs\n",t2-t1);
        double t3=omp_get_wtime();
    dynamic_omp(chunk);

    double t4=omp_get_wtime();
    printf("Dynamic Time: %lfs\n",t4-t3);

    freeRes(A, b, s, n);
    return 0;
}
