// ConsoleApplication1.cpp : 定义控制台应用程序的入口点。
//
#include<fstream>
#include<string.h>
#include<cstring>
#include<string>
#include<vector>
#include<iostream>
using namespace std;
int n=0,x=0;              //x记录当前节点
int byte=4096*34;
struct super_block{
	bool inode_bitmap[4096];
	bool block_bitmap[4096];
}sup;
ofstream fout;
//索引节点
//记录文件描述信息
struct inode{
	int i_id;                    //节点编号
	int i_mode;                  //类型，文件1or目录2or空0 
	int i_file_size;             //文件大小
	int i_blocks[1];             //上一级目录
	char i_place_holder[16];     //补全32Byte
}node[4096];

//data区域记录文件具体内容
//data_block分为file_block&dir_block
struct file_block{
    char data[4096];
}fb[4096];

struct dir_entry{
	char name[252];
	int inode_id;
};

struct dir_block{
	dir_entry dirs[16];
}db[4096];
//split 函数
vector<string> split(string s, char c){  //用于处理输入命令。 
		string str; 
	vector<string> str1;
		s.push_back(c);
		int p=s.size(); 
	for(int i=0;i<p;++i){
		if(s[i]==c){if(!str.empty()) str1.push_back(str);str.clear();}
		else str.push_back(s[i]);
	}
	return str1;
}

//由名字查询目录节点（查下一级）
int finddw(int x1,char a[]){
	for(int i=0;i<16;i++){
		if(strcmp(db[x1].dirs[i].name,a)==0&&node[db[x1].dirs[i].inode_id].i_mode==1)return -1;
		if(strcmp(db[x1].dirs[i].name,a)==0){return db[x1].dirs[i].inode_id;}
	}
	return -1;
}
//由名字查上一级
int findup(int x1){
	return node[x1].i_blocks[0];
	}
//初始化
void ini(){ofstream fout("start",ios::binary);
    x=0;
	memset(sup.block_bitmap,0,sizeof(sup.block_bitmap));
	memset(sup.inode_bitmap,0,sizeof(sup.inode_bitmap));

	memset(node,0,sizeof(node));
	memset(db,0,sizeof(db));
	sup.inode_bitmap[0]=1;
	sup.block_bitmap[0]=1;
	node[0].i_id=0;
	node[0].i_mode=2;
	node[0].i_blocks[0]=-1;
	db[0].dirs[0].inode_id=n;
	db[0].dirs[0].name[0]='.';
	fout.write((char*)&sup.inode_bitmap,4096);
	fout.write((char*)&sup.block_bitmap,4096);
	fout.write((char*)&node,sizeof(node));
	fout.write((char*)&db,sizeof(db));	
	fout.close();
	
}
//创建文件，b为名称，a为数据：用记录大小
void mk(int x1,char b[],char a[]){
	int i;
	bool t1=0,t2=0;
	for(int k=2;k<16;k++){
		if(db[x1].dirs[k].inode_id==0){ t1=1; i=k;break;}
	}if(t1){
	for(int k=1;k<4096;k++)
		if(sup.inode_bitmap[k]==0){
			n=k;
			sup.block_bitmap[k]=1;
			sup.inode_bitmap[k]=1;
			db[x1].dirs[i].inode_id=n;
	        strcpy(db[x1].dirs[i].name,b);
			fout.seekp(k,ios::beg);
			fout.write((char*)&sup.inode_bitmap[k],1);
			fout.seekp(k+4096,ios::beg);
			fout.write((char*)&sup.block_bitmap[k],1);
			t2=1;
			break;
		}
if(t2){
	node[n].i_id=n;
	node[n].i_mode=1;
	node[n].i_file_size=strlen(a);
	node[n].i_blocks[0]=x1;
	fout.seekp(byte+x1*4096+i*256,ios::beg);
	fout.write((char*)db[x1].dirs[i].name,sizeof(db[x1].dirs[i].name));
	fout.write((char*)&db[x1].dirs[i].inode_id,4);
	fout.seekp(4096*2+32*n,ios::beg);
	fout.write((char*)&node[n].i_id,4);
	fout.write((char*)&node[n].i_mode,4);
	fout.write((char*)&node[n].i_file_size,4);
	fout.write((char*)&node[n].i_blocks[0],4);
}else cout<<"no block"<<endl;
	}else cout<<"directory entry is full"<<endl;
}
//写入文件
void echo(int x2,vector<string> str){
	int x1,l=str[1].size();
	char b[252];           //b->name
	char a[4096];          //a->data
	memset(a,0,sizeof(a));
	int c=0;
	memset(b,0,sizeof(b));
	for(int i=0;i<l;i++)
		a[i]=str[1][i];
	vector<string> str1=split(str[2],'/');
	int p=str1.size();
	l=str1[p-1].size();
	for(int i=0;i<l;i++)
		b[i]=str1[p-1][i];
	if(str1[0]!="."&&str1[0]!=".."){
		for(int k=0;k<p-1;k++){
			char a1[252];
			memset(a1,0,sizeof(a1));
			l=str1[k].size();
		    for(int q=0;q<l;q++)
				a1[q]=str1[k][q];
		    c= finddw(c,a1);
			if(c==-1){
				return;
			}
		}
	x1=c;
	}else {c=x2;
		for(int k=0;k<p-1;k++){
			char a1[252];
			memset(a1,0,sizeof(a1));
			l=str1[k].size();
		    for(int q=0;q<l;q++)
				a1[q]=str1[k][q];
			if(str1[k]=="..")
				c=findup(c);
			else if(str1[k]!=".")
				c=finddw(c,a1);
			if(c==-1){
				return;
			}
		}x1=c;
	}

	bool t1=0;
	for(int i=2;i<16;i++){
	if(strcmp(db[x1].dirs[i].name,b)==0){
		if(node[db[x1].dirs[i].inode_id].i_mode==1){
		strcpy(fb[db[x1].dirs[i].inode_id].data,a);
		fout.seekp(byte+db[x1].dirs[i].inode_id*4096,ios::beg);
		fout.write(fb[db[x1].dirs[i].inode_id].data,sizeof(fb[db[x1].dirs[i].inode_id].data));
		cout<<">>";
		return;
		}else {cout<<b<<" is directory"<<endl<<">>";return;}
	}
	}for(int i=2;i<16;i++)if(db[x1].dirs[i].inode_id==0){
		mk(x1,b,a);
		strcpy(fb[db[x1].dirs[i].inode_id].data,a);
		fout.seekp(byte+db[x1].dirs[i].inode_id*4096,ios::beg);
		fout.write(fb[db[x1].dirs[i].inode_id].data,sizeof(fb[0].data));
		return;
	}
	
	cout<<"directory entry is full"<<endl;
	}

