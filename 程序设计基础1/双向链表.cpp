#include <iostream>
#include <cstring>
#include <cstdio>
using namespace std;

struct Student {
    int   id;           // 学号
    char  name[11];     // 姓名
    char  dept[24];     // 院系
    char  group[10];    // 班级
    char  type[10];     // 类别
    char  email[40];    // 邮箱
    long long cell;     // 手机
};

struct LinkNode {
    LinkNode * next;
    LinkNode * prev;
    Student  * stu;
};

// 初始化带有首尾哨兵的双向链表
LinkNode * initLinkedList() {
    LinkNode * phead = new LinkNode;
    LinkNode * ptail = new LinkNode;

    phead->next = ptail;
    phead->prev = NULL;
    phead->stu  = NULL;

    ptail->next = NULL;
    ptail->prev = phead;
    ptail->stu  = NULL;

	return phead;
}

// 插入排序，要求按班级升序、稳定排序
void insertionSort(LinkNode * &phead) {
	for (LinkNode *now = phead-> next, *nxt; nxt = now-> next, now-> next; now = nxt) {
		for (LinkNode *tmp = phead-> next; tmp != now; tmp = tmp-> next)
			if (strcmp (tmp-> stu-> group, now-> stu-> group) > 0) {
				LinkNode *prv = tmp-> prev;
				LinkNode *nprv = now-> prev;
				LinkNode *nnxt = now-> next;
				nprv-> next = now-> next;
				nnxt-> prev = now-> prev;
				prv-> next = now;
				now-> prev = prv;
				now-> next = tmp;
				tmp-> prev = now;
				break;
			}
	}
	/*
	LinkNode *tmp=phead->next->next;
	LinkNode *space = new LinkNode;//存储要比较的数据
	for(;tmp->next;tmp=tmp->next){
		space->stu=tmp->stu;
		for(;strcmp(tmp->prev->stu->group,space->stu->group)>0;tmp->prev=tmp->prev->prev)
		if(strcmp(tmp->prev->stu->group,space->stu->group)>0){
            tmp->stu=tmp->prev->stu;
		}
		tmp->stu=space->stu;
	}
	*/
}

// 读入数据，形成链表
int readStructsIntoList(LinkNode * &phead){
	LinkNode *ta=new LinkNode;
	LinkNode *tail=phead;
    char buffer[256];
	int k=0;
	freopen("roster.txt","r",stdin);
	for(;gets(buffer);k++){
		ta= new LinkNode;
		ta->stu= new Student;
		sscanf( buffer, "%d\t%s\t%s\t%s\t%s\t%s\t%lld",
				&ta->stu->id,
				ta->stu->name,
				ta->stu->dept,
				ta->stu->group,
				ta->stu->type,
				ta->stu->email,
				&ta->stu->cell);
		ta->prev=tail;
		ta->next=tail->next;
		tail->next->prev=ta;
		tail->next=ta;
		tail=ta;
	}
	return k;
}

// 输出链表中的数据
void writeListIntoStructs(LinkNode * &phead) {
	freopen ("roster_sorted.txt", "w", stdout);
	LinkNode *ta=phead->next;
	for(;ta->next;ta=ta->next){
    printf("%d\t%s\t%s\t%s\t%s\t%s\t%lld\n",
         ta->stu->id,
         ta->stu->name,
         ta->stu->dept,
         ta->stu->group,
         ta->stu->type,
         ta->stu->email,
         ta->stu->cell);
	}
}

// 释放链表
void releaseLinkList(LinkNode * &phead) {
    LinkNode *p=NULL;
    LinkNode *q=NULL;
    p=phead;
    while(p!=NULL){
    	q=p->next;
    	delete p;
    	p=q;
	}
	phead=NULL;
}

int main(int argc, char* argv[]) {
    LinkNode * phead = initLinkedList(); // 初始化链表
    readStructsIntoList(phead);          // 从文件roster.txt中读取数据
    insertionSort(phead);                // 插入排序
    writeListIntoStructs(phead);         // 将排序后的结果写到文件roster_sorted.txt中，格式同roster.txt
    releaseLinkList(phead);              // 释放链表
	return 0;
}
