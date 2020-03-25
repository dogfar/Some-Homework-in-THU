#ifndef ITEM_H
#define ITEM_H
#include <QPainter>
#include <QDialog>
#include <QObject>
#include <QLabel>
#include <QLineEdit>
#include <QMessageBox>
#include <QGridLayout>
#include <QPushButton>
#include <QtNetwork/QHostAddress>
#include <QtNetwork/QNetworkInterface>
#include <QList>

enum ITEM_TYPE{
    JU=0,
    MA,
    XIANG,
    SHI,
    SHUAI,
    PAO,
    BING,
    numberoftypes,
};
enum ITEM_COLOR{
    RED=0,
    BLACK,
};
class Item{
public:
    Item(){}
    Item(ITEM_TYPE t,ITEM_COLOR c,QPoint p);
    ~Item();
public:
    ITEM_TYPE c_type;
    ITEM_COLOR c_color;
    QPoint c_p;
    bool Isshow;
};
class clientdialog:public QDialog{
    Q_OBJECT
public:
    QLabel *l1;
    QLineEdit *le1;
    QLabel *l2;
    QLineEdit *le2;
    QLabel *l3;
    QPushButton *pbok;
    QPushButton *pbcancel;
    clientdialog(QWidget *parent);
signals:
    void connectit();
public slots:
    void IsValid();
};
#endif // ITEM_H