//创建目录
void mkdir(int x2,vector<string> str){
	int x1,l;
	char a[252];
	memset(a,0,sizeof(a));
	vector<string> str1=split(str[1],'/');
	int p=str1.size();
	l=str1[p-1].size();
	for(int k=0;k<l;k++)
		a[k]=str1[p-1][k];
	int c=0;
	 if(str1[0]!="."&&str1[0]!=".."){
		for(int k=0;k<p-1;k++){
			char a1[252];
			memset(a1,0,sizeof(a1));
			l=str1[k].size();
		    for(int q=0;q<l;q++)
				a1[q]=str1[k][q];
		    c= finddw(c,a1);
			if(c==-1){
				cout<<"mistake"<<endl;
				return;
			}
		}
	x1=c;
	}else {
		c=x2;
		for(int k=0;k<p-1;k++){
			char a1[2];
			memset(a1,0,sizeof(a1));
			l=str1[k].size();
		    for(int q=0;q<l;q++)
				a1[q]=str1[k][q];
			if(str1[k]=="..")
				c=findup(c);
			else if(str1[k]!=".")
				c=finddw(c,a1);
			if(c==-1){
				cout<<"mistake"<<endl;
				return;
			}
		}x1=c;
	}	
	int i;
	bool t1=0;
	for(int k=2;k<16;k++){
		if(strcmp(db[x1].dirs[k].name,a)==0){cout<<a<<" already exist."<<endl;return;}
	}for(int k=2;k<16;k++)
	if(db[x1].dirs[k].inode_id==0){ t1=1;i=k;break;}
	if(t1){
		for(int k=1;k<4096;k++)
			if(sup.inode_bitmap[k]==0){
				n=k;
				sup.block_bitmap[k]=1;
				sup.inode_bitmap[k]=1;
				fout.seekp(k,ios::beg);
				fout.write((char*)&sup.inode_bitmap[k],1);
				fout.seekp(k+4096,ios::beg);
				fout.write((char*)&sup.block_bitmap[k],1);
				break;
			}
		db[x1].dirs[i].inode_id=n;
	    strcpy(db[x1].dirs[i].name,a);
	    node[n].i_id=n;
	    node[n].i_mode=2;
		node[n].i_file_size=16;
	    node[n].i_blocks[0]=x1;
		db[n].dirs[0].inode_id=n;
		db[n].dirs[0].name[0]='.';
		db[n].dirs[1].inode_id=x1;
		db[n].dirs[1].name[0]='.';
		db[n].dirs[1].name[1]='.';
		fout.seekp(byte+x1*4096+i*256,ios::beg);
		fout.write((char*)db[x1].dirs[i].name,252);
		fout.write((char*)&db[x1].dirs[i].inode_id,4);
		fout.seekp(byte+n*4096,ios::beg);
		fout.write((char*)db[n].dirs[0].name,252);
		fout.write((char*)&db[n].dirs[0].inode_id,4);
		fout.write((char*)db[n].dirs[1].name,252);
		fout.write((char*)&db[n].dirs[1].inode_id,4);
	fout.seekp(4096*2+32*n,ios::beg);
	fout.write((char*)&node[n].i_id,4);
	fout.write((char*)&node[n].i_mode,4);
	fout.write((char*)&node[n].i_file_size,4);
	fout.write((char*)&node[n].i_blocks[0],4);
	}else {
		cout<<"directory entry is full"<<endl;
	}
}


