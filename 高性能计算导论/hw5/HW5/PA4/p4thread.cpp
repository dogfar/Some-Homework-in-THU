//Compile: g++ -g -Wall -lpthread -fopenmp -o p4thread p4thread.cpp
//Run: p4thread <N> <num_threads>

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <time.h>
#include <omp.h>
int n, thread_cnt;
double** A;
double* s;
int* b;
int waiting_thread=0;
int flag=0;

struct tasknode{
    int index;
    tasknode* next;
    tasknode(int i){this->index=i;this->next=NULL;}
};

tasknode* taskhead;
tasknode* tasktail;
pthread_mutex_t condmutex;
pthread_cond_t cond;
pthread_mutex_t Qmutex;

void gen(double*** A, int** b,int n) {
    (*A) = (double**)malloc(sizeof(double*) * n);
    (*b) = (int*)malloc(sizeof(int) * n);
    srand((unsigned)time(0));
    for(int i = 0; i < n; i++) {
        (*A)[i] = (double*)malloc(sizeof(double) * n);
        for(int j = 0; j < n; j++) {
            (*A)[i][j] = -100 + rand() * 1.0 / RAND_MAX * 200;
        }
    }
    for(int i = 0 ; i < n; i++) {
        (*b)[i] = rand() % n + 1;
    }
}

void print(double** A, int* b, int n) {
    printf("A:\n");
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            printf("%f ", A[i][j]);
        }
        printf("\n");
    }
    printf("b;\n");
    for(int i = 0; i < n; i++) {
        printf("%d\n", b[i]);
    }
}

void printResult(double* s, int n) {
    for(int i = 0; i < n; i++) {
        printf("%f\n", s[i]);
    }
}
/*
void freeRes(double** A, int*b, double* s, int n) {
    free(s);
    free(b);
    for(int i = 0; i < n; i++) {
        free(A[i]);
    }
    free(A);
}*/
void gen_task(int n){
    for(int i=0;i<n;i++){
        pthread_mutex_lock(&Qmutex);
        tasknode* t=new tasknode(i);
        tasktail->next=t;
        tasktail=t;
        pthread_mutex_unlock(&Qmutex);
        if(waiting_thread>0)pthread_cond_signal(&cond);
    }
	while(taskhead->next!=NULL){
        	if(waiting_thread>0)pthread_cond_signal(&cond);
    	}
    while(waiting_thread<thread_cnt){/*wait until all threads finish their work*/}
    flag=1;
    pthread_mutex_lock(&condmutex);
    pthread_cond_broadcast(&cond);
    pthread_mutex_unlock(&condmutex);
}
int getdata(int* my_idx){
    while(1){
        pthread_mutex_lock(&condmutex);
        waiting_thread++;
        while(pthread_cond_wait(&cond,&condmutex)!=0){/*wait until being waken up*/}
        waiting_thread--;
        pthread_mutex_unlock(&condmutex);
        if(!flag && taskhead->next!=NULL){
            pthread_mutex_lock(&Qmutex);
            taskhead=taskhead->next;
            *my_idx=taskhead->index;
            pthread_mutex_unlock(&Qmutex);
            return 1;
        }
	if(!flag && taskhead->next==NULL)waiting_thread++;
        return 0;
    }
}
void* work(void* rank){
    int my_idx=-1;
    while(getdata(&my_idx)){
        s[my_idx]=0;
        for(int i=0;i<n;i++)s[my_idx]+=A[my_idx][i];
        s[my_idx]=s[my_idx]*1.0/(b[my_idx]*1.0);
//	printf("%d\n",my_idx);
    }
    return NULL;
}
int main(int argc, char* argv[])
{
    double time_use=0;
    long thread;
    pthread_t *thread_handles;
    if(argc < 3) {
        printf("Usage: ./target n size.\n");
    }
    n = atoi(argv[1]);
    thread_cnt = atoi(argv[2]);
	gen(&A, &b, n);
	double start=omp_get_wtime();
/***********************************************************/
    thread_handles = (pthread_t*)malloc(thread_cnt*sizeof(pthread_t));
    taskhead=new tasknode(-1);
    tasktail=taskhead;
 //    print(A,b,n);
    s = (double*)malloc(sizeof(double) * n);
    pthread_mutex_init(&condmutex,NULL);
    pthread_cond_init(&cond,NULL);
    pthread_mutex_init(&Qmutex,NULL);
    for(thread = 0; thread < thread_cnt; thread++) {
        pthread_create(&thread_handles[thread], NULL, work, (void*) thread);
    }
    gen_task(n);
    for(thread = 0;thread < thread_cnt; thread++){
        pthread_join(thread_handles[thread], NULL);
    }
    pthread_mutex_destroy(&condmutex);
    pthread_cond_destroy(&cond);
    pthread_mutex_destroy(&Qmutex);
/*************************************************/
	double end=omp_get_wtime();
    time_use=end-start;

    printf("%lf s\n",time_use);
//    printResult(s,n);
    return 0;
}