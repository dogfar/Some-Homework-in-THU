import sqlite3
import time
from html.parser import HTMLParser

def get_page(url):
    time.sleep(2)
    import urllib.request
    headers = {'User-Agent':'Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN) AppleWebKit/523.15 (KHTML, like Gecko, Safari/419.3) Arora/0.3 (Change: 287 c9dfb30)",'}
    print ("8")
    req = urllib.request.Request(url=url,headers=headers)
    s=urllib.request.urlopen(req).read()
    print ("9")
    s=s.decode("utf-8","ignore").replace(u'\u3000', u'')
    return s
  #  except:
   #     return ""
class myparser(HTMLParser):
    def __init__(self):
        
        HTMLParser.__init__(self)
        
        self.flag=False
        
        self.text=[]
        
    def handle_starttag(self,tag,attrs):
        if tag== 'title':
            self.flag=True

    def handle_data(self,data):
        if self.flag==True:
            self.text.append(data)

    def handle_endtag(self,tag):
        if tag=='title':
            self.flag=False

class myparser2(HTMLParser):
    def __init__(self):
        
        HTMLParser.__init__(self)
        
        self.flag=False
        
        self.text=[]
        
    def handle_starttag(self,tag,attrs):
        if ('class','h-time') in attrs:
            self.flag=True

    def handle_data(self,data):
        if self.flag==True:
            self.text.append(data)

    def handle_endtag(self,tag):
        if tag=='span':
            self.flag=False

class myparser3(HTMLParser):
    def __init__(self):
        
        HTMLParser.__init__(self)
        
        self.flag=False
        
        self.text=[]
        
    def handle_starttag(self,tag,attrs):
        if tag== 'p':
            self.flag=True

    def handle_data(self,data):
        if self.flag==True:
            self.text.append(data)

    def handle_endtag(self,tag):
        if tag=='p':
            self.flag=False

conn=sqlite3.connect("greatwork.db")
c=conn.cursor()
c2=conn.cursor()

cursor = c.execute("SELECT id,url from htmllist where id>500")
for row in cursor:
    parser=myparser()
    parser2=myparser2()
    parser3=myparser3()
    article=""
    id=row[0]
    url=row[1]
    s=get_page(url)
    parser.feed(s)
    parser.close()
    parser2.feed(s)
    parser2.close()
    parser3.feed(s)
    parser3.close()
    title=parser.text[0]
    
    if len(parser2.text)==0:
        time0="/"
    else:
        time0=parser2.text[0]
    for index in range(len(parser3.text)):
        article+=parser3.text[index]
        
    c2.execute("insert into urllist(id,url,title,time,article)\
            VALUES(?,?,?,?,?)",(id,url,title,time0,article))
    print (id)
    print (url)
    print (title)
    print (time0)
    conn.commit()

cursor=c.execute("SELECT id,url,title,time from urllist")
for row in cursor:
    print (row[0])
    print (row[1])
    print (row[2])
    print (row[3])

conn.close()
                         
    
    
    
    