void pwd(int x1){                  //查看当前目录,n为当前目录编号 
	int a1[4096],kt;
	memset(a1,0,sizeof(a1));
	a1[0]=x1;
	for(int k=1;;k++){
		if(a1[k-1]==0){kt=k-1;break;}
		else a1[k]=findup(a1[k-1]);
	}

	for(int i=kt;i>0;i--)
	for(int t=0;t<16;t++)
	if(db[a1[i]].dirs[t].inode_id==a1[i-1])
	cout<<"/"<<db[a1[i]].dirs[t].name;
	cout<<endl;
}
//查看文件data
void cat(int x2,vector<string> str){
	int x1;
	char b[252];                             //b储存文件名
	memset(b,0,sizeof(b));
	vector<string> str1=split(str[1],'/');
	int p=str1.size();
	int l=str1[p-1].size();
	for(int k=0;k<l;k++)
		b[k]=str1[p-1][k];
	int c=0;
	if(str1[0]!="."&&str1[0]!=".."){
		for(int k=0;k<p-1;k++){
			char a1[252];
			memset(a1,0,sizeof(a1));
			l=str1[k].size();
		    for(int q=0;q<l;q++)
				a1[q]=str1[k][q];
		    c= finddw(c,a1);
			if(c==-1){
				cout<<"mistake"<<endl;
				return;
			}
		}
	x1=c;
	}
	else {c=x2;
		for(int k=0;k<p-1;k++){
			char a1[20];
			memset(a1,0,sizeof(a1));
			l=str1[k].size();
		    for(int q=0;q<l;q++)
				a1[q]=str1[k][q];
			if(str1[k]=="..")
				c=findup(c);
			else if(str1[k]!=".")
				c=finddw(c,a1);
			if(c==-1){
				cout<<"mistake"<<endl;
				return;
			}
		}x1=c;
	}for(int k=2;k<16;k++){
		if(strcmp(db[x1].dirs[k].name,b)==0&&node[db[x1].dirs[k].inode_id].i_mode==1){
			cout<<fb[db[x1].dirs[k].inode_id].data<<endl;
			return;
		}
		if(strcmp(db[x1].dirs[k].name,b)==0&&node[db[x1].dirs[k].inode_id].i_mode==2){
		   cout<<b<< " is a directory, not a document"<<endl;
		   return;
	}
	}cout<<"no such file"<<endl;
}
//切换当前目录
void cd(int &x1,vector<string> str){
	int x2=x1;
	vector<string> str1=split(str[1],'/');
	int p=str1.size(),l;
	int c=0;
	if(p==0){x1=0;return;}
	if(str1[0]!="."&&str1[0]!=".."){
		for(int k=0;k<p;k++){
			char a1[252];
			memset(a1,0,sizeof(a1));
			l=str1[k].size();
		    for(int q=0;q<l;q++)
				a1[q]=str1[k][q];
		    c= finddw(c,a1);
			if(c==-1){
				cout<<"mistake"<<endl;
				return;
			}
		}
	x2=c;
	}else {c=x2;
		for(int k=0;k<p;k++){
			char a1[20];
			memset(a1,0,sizeof(a1));
			l=str1[k].size();
		    for(int q=0;q<l;q++)
					a1[q]=str1[k][q];
			if(str1[k]=="..")
				c=findup(c);
			else if(str1[k]!=".")
				c=finddw(c,a1);
			if(c==-1){
				cout<<"mistake"<<endl;
				return;
			}
		}x2=c;
	}x1=c;
}

