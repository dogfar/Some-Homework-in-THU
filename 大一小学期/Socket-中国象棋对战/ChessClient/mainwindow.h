#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QPixmap>
#include <QPoint>
#include <QPainter>
#include <QMediaPlayer>
#include <QtNetwork>
#include <item.h>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();
    void paintEvent(QPaintEvent *e);
    void InitItems();
    void DrawItem(Item m, QPainter& p);
    void changeitempoint(QPoint p1,QPoint p2);
    bool deleteitempoint(QPoint pt, bool &Isshuaideleted);
    void timerEvent(QTimerEvent *event);
    bool ifhasbeenchess(QPoint pt,Item& tp );
    void showit(Item m,bool isseen);
    void jiangjunplay();
    void mousePressEvent(QMouseEvent *e);
    bool pdduijiang(Item it,QPoint pt);
    void deleteitems();
    void savefilecon();
    void readfilecon();
public slots:
    void connecthost();
    void recvmessage();
    void savefile();
    void readfile();
    void newgame();
    void settingit();
    void showtimelimit();
public:
    bool jumovable(Item i,QPoint pt);
    bool mamovable(Item i,QPoint pt);
    bool xiangmovable(Item i,QPoint pt);
    bool shimovable(Item i,QPoint pt);
    bool shuaimovable(Item i,QPoint pt);
    bool paomovable(Item i,QPoint pt);
    bool bingmovable(Item i,QPoint pt);
    bool movable(Item i,QPoint pt);
private slots:
    void on_pushButton_clicked(bool checked);

private:
    Ui::MainWindow *ui;
    QVector<Item> items;
    clientdialog *cd;
    Item chosenitem;
    bool redturn;
    bool existing;
    QMediaPlayer *qmp;
    int a;
    QTimer *timer;
    QTcpSocket *readwritesocket;
    int yourcolor;
};

#endif // MAINWINDOW_H
