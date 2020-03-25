#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "pipe.h"
#include <QPushButton>
#include <QObject>
#include <QString>
#include <QtGlobal>
#include <QTime>
#include <QMenu>
#include <QAction>
#include <QDebug>
#include <QMessageBox>
#include <QIcon>
#include "algori.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    QIcon icon("D:/qaq.jpg");
    setFixedSize(900,900);
    setWindowTitle("QtMFS");
    setWindowIcon(icon);
    QMenuBar *menuB=menuBar();
    QMenu *settingmenu=new QMenu(tr("Setting"),this);
    menuB->addMenu(settingmenu);
    QAction *setaction=new QAction("Setting...",this);
    setaction->setShortcut(QKeySequence::Save);
    settingmenu->addAction(setaction);
    connect(setaction,SIGNAL(triggered(bool)),this,SLOT(on_pushButton_clicked()));
    QMenu *randommenu= new QMenu(tr("random"),this);
    menuB->addMenu(randommenu);
    QAction *ranaction=new QAction("randompipe",this);
    ranaction->setShortcut(QKeySequence::Open);
    randommenu->addAction(ranaction);
    connect(ranaction,SIGNAL(triggered(bool)),this,SLOT(on_pushButton_2_clicked(bool)));
    QMenu *Calmenu=new QMenu(tr("Calculate"),this);
    menuB->addMenu(Calmenu);
    QAction *calaction=new QAction("Calculate",this);
    calaction->setShortcut(QKeySequence::Back);
    Calmenu->addAction(calaction);
    connect(calaction,SIGNAL(triggered(bool)),this,SLOT(calculate()));
}
void MainWindow::setnum(int n){
    num=n;
}
void MainWindow::setcenter(){
    for(int i=0;i<num;i++){
        for(int j=0;j<num;j++){
            centerin* p_c=new centerin(this);
            p_c->setGeometry(150+80*j,150+i*80,10,10);
            p_c->x=i,p_c->y=j;
            p_cen.push_back(p_c);
            p_c->show();
        }
    }
}
void MainWindow::Initpipe(){
    for(int i=0;i<num*num-num;i++){
        pipehgt* p=new pipehgt(i,this);
        p_hgts.push_back(p);
    }
    for(int i=num*num-num;i<2*num*num-2*num;i++){
        pipewid* p=new pipewid(i,this);
        p_wids.push_back(p);
    }
}
void MainWindow::drawother(int v1, int v2, int o1, int o2, int o3){
    int ind[5]={v1,v2,o1,o2,o3};
    for(int i=0;i<=4;i++){
        pipehgt *p=new pipehgt(ind[i],this);
        p->Ifinp=true;
        p_inps.push_back(p);
    }
    for(int i=0;i<2;i++){
        int tmp=p_inps[i]->index;
        p_inps[i]->setGeometry(150+tmp*80,70,10,90);
        p_inps[i]->startx=150+tmp*80;
        p_inps[i]->starty=70;
        p_inps[i]->show();
    }
    for(int i=2;i<=4;i++){
        int tmp=p_inps[i]->index;
        p_inps[i]->setGeometry(150+tmp*80,150+(num-1)*80,10,90);
        p_inps[i]->startx=150+tmp*80;
        p_inps[i]->starty=150+(num-1)*80;
        p_inps[i]->show();
    }
}
void MainWindow::Releasepipe(){
    for(int i=0;i<p_hgts.size();i++){
        if(p_hgts[i]!=NULL){
            delete p_hgts[i];
            p_hgts[i]=NULL;
        }
    }
    p_hgts.clear();
    for(int i=0;i<p_wids.size();i++){
        if(p_wids[i]!=NULL){
            delete p_wids[i];
            p_wids[i]=NULL;
        }
    }
    p_wids.clear();
    for(int i=0;i<p_inps.size();i++){
        if(p_inps[i]!=NULL){
            delete p_inps[i];
            p_inps[i]=NULL;
        }
    }
    p_inps.clear();
    for(int i=0;i<p_cen.size();i++){
        if(p_cen[i]!=NULL){
            delete p_cen[i];
            p_cen[i]=NULL;
        }
    }
    p_cen.clear();
    Ifset=false;
}
void MainWindow::setButton(){
    Initpipe();
    for(int i=0;i<p_hgts.size();i++){
        int tmp=p_hgts[i]->index;
        p_hgts[i]->setGeometry(150+(tmp/(num-1))*80,150+(tmp%(num-1))*80,10,90);
        p_hgts[i]->startx=150+(tmp/(num-1))*80;
        p_hgts[i]->starty=150+(tmp%(num-1))*80;
        p_hgts[i]->show();
    }
    for(int i=0;i<p_wids.size();i++){
        int tmp=p_wids[i]->index;
        tmp=tmp-num*num+num;
        p_wids[i]->setGeometry(150+(tmp/(num))*80,150+(tmp%(num))*80,90,10);
        p_wids[i]->startx=150+(tmp/(num))*80;
        p_wids[i]->starty=150+(tmp%(num))*80;
        p_wids[i]->show();
    }
    Ifset=true;
}
void MainWindow::setn(int n,int v1,int v2,int o1,int o2,int o3){
    Releasepipe();
    setnum(n);
    setButton();
    drawother(v1,v2,o1,o2,o3);
    setcenter();
}
MainWindow::~MainWindow()
{
    delete ui;
}
void MainWindow::on_pushButton_clicked()
{
    setdl=new setdialog();
    setdl->setModal(true);
    connect(setdl,SIGNAL(draw(int,int,int,int,int,int)),this,SLOT(setn(int,int,int,int,int,int)));
    setdl->show();
}