void ls(int x2,vector<string> str){
	int x1;
	char b[252];                             //b储存文件名或目录名
	memset(b,0,sizeof(b));
	vector<string> str1=split(str[1],'/');
	int p=str1.size();
	if(p==0){x1=0;
	for(int i=2;i<16;i++)
		if((db[x1].dirs[i].inode_id)!=0)
			cout<<db[x1].dirs[i].name<<endl;
	return;}
	int l;
	l=str1[p-1].size();
	for(int k=0;k<l;k++)
		b[k]=str1[p-1][k];
	int c=0;
	if(str1[0]!="."&&str1[0]!=".."){
		for(int k=0;k<p-1;k++){
			char a1[252];
			memset(a1,0,sizeof(a1));
			l=str1[k].size();
		    for(int q=0;q<l;q++)
				a1[q]=str1[k][q];
		    c= finddw(c,a1);
			if(c==-1){
				cout<<"mistake"<<endl;
				return;
			}
		}x1=c;
	
	}else {c=x2;
		for(int k=0;k<p-1;k++){
			char a1[252];
			memset(a1,0,sizeof(a1));
			l=str1[k].size();
		    for(int q=0;q<l;q++)
				a1[q]=str1[k][q];
			if(str1[k]=="..")
				c=findup(c);
			else if(str1[k]!=".")
				c=finddw(c,a1);
			if(c==-1){
				cout<<"mistake"<<endl;
				return;
			}
		}x1=c;
	}
	

	
	for(int k=0;k<16;k++){
		if(strcmp(db[x1].dirs[k].name,b)==0&&node[db[x1].dirs[k].inode_id].i_mode==1){
			if(str1[0]!="."&&str1[0]!=".."){
				for(int i=0;i<p-1;i++)
					cout<<"/"<<str1[i];
				cout<<endl;
				}
			else {
				int a1[100];
				memset(a1,0,sizeof(a1));
				a1[0]=x1;
				for(int kt=1;;kt++){
					a1[kt]=findup(a1[kt-1]);
					if(a1[kt]==0){
						for(int i=kt;i>0;i--){
							for(int t=0;t<16;t++)
								if(db[a1[i]].dirs[t].inode_id==a1[i-1]){
									cout<<"/"<<db[a1[i]].dirs[t].name;
									break;
								}
						}
				}				
				}cout<<endl;return;
			}
		}else if(strcmp(db[x1].dirs[k].name,b)==0&&node[db[x1].dirs[k].inode_id].i_mode==2){
				char a1[252];
			memset(a1,0,sizeof(a1));
			l=str1[p-1].size();
		    for(int q=0;q<l;q++)
				a1[q]=str1[p-1][q];
			if(str1[p-1]=="..")
				x1=findup(x1);
			else if(str1[p-1]!=".")
				x1=finddw(x1,a1);
			if(x1==-1){
				cout<<"mistake"<<endl;
				return;}
				for(int i=2;i<16;i++)
					if(db[x1].dirs[i].inode_id!=0)
			cout<<db[x1].dirs[i].name<<endl;
	        return;
		}
	}
}

