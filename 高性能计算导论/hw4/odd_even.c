//Compile: gcc -g -Wall -lpthread -o odd_even odd_even.c
//Run: odd_even num_of_threads


#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <string.h>

int msg=0;
int thread_cnt=0;
int receiver=0;
char* message;

pthread_mutex_t mutex;

void* work(void* rank);

int main(int argc,char* argv[]){
	long thread;
	pthread_t* thread_handles;
	message = malloc(100*sizeof(char));
	thread_cnt = strtol(argv[1], NULL, 10);
	thread_handles = malloc(thread_cnt*sizeof(pthread_t));
	pthread_mutex_init(&mutex, NULL);
	for(thread = 0; thread < thread_cnt; thread++) {
		pthread_create(&thread_handles[thread], NULL, work, (void*) thread);
	}
	for(thread = 0; thread < thread_cnt; thread++) {
		pthread_join(thread_handles[thread], NULL);
	}
	pthread_mutex_destroy(&mutex);
	free(message);
	free(thread_handles);
	return 0;
}
void* work(void* rank){
	long my_rank=(long)rank;
	while(1){
		pthread_mutex_lock(&mutex);
		if(my_rank%2==1){
			if(msg){
				msg=0;
				printf("%ld Got Message: %s\n",my_rank,message);
				pthread_mutex_unlock(&mutex);
				break;
			}
		}
		else{
			if(!msg){
				sprintf(message,"I am %ld",my_rank);
				msg=1;
				pthread_mutex_unlock(&mutex);
				break;
			}
		}
		pthread_mutex_unlock(&mutex);
	}
	return NULL;
}