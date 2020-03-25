#ifndef SETDIALOG_H
#define SETDIALOG_H
#include <QDialog>
#include <QObject>
#include <QLineEdit>
#include <QLabel>
#include <QLayout>
#include <QPushButton>
#include <QValidator>

class setdialog:public QDialog{
    Q_OBJECT
public:
    QValidator *numvalidator = new QIntValidator(5,8,this);
    QLabel *numlabel = new QLabel("输入网格大小: ");
    QLineEdit *numLineEdit = new QLineEdit;
    QLabel *fluidlabel= new QLabel("液体入口编号i1: ");
    QLineEdit *fluidLineEdit= new QLineEdit;
    QLabel *waterlabel= new QLabel("清水入口编号i2: ");
    QLineEdit *waterLineEdit = new QLineEdit;
    QLabel *outlabel1= new QLabel("出口节点编号o1: ");
    QLabel *outlabel2= new QLabel("出口节点编号o2: ");
    QLabel *outlabel3= new QLabel("出口节点编号o3: ");
    QLineEdit *outLineEdit1 = new QLineEdit;
    QLineEdit *outLineEdit2 = new QLineEdit;
    QLineEdit *outLineEdit3 = new QLineEdit;
    QPushButton *button= new QPushButton;
    setdialog();
signals:
    void draw(int,int,int,int,int,int);
public slots:
    void IsValid();
};
class changewidthdialog: public QDialog{
    Q_OBJECT
public:
    QValidator *numvalidator = new QIntValidator(200,2000,this);//changing
    QLabel *widlabel = new QLabel("改变按钮宽度: ");
    QLineEdit *widLineEdit = new QLineEdit;
    QPushButton *button= new QPushButton;
    changewidthdialog();
signals:
    void changewid(double);
public slots:
    void inputover();
};
class ansdialog:public QDialog{
    Q_OBJECT
public:
    QLabel *label0= new QLabel("计算结果: ");
    QLabel *label1= new QLabel("出口管道1: ");
    QLabel *label2= new QLabel("出口管道2: ");
    QLabel *label3= new QLabel("出口管道3: ");
    QLineEdit *LineEdit1= new QLineEdit;
    QLineEdit *LineEdit2= new QLineEdit;
    QLineEdit *LineEdit3= new QLineEdit;
    QPushButton *button=new QPushButton;
    ansdialog();
};
#endif // SETDIALOG_H
