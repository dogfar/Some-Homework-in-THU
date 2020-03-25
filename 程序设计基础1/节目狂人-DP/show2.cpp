#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;

char files[][20] = {"cctv1","cctv2","cctv3","cctv4asia","cctv5","cctv5plus","cctv6","cctv7",
"cctv8","cctv9","cctv10","cctv11","cctv12","cctv13","cctv14","cctv15","cctvarabic","cctvdoc",
"cctvxiyu","cctvfrench","cctvnews","cctvrussian"}; 

char list[1000][50];
int summin[1001],finallist[1001];
int tmp=0,ans=0,sumn=1;
int emmm[1001]={-1};

struct show{
	int favor;
	int bg;
	int end;
	char name[50];
	int length; 
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
void whichshow(int n, int a[]){
	if(a[n]==-1){
		return;
	}
	else{
		sumn++;
		finallist[sumn]=a[n];
	}
	whichshow(a[n],a);
}
void find_longest(int n, show *p){
	bubblesort(n,p);
	for(int i=0;i<n;i++){
		summin[i]=p[i].length;
	}
	for(int i=1;i<n;i++){
		for(int j=0;j<=i-1;j++){
			if(p[j].end<=p[i].bg){
				tmp=p[i].length+summin[j];
				if(tmp>summin[i]){
					summin[i]=tmp;
					emmm[i]=j;
				}
			}
		}
	}
	int r=0;
	for(int i=0;i<n;i++){
		if(summin[i]>ans){
			ans=summin[i];
			r=i;
		}
	}
	finallist[1]=r;
	whichshow(r,emmm);
	for(int i=sumn;i--;i>=1){
		strcpy(list[sumn+1-i],p[i].name);
	}
}
int main(){
	show channel[1000];
	int sum = 0;
	for (int i = 0;i < 22;i++) {
		ifstream fin(files[i]); //CJJ 
		char time[12];
		while(fin >> time 
		         >> channel[sum].name 
				 >> channel[sum].favor){
			channel[sum].bg=(time[0]-'0')*600+(time[1]-'0')*60+(time[3]-'0')*10+(time[4]-'0');
			channel[sum].end=(time[10]-'0')+(time[9]-'0')*10+(time[7]-'0')*60+(time[6]-'0')*600; 
			channel[sum].length=channel[sum].end-channel[sum].bg;
			sum++;
		}
	}
	find_longest(sum,channel);
	for(int i=1;i<=sumn;i++){
		cout << list[i] << endl; 
	}
	ofstream fout("result.txt");
	fout << ans << "min" << endl;
	return 0;
} 
