#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;

char files[][20] = {"cctv1","cctv2","cctv3","cctv4asia","cctv5","cctv5plus","cctv6","cctv7",
"cctv8","cctv9","cctv10","cctv11","cctv12","cctv13","cctv14","cctv15","cctvarabic","cctvdoc",
"cctvxiyu","cctvfrench","cctvnews","cctvrussian"}; 

char list[1000][50];
int num=0;
struct show{
	int favor;
	int bg;
	int end;
	char name[50];
}; 
void bubblesort(int n,show *p){
	show tmp;
	for(int i=1;i<=n-1;i++){
		for(int j=0;j<=n-i-1;j++){
			if(p[j].end>p[j+1].end){
				tmp=p[j];
				p[j]=p[j+1];
				p[j+1]=tmp;
			}
		}
	}
}
void schedule(int n,show *p){
	bubblesort(n,p);
	int end=0;
	for(int i=0;i<n;i++){
		if(p[i].bg>=end){
			end=p[i].end;
			num++;
			strcpy(list[num],p[i].name);
		}
	}
}
int main(){
	show channel[1000];
	int sum = 0;
	int m=0;
	for (int i = 0;i < 22;i++) {
		ifstream fin(files[i]); //CJJ 
		char time[12];
		while(fin >> time 
		         >> channel[sum].name 
				 >> channel[sum].favor){
			channel[sum].bg=(time[0]-'0')*600+(time[1]-'0')*60+(time[3]-'0')*10+(time[4]-'0');
			channel[sum].end=(time[10]-'0')+(time[9]-'0')*10+(time[7]-'0')*60+(time[6]-'0')*600;
			sum++;//全部处理成min 
		}
	}
	schedule(sum,channel);
     for(int i=1;i<=num;i++){
     	cout << list[i] << endl;
	 }
	 ofstream fout("results.txt");
	 fout << num << endl;
	return 0;
}