void MainWindow::on_pushButton_2_clicked(bool checked)
{
    if(Ifset==false){
        QMessageBox::warning(this,"ERROR!","请先设置管道!",QMessageBox::Ok);
        return;
    }
    qsrand(QTime(0,0,0).secsTo(QTime::currentTime()));
    for(int i=0;i<p_hgts.size();i++){
        if(p_hgts[i]->Ifhide==true)p_hgts[i]->setitflat();
        int tmp=qrand();
        if(tmp%10==0)p_hgts[i]->setitflat();
    }
    for(int i=0;i<p_wids.size();i++){
        if(p_wids[i]->Ifhide==true)p_hgts[i]->setitflat();
        int tmp=qrand();
        if(tmp%10==0)p_wids[i]->setitflat();
    }
}
void MainWindow::calculate(){
    if(Ifset==false){
        QMessageBox::warning(this,"ERROR!","请先设置管道!",QMessageBox::Ok);
        return;
    }
    ansdl=new ansdialog();
    ansdl->setModal(true);
    int n=num;
    std::vector <double> Q;
    for(int i=0;i<p_hgts.size();i++){
        if(p_hgts[i]->Ifhide==true)Q.push_back(0);
        else {
            double t=10.00000/p_hgts[i]->wid;
            Q.push_back(t);
        }
    }
    for(int i=0;i<p_wids.size();i++){
        if(p_wids[i]->Ifhide==true)Q.push_back(0);
        else {
            double t=10.00000/p_wids[i]->wid;
            Q.push_back(t);
        }
    }
    for(int i=0;i<=4;i++){
        Q.push_back(1);
    }
    int v1=p_inps[0]->index;
    int v2=p_inps[1]->index;
    int o1=p_inps[2]->index;
    int o2=p_inps[3]->index;
    int o3=p_inps[4]->index;
    std::vector <double> ans=caluconspeed(n,Q,v1,v2,o1,o2,o3);
    QString s1=QString::number(ans[0],10,3);
    QString s2=QString::number(ans[1],10,3);
    QString s3=QString::number(ans[2],10,3);
    ansdl->LineEdit1->setText(s1);
    ansdl->LineEdit2->setText(s2);
    ansdl->LineEdit3->setText(s3);
    ansdl->show();
}
