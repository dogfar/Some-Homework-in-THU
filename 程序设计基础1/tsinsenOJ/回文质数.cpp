#include <iostream>
using namespace std;
//����Ҫ���ҳ�һ���ڵĻ�������������Ѳ�������100000000�ͻᳬʱ��������˵������ż��λ�Ļ�����������11�������Ե�b>һǧ��ֱ�ӿ���1000000���ڵľͺá�
//Ҳ�����ȹ�����������ж�������ͬ����������Ľ��ۣ�������ֻ�蹹��1-1000�����ֵĺ�һ�뵹�����Ϳɣ��ٰ����жϡ� 
 
int main(){
	int i=0,j=0,a=0,b=0,sum=0,p=0,k=0;
	cin >> a >> b; 
	bool PRIME[10000000];
	bool HUIWEN=true;
	int S[100];
	int temp[8];
	if(b>=10000000){
		for(i=3;i<=10000000;i=i+2){
		    PRIME[i]=true;
	    }
	    for(i=3;i*i<=10000000;i++){
		    if(PRIME[i]){
			    for(j=3;i*j<=10000000;j++){
			 	    PRIME[i*j]=false;
			    }
		    }
	    }
	    for(i=a;i<=10000000;i++){
		    if(PRIME[i]){
			   sum=sum+1;
			   S[sum]=i;
		    }
	    }
	}
	else{
		for(i=3;i<=b;i=i+2){
		    PRIME[i]=true;
	    }
	    for(i=3;i*i<=b;i++){
		    if(PRIME[i]){
			    for(j=3;i*j<=b;j++){
			 	    PRIME[i*j]=false;
			    }
		    }
	    }
	    for(i=a;i<=b;i++){
		    if(PRIME[i]){
			   sum=sum+1;
			   S[sum]=i;
		    }
	    }
	}
	for(i=1;i<=sum;i++){
		p=S[i];
		while(S[i]>0){
			temp[k+1]=S[i]%10;
			S[i]=S[i]/10;
			k++;
		}
		for(j=1;j<=k/2;j++){
			if(temp[j]!=temp[k+1-j]){
				HUIWEN=false;
				break;
			}
		}
		if(HUIWEN==true){
			cout << p << endl;
		}
		HUIWEN=true;
		k=0;
	}
	return 0;
} 
