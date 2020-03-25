#include "pipe.h"
#include "setdialog.h"
#include <QDebug>

pipewid::pipewid(QWidget *parent):QPushButton(parent){
    this->setStyleSheet("QPushButton{background:blue}");
    index=-1;
    Ifhide=false;
    Ifinp=false;
    hgt=90,wid=10;
    startx=-1,starty=-1;
    connect(this,SIGNAL(clicked(bool)),this,SLOT(setitflat()));
    connect(this,SIGNAL(right()),this,SLOT(showdialog()));
}
pipewid::pipewid(int ipt,QWidget *parent):QPushButton(parent){
    this->setStyleSheet("QPushButton{background:blue}");
    index=ipt;
    Ifhide=false;
    Ifinp=false;
    hgt=90,wid=10;
    startx=-1,starty=-1;
    connect(this,SIGNAL(clicked(bool)),this,SLOT(setitflat()));
    connect(this,SIGNAL(right()),this,SLOT(showdialog()));
}
void pipewid::setitflat(){
    if(Ifhide==false){
        if(Ifinp==false){
            Ifhide=true;
            setFlat(true);
        }
    }
    else{
        Ifhide=false;
        setFlat(false);
    }
}
void pipewid::showdialog(){
    if(this->Ifhide==true)return;
    c=new changewidthdialog();
    connect(c,SIGNAL(changewid(double)),this,SLOT(redraw(double)));
    c->setModal(true);
    c->show();
}
void pipewid::mousePressEvent(QMouseEvent *e){
    if(e->button()==Qt::LeftButton){
        emit clicked();
    }
    else if(e->button()==Qt::RightButton){
        emit right();
    }
}
pipehgt::pipehgt(QWidget *parent):QPushButton(parent){
    this->setStyleSheet("QPushButton{background:blue}");
    index=-1;
    Ifhide=false;
    Ifinp=false;
    hgt=90,wid=10;
    startx=-1,starty=-1;
    connect(this,SIGNAL(clicked(bool)),this,SLOT(setitflat()));
    connect(this,SIGNAL(right()),this,SLOT(showdialog()));
}
pipehgt::pipehgt(int ipt,QWidget *parent):QPushButton(parent){
    this->setStyleSheet("QPushButton{background:blue}");
    index=ipt;
    Ifhide=false;
    Ifinp=false;
    hgt=90,wid=10;
    startx=-1,starty=-1;
    connect(this,SIGNAL(clicked(bool)),this,SLOT(setitflat()));
    connect(this,SIGNAL(right()),this,SLOT(showdialog()));
}
void pipehgt::setitflat(){
    if(Ifhide==false){
        if(Ifinp==false){
            Ifhide=true;
            setFlat(true);
        }
    }
    else{
        Ifhide=false;
        setFlat(false);
    }
}
void pipehgt::mousePressEvent(QMouseEvent *e){
    if(e->button()==Qt::LeftButton){
        emit clicked();
    }
    else if(e->button()==Qt::RightButton){
        emit right();
    }
}
void pipehgt::showdialog(){
    if(this->Ifhide==true){
        return;
    }
    c=new changewidthdialog();
    connect(c,SIGNAL(changewid(double)),this,SLOT(redraw(double)));
    c->setModal(true);
    c->show();
}
void pipewid::redraw(double tmpwid){
    this->wid=tmpwid;
    int x=this->startx,y=this->starty;
    this->setGeometry(x,y-(tmpwid-10)/2,90,tmpwid);
    this->show();
}
void pipehgt::redraw(double tmpwid){
    this->wid=tmpwid;
    int x=this->startx,y=this->starty;
    this->setGeometry(x-(tmpwid-10)/2,y,tmpwid,90);
    this->show();
}
centerin::centerin(QWidget* parent):QPushButton(parent){
    x=-1,y=-1;
}
