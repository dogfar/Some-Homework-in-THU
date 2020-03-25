import time
import random
import HTMLParser
import sqlite3


#SQL
conn=sqlite3.connect("greatwork.db")
c=conn.cursor()
c.execute('''create table htmllist
        (id int primary key,
        url text);''')
conn.commit()

#WEBCRAWLER
def get_page(url):
    try:
        import urllib.request
        headers = {'User-Agent':'Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN) AppleWebKit/523.15 (KHTML, like Gecko, Safari/419.3) Arora/0.3 (Change: 287 c9dfb30)",'}
        req = urllib.request.Request(url=url,headers=headers)
        s=urllib.request.urlopen(req).read()
        s=s.decode("gbk","ignore")
        return s
    except:
        return ""
        
def get_next_page1(page):
    start_link=page.find("http://www.xinhuanet.com/politics/")
    if (start_link== -1):
        return None,0
    end_link=page.find("htm",start_link)
    end_link=end_link+3
    url=page[start_link:end_link]
    if(url.count("/"))>10:
        return None,0
    return url,end_link

def get_next_page2(page):
    start_link2=page.find("http://www.xinhuanet.com/legal/")
    if(start_link2==-1):
        return None,0
    end_link2=page.find("htm",start_link2)
    end_link2=end_link2+3
    url=page[start_link2:end_link2]
    if(url.count("/"))>10:
        return None,0
    return url,end_link2

def get_all_links(page):
    links=[]
    page2=page
    while True:
        url,endpos=get_next_page1(page)
        if url:
            links.append(url)
            page=page[endpos:]
        else:
            break;
    while True:
        url,endpos=get_next_page2(page2)
        if url:
            links.append(url)
            page2=page2[endpos:]
        else:
            break;
    return links

def union(a,b):
    for e in b:
        if e not in a:
            a.append(e)


def crawl_web(seed):
    count=0
    tocrawl=[seed]
    crawled=[]
    while tocrawl:
        page=tocrawl.pop()
        if page not in crawled:
            count=count+1
            c.execute("insert into htmllist(id,url)\
                VALUES(?,?)",(count,page))
            conn.commit()
            print (count)
            print (page)
            time.sleep(3)
            content = get_page(page)
            outlinks = get_all_links(content)
            union(tocrawl,outlinks)
            crawled.append(page)


crawl_web("http://www.xinhuanet.com/")
conn.close()
