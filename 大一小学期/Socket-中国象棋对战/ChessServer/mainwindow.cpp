#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <item.h>
#include <QAction>
#include <QDebug>
#include <QMouseEvent>
#include <QtAlgorithms>
#include <QTimer>
#include <QMediaPlayer>
#include <QTextStream>
#include <QFile>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->mainToolBar->hide();
    setWindowTitle("Chinese chess game Server");
    setFixedSize(800,600);
    QMenuBar *mb=menuBar();
    QMenu *me=new QMenu("菜单");
    mb->addMenu(me);
    QAction *act=new QAction("设置连接");
    me->addAction(act);
    connect(act,SIGNAL(triggered(bool)),this,SLOT(settingit()));
    QAction *saveact=new QAction("保存");
    me->addAction(saveact);
    connect(saveact,SIGNAL(triggered(bool)),this,SLOT(savefile()));
    QAction *loadaction=new QAction("加载残局");
    me->addAction(loadaction);
    connect(loadaction,SIGNAL(triggered(bool)),this,SLOT(readfile()));
    QAction *startaction=new QAction("开始");
    me->addAction(startaction);
    connect(startaction,SIGNAL(triggered(bool)),this,SLOT(newgame()));

    //connect save and load
    existing=false,redturn=true;
    a=30;
    ui->lcdNumber->display(a);
    timer=new QTimer(this);
    startTimer(500);
}
void MainWindow::InitItems(){
    chosenitem.c_p=QPoint(-1,-1);
    ITEM_COLOR b=BLACK;
    ITEM_COLOR r=RED;
    QVector <ITEM_TYPE> Q;
    Q.push_back(JU);
    Q.push_back(MA);
    Q.push_back(XIANG);
    Q.push_back(SHI);
    Q.push_back(SHUAI);
    Q.push_back(SHI);
    Q.push_back(XIANG);
    Q.push_back(MA);
    Q.push_back(JU);
    for(int i=0;i<Q.size();i++){
        Item itemtmp(Q[i],b,QPoint(i,0));
        items.push_back(itemtmp);
    }
    Item bp1(PAO,b,QPoint(1,2));
    items.push_back(bp1);
    Item bp2(PAO,b,QPoint(7,2));
    items.push_back(bp2);
    for(int i=0;i<5;i++){
        Item zu(BING,b,QPoint(i*2,3));
        items.push_back(zu);
    }
    for(int i=0;i<Q.size();i++){
        Item itm(Q[i],r,QPoint(i,9));
        items.push_back(itm);
    }
    Item rp1(PAO,r,QPoint(1,7));
    items.push_back(rp1);
    Item rp2(PAO,r,QPoint(7,7));
    items.push_back(rp2);
    for(int i=0;i<5;i++){
        Item bing(BING,r,QPoint(i*2,6));
        items.push_back(bing);
    }
}
void MainWindow::paintEvent(QPaintEvent *e){
    QPainter p(this);
    QPixmap chessboard;
    chessboard.load("D:/background.png");
    p.drawPixmap(0,0,512,600,chessboard);
    for(int i=0;i<items.size();i++){
        DrawItem(items[i],p);
    }
    update();
}
void MainWindow::DrawItem(Item m, QPainter& p){
    if(m.Isshow==false){
        return;
    }
    QPixmap pxm;
        int x=m.c_p.x();
        int y=m.c_p.y();
        ITEM_TYPE t=m.c_type;
        ITEM_COLOR c=m.c_color;
        if(c==BLACK){
            if(t==JU){pxm=QPixmap("D:/b_ju.png");}
            if(t==MA){pxm=QPixmap("D:/b_ma.png");}
            if(t==BING){pxm=QPixmap("D:/b_zubing.png");}
            if(t==PAO){pxm=QPixmap("D:/b_pao.png");}
            if(t==SHUAI){pxm=QPixmap("D:/b_jiangshuai.png");}
            if(t==SHI){pxm=QPixmap("D:/b_shi.png");}
            if(t==XIANG){pxm=QPixmap("D:/b_xiang.png");}
            p.drawPixmap(12+55*x,25+55*y,50,50,pxm);
        }
        else if(c==RED){
            if(t==JU){pxm=QPixmap("D:/r_ju.png");}
            if(t==MA){pxm=QPixmap("D:/r_ma.png");}
            if(t==BING){pxm=QPixmap("D:/r_bing.png");}
            if(t==PAO){pxm=QPixmap("D:/r_pao.png");}
            if(t==SHUAI){pxm=QPixmap("D:/r_jiangshuai.png");}
            if(t==SHI){pxm=QPixmap("D:/r_shi.png");}
            if(t==XIANG){pxm=QPixmap("D:/r_xiang.png");}
            p.drawPixmap(10+55*x,28+55*y,50,50,pxm);
        }
}
void MainWindow::showit(Item m, bool isseen){
    for(int i=0;i<items.size();i++){
        if(items[i].c_p==m.c_p){
            items[i].Isshow=isseen;
            break;
        }
    }
}
void MainWindow::mousePressEvent(QMouseEvent *e){
    if((yourcolor==0 && !redturn) || (yourcolor==1 && redturn))return;
    QPoint tmp;
    QPoint ptofshuai;
    if(redturn){
        for(int i=0;i<items.size();i++){
            if(items[i].c_color==BLACK && items[i].c_type==SHUAI){
                ptofshuai=items[i].c_p;
                break;
            }
        }
    }
    else{
        for(int i=0;i<items.size();i++){
            if(items[i].c_color==RED && items[i].c_type==SHUAI){
                ptofshuai=items[i].c_p;
                break;
            }
        }
    }
    tmp.setX((e->pos().x()-7.5)/55);
    tmp.setY((e->pos().y()-17.5)/55);
    if(tmp.x()<0 || tmp.x()>8 || tmp.y()<0 || tmp.y()>9)return;
    if(existing==true){
        bool isshuaichosen=false;
        if(chosenitem.c_type==SHUAI)isshuaichosen=true;
        Item tp;
        if(ifhasbeenchess(tmp,tp)){
            QByteArray *array =new QByteArray;
            array->clear();
            QString sen;
            if(tp.c_color==chosenitem.c_color){
                showit(chosenitem,true);
                chosenitem=tp;
                return;
            }
            else{
                if(movable(chosenitem,tmp)){
                    bool deleteshuai=false;
                    sen+=QString::number(chosenitem.c_p.x(),10);
                    sen+=QString::number(chosenitem.c_p.y(),10);
                    sen+=QString::number(tmp.x(),10);
                    sen+=QString::number(tmp.y(),10);
                    sen+="10";
                    deleteitempoint(tmp,deleteshuai);
                    changeitempoint(chosenitem.c_p,tmp);
                    if(deleteshuai==true){
                        array->append(sen);
                        this->readWriteSocket->write(array->data());
                        timer->stop();
                        if(redturn){
                            QMessageBox::information(this,"Game over","红方胜利!          ",QMessageBox::Ok);
                            return;
                        }
                        else{
                            QMessageBox::information(this,"Game over","黑方胜利!          ",QMessageBox::Ok);
                            return;
                        }
                    }
                    if(redturn){
                        for(int i=0;i<items.size();i++){
                            if(items[i].c_color==RED && movable(items[i],ptofshuai) && isshuaichosen==false){
                                sen[5]='1';
                                qDebug() << "123";
                                jiangjunplay();
                                break;
                            }
                        }
                    }
                    else{
                        for(int i=0;i<items.size();i++){
                            if(items[i].c_color==BLACK && movable(items[i],ptofshuai) && isshuaichosen==false){
                                sen[5]='1';
                                qDebug() << "123";
                                jiangjunplay();
                                break;
                            }
                        }
                    }
                    array->append(sen);
                    this->readWriteSocket->write(array->data());
                    existing=false;
                    redturn=!redturn;
                    a=30;
                    update();
                    return;
                }
                else return;
            }
        }
        else{
            if(movable(chosenitem,tmp)){
                QString sen;
                sen+=QString::number(chosenitem.c_p.x(),10);
                sen+=QString::number(chosenitem.c_p.y(),10);
                sen+=QString::number(tmp.x(),10);
                sen+=QString::number(tmp.y(),10);
                sen+="00";
                QByteArray *array =new QByteArray;
                array->clear();
                changeitempoint(chosenitem.c_p,tmp);
                if(redturn){
                    for(int i=0;i<items.size();i++){
                        if(items[i].c_color==RED && movable(items[i],ptofshuai) && isshuaichosen==false){
                            sen[5]='1';
                            qDebug() << "123";
                            jiangjunplay();
                            break;
                        }
                    }
                }
                else{
                    for(int i=0;i<items.size();i++){
                        if(items[i].c_color==BLACK && movable(items[i],ptofshuai) && isshuaichosen==false){
                            sen[5]='1';
                            qDebug() << "123";
                            jiangjunplay();
                            break;
                        }
                    }
                }
                array->append(sen);
                this->readWriteSocket->write(array->data());
                existing=false;
                redturn=!redturn;
                a=30;
                update();
                return;
            }
            else return;
        }
    }
    else{
        Item tp;
        if(ifhasbeenchess(tmp,tp)){
            if((tp.c_color==RED && redturn==true) || (tp.c_color==BLACK && redturn==false)){
                chosenitem=tp;
                existing=true;
                return;
            }
        }
        else return;
    }
}
bool MainWindow::ifhasbeenchess(QPoint pt,Item& tp){
    for(int i=0;i<items.size();i++){
        if(items[i].c_p==pt){
            tp=items[i];
            return true;
        }
    }
    return false;
}
void MainWindow::settingit(){
    cd=new clientdialog(this);
    connect(cd,SIGNAL(connectit()),this,SLOT(initServer()));
    connect(cd,SIGNAL(stopconnect()),this,SLOT(ServerClose()));
    cd->show();
}
void MainWindow::timerEvent(QTimerEvent *event){
    for(int i=0;i<items.size();i++){
        if(items[i].c_p==chosenitem.c_p){
            items[i].Isshow=!items[i].Isshow;
            break;
        }
    }
}
bool MainWindow::jumovable(Item i, QPoint pt){
    if(pdduijiang(i,pt))return false;
    QPoint ipt=i.c_p;
    Item tmp;
    if(ipt.x()!=pt.x() && ipt.y()!=pt.y())return false;
    else{
        if(ipt.x()==pt.x()){
            int x=pt.x();
            if(ipt.y()>pt.y()){
                for(int i=pt.y()+1;i<ipt.y();i++){
                    QPoint p=QPoint(x,i);
                    if(ifhasbeenchess(p,tmp))return false;
                }
                return true;
            }
            if(ipt.y()<pt.y()){
                for(int i=ipt.y()+1;i<pt.y();i++){
                    QPoint p=QPoint(x,i);
                    if(ifhasbeenchess(p,tmp))return false;
                }
                return true;
            }
        }
        if(ipt.y()==pt.y()){
            int y=pt.y();
            if(ipt.x()>pt.x()){
                for(int i=pt.x()+1;i<ipt.x();i++){
                    QPoint p=QPoint(i,y);
                    if(ifhasbeenchess(p,tmp))return false;
                }
                return true;
            }
            if(ipt.x()<pt.x()){
                for(int i=ipt.x()+1;i<pt.x();i++){
                    QPoint p=QPoint(i,y);
                    if(ifhasbeenchess(p,tmp))return false;
                }
                return true;
            }
        }
    }
}
bool MainWindow::mamovable(Item i, QPoint pt){
    if(pdduijiang(i,pt))return false;
    QPoint ipt=i.c_p;
    Item tmp;
    if(ipt.x()+1==pt.x() && ipt.y()+2==pt.y()){
        QPoint t=QPoint(ipt.x(),ipt.y()+1);
        if(!ifhasbeenchess(t,tmp))return true;
    }
    if(ipt.x()+2==pt.x() && ipt.y()+1==pt.y()){
        QPoint t=QPoint(ipt.x()+1,ipt.y());
        if(!ifhasbeenchess(t,tmp))return true;
    }
    if(ipt.x()+2==pt.x() && ipt.y()-1==pt.y()){
        QPoint t=QPoint(ipt.x()+1,ipt.y());
        if(!ifhasbeenchess(t,tmp))return true;
    }
    if(ipt.x()+1==pt.x() && ipt.y()-2==pt.y()){
        QPoint t=QPoint(ipt.x(),ipt.y()-1);
        if(!ifhasbeenchess(t,tmp))return true;
    }
    if(ipt.x()-1==pt.x() && ipt.y()-2==pt.y()){
        QPoint t=QPoint(ipt.x(),ipt.y()-1);
        if(!ifhasbeenchess(t,tmp))return true;
    }
    if(ipt.x()-2==pt.x() && ipt.y()-1==pt.y()){
        QPoint t=QPoint(ipt.x()-1,ipt.y());
        if(!ifhasbeenchess(t,tmp))return true;
    }
    if(ipt.x()-2==pt.x() && ipt.y()+1==pt.y()){
        QPoint t=QPoint(ipt.x()-1,ipt.y());
        if(!ifhasbeenchess(t,tmp))return true;
    }
    if(ipt.x()-1==pt.x() && ipt.y()+2==pt.y()){
        QPoint t=QPoint(ipt.x(),ipt.y()+1);
        if(!ifhasbeenchess(t,tmp))return true;
    }
    return false;
}
bool MainWindow::xiangmovable(Item i, QPoint pt){
    if(pdduijiang(i,pt))return false;
    QPoint ipt=i.c_p;
    Item tmp;
    QVector<QPoint> dirs;
    QPoint tp1=QPoint(-2,-2),tp2=QPoint(2,-2),tp3=QPoint(-2,2),tp4=QPoint(2,2);
    dirs.push_back(tp1);dirs.push_back(tp2);dirs.push_back(tp3);dirs.push_back(tp4);
    if(i.c_color==RED){
        if(pt.y()<=4)return false;
    }
    if(i.c_color==BLACK){
        if(pt.y()>=5)return false;
    }
    for(int i=0;i<=3;i++){
        if(ipt.x()+dirs[i].x()==pt.x() && ipt.y()+dirs[i].y()==pt.y()){
            QPoint ctr=QPoint((ipt.x()+pt.x())/2,(ipt.y()+pt.y())/2);
            if(ifhasbeenchess(ctr,tmp))continue;
            else return true;
        }
    }
    return false;
}
bool MainWindow::shimovable(Item i, QPoint pt){
    if(pdduijiang(i,pt))return false;
    QPoint ipt=i.c_p;
    if(qAbs(pt.x()-ipt.x())!=1 || qAbs(pt.y()-ipt.y())!=1)return false;
    if(i.c_color==RED){
       QVector <QPoint> tmp;
       QPoint tp1=QPoint(3,9),tp2=QPoint(5,9),tp3=QPoint(4,8),tp4=QPoint(3,7),tp5=QPoint(5,7);
       tmp.push_back(tp1);tmp.push_back(tp2);tmp.push_back(tp3);tmp.push_back(tp4);tmp.push_back(tp5);
       for(int i=0;i<5;i++){
           if(pt.x()==tmp[i].x() && pt.y()==tmp[i].y())return true;
       }
       return false;
    }
    if(i.c_color==BLACK){
       QVector <QPoint> tmp;
       QPoint tp1=QPoint(3,0),tp2=QPoint(3,5),tp3=QPoint(4,1),tp4=QPoint(3,2),tp5=QPoint(5,2);
       tmp.push_back(tp1);tmp.push_back(tp2);tmp.push_back(tp3);tmp.push_back(tp4);tmp.push_back(tp5);
       for(int i=0;i<5;i++){
           if(pt.x()==tmp[i].x() && pt.y()==tmp[i].y())return true;
       }
       return false;
    }
}
bool MainWindow::shuaimovable(Item i, QPoint pt){
    if(pdduijiang(i,pt))return false;
    QPoint ipt=i.c_p;
    if(ipt.x()!=pt.x() && ipt.y()!=pt.y())return false;
    if(qAbs(ipt.x()-pt.x())!=1 && qAbs(ipt.y()-pt.y())!=1)return false;
    if(i.c_color==RED){
        QVector <QPoint> tmp;
        QPoint tp1=QPoint(3,7),tp2=QPoint(4,7),tp3=QPoint(5,7),tp4=QPoint(3,8),tp5=QPoint(4,8),
               tp6=QPoint(5,8),tp7=QPoint(3,9),tp8=QPoint(4,9),tp9=QPoint(5,9);
        tmp.push_back(tp1);tmp.push_back(tp2);tmp.push_back(tp3);tmp.push_back(tp4);tmp.push_back(tp5);
        tmp.push_back(tp6);tmp.push_back(tp7);tmp.push_back(tp8);tmp.push_back(tp9);
        for(int i=0;i<9;i++){
            if(pt.x()==tmp[i].x() && pt.y()==tmp[i].y())return true;
        }
        return false;
    }
    if(i.c_color==BLACK){
        QVector <QPoint> tmp;
        QPoint tp1=QPoint(3,0),tp2=QPoint(4,0),tp3=QPoint(5,0),tp4=QPoint(3,1),
               tp5=QPoint(4,1),tp6=QPoint(5,1),tp7=QPoint(3,2),tp8=QPoint(4,2),tp9=QPoint(5,2);
        tmp.push_back(tp1);tmp.push_back(tp2);tmp.push_back(tp3);tmp.push_back(tp4);tmp.push_back(tp5);
        tmp.push_back(tp6);tmp.push_back(tp7);tmp.push_back(tp8);tmp.push_back(tp9);
        for(int i=0;i<9;i++){
            if(pt.x()==tmp[i].x() && pt.y()==tmp[i].y())return true;
        }
        return false;
    }
}
bool MainWindow::paomovable(Item i, QPoint pt){
    if(pdduijiang(i,pt))return false;
    QPoint ipt=i.c_p;
    Item tmp;
    if(ipt.x()!=pt.x() && ipt.y()!=pt.y())return false;
    if(ifhasbeenchess(pt,tmp)){
        int count=0;
        if(ipt.x()==pt.x()){
            int x=pt.x();
            if(ipt.y()>pt.y()){
                for(int i=pt.y()+1;i<ipt.y();i++){
                    QPoint p=QPoint(x,i);
                    if(ifhasbeenchess(p,tmp))count++;
                }
                if(count==1)return true;
                else return false;
            }
            if(ipt.y()<pt.y()){
                for(int i=ipt.y()+1;i<pt.y();i++){
                    QPoint p=QPoint(x,i);
                    if(ifhasbeenchess(p,tmp))count++;
                }
                if(count==1)return true;
                else return false;
            }
        }
        if(ipt.y()==pt.y()){
            int y=pt.y();
            if(ipt.x()>pt.x()){
                for(int i=pt.x()+1;i<ipt.x();i++){
                    QPoint p=QPoint(i,y);
                    if(ifhasbeenchess(p,tmp))count++;
                }
                if(count==1)return true;
                else return false;
            }
            if(ipt.x()<pt.x()){
                for(int i=ipt.x()+1;i<pt.x();i++){
                    QPoint p=QPoint(i,y);
                    if(ifhasbeenchess(p,tmp))count++;
                }
                if(count==1)return true;
                else return false;
            }
        }
    }
    else{
        if(ipt.x()==pt.x()){
            int x=pt.x();
            if(ipt.y()>pt.y()){
                for(int i=pt.y()+1;i<ipt.y();i++){
                    QPoint p=QPoint(x,i);
                    if(ifhasbeenchess(p,tmp))return false;
                }
                return true;
            }
            if(ipt.y()<pt.y()){
                for(int i=ipt.y()+1;i<pt.y();i++){
                    QPoint p=QPoint(x,i);
                    if(ifhasbeenchess(p,tmp))return false;
                }
                return true;
            }
        }
        if(ipt.y()==pt.y()){
            int y=pt.y();
            if(ipt.x()>pt.x()){
                for(int i=pt.x()+1;i<ipt.x();i++){
                    QPoint p=QPoint(i,y);
                    if(ifhasbeenchess(p,tmp))return false;
                }
                return true;
            }
            if(ipt.x()<pt.x()){
                for(int i=ipt.x()+1;i<pt.x();i++){
                    QPoint p=QPoint(i,y);
                    if(ifhasbeenchess(p,tmp))return false;
                }
                return true;
            }
        }
    }
}
bool MainWindow::bingmovable(Item i, QPoint pt){
    if(pdduijiang(i,pt))return false;
    QPoint ipt=i.c_p;
    if(i.c_color==RED){
        if(ipt.y()>=5){
            if(pt.y()==ipt.y()-1 && pt.x()==ipt.x())return true;
            else return false;
        }
        if(ipt.y()<=4){
            if(pt.y()==ipt.y()-1 && pt.x()==ipt.x())return true;
            if(pt.y()==ipt.y() && qAbs(pt.x()-ipt.x())==1)return true;
            return false;
        }
    }
    if(i.c_color==BLACK){
        if(ipt.y()<=4){
            if(pt.y()==ipt.y()+1 && pt.x()==ipt.x())return true;
            else return false;
        }
        if(ipt.y()>=5){
            if(pt.y()==ipt.y()+1 && pt.x()==ipt.x())return true;
            if(pt.y()==ipt.y() && qAbs(pt.x()-ipt.x())==1)return true;
            return false;
        }
    }
}
bool MainWindow::movable(Item i, QPoint pt){
    switch(i.c_type){
    case JU:
        return jumovable(i,pt);
    case MA:
        return mamovable(i,pt);
    case XIANG:
        return xiangmovable(i,pt);
    case SHI:
        return shimovable(i,pt);
    case SHUAI:
        return shuaimovable(i,pt);
    case PAO:
        return paomovable(i,pt);
    case BING:
        return bingmovable(i,pt);
    }
}
bool MainWindow::deleteitempoint(QPoint pt,bool &Isshuaideleted){
    bool deleted=false;
    for(int i=0;i<items.size();i++){
        if(items[i].c_p==pt){
            Isshuaideleted=(items[i].c_type==SHUAI);
            items.erase(items.begin()+i);
            deleted=true;
            break;
        }
    }
    return deleted;
}
void MainWindow::changeitempoint(QPoint p1, QPoint p2){
    for(int i=0;i<items.size();i++){
        if(items[i].c_p==p1){
            chosenitem.c_p=QPoint(-1,-1);
            items[i].c_p=p2;
            items[i].Isshow=true;
            break;
        }
    }
}
void MainWindow::jiangjunplay(){
    qmp=new QMediaPlayer;
    qmp->setMedia(QMediaContent(QUrl::fromLocalFile("D:/2.mp3")));
    qmp->play();
}
bool MainWindow::pdduijiang(Item it, QPoint pt){
    QPoint redshuai;
    QPoint blackshuai;
    Item i0;
    for(int i=0;i<items.size();i++){
        if(items[i].c_color==RED && items[i].c_type==SHUAI)redshuai=items[i].c_p;
        if(items[i].c_color==BLACK && items[i].c_type==SHUAI)blackshuai=items[i].c_p;
    }
    if(redshuai.x()!=blackshuai.x() || it.c_p.x()!=redshuai.x() || pt.x()==redshuai.x())return false;
    if(redshuai.y()>blackshuai.y()){
        int count=0;
        for(int i=blackshuai.y()+1;i<redshuai.y();i++){
            QPoint tmp=QPoint(it.c_p.x(),i);
            if(ifhasbeenchess(tmp,i0))count++;
        }
        if(count==1)return true;
        else return false;
    }
    else{
        int count=0;
        for(int i=redshuai.y()+1;i<blackshuai.y();i++){
            QPoint tmp=QPoint(it.c_p.x(),i);
            if(ifhasbeenchess(tmp,i0))count++;
        }
        if(count==1)return true;
        else return false;
    }
}
void MainWindow::showtimelimit(){
    ui->lcdNumber->display(a);
    if(a==0){
        timer->stop();
        QByteArray *array=new QByteArray;
        array->clear();
        array->append("overtime");
        this->readWriteSocket->write(array->data());
        if(redturn)
        QMessageBox::information(this,"Game Over!","红方超时判负!   ",QMessageBox::Ok);
        else QMessageBox::information(this,"Game Over!","黑方超时判负!   ",QMessageBox::Ok);
        disconnect(timer,SIGNAL(timeout()),this,SLOT(showtimelimit()));
    }
    a--;
}
MainWindow::~MainWindow()
{
    delete ui;
}
void MainWindow::deleteitems(){
    if(items.size()>0)items.clear();
    if(timer!=NULL){
        disconnect(timer,SIGNAL(timeout()),this,SLOT(showtimelimit()));
    }
}
void MainWindow::newgame(int c){
    deleteitems();
    InitItems();
    yourcolor=c;
    if(yourcolor==0){
        this->setWindowTitle("Chinese chess game Server-您执红方");
    }
    else {this->setWindowTitle("Chinese chess game Server-您执黑方");}
    a=30;
    chosenitem.c_p=QPoint(-1,-1);
    redturn = true;
    existing = false;
    connect(timer,SIGNAL(timeout()),this,SLOT(showtimelimit()));
    timer->start(1000);
}
void MainWindow::savefile(){
    QFile file("D:/tests.txt");
    QByteArray *array =new QByteArray;
    array->clear();
    array->append("save");
    this->readWriteSocket->write(array->data());
    if(file.open(QFile::WriteOnly)){
        QTextStream out(&file);
        int countred[7]={0,0,0,0,0,0,0};
        int countblack[7]={0,0,0,0,0,0,0};
        QVector <QPoint> shuai;QVector <QPoint> shi;QVector <QPoint> xiang; QVector <QPoint> ma;
        QVector <QPoint> ju; QVector <QPoint> pao;QVector <QPoint> bing;
        QVector <QPoint> bshuai;QVector <QPoint> bshi;QVector <QPoint> bxiang; QVector <QPoint> bma;
        QVector <QPoint> bju; QVector <QPoint> bpao;QVector <QPoint> bbing;
        for(int i=0;i<items.size();i++){
            if(items[i].c_color==RED){
                switch(items[i].c_type){
                case SHUAI:
                    countred[0]++;
                    shuai.push_back(items[i].c_p);
                    break;
                case SHI:
                    countred[1]++;
                    shi.push_back(items[i].c_p);
                    break;
                case XIANG:
                    countred[2]++;
                    xiang.push_back(items[i].c_p);
                    break;
                case MA:
                    countred[3]++;
                    ma.push_back(items[i].c_p);
                    break;
                case JU:
                    countred[4]++;
                    ju.push_back(items[i].c_p);
                    break;
                case PAO:
                    countred[5]++;
                    pao.push_back(items[i].c_p);
                    break;
                case BING:
                    countred[6]++;
                    bing.push_back(items[i].c_p);
                    break;
                }
            }
            else{
                switch(items[i].c_type){
                case SHUAI:
                    countblack[0]++;
                    bshuai.push_back(items[i].c_p);
                    break;
                case SHI:
                    countblack[1]++;
                    bshi.push_back(items[i].c_p);
                    break;
                case XIANG:
                    countblack[2]++;
                    bxiang.push_back(items[i].c_p);
                    break;
                case MA:
                    countblack[3]++;
                    bma.push_back(items[i].c_p);
                    break;
                case JU:
                    countblack[4]++;
                    bju.push_back(items[i].c_p);
                    break;
                case PAO:
                    countblack[5]++;
                    bpao.push_back(items[i].c_p);
                    break;
                case BING:
                    countblack[6]++;
                    bbing.push_back(items[i].c_p);
                    break;
                }
            }
        }
        out << "red" << "\n";
        out << countred[0];
        for(int i=0;i<shuai.size();i++){
            out << " <" << shuai[i].x() << "," << 9-shuai[i].y() << ">";
        }
        out << endl;
        out << countred[1];
        for(int i=0;i<shi.size();i++){
            out << " <" << shi[i].x() << "," << 9-shi[i].y() << ">";
        }
        out << endl;
        out << countred[2];
        for(int i=0;i<xiang.size();i++){
            out << " <" << xiang[i].x() << "," << 9-xiang[i].y() << ">";
        }
        out << endl;
        out << countred[3];
        for(int i=0;i<ma.size();i++){
            out << " <" << ma[i].x() << "," << 9-ma[i].y() << ">";
        }
        out << endl;
        out << countred[4];
        for(int i=0;i<ju.size();i++){
            out << " <" << ju[i].x() << "," << 9-ju[i].y() << ">";
        }
        out << endl;
        out << countred[5];
        for(int i=0;i<pao.size();i++){
            out << " <" << pao[i].x() << "," << 9-pao[i].y() << ">";
        }
        out << endl;
        out << countred[6];
        for(int i=0;i<bing.size();i++){
            out << " <" << bing[i].x() << "," << 9-bing[i].y() << ">";
        }
        out << endl;
        out << "black" << endl;
        out << countblack[0];
        for(int i=0;i<bshuai.size();i++){
            out << " <" << bshuai[i].x() << "," << 9-bshuai[i].y() << ">";
        }
        out << endl;
        out << countblack[1];
        for(int i=0;i<bshi.size();i++){
            out << " <" << bshi[i].x() << "," << 9-bshi[i].y() << ">";
        }
        out << endl;
        out << countblack[2];
        for(int i=0;i<bxiang.size();i++){
            out << " <" << bxiang[i].x() << "," << 9-bxiang[i].y() << ">";
        }
        out << endl;
        out << countblack[3];
        for(int i=0;i<bma.size();i++){
            out << " <" << bma[i].x() << "," << 9-bma[i].y() << ">";
        }
        out << endl;
        out << countblack[4];
        for(int i=0;i<bju.size();i++){
            out << " <" << bju[i].x() << "," << 9-bju[i].y() << ">";
        }
        out << endl;
        out << countred[5];
        for(int i=0;i<bpao.size();i++){
            out << " <" << bpao[i].x() << "," << 9-bpao[i].y() << ">";
        }
        out << endl;
        out << countblack[6];
        for(int i=0;i<bbing.size();i++){
            out << " <" << bbing[i].x() << "," << 9-bbing[i].y() << ">";
        }
        out << endl;
        if(yourcolor==0)out << "R" << endl;
        else out << "B" << endl;
        if(redturn) out << "r" << endl;
        else out << "b" << endl;
        out << "EndOfFile" << endl;
        QMessageBox::information(this,"SAVE SUCCESS!","保存对局成功! ",QMessageBox::Ok);
    }
    else{
        QMessageBox::warning(this,"SAVE FAIL!","保存失败! ",QMessageBox::Ok);
    }
}
void MainWindow::readfile(){
    deleteitems();
    a=30;
    chosenitem.c_p=QPoint(-1,-1);
    existing = false;
    connect(timer,SIGNAL(timeout()),this,SLOT(showtimelimit()));
    timer->start(1000);
    QByteArray *array =new QByteArray;
    array->clear();
    array->append("load");
    this->readWriteSocket->write(array->data());
    QFile file("D:/tests.txt");
    if(!file.open(QFile::ReadOnly))return;
    QTextStream in(&file);
    QString line=in.readLine();
    if(line=="red"){
        int count=0;
        while(line!="black"){
           line=in.readLine();
           count++;
           QByteArray arr=line.toLatin1();
           char *arrinf=arr.data();
           switch(count){
           case 1:
               for(int i=0;i<line.length();i++){
                   if(i%6==3){
                      QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                      Item m(SHUAI,RED,p);
                      items.push_back(m);
                   }
               }
               break;
           case 2:
               for(int i=0;i<line.length();i++){
                   if(i%6==3){
                      QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                      Item m(SHI,RED,p);
                      items.push_back(m);
                   }
               }
               break;
           case 3:
               for(int i=0;i<line.length();i++){
                   if(i%6==3){
                      QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                      Item m(XIANG,RED,p);
                      items.push_back(m);
                   }
               }
               break;
           case 4:
               for(int i=0;i<line.length();i++){
                   if(i%6==3){
                      QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                      Item m(MA,RED,p);
                      items.push_back(m);
                   }
               }
               break;
           case 5:
               for(int i=0;i<line.length();i++){
                   if(i%6==3){
                      QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                      Item m(JU,RED,p);
                      items.push_back(m);
                   }
               }
               break;
           case 6:
               for(int i=0;i<line.length();i++){
                   if(i%6==3){
                      QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                      Item m(PAO,RED,p);
                      items.push_back(m);
                   }
               }
               break;
           case 7:
               for(int i=0;i<line.length();i++){
                   if(i%6==3){
                      QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                      Item m(BING,RED,p);
                      items.push_back(m);
                   }
               }
               break;
           }
        }
    }
    if(line=="black"){
        int count=0;
        while(line!="EndOfFile"){
            line=in.readLine();
            count++;
            QByteArray arr=line.toLatin1();
            char *arrinf=arr.data();
            switch(count){
            case 1:
                for(int i=0;i<line.length();i++){
                    if(i%6==3){
                       QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                       Item m(SHUAI,BLACK,p);
                       items.push_back(m);
                    }
                }
                break;
            case 2:
                for(int i=0;i<line.length();i++){
                    if(i%6==3){
                       QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                       Item m(SHI,BLACK,p);
                       items.push_back(m);
                    }
                }
                break;
            case 3:
                for(int i=0;i<line.length();i++){
                    if(i%6==3){
                       QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                       Item m(XIANG,BLACK,p);
                       items.push_back(m);
                    }
                }
                break;
            case 4:
                for(int i=0;i<line.length();i++){
                    if(i%6==3){
                       QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                       Item m(MA,BLACK,p);
                       items.push_back(m);
                    }
                }
                break;
            case 5:
                for(int i=0;i<line.length();i++){
                    if(i%6==3){
                       QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                       Item m(JU,BLACK,p);
                       items.push_back(m);
                    }
                }
                break;
            case 6:
                for(int i=0;i<line.length();i++){
                    if(i%6==3){
                       QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                       Item m(PAO,BLACK,p);
                       items.push_back(m);
                    }
                }
                break;
            case 7:
                for(int i=0;i<line.length();i++){
                    if(i%6==3){
                       QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                       Item m(BING,BLACK,p);
                       items.push_back(m);
                    }
                }
                break;
            case 8:
                if(arrinf[0]=='R')yourcolor=0;
                else yourcolor=1;
                break;
            case 9:
                if(arrinf[0]=='r')redturn=true;
                else redturn=false;
            }
        }
    }
    if(yourcolor==0)this->setWindowTitle("Chinese Chess Server-您执红方");
    else this->setWindowTitle("Chinese Chess Server-您执黑方");
    update();
}
void MainWindow::initServer()
{
    this->listenSocket =new QTcpServer;
    this->listenSocket->listen(QHostAddress::Any,8888);
    QObject::connect(this->listenSocket,SIGNAL(newConnection()),this,SLOT(acceptConnection()));
}
void MainWindow::ServerClose(){
    if(this->listenSocket!=NULL)
    this->listenSocket->close();
}
void MainWindow::acceptConnection()
{
    this->readWriteSocket =this->listenSocket->nextPendingConnection();
    QObject::connect(this->readWriteSocket,SIGNAL(readyRead()),this,SLOT(recvMessage()));
    QByteArray *array =new QByteArray;
    array->clear();
    array->append("start");
    this->readWriteSocket->write(array->data());
}
void MainWindow::recvMessage()
{
    QString info;
    info += this->readWriteSocket->readAll();
    qDebug() << info;
    if(info=="start"){
        QMessageBox::information(this,"Connect! ","连接成功! ",QMessageBox::Ok);
    }
    if(info=="new0")newgame(1);
    if(info=="new1")newgame(0);
    if(info=="save")savefilecon();
    if(info=="lose"){
        timer->stop();
        if(redturn)QMessageBox::information(this,"Game Over! ","红方已认输! ",QMessageBox::Ok);
        else QMessageBox::information(this,"Game Over! ","黑方已认输! ",QMessageBox::Ok);
    }
    if(info=="overtime"){
        timer->stop();
        if(redturn)QMessageBox::information(this,"Game Over! ","红方超时判负! ",QMessageBox::Ok);
        else QMessageBox::information(this,"Game Over! ","黑方超时判负! ",QMessageBox::Ok);
    }
    if(info=="load")readfilecon();
    if(info[0]>='0' || info[0]<='9'){
        QByteArray ba=info.toLatin1();
        char *inf=ba.data();
        int i0=inf[0]-48;int i1=inf[1]-48;int i2=inf[2]-48;int i3=inf[3]-48;
        QPoint p1=QPoint(i0,i1);
        QPoint p2=QPoint(i2,i3);
        bool Isshuaichosen=false;
        bool Isshuaibechosen=false;
        Item chosen;
        Item bechosen;
        for(int i=0;i<items.size();i++){
            if(items[i].c_p==p1){
                chosen=items[i];
                if(items[i].c_type==SHUAI)Isshuaichosen=true;
            }
            if(items[i].c_p==p2){
                bechosen=items[i];
                if(items[i].c_type==SHUAI)Isshuaibechosen=true;
            }
        }
        if(info[4]=='0'){
            changeitempoint(p1,p2);
            if(info[5]=='1'){
                jiangjunplay();
            }
            redturn=!redturn;
            a=30;
            update();
            return;
        }
        if(info[4]=='1'){
            deleteitempoint(p2,Isshuaibechosen);
            changeitempoint(p1,p2);
            if(Isshuaibechosen==true){
                timer->stop();
                if(redturn){
                    QMessageBox::information(this,"Game over","红方胜利!          ",QMessageBox::Ok);
                    return;
                }
                else{
                    QMessageBox::information(this,"Game over","黑方胜利!          ",QMessageBox::Ok);
                    return;
                }
            }
            if(info[5]=='1')jiangjunplay();
            redturn=!redturn;
            a=30;
            update();
            return;
        }
    }
}
void MainWindow::savefilecon(){
    QFile file("D:/tests.txt");
    if(file.open(QFile::WriteOnly)){
        QTextStream out(&file);
        int countred[7]={0,0,0,0,0,0,0};
        int countblack[7]={0,0,0,0,0,0,0};
        QVector <QPoint> shuai;QVector <QPoint> shi;QVector <QPoint> xiang; QVector <QPoint> ma;
        QVector <QPoint> ju; QVector <QPoint> pao;QVector <QPoint> bing;
        QVector <QPoint> bshuai;QVector <QPoint> bshi;QVector <QPoint> bxiang; QVector <QPoint> bma;
        QVector <QPoint> bju; QVector <QPoint> bpao;QVector <QPoint> bbing;
        for(int i=0;i<items.size();i++){
            if(items[i].c_color==RED){
                switch(items[i].c_type){
                case SHUAI:
                    countred[0]++;
                    shuai.push_back(items[i].c_p);
                    break;
                case SHI:
                    countred[1]++;
                    shi.push_back(items[i].c_p);
                    break;
                case XIANG:
                    countred[2]++;
                    xiang.push_back(items[i].c_p);
                    break;
                case MA:
                    countred[3]++;
                    ma.push_back(items[i].c_p);
                    break;
                case JU:
                    countred[4]++;
                    ju.push_back(items[i].c_p);
                    break;
                case PAO:
                    countred[5]++;
                    pao.push_back(items[i].c_p);
                    break;
                case BING:
                    countred[6]++;
                    bing.push_back(items[i].c_p);
                    break;
                }
            }
            else{
                switch(items[i].c_type){
                case SHUAI:
                    countblack[0]++;
                    bshuai.push_back(items[i].c_p);
                    break;
                case SHI:
                    countblack[1]++;
                    bshi.push_back(items[i].c_p);
                    break;
                case XIANG:
                    countblack[2]++;
                    bxiang.push_back(items[i].c_p);
                    break;
                case MA:
                    countblack[3]++;
                    bma.push_back(items[i].c_p);
                    break;
                case JU:
                    countblack[4]++;
                    bju.push_back(items[i].c_p);
                    break;
                case PAO:
                    countblack[5]++;
                    bpao.push_back(items[i].c_p);
                    break;
                case BING:
                    countblack[6]++;
                    bbing.push_back(items[i].c_p);
                    break;
                }
            }
        }
        out << "red" << "\n";
        out << countred[0];
        for(int i=0;i<shuai.size();i++){
            out << " <" << shuai[i].x() << "," << 9-shuai[i].y() << ">";
        }
        out << endl;
        out << countred[1];
        for(int i=0;i<shi.size();i++){
            out << " <" << shi[i].x() << "," << 9-shi[i].y() << ">";
        }
        out << endl;
        out << countred[2];
        for(int i=0;i<xiang.size();i++){
            out << " <" << xiang[i].x() << "," << 9-xiang[i].y() << ">";
        }
        out << endl;
        out << countred[3];
        for(int i=0;i<ma.size();i++){
            out << " <" << ma[i].x() << "," << 9-ma[i].y() << ">";
        }
        out << endl;
        out << countred[4];
        for(int i=0;i<ju.size();i++){
            out << " <" << ju[i].x() << "," << 9-ju[i].y() << ">";
        }
        out << endl;
        out << countred[5];
        for(int i=0;i<pao.size();i++){
            out << " <" << pao[i].x() << "," << 9-pao[i].y() << ">";
        }
        out << endl;
        out << countred[6];
        for(int i=0;i<bing.size();i++){
            out << " <" << bing[i].x() << "," << 9-bing[i].y() << ">";
        }
        out << endl;
        out << "black" << endl;
        out << countblack[0];
        for(int i=0;i<bshuai.size();i++){
            out << " <" << bshuai[i].x() << "," << 9-bshuai[i].y() << ">";
        }
        out << endl;
        out << countblack[1];
        for(int i=0;i<bshi.size();i++){
            out << " <" << bshi[i].x() << "," << 9-bshi[i].y() << ">";
        }
        out << endl;
        out << countblack[2];
        for(int i=0;i<bxiang.size();i++){
            out << " <" << bxiang[i].x() << "," << 9-bxiang[i].y() << ">";
        }
        out << endl;
        out << countblack[3];
        for(int i=0;i<bma.size();i++){
            out << " <" << bma[i].x() << "," << 9-bma[i].y() << ">";
        }
        out << endl;
        out << countblack[4];
        for(int i=0;i<bju.size();i++){
            out << " <" << bju[i].x() << "," << 9-bju[i].y() << ">";
        }
        out << endl;
        out << countred[5];
        for(int i=0;i<bpao.size();i++){
            out << " <" << bpao[i].x() << "," << 9-bpao[i].y() << ">";
        }
        out << endl;
        out << countblack[6];
        for(int i=0;i<bbing.size();i++){
            out << " <" << bbing[i].x() << "," << 9-bbing[i].y() << ">";
        }
        out << endl;
        if(yourcolor==0)out << "R" << endl;
        else out << "B" << endl;
        if(redturn)out << "r" << endl;
        else out << "b" << endl;
        out << "EndOfFile" << endl;
        QMessageBox::information(this,"SAVE SUCCESS!","保存对局成功! ",QMessageBox::Ok);
    }
    else{
        QMessageBox::warning(this,"SAVE FAIL!","保存失败! ",QMessageBox::Ok);
    }
}
void MainWindow::readfilecon(){
    deleteitems();
    a=30;
    chosenitem.c_p=QPoint(-1,-1);
    redturn = true;
    existing = false;
    connect(timer,SIGNAL(timeout()),this,SLOT(showtimelimit()));
    timer->start(1000);
    QFile file("D:/tests.txt");
    if(!file.open(QFile::ReadOnly))return;
    QTextStream in(&file);
    QString line=in.readLine();
    if(line=="red"){
        int count=0;
        while(line!="black"){
           line=in.readLine();
           count++;
           QByteArray arr=line.toLatin1();
           char *arrinf=arr.data();
           switch(count){
           case 1:
               for(int i=0;i<line.length();i++){
                   if(i%6==3){
                      QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                      Item m(SHUAI,RED,p);
                      items.push_back(m);
                   }
               }
               break;
           case 2:
               for(int i=0;i<line.length();i++){
                   if(i%6==3){
                      QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                      Item m(SHI,RED,p);
                      items.push_back(m);
                   }
               }
               break;
           case 3:
               for(int i=0;i<line.length();i++){
                   if(i%6==3){
                      QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                      Item m(XIANG,RED,p);
                      items.push_back(m);
                   }
               }
               break;
           case 4:
               for(int i=0;i<line.length();i++){
                   if(i%6==3){
                      QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                      Item m(MA,RED,p);
                      items.push_back(m);
                   }
               }
               break;
           case 5:
               for(int i=0;i<line.length();i++){
                   if(i%6==3){
                      QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                      Item m(JU,RED,p);
                      items.push_back(m);
                   }
               }
               break;
           case 6:
               for(int i=0;i<line.length();i++){
                   if(i%6==3){
                      QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                      Item m(PAO,RED,p);
                      items.push_back(m);
                   }
               }
               break;
           case 7:
               for(int i=0;i<line.length();i++){
                   if(i%6==3){
                      QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                      Item m(BING,RED,p);
                      items.push_back(m);
                   }
               }
               break;
           }
        }
    }
    if(line=="black"){
        int count=0;
        while(line!="EndOfFile"){
            line=in.readLine();
            count++;
            QByteArray arr=line.toLatin1();
            char *arrinf=arr.data();
            switch(count){
            case 1:
                for(int i=0;i<line.length();i++){
                    if(i%6==3){
                       QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                       Item m(SHUAI,BLACK,p);
                       items.push_back(m);
                    }
                }
                break;
            case 2:
                for(int i=0;i<line.length();i++){
                    if(i%6==3){
                       QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                       Item m(SHI,BLACK,p);
                       items.push_back(m);
                    }
                }
                break;
            case 3:
                for(int i=0;i<line.length();i++){
                    if(i%6==3){
                       QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                       Item m(XIANG,BLACK,p);
                       items.push_back(m);
                    }
                }
                break;
            case 4:
                for(int i=0;i<line.length();i++){
                    if(i%6==3){
                       QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                       Item m(MA,BLACK,p);
                       items.push_back(m);
                    }
                }
                break;
            case 5:
                for(int i=0;i<line.length();i++){
                    if(i%6==3){
                       QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                       Item m(JU,BLACK,p);
                       items.push_back(m);
                    }
                }
                break;
            case 6:
                for(int i=0;i<line.length();i++){
                    if(i%6==3){
                       QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                       Item m(PAO,BLACK,p);
                       items.push_back(m);
                    }
                }
                break;
            case 7:
                for(int i=0;i<line.length();i++){
                    if(i%6==3){
                       QPoint p=QPoint(arrinf[i]-48,9-(arrinf[i+2]-48));
                       Item m(BING,BLACK,p);
                       items.push_back(m);
                    }
                }
                break;
            case 8:
                if(arrinf[0]=='R')yourcolor=0;
                else yourcolor=1;
                break;
            case 9:
                if(arrinf[0]=='r')redturn=true;
                else redturn=false;
                break;
            }
        }
    }
    if(yourcolor==0)this->setWindowTitle("Chinese Chess Server-您执红方");
    else this->setWindowTitle("Chinese Chess Server-您执黑方");
    update();
}
void MainWindow::on_pushButton_clicked(bool checked)
{
    QByteArray *array =new QByteArray;
    switch(QMessageBox::question(this,"Are you Sure?","你确定要认输吗? ", QMessageBox::Yes|QMessageBox::No)){
    case QMessageBox::Yes :
        timer->stop();
        array->clear();
        array->append("lose");
        this->readWriteSocket->write(array->data());
        if(redturn)QMessageBox::information(this,"Game Over! ","红方已认输! ",QMessageBox::Ok);
        else QMessageBox::information(this,"Game Over! ","黑方已认输! ",QMessageBox::Ok);
        break;
    case QMessageBox::No:
        return;
    default:
        return;
    }
}
