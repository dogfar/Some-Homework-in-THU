#include "item.h"

Item::Item(ITEM_TYPE t, ITEM_COLOR c, QPoint p){
    c_type=t;
    c_color=c;
    c_p=p;
    Isshow=true;
}
Item::~Item(){

}
clientdialog::clientdialog(QWidget *parent):QDialog(parent){
    l1=new QLabel("请输入IP地址: ");
    le1=new QLineEdit();
    le2=new QLineEdit();
    l3=new QLabel("端口号: ");
    l2=new QLabel("等待连接...");
    l2->setHidden(true);
    pbok=new QPushButton("OK");
    pbcancel=new QPushButton("Cancel");
    connect(pbok,SIGNAL(clicked(bool)),this,SLOT(IsValid()));
    connect(pbcancel,SIGNAL(clicked(bool)),this,SLOT(close()));
    QGridLayout *layout=new QGridLayout;
    layout->addWidget(l1,0,0);
    layout->addWidget(le1,0,1);
    layout->addWidget(l3,1,0);
    layout->addWidget(le2,1,1);
    layout->addWidget(l2,2,0);
    layout->addWidget(pbok,3,Qt::AlignCenter);
    layout->addWidget(pbcancel,4,Qt::AlignCenter);
    this->setLayout(layout);
}
void clientdialog::IsValid(){
    QString s;
    QList<QHostAddress> list = QNetworkInterface::allAddresses();
    foreach (QHostAddress address,list)
    {
        if(address.protocol() == QAbstractSocket::IPv4Protocol)
        {
            s=address.toString();
            break;
        }
    }
    QString s1=le1->text();
    QString s2=le2->text();
    if(s!=s1 || s2!="8888"){
        QMessageBox::warning(this,"error!","IP地址输入不正确! ",QMessageBox::Ok);
    }
    else{
        l2->setHidden(false);
        emit connectit();
    }
}
