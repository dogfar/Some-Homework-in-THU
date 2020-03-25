//Comple: gcc -g -Wall -lpthread -o p2 problem2.c
//Run: ./p2 <num_threads> <N>

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <time.h>

#define MAX_INT 6

int thread_cnt=0,flag=0,waiting_thread=0;

struct listnode{
	int value;
	struct listnode* next;
};
struct tasknode{
	int option;
	int value;
	struct tasknode* next;
};

struct listnode* listhead;
struct tasknode* taskhead;
struct tasknode* tasktail;
pthread_mutex_t mutexlist;
pthread_mutex_t condmutex;
pthread_cond_t cond;
pthread_mutex_t Qmutex;

int insertnum(int data){
	struct listnode* tmp;
	struct listnode* now=listhead;
	struct listnode* pre=NULL;
	while(now!=NULL && now->value<data){
		pre=now;
		now=now->next;
	}
	if(now==NULL || now->value>data){
		tmp=malloc(sizeof(struct listnode));
		tmp->value=data;
		tmp->next=now;
		pre->next=tmp;
		return 1;
	}
	else return 0;
}
int findmember(int data){
	struct listnode* now=listhead;
	while(now!=NULL && now->value<data)now=now->next;
	if(now!=NULL && now->value==data)return 1;
	else return 0;
}
int deletenum(int data){
	struct listnode* now=listhead;
	struct listnode* pre=NULL;
	while(now!=NULL && now->value<data){
		pre=now;
		now=now->next;
	}
	if(now==NULL || now->value>data)return 0;
	else{
		pre->next=now->next;
		free(now);
		return 1;
	}
}
void printlist(){
	struct listnode* now=listhead->next;
	while(now!=NULL){
		printf("%d ",now->value);
		now=now->next;
	}
	printf("\n");
}
void gen_task(int n){
	srand((unsigned)time(NULL));
	int i,tmpopt,tmpval;
	for(i=0;i<n;i++){
		pthread_mutex_lock(&Qmutex);
		struct tasknode* t=NULL;
		t=malloc(sizeof(struct tasknode));
		tmpopt=rand()%5;
		tmpval=rand()%MAX_INT;
		t->option=tmpopt;
		t->value=tmpval;
		t->next=NULL;
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

int getdata(long my_rank,int* my_option,int* my_data){
	while(1){
		pthread_mutex_lock(&condmutex);
		waiting_thread++;
		while(pthread_cond_wait(&cond,&condmutex)!=0){/*wait until being waken up*/}
		waiting_thread--;
		pthread_mutex_unlock(&condmutex);
		if(!flag && taskhead->next!=NULL){
			pthread_mutex_lock(&Qmutex);
			taskhead=taskhead->next;
			*my_option=taskhead->option;
			*my_data=taskhead->value;
			pthread_mutex_unlock(&Qmutex);
			return 1;
		}
		return 0;
	}
}

void* work(void* rank){
	long my_rank=(long)rank;
	int myopt=-1,my_data=-1;
	while(getdata(my_rank,&myopt,&my_data)){
		pthread_mutex_lock(&mutexlist);
		if(myopt==0 || myopt==1){
			if(insertnum(my_data))printf("Task Insert %d finished\n",my_data);
			else printf("%d has already existed\n",my_data);
		}
		else if(myopt==2){
			if(deletenum(my_data))printf("Task Delete %d finished\n",my_data);
			else printf("%d can't be deleted for not existing\n",my_data);
		}
		else if(myopt==3){
			if(findmember(my_data))printf("Find %d \n",my_data);
			else printf("Cannot find %d \n",my_data);
		}
		else if(myopt==4){
			printf("Print List: ");
			printlist();
		}
		pthread_mutex_unlock(&mutexlist);
	}
	return NULL;
}

int main(int argc, char* argv[]){
	long thread;
	pthread_t *thread_handles;
	int n;
	thread_cnt=strtol(argv[1],NULL,10);
	n=strtol(argv[2], NULL, 10);
	thread_handles = malloc(thread_cnt*sizeof(pthread_t));

	listhead=malloc(sizeof(struct listnode));
	listhead->value=-1;
	listhead->next=NULL;
	
	taskhead=malloc(sizeof(struct tasknode));
	taskhead->option=-1;
	taskhead->value=-1;
	taskhead->next=NULL;

	tasktail=taskhead;

	pthread_mutex_init(&mutexlist,NULL);
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

	pthread_mutex_destroy(&mutexlist);
	pthread_mutex_destroy(&condmutex);
	pthread_cond_destroy(&cond);
	pthread_mutex_destroy(&Qmutex);

	free(thread_handles);
	return 0;
}

