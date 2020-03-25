import json
from loaddata import word_emb

news_dir="sinanews.train"
target_dir='data.json'

valid_dir="sinanews.test"
valid_target='valid.json'

emb=word_emb()

lab_list=[]
news_vec=[]
cross_entropy=[]

with open(valid_dir, "r", encoding="utf8") as f:
	for idx,line in enumerate(f.readlines()):
		l=line.split('\t')
		lab=l[1].split(' ')
		label_list=[]
		q=0
		maxlabel=-1
		la=-1
		for item in lab:
			q+=1
			tpl=item.split(':')
			label_list.append(int(tpl[1]))
			if q>1:
				if label_list[-1]>maxlabel:
					maxlabel=label_list[-1]
					la=q-2
		cross_entropy.append(la)
		lab_list.append(label_list)
		text_list=[]
		l=l[2].split(' ')
		cnt=0
		T=False
		for i in range(0,1500):
			if i>=len(l):
				T=True
				text_list.append(0)
			else:
				l0=emb.getemb(l[i])
				text_list.append(l0)
		if T:
			cnt+=1
		news_vec.append(text_list)		
f.close()

##print(cnt,"-----------------------------------------------------------------------------------------------\n")
data_dict = {'labeldata': lab_list, 'textdata': news_vec,'ce':cross_entropy}
with open(valid_target, "w", encoding="utf8") as f:
   	json.dump(data_dict, f)



