#include <iostream>
#include <cstring>
#include <cstdio>
using namespace std;

struct Student {
    int   id;           // ѧ��
    char  name[11];     // ����
    char  dept[24];     // Ժϵ
    char  group[10];    // �༶
    char  type[10];     // ���
    char  email[40];    // ����
    long long cell;     // �ֻ�
};

struct LinkNode {
    LinkNode * next;
    LinkNode * prev;
    Student  * stu;
};

// ��ʼ��������β�ڱ���˫������
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

// ��������Ҫ�󰴰༶�����ȶ�����
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
	LinkNode *space = new LinkNode;//�洢Ҫ�Ƚϵ�����
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

// �������ݣ��γ�����
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

// ��������е�����
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

// �ͷ�����
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
    LinkNode * phead = initLinkedList(); // ��ʼ������
    readStructsIntoList(phead);          // ���ļ�roster.txt�ж�ȡ����
    insertionSort(phead);                // ��������
    writeListIntoStructs(phead);         // �������Ľ��д���ļ�roster_sorted.txt�У���ʽͬroster.txt
    releaseLinkList(phead);              // �ͷ�����
	return 0;
}
