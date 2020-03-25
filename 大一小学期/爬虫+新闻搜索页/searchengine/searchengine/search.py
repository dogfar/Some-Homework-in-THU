# -*- coding: utf-8 -*-

from django.shortcuts import render
from django.views.decorators import csrf
from django.http import HttpResponse
from django.shortcuts import render_to_response
import jieba

import random

def create_HTML(text):
    import time
    import datetime
    import sqlite3
    conn=sqlite3.connect('greatwork.db')
    conn2=sqlite3.connect('dictionary.db')
    c=conn.cursor()
    c2=conn2.cursor()
    word=[]
    s=[]
    tmp=[]
    seg=[]
    starttime=time.clock()
    if len(text)>4:
        word=text.split(" ")
        word=list(set(word))
        if len(word)==1:
            seg_list=jieba.cut(word[0])
            seg=list(seg_list)
        else:
            seg=word
        for i in range(len(seg)):
            cursor=c2.execute("select idlist from dic where word='%s'"%seg[i])
            for row in cursor:
                tmp=row[0].split(",")
                tmp=list(set(tmp))
                for item in tmp:
                    if item not in s:
                        s.append(item)
    else:
        seg.append(text)
        cursor=c2.execute("select idlist from dic where word='%s'"%text)
        for row in cursor:
            s=row[0].split(",")
            s=list(set(s))
    filename='C:/Users/lenovo/Desktop/searchengine/searchengine/templates/result.html'
    p=""
    cnt=0
    for i in s:
        cnt=cnt+1
        cursor2=c.execute("select title,time,article from urllist where id='%s'"%i)
        piece=""
        r=""
        for j in cursor2:
            title=j[0]
            time0=j[1]
            article=j[2]
            flag=0
            tmp=random.randint(10,100)
            first=True
            for index in range(len(seg)):
                flag=article.find(seg[index])
                if flag!=-1 and first==True:
                    first=False
                    show='...'+article[flag:flag+150+tmp]
                    if flag+150+tmp < len(article):
                        show=show+"..."
                textnew="<font size='4' color='red'>"+seg[index]+"</font>"
                title=title.replace(seg[index],textnew)
                show=show.replace(seg[index],textnew)
            piece='<tr><td><a href="http://127.0.0.1:8000/html'+i+'"><h3>'+title+'</h3>'+'</a></td></tr>'+'<tr><td><h4>'+time0+'</h4></td></tr>'+'<tr><td><p>'+show+'</p></td></tr>+<tr><td><br/><br/></td></tr>'
        p=p+piece
    if(cnt>0):
        cnt=cnt-1
    cnt_str=str(cnt)
    endtime=time.clock()
    timestr=str((endtime-starttime))
    s = '<!DOCTYPE html><html><head><meta charset = "utf-8"><title></title><link rel="stylesheet" type="text/css" href="../static/bulma/css/bulma.min.css"><script type = "text/javascript" src = "../static/js/pages.js"></script></head><body onload="goPage(1,40);"><p>信息条目:'+cnt_str+'</p><p>搜索用时: '+timestr+'秒</p><form action = "/search" method = "post">{% csrf_token %}<input type = "text" name = "q"><input type = "submit" value = "搜索"></form><hr align="center" width="50%" /><table id="idData">'+ p + '</table><table width="60%" align="right"><tr><td><div id="barcon" name="barcon"></div></td></tr></table></body></html>'
    
    with open(filename,'w',encoding = 'utf-8') as fileobject:
        fileobject.write(s)

def search_post(request):
    if request.POST:
        text=request.POST['q']
        create_HTML(text)
    return render_to_response('result.html')
def start(request):
    return render_to_response('search.html')
def linking(request):
    import re
    s=''
    path=request.path
    l=re.search("\d+",path)
    r=l.group(0)
    s=s+r+'.html'
    return render_to_response(s)
