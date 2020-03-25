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
    l1=new QLabel("Server端IP地址: ");
    le1=new QLineEdit();
    le1->setReadOnly(true);
    l2=new QLabel("等待连接...");
    l2->setHidden(true);
    QString localHostName = QHostInfo::localHostName();
    QHostInfo info = QHostInfo::fromName(localHostName);
    foreach(QHostAddress address, info.addresses())
    {
        if (address.protocol() == QAbstractSocket::IPv4Protocol){
            QString s=address.toString();
            le1->setText(s);
        }
    }
    pbok=new QPushButton("OK");
    pbcancel=new QPushButton("Cancel");
    connect(pbok,SIGNAL(clicked(bool)),this,SLOT(IsValid()));
    connect(pbcancel,SIGNAL(clicked(bool)),this,SLOT(cancel()));
    QGridLayout *layout=new QGridLayout;
    layout->addWidget(l1,0,0);
    layout->addWidget(le1,0,1);
    layout->addWidget(l2,1,0);
    layout->addWidget(pbok,2,Qt::AlignCenter);
    layout->addWidget(pbcancel,3,Qt::AlignCenter);
    this->setLayout(layout);
}
void clientdialog::IsValid(){
    l2->setHidden(false);
    emit connectit();
}
void clientdialog::cancel(){
    l2->setHidden(true);
    emit stopconnect();
}
