import os
import jieba
import sqlite3

conn=sqlite3.connect("greatwork.db")
c=conn.cursor()
dictconn=sqlite3.connect("dictionary.db")
dic=dictconn.cursor()
splited=[]

def stopwordslist(filepath):
    stopwords = [line.strip() for line in open(filepath, 'r', encoding='gbk').readlines()]  
    return stopwords

cur=c.execute("SELECT id,title,article from urllist where id>=2")
for row in cur:
    id0=row[0]
    id_str=str(id0)+","
    title=row[1]
    word0=row[2]
    seg_list_title=jieba.cut(title)
    seg_list_word=jieba.cut(word0)
    wordlist=[]
    stopwords=stopwordslist('C:/Users/lenovo/Desktop/stopwords.txt')
    for w in seg_list_title:
        if w not in stopwords and w not in wordlist:
             wordlist.append(w)
    
    for wo in seg_list_word:
        if wo not in stopwords and wo not in wordlist:
             wordlist.append(wo)

    print(id_str)
    
    for worditem in wordlist:
        if worditem not in splited:
            splited.append(worditem)
            dic.execute("insert into dic(word,idlist)\
                        VALUES(?,?)",(worditem,id_str))
        else:
            cursor=dic.execute("SELECT word,idlist from dic where word='%s'"%worditem)
            for row in cursor:
                wordtmp=row[1]+id_str
            dic.execute("update dic set idlist='%s' where word='%s'"%(wordtmp,worditem))
    dictconn.commit()
dictconn.close()
conn.close()
    
