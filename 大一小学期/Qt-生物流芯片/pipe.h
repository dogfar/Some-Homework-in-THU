#ifndef PIPE_H
#define PIPE_H

#include <QPushButton>
#include <QWidget>
#include <QPushButton>
#include <QMouseEvent>
#include <setdialog.h>
class pipewid:public QPushButton{
    Q_OBJECT
public:
    pipewid(QWidget *parent);
    pipewid(int ipt,QWidget *parent);
    int index;
    bool Ifhide;
    bool Ifinp;
    double wid;
    int hgt;
    int startx,starty;
    changewidthdialog* c;
    void mousePressEvent(QMouseEvent *e);
signals:
    void right();
public slots:
    void redraw(double tmpwid);
    void setitflat();
    void showdialog();
};
class pipehgt:public QPushButton{
    Q_OBJECT
public:
    pipehgt(QWidget *parent);
    pipehgt(int ipt,QWidget *parent);
    int index;
    bool Ifhide;
    bool Ifinp;
    int hgt;
    double wid;
    int startx,starty;
    changewidthdialog* c;
    void mousePressEvent(QMouseEvent *e);
signals:
    void right();
public slots:
    void redraw(double tmpwid);
    void setitflat();
    void showdialog();
};
class centerin:public QPushButton{
    Q_OBJECT
public:
    int x,y;
    centerin(QWidget *parent);
};
#endif // PIPE_H
