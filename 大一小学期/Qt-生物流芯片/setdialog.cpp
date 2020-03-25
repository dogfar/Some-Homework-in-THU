#include "setdialog.h"
#include "mainwindow.h"

#include <QDialog>
#include <QObject>
#include <QLineEdit>
#include <QLabel>
#include <QLayout>
#include <QPushButton>
#include <QValidator>
#include <QMessageBox>
#include <QString>

setdialog::setdialog(){
    setWindowTitle("Setting");
    setFixedSize(420,420);
    button->setText("OK");
    numLineEdit->setValidator(numvalidator);
    connect(button,SIGNAL(clicked(bool)),this,SLOT(IsValid()));
    QGridLayout *Layout= new QGridLayout;
    Layout->addWidget(numlabel,0,0);
    Layout->addWidget(numLineEdit,0,1);
    Layout->addWidget(fluidlabel,1,0);
    Layout->addWidget(fluidLineEdit,1,1);
    Layout->addWidget(waterlabel,2,0);
    Layout->addWidget(waterLineEdit,2,1);
    Layout->addWidget(outlabel1,3,0);
    Layout->addWidget(outLineEdit1,3,1);
    Layout->addWidget(outlabel2,4,0);
    Layout->addWidget(outLineEdit2,4,1);
    Layout->addWidget(outlabel3,5,0);
    Layout->addWidget(outLineEdit3,5,1);
    Layout->addWidget(button,6,Qt::AlignCenter);
    this->setLayout(Layout);
}
void setdialog::IsValid(){
    bool OK=true;
    QString q1=numLineEdit->text();
    QString q2=fluidLineEdit->text();
    QString q3=waterLineEdit->text();
    QString q4=outLineEdit1->text();
    QString q5=outLineEdit2->text();
    QString q6=outLineEdit3->text();
    int num=q1.toInt(),fluid=q2.toInt(),water=q3.toInt(),o1=q4.toInt(),o2=q5.toInt(),o3=q6.toInt();
    if(num<5)OK=false;
    if(fluid>=water)OK=false;
    if(o1>=o2 || o1>=o3 || o2>=o3)OK=false;
    if(fluid>=num || water>=num || o1>=num || o2 >=num || o3 >=num)OK=false;
    if(fluid<0 || water<0 || o1<0 || o2<0 || o3<0)OK=false;
    if(OK==true){
        emit draw(num,fluid,water,o1,o2,o3);
        this->close();
    }
    else{
        QMessageBox::warning(this,"ERROR!","网格大小5-8，i1<i2且o1<o2<o3",QMessageBox::Ok);
    }
}
changewidthdialog::changewidthdialog(){
    setWindowTitle("管道宽度");
    setFixedSize(300,100);
    button->setText("OK");
    widLineEdit->setValidator(numvalidator);
    connect(button,SIGNAL(clicked(bool)),this,SLOT(inputover()));
    QGridLayout *Layout=new QGridLayout;
    Layout->addWidget(widlabel,0,0);
    Layout->addWidget(widLineEdit,0,1);
    Layout->addWidget(button,1,Qt::AlignCenter);
    this->setLayout(Layout);
}
void changewidthdialog::inputover(){
    QString q=widLineEdit->text();
    int tmpwid=q.toInt();
    if(tmpwid<20){
        QMessageBox::warning(this,"ERROR!","宽度必须大于等于20!",QMessageBox::Ok);
    }
    else{
        emit changewid(tmpwid/20);
        this->close();
    }
}
ansdialog::ansdialog(){
    setWindowTitle("Answer");
    setFixedSize(400,300);
    button->setText("OK");
    connect(button,SIGNAL(clicked(bool)),this,SLOT(close()));
    LineEdit1->setReadOnly(true);
    LineEdit2->setReadOnly(true);
    LineEdit3->setReadOnly(true);
    QGridLayout *Layout=new QGridLayout;
    Layout->addWidget(label0,0,0);
    Layout->addWidget(label1,1,0);
    Layout->addWidget(LineEdit1,1,1);
    Layout->addWidget(label2,2,0);
    Layout->addWidget(LineEdit2,2,1);
    Layout->addWidget(label3,3,0);
    Layout->addWidget(LineEdit3,3,1);
    Layout->addWidget(button,4,Qt::AlignCenter);
    this->setLayout(Layout);
}
