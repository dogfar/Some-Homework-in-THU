#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QPushButton>
#include <QDialog>
#include "pipe.h"
#include "setdialog.h"
namespace Ui {
class MainWindow;
}

#define RECT_WIDTH 10
#define RECT_LENGTH 80

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent=0);
    ~MainWindow();
    void Initpipe();
    void Releasepipe();
    void setcenter();
    void setnum(int n);
    void drawother(int v1,int v2,int o1,int o2,int o3);
public slots:
    void calculate();
    void setn(int n,int v1,int v2,int o1,int o2,int o3);
    void on_pushButton_clicked();
private slots:
    void on_pushButton_2_clicked(bool checked);
private:
    void setButton();
private:
    Ui::MainWindow *ui;
    int num;
    QVector<pipewid*> p_wids;
    QVector<pipehgt*> p_hgts;
    QVector<pipehgt*> p_inps;
    QVector<centerin*> p_cen;
    setdialog *setdl;
    ansdialog *ansdl;
    bool Ifset=false;
};

#endif // MAINWINDOW_H
