#include <cstdio>
#include <cstring>
using namespace std;

long long int queue[2002][2002],stack[2002][5],score[2002][2002];// score是每次得分 
int scorecnt=0,headofs=0,headofq=0,tailofq=0;
long long int tmp[25002]; //在做所有score的乘法时 记录每一次乘完之后的答案 
long long int buffer[2002];//读入到buffer里以便于sort 
long long int ans[25002];//最终答案 
int scobit[2002],qsbit[2002];//下同 记录有效位数 
int tmpscobit; 
//以下的calc都是照搬自PA1-1，只是取count有所不同 
void calc(long long int num1[],long long int num2[],int headofq,int tailofq,int scorecnt){
	int count1,count2;
	for(int i=qsbit[headofq];i>=0;i--){//从队列取两个数，其有效位数不超过qsbit 
		if(num1[i]!=0){
			count1=i+1;
			break;
		}
	}
	for(int i=qsbit[headofq+1];i>=0;i--){
		if(num2[i]!=0){
			count2=i+1;
			break;
		}
	}
	qsbit[tailofq]=count1+count2;
	scobit[scorecnt]=count1+count2;
	for(int i=0;i<count1;i++){
		for(int j=0;j<count2;j++){
			queue[tailofq][i+j]+=num1[i]*num2[j];
			queue[tailofq][i+j+1]+=queue[tailofq][i+j]/1000000000;
			queue[tailofq][i+j]%=1000000000;
			score[scorecnt][i+j]=queue[tailofq][i+j];
			score[scorecnt][i+j+1]=queue[tailofq][i+j+1];
		}
	} 
} 
void calcforstack(long long int num1[],long long int num2[],int tailofq,int scorecnt){
	int count1=1,count2=1;//从stack里取两个数，有效位数自然是1 
	scobit[scorecnt]=2;
	qsbit[tailofq]=2;
	for(int i=0;i<count1;i++){
		for(int j=0;j<count2;j++){
			queue[tailofq][i+j]+=num1[i]*num2[j];
			queue[tailofq][i+j+1]+=queue[tailofq][i+j]/1000000000;
			queue[tailofq][i+j]%=1000000000;
			score[scorecnt][i+j]=queue[tailofq][i+j];
			score[scorecnt][i+j+1]=queue[tailofq][i+j+1];
		}
	} 
} 
void calcforsq(long long int num1[],long long int num2[],int headofq,int tailofq,int scorecnt){
	int count1,count2=1;//取一个队列的一个栈里的 
	for(int i=qsbit[headofq];i>=0;i--){
		if(num1[i]!=0){
			count1=i+1;
			break;
		}
	}
	qsbit[tailofq]=count1+count2;
	scobit[scorecnt]=count1+count2;
	for(int i=0;i<count1;i++){
		for(int j=0;j<count2;j++){
			queue[tailofq][i+j]+=num1[i]*num2[j];
			queue[tailofq][i+j+1]+=queue[tailofq][i+j]/1000000000;
			queue[tailofq][i+j]%=1000000000;
			score[scorecnt][i+j]=queue[tailofq][i+j];
			score[scorecnt][i+j+1]=queue[tailofq][i+j+1];
		}
	} 
} 
void cal2(long long int num1[],long long int num2[],int k){
	int count1,count2;//最后每次分数相乘时的运算 
	for(int i=scobit[k];i>=0;i--){//分数数组的有效位数 
		if(num1[i]!=0){
			count1=i+1;break;
		}
	}
	for(int i=tmpscobit;i>=0;i--){//上一轮答案的有效位数 
		if(num2[i]!=0){
			count2=i+1;break;
		}
	}
	tmpscobit=count1+count2;
	for(int i=0;i<count1;i++){
		for(int j=0;j<count2;j++){
			ans[i+j]+=num1[i]*num2[j];
			ans[i+j+1]+=ans[i+j]/1000000000;
			ans[i+j]%=1000000000;
		}
	} 
	memset(tmp,0,sizeof(tmp));
	for(int i=0;i<count1+count2;i++){
		tmp[i]=ans[i];
	}
}
void qs(long long int num[],int l,int r){//快排 抄自PA1-2 
	if(l>=r)return;
	else{
		int i=l,j=r;
		long long int tmp;
		long long int flag=num[r];
		while(i<j){
			while(i<j && num[i]<flag){
				i++;
			}
			while(i<j && num[j]>=flag){
				j--;
			}
			if(i<=j){
				tmp=num[i];
				num[i]=num[j];
				num[j]=tmp;
			}
		}
		num[r]=num[j];
		num[j]=flag;
		qs(num,l,i-1);
		qs(num,i+1,r);
	}
}
int main(){
	setvbuf(stdin,new char[1<<20],_IOFBF,1<<20);
	setvbuf(stdout,new char[1<<20],_IOFBF,1<<20);
	int n;
	scanf("%d",&n);
	for(int i=0;i<n;i++)scanf("%lld",&buffer[i]);//先读入一维的便于sort 
	if(n==2){
		printf("%lld",buffer[0]*buffer[1]);
		return 0;//特判 
	}
	qs(buffer,0,n-1);
	for(int i=0;i<n;i++)stack[i][0]=buffer[i];//转移到二维的 
	while(headofs<=n-1 && scorecnt<n-1){//判断该取那两个数 
		memset(ans,0,sizeof(ans));
		if(headofs<n-1){//stack里的数充裕 
			if(queue[headofq][1]>0 || queue[headofq][0]>=stack[headofs+1][0] || tailofq==headofq){
				calcforstack(stack[headofs],stack[headofs+1],tailofq,scorecnt);//two from stack 
				headofs+=2;//取俩stack 
				tailofq++,scorecnt++;
				continue;
			}
		} 
		if(tailofq>headofq+1){//queue里的数充裕 
			if(stack[headofs][0]>queue[headofq+1][0] && queue[headofq+1][1]==0){
				calc(queue[headofq],queue[headofq+1],headofq,tailofq,scorecnt);
				tailofq++,scorecnt++;//取俩queue 
				headofq+=2;
				continue; 
			}
		}
		calcforsq(queue[headofq],stack[headofs],headofq,tailofq,scorecnt);
		headofs++,headofq++,tailofq++,scorecnt++; //要么就取一个queue一个stack 
	}
	while(scorecnt<n-1){
		calc(queue[headofq],queue[headofq+1],headofq,tailofq,scorecnt);
		headofq+=2,tailofq++,scorecnt++;//queue里还剩了一些 
	}
	tmpscobit=scobit[0];
	for(int i=0;i<=scobit[0];i++){
		tmp[i]=score[0][i];
	} 
	for(int i=1;i<scorecnt;i++){
		memset(ans,0,sizeof(ans));
		cal2(score[i],tmp,i);//把所有分数乘起来 
	}
	int flag=0;
	for(int i=25002;i>=0;i--){
		if(ans[i]!=0){
			printf("%lld",ans[i]);
			flag=i;
			break;
		}
	}
	for(int i=flag-1;i>=0;i--){
		printf("%0*d",9,ans[i]);
	}
	return 0;
}