void rmdir0(int x1){
			db[x1].dirs[0].inode_id=0;
			memset(db[x1].dirs[0].name,0,sizeof(db[x1].dirs[0].name));
			db[x1].dirs[1].inode_id=0;
			memset(db[x1].dirs[1].name,0,sizeof(db[x1].dirs[1].name));
		fout.seekp(byte+x1*4096,ios::beg);
		fout.write((char*)db[x1].dirs[0].name,252);
		fout.write((char*)&db[x1].dirs[0].inode_id,4);
		fout.seekp(byte+n*4096+256,ios::beg);
		fout.write((char*)db[x1].dirs[1].name,252);
		fout.write((char*)&db[x1].dirs[1].inode_id,4);
     for(int i=2;i<16;i++){
		if(node[db[x1].dirs[i].inode_id].i_mode==1){
			node[db[x1].dirs[i].inode_id].i_blocks[0]=0;
			node[db[x1].dirs[i].inode_id].i_file_size=0;
			node[db[x1].dirs[i].inode_id].i_id=0;
			node[db[x1].dirs[i].inode_id].i_mode=0;
			fout.seekp(4096*2+db[x1].dirs[i].inode_id*32,ios::beg);
			fout.write((char*)&node[db[x1].dirs[i].inode_id].i_id,4);
	        fout.write((char*)&node[db[x1].dirs[i].inode_id].i_mode,4);
	        fout.write((char*)&node[db[x1].dirs[i].inode_id].i_file_size,4);
	        fout.write((char*)&node[db[x1].dirs[i].inode_id].i_blocks[0],4);

			sup.block_bitmap[db[x1].dirs[i].inode_id]=0;
			sup.inode_bitmap[db[x1].dirs[i].inode_id]=0;
			fout.seekp(db[x1].dirs[i].inode_id,ios::beg);
			fout.write((char*)&sup.inode_bitmap[db[x1].dirs[i].inode_id],1);
			fout.seekp(db[x1].dirs[i].inode_id+4096,ios::beg);
			fout.write((char*)&sup.block_bitmap[db[x1].dirs[i].inode_id],1);

			memset(fb[db[x1].dirs[i].inode_id].data,0,sizeof(fb[db[x1].dirs[i].inode_id].data));
			db[x1].dirs[i].inode_id=0;
			memset(db[x1].dirs[i].name,0,sizeof(db[x1].dirs[i].name));
			fout.seekp(byte+db[x1].dirs[i].inode_id*4096,ios::beg);
			fout.write((char*)fb[db[x1].dirs[i].inode_id].data,sizeof(fb[db[x1].dirs[i].inode_id].data));

			fout.seekp(byte+x1*4096+i*252,ios::beg);
	        fout.write((char*)db[x1].dirs[db[x1].dirs[i].inode_id].name,sizeof(db[x1].dirs[db[x1].dirs[i].inode_id].name));
	        fout.write((char*)&db[x1].dirs[db[x1].dirs[i].inode_id].inode_id,4);

		}else if(node[db[x1].dirs[i].inode_id].i_mode==2&&node[db[x1].dirs[i].inode_id].i_id!=0){
			rmdir0(db[x1].dirs[i].inode_id);
			node[db[x1].dirs[i].inode_id].i_blocks[0]=0;
			node[db[x1].dirs[i].inode_id].i_file_size=0;
			node[db[x1].dirs[i].inode_id].i_id=0;
			node[db[x1].dirs[i].inode_id].i_mode=0;
			fout.seekp(4096*2+db[x1].dirs[i].inode_id*32,ios::beg);
			fout.write((char*)&node[db[x1].dirs[i].inode_id].i_id,4);
	        fout.write((char*)&node[db[x1].dirs[i].inode_id].i_mode,4);
	        fout.write((char*)&node[db[x1].dirs[i].inode_id].i_file_size,4);
	        fout.write((char*)&node[db[x1].dirs[i].inode_id].i_blocks[0],4);


			sup.block_bitmap[db[x1].dirs[i].inode_id]=0;
			sup.inode_bitmap[db[x1].dirs[i].inode_id]=0;
			fout.seekp(db[x1].dirs[i].inode_id,ios::beg);
			fout.write((char*)&sup.inode_bitmap[db[x1].dirs[i].inode_id],1);
			fout.seekp(db[x1].dirs[i].inode_id+4096,ios::beg);
			fout.write((char*)&sup.block_bitmap[db[x1].dirs[i].inode_id],1);


			db[x1].dirs[i].inode_id=0;
			memset(db[x1].dirs[i].name,0,sizeof(db[x1].dirs[i].name));
			fout.seekp(byte+db[x1].dirs[i].inode_id*4096,ios::beg);
			fout.write((char*)fb[db[x1].dirs[i].inode_id].data,sizeof(fb[db[x1].dirs[i].inode_id].data));
		}
	 }
}
//删除目录
void rmdir(int x2,vector<string> str){
	int x1;
	char b[252];                             //b储存删除的目录名
	memset(b,0,sizeof(b));
	vector<string> str1=split(str[1],'/');
	int p=str1.size();
	int l=str1[p-1].size();
	for(int k=0;k<l;k++)
		b[k]=str1[p-1][k];
	int c=0;
	if(p==0)x1=0;
	else if(str1[0]!="."&&str1[0]!=".."){
		for(int k=0;k<p;k++){
			char a1[20];
			memset(a1,0,sizeof(a1));
			l=str1[k].size();
		    for(int q=0;q<l;q++)
				a1[q]=str1[k][q];
		    c= finddw(c,a1);
			if(c==-1){
				cout<<"mistake"<<endl;
				return;
			}
		}
	x1=c;
	}else {c=x2;
		for(int k=0;k<p;k++){
			char a1[20];
			memset(a1,0,sizeof(a1));
			l=str1[k].size();
		    for(int q=0;q<l;q++)
				a1[q]=str1[k][q];
			if(str1[k]=="..")
				c=findup(c);
			else if(str1[k]!=".")
				c=finddw(c,a1);
			if(c==-1){
				cout<<"mistake"<<endl;
				return;
			}
		}x1=c;
	}
for(int i=x2;i!=0;){
	if(i==x1){cout<<"mistake"<<endl;return;}
	i=findup(i);
}
	rmdir0(x1);
	for(int i=2;i<16;i++)
		if(db[node[x1].i_blocks[0]].dirs[i].inode_id==x1){
	db[node[x1].i_blocks[0]].dirs[i].inode_id=0;
	memset(db[node[x1].i_blocks[0]].dirs[i].name,0,sizeof(db[node[x1].i_blocks[0]].dirs[i].name));
	fout.seekp(byte+node[x1].i_blocks[0]*4096+i*256,ios::beg);
	fout.write((char*)db[node[x1].i_blocks[0]].dirs[i].name,sizeof((char*)db[node[x1].i_blocks[0]].dirs[i].name));
	fout.write((char*)&db[node[x1].i_blocks[0]].dirs[i].inode_id,4);
	break;
	}
	node[x1].i_blocks[0]=0;
	node[x1].i_file_size=0;
	node[x1].i_id=0;
	node[x1].i_mode=0;
	fout.seekp(4096*2+32*x1,ios::beg);
	fout.write((char*)&node[x1].i_id,4);
	fout.write((char*)&node[x1].i_mode,4);
	fout.write((char*)&node[x1].i_file_size,4);
	fout.write((char*)&node[x1].i_blocks[0],4);

	sup.block_bitmap[x1]=0;
	sup.inode_bitmap[x1]=0;
	fout.seekp(x1,ios::beg);
	fout.write((char*)&sup.inode_bitmap[x1],1);
	fout.seekp(x1+4096,ios::beg);
	fout.write((char*)&sup.block_bitmap[x1],1);
	//写入文件
}
//删除文件
void rm(int x2,vector<string> str){
	int x1;
	char b[252];                             //b储存文件名
	memset(b,0,sizeof(b));
	vector<string> str1=split(str[1],'/');
	int p=str1.size();
	int l=str1[p-1].size();
	for(int k=0;k<l;k++)
		b[k]=str1[p-1][k];
	int c=0;
      if(str1[0]!="."&&str1[0]!=".."){
		for(int k=0;k<p-1;k++){
			char a1[252];
			memset(a1,0,sizeof(a1));
			l=str1[k].size();
		    for(int q=0;q<l;q++)
				a1[q]=str1[k][q];
		    c= finddw(c,a1);
			if(c==-1){
				cout<<"mistake"<<endl;
				return;
			}
		}
	x1=c;
	}else {c=x2;
		for(int k=0;k<p-1;k++){
			char a1[20];
			memset(a1,0,sizeof(a1));
			l=str1[k].size();
		    for(int q=0;q<l;q++)
				a1[q]=str1[k][q];
			if(str1[k]=="..")
				c=findup(c);
			else if(str1[k]!=".")
				c=finddw(c,a1);
			if(c==-1){
				cout<<"mistake"<<endl;
				return;
			}
		}x1=c;
	}
	for(int k=2;k<16;k++){
			if(strcmp(db[x1].dirs[k].name,b)==0&&node[db[x1].dirs[k].inode_id].i_mode==2){
		     cout<<b<< " is a directory, not a document"<<endl;
		      return;
	    }
		if(strcmp(db[x1].dirs[k].name,b)==0&&node[db[x1].dirs[k].inode_id].i_mode==1){
			int id=db[x1].dirs[k].inode_id;
			
			
			node[id].i_id=0;
			node[id].i_mode=0;
			node[id].i_blocks[0]=0;
			node[id].i_file_size=0;
			fout.seekp(4096*2+id*32,ios::beg);
			fout.write((char*)&node[id].i_id,4);
	        fout.write((char*)&node[id].i_mode,4);
	        fout.write((char*)&node[id].i_file_size,4);
	        fout.write((char*)&node[id].i_blocks[0],4);
			
			
			sup.block_bitmap[id]=0;
			sup.inode_bitmap[id]=0;
			fout.seekp(id,ios::beg);
			fout.write((char*)&sup.inode_bitmap[id],1);
			fout.seekp(id+4096,ios::beg);
			fout.write((char*)&sup.block_bitmap[id],1);

			memset(fb[id].data,0,4096);
			fout.seekp(byte+id*4096,ios::beg);
			fout.write((char*)fb[id].data,sizeof(fb[id].data));
			db[x1].dirs[k].inode_id=0;
			memset(db[x1].dirs[k].name,0,sizeof(db[x1].dirs[k].name));
			fout.seekp(byte+x1*4096+k*256,ios::beg);
	        fout.write((char*)db[x1].dirs[k].name,sizeof(db[x1].dirs[k].name));
	        fout.write((char*)&db[x1].dirs[k].inode_id,4);
			return;
			//输入文件中
       }
	}cout<<"document does not exist"<<endl;
}
//move函数，移动文件或文件夹，输入1.文件或文件夹的路径，2.移入的目录；
void move(int x2,vector<string> str){
	int x1;
	char b[252];                             //b储存文件名或目录名
	memset(b,0,sizeof(b));
	vector<string> str1=split(str[1],'/');
	vector<string> str2=split(str[2],'/');
	int p=str1.size();
	int l;
	l=str1[p-1].size();
	for(int k=0;k<l;k++)
		b[k]=str1[p-1][k];
	int c=0;
	if(str1[0]!="."&&str1[0]!=".."){
		for(int k=0;k<p-1;k++){
			char a1[252];
			memset(a1,0,sizeof(a1));
			l=str1[k].size();
		    for(int q=0;q<l;q++)
				a1[q]=str1[k][q];
		    c= finddw(c,a1);
			if(c==-1){
				cout<<"mistake"<<endl;
				return;
			}
		}x1=c;
	
	}else {c=x2;
		for(int k=0;k<p-1;k++){
			char a1[252];
			memset(a1,0,sizeof(a1));
			l=str1[k].size();
		    for(int q=0;q<l;q++)
				a1[q]=str1[k][q];
			if(str1[k]=="..")
				c=findup(c);
			else if(str1[k]!=".")
				c=finddw(c,a1);
			if(c==-1){
				cout<<"mistake"<<endl;
				return;
			}
		}x1=c;
	}
	int x3;
	char b1[252];
	memset(b1,0,sizeof(b1));
	int p1=str2.size();
	int l0;
	l0=str2[p1-1].size();
	for(int k=0;k<l0;k++)
		b1[k]=str2[p1-1][k];
	c=0;
	if(str2[0]!="."&&str2[0]!=".."){
		for(int k=0;k<p1;k++){
			char a1[252];
			memset(a1,0,sizeof(a1));
			l0=str2[k].size();
		    for(int q=0;q<l0;q++)
				a1[q]=str2[k][q];
		    c= finddw(c,a1);
			if(c==-1){
				cout<<"mistake"<<endl;
				return;
			}
		}x3=c;
	
	}else {c=x2;
		for(int k=0;k<p1;k++){
			char a1[252];
			memset(a1,0,sizeof(a1));
			l0=str2[k].size();
		    for(int q=0;q<l0;q++)
				a1[q]=str2[k][q];
			if(str1[k]=="..")
				c=findup(c);
			else if(str2[k]!=".")
				c=finddw(c,a1);
			if(c==-1){
				cout<<"mistake"<<endl;
				return;
			}
		}x3=c;
	}
	for(int k=0;k<16;k++){
		if(strcmp(db[x1].dirs[k].name,b)==0){
			for(int i=2;i<16;i++)if(strcmp(db[x3].dirs[i].name,db[x1].dirs[k].name)==0){cout<<"document is already exist"<<endl;return;}
			for(int i=2;i<16;i++)
				if(db[x3].dirs[i].inode_id==0){
					if(node[db[x1].dirs[k].inode_id].i_mode==2)
						for(int t=x3;t!=0;){
							if(t==db[x1].dirs[k].inode_id){cout<<"mistake"<<endl;return;}
							t=findup(t);}
					db[x3].dirs[i].inode_id=db[x1].dirs[k].inode_id;
					strcpy(db[x3].dirs[i].name,db[x1].dirs[k].name);
					node[db[x3].dirs[i].inode_id].i_blocks[0]=x3;
					db[x1].dirs[k].inode_id=0;
					memset(db[x1].dirs[k].name,0,sizeof(db[x1].dirs[k].name));

			        fout.seekp(4096*2+db[x3].dirs[i].inode_id*32,ios::beg);
			        fout.write((char*)&node[db[x3].dirs[i].inode_id].i_id,4);
	                fout.write((char*)&node[db[x3].dirs[i].inode_id].i_mode,4);
	                fout.write((char*)&node[db[x3].dirs[i].inode_id].i_file_size,4);
	                fout.write((char*)&node[db[x3].dirs[i].inode_id].i_blocks[0],4);

					fout.seekp(byte+x1*4096+k*256,ios::beg);
	                fout.write((char*)db[x1].dirs[k].name,sizeof(db[x1].dirs[k].name));
	                fout.write((char*)&db[x1].dirs[k].inode_id,4);
					fout.seekp(byte+x3*4096+i*256,ios::beg);
	                fout.write((char*)db[x3].dirs[i].name,sizeof(db[x1].dirs[k].name));
	                fout.write((char*)&db[x3].dirs[i].inode_id,4);
					return;
				}
		}
}cout<<b<<" doesn't exist"<<endl;
}
int main(){
	void out();
	memset(node,0,sizeof(node));
	memset(fb,0,sizeof(fb));
	memset(db,0,sizeof(db));
	memset(sup.block_bitmap,0,sizeof(sup.block_bitmap));
	memset(sup.inode_bitmap,0,sizeof(sup.inode_bitmap));
	ifstream fin("start",ios::binary);
	if(!fin) {   
		cout<<"fin unsuccessful"<<endl;
		ini();
		return 0;
	}
	fin.read((char*)&sup.inode_bitmap,sizeof(sup.inode_bitmap));   //读取文件系统状态 
	fin.read((char*)&sup.block_bitmap,sizeof(sup.block_bitmap));
	fin.read((char*)&node,sizeof(node));
	for(int i=0;i<4096;++i){
		if(node[i].i_mode==0||node[i].i_mode==2){
			fin.read((char*)&db[i],sizeof(db[i]));
		}
		else fin.read((char*)&fb[i],sizeof(fb[i]));
	} //读入完毕
	//防止清空
	fout.open("start",ios::binary);
	fout.write((char*)&sup.inode_bitmap,sizeof(sup.inode_bitmap));  
	fout.write((char*)&sup.block_bitmap,sizeof(sup.block_bitmap));
	fout.write((char*)&node,sizeof(node));
	for(int i=0;i<4096;++i){
		if(node[i].i_mode==0||node[i].i_mode==2){
			fout.write((char*)&db[i],sizeof(db[i]));
		}
		else fout.write((char*)&fb[i],sizeof(fb[i]));
	}	
	for(;;){  //输入命令，当输入exit时结束 
		cout<<">>"; 
		string in;
		if(!getline(cin, in)) break;
		vector<string> cmd = split(in, ' ');
		if(cmd[0] == "pwd"){
			if(cmd.size()!=1) cout<<""<<endl; 
			else pwd(x);
		} 
		
		else if(cmd[0]=="mkdir"){
			if(cmd.size()!=2) cout<<"read error"<<endl;
			else mkdir(x,cmd);
		}
		else if(cmd[0]=="ls"){
			if(cmd.size()!=2) cout<<"read error"<<endl;
			else ls(x,cmd);
		}
		else if(cmd[0]=="rmdir"){
			if(cmd.size()!=2) cout<<"read error"<<endl;
			else rmdir(x,cmd);
		}
		else if(cmd[0]=="echo"){
			if(cmd.size()!=3) cout<<"read error"<<endl;
			else echo(x,cmd);
		}
		else if(cmd[0]=="cat"){
			if(cmd.size()!=2) cout<<"read error"<<endl;
			else cat(x,cmd);
		}
		else if(cmd[0]=="rm"){
			if(cmd.size()!=2) cout<<"read error"<<endl;
			else rm(x,cmd);
		}	
		else if(cmd[0] == "cd") {
			if(cmd.size()!=2) cout<<"read error"<<endl;
			else cd(x,cmd);
		} 
		else if(cmd[0]=="ini"){
			if(cmd.size()!=1)cout<<"read error"<<endl;
			else ini();
		}
		else if(cmd[0]=="move"){
			if(cmd.size()!=3)cout<<"read error"<<endl;
			else move(x,cmd);	
		}
		else if(cmd[0]=="exit")break;

		else puts("command error"); 
	}
	//结束时写回文件 

	return 0;
}
