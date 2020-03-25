import os
import sqlite3

conn=sqlite3.connect("greatwork.db")
c=conn.cursor()
cursor=c.execute("SELECT id,title,time,article from urllist where id>=2")

def writeit():
    for row in cursor:
        id=row[0]
        id_str=str(id)
        title=row[1]
        time0=row[2]
        word=row[3]
        word.replace(u'\xa9', u'')
        p=word.split('\n')
        r=''
        for j in p:
            r=r+'<p>'+j+'</p>'
        filename='pages/'+id_str+'.html'
        with open(filename,'w',encoding='utf-8') as fileobject:
            fileobject.write('<!DOCTYPE html>'
                             '\n<html>'
                             '\n<head>'
                             '\n<meta charset="utf-8">'
                             '\n<title>'+id_str+ '</title>'
                             '\n</head>'
                             '\n<body>'
                             '\n<h1>'+title+'</h1>'
                             '\n<p id="demo">'+time0+'</p>'+r+
                             '</body>'
                             '</html>')

writeit()
                         
