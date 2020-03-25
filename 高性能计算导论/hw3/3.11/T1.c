#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <time.h>

const int local_data_count=10;

int main(void){
	int my_rank, comm_sz;
   	MPI_Comm comm;
	MPI_Init(NULL, NULL);
	comm = MPI_COMM_WORLD;
	MPI_Comm_size(comm, &comm_sz);
	MPI_Comm_rank(comm, &my_rank);
	
	srand((unsigned) time(NULL));
	
	int* local_data;
	int* loc_pre_sum;
	int* pre_sum;
	int total_data;
	
	total_data=comm_sz*local_data_count;
	local_data=malloc(local_data_count*sizeof(int));
	loc_pre_sum=malloc(local_data_count*sizeof(int));
	pre_sum=malloc(total_data*sizeof(int));
	int i;
	printf("%d ",my_rank);
	for(i=0;i<local_data_count;i++){
		local_data[i]=rand()%1000;
		loc_pre_sum[i]=0;
		printf("%d ",local_data[i]);
	}
	printf("\n");
	for(i=0;i<local_data_count;i++){
		loc_pre_sum[i]=(i? local_data[i]+loc_pre_sum[i-1]:local_data[i]);
	}
	
	int part_sum;
	MPI_Scan(loc_pre_sum+local_data_count-1,&part_sum,1,MPI_INT,MPI_SUM,MPI_COMM_WORLD);
	part_sum-=loc_pre_sum[local_data_count-1];
	for(i=0;i<local_data_count;i++){
		loc_pre_sum[i]+=part_sum; 
	}
	MPI_Barrier(MPI_COMM_WORLD);
	MPI_Gather(loc_pre_sum,local_data_count,MPI_INT,pre_sum,local_data_count,MPI_INT,0,MPI_COMM_WORLD);
	if(my_rank==0){
		for (i=0;i<total_data;i++){
			printf("%d ",pre_sum[i]);
		}
                printf("\n");
	}
	free(local_data);
	free(loc_pre_sum);
	free(pre_sum);
	MPI_Finalize();
	return 0;
} 
