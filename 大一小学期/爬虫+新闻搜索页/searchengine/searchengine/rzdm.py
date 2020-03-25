import random
import time
import datetime
import sqlite3
import os

def create_First():
    conn=sqlite3.connect('greatwork.db')
    c=conn.cursor()
    cursor=c.execute("select id,title,time,article from urllist where id>=2")
    filename="C:/Users/lenovo/Desktop/search.html"
    piece=""
    p=""
    for j in cursor:
        i=str(j[0])
        title=j[1]
        time0=j[2]
        article=j[3]
        flag=0
        tmp=random.randint(10,100)
        show=article[flag:flag+150+tmp]
        if flag+150+tmp < len(article):
            show=show+"..."
        piece='<tr><td><a href="http://127.0.0.1:8000/html'+i+'"><h3>'+title+'</h3>'+'</a></td></tr>'+'<tr><td><h4>'+time0+'</h4></td></tr>'+'<tr><td><p>'+show+'</p><tr><td><br/><br/></td></tr>'
        p=p+piece
    s = '<!DOCTYPE html><html><head><meta charset = "utf-8"><title></title><link rel="stylesheet" type="text/css" href="../static/bulma/css/bulma.min.css"><script type = "text/javascript" src = "../static/js/pages.js"></script></head><body onload="goPage(1,40);"><h1>新华网信息检索</h1><p>新闻总量: 1580</p><p>请输入搜索关键词: </p><form action = "/search" method = "post">{% csrf_token %}<input type = "text" name = "q"><input type = "submit" value = "搜索"></form><hr align="center" width="75%" /><table id="idData">'+ p + '</table><table width="60%" align="right"><tr><td><div id="barcon" name="barcon"></div></td></tr></table></body></html>'
    with open(filename,'a',encoding='utf-8') as fileobject:
        fileobject.write(s)

create_First()
