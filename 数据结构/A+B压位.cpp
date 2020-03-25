#include <cstring> 
#include <cstdio>
using namespace std;
int main(){
	setvbuf(stdin,new char[1<<20],_IOFBF,1<<20);
	setvbuf(stdout,new char[1<<20],_IOFBF,1<<20);
	long long int num1[557],num2[557],num[1115];
	int t;
	scanf("%d",&t); 
	while(t--){
		for(int i=0;i<557;i++){
			num1[i]=0;
			num2[i]=0;
		}
		for(int i=0;i<1115;i++)num[i]=0; 
		char s1[5005]="",s2[5005]=""; 
		scanf("%s",&s1);
		scanf("%s",&s2);
		if(s1[0]=='0' || s2[0]=='0'){
			printf("%d\n",0);
			continue;
		}
		int l1=strlen(s1);
		int l2=strlen(s2);
		long long int tmp=0;
		int count1=0,count2=0,cal=0;
		long long int f=1;
		for(int i=l1-1;i>=0;i--){
			tmp=tmp+f*(s1[i]-'0');
			f*=10;
			cal++;
			if(cal==9){
				cal=0;
				num1[count1]=tmp;
				count1++;
				tmp=0;
				f=1;
			}
			if(i==0 && cal!=0){
				num1[count1]=tmp;
				count1++;
			}
		}
		tmp=0;
		f=1;
		cal=0;
		for(int i=l2-1;i>=0;i--){
			tmp=tmp+f*(s2[i]-'0');
			f*=10;
			cal++;
			if(cal==9){
				cal=0;
				num2[count2]=tmp;
				count2++;
				tmp=0;
				f=1;
			}
			if(i==0 && cal!=0){
				num2[count2]=tmp;
				count2++;
			}
		}
		for(int i=0;i<count1;i++){
			for(int j=0;j<count2;j++){
				num[i+j]+=num1[i]*num2[j];
				num[i+j+1]+=num[i+j]/1000000000;
				num[i+j]%=1000000000;
			}
		} 
		int flag=0;
		for(int s=count1+count2;s>=0;s--){
			if(num[s]!=0){
				flag=s;
				printf("%d",num[flag]);
				break;
			}
		}
		for(int s=flag-1;s>=0;s--){
			printf("%0*d",9,num[s]);
		}
		printf("\n"); 
	}
	return 0;
}
