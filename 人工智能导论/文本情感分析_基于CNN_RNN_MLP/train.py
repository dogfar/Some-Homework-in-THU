import torch 
import torch.nn as nn
from torch.nn import functional as F
from model import CNN
import numpy as np
import json
from torch.utils.data import Dataset, DataLoader
from loaddata import word_emb
from scipy.stats import pearsonr
from sklearn.metrics import f1_score
import random
import pickle

weightFile='weight'
target_dir='data.json'
valid_target='valid.json'
embedding=word_emb()
d={}
data={}
vd={}
args={'kernel_num':100,'kernel_size':[3,4,5],'dropout':0.5,'vocab_size':336537,'preword':embedding.ite}
argstest={'kernel_num':100,'kernel_size':[3,4,5],'dropout':0,'vocab_size':336537,'preword':embedding.ite}
EPOCH=20
BATCH_SIZE=128
SHUFFLE=True
LR=0.001
LOSS_MODE='cel'

with open(target_dir,'r',encoding='utf-8') as f:
	d=json.load(f)
	f.close()

with open(valid_target,'r',encoding='utf-8') as f:
	vd=json.load(f)
	f.close()

max_len=len(d['labeldata'])
indexlist=[i for i in range(max_len)]

if SHUFFLE:
	random.shuffle(indexlist)

labellist=[]
textlist=[]
ce=[]
for indx in indexlist:
	textlist.append(d['textdata'][indx])
	ce.append(d['ce'][indx])

data['textdata']=textlist
data['ce']=ce

class mydataset(Dataset):
	def __init__(self):
		self.textdata=torch.LongTensor(data['textdata'])
		self.labeldata=torch.LongTensor(data['ce'])

	def __len__(self):
		return len(self.textdata)

	def __getitem__(self,index):
		return self.textdata[index],self.labeldata[index]

class validset(Dataset):
	def __init__(self):
		self.textdata=torch.LongTensor(vd['textdata'])
		self.labeldata=torch.LongTensor(vd['ce'])

	def __len__(self):
		return len(self.textdata)

	def __getitem__(self,index):
		return self.textdata[index],self.labeldata[index]

text=mydataset()
textloader=DataLoader(dataset=text,batch_size=BATCH_SIZE,shuffle=False)

model=CNN(args)
optimizer=torch.optim.Adam(model.parameters(),lr=LR)

cnt=0
calloss = nn.CrossEntropyLoss()

for epoch in range(EPOCH):
	aveloss=0
	batchnum=0
	for text,label in textloader:
		batchnum+=1
		optimizer.zero_grad()
		out=model(text)
		loss=calloss(out,label)
		loss.backward()
		aveloss+=loss.item()
		optimizer.step()
	aveloss/=batchnum
	print('Epoch:',epoch,'aveloss:',aveloss)
	torch.save(model.state_dict(), weightFile+str(epoch)+'.pkl')
'''
##FOR TEST
test=validset()
testloader=DataLoader(dataset=test,batch_size=BATCH_SIZE,shuffle=False)
testmodel=CNN(argstest)
opt=torch.optim.Adam(testmodel.parameters(),lr=LR)

correct=0
total=0
epoch=8
coef=0
lc=[]
testmodel.load_state_dict(torch.load(weightFile+str(epoch)+'.pkl')) 
for text,label in testloader:
	opt.zero_grad()
	out=testmodel(text)
	for ind in range(len(out)):
		v0=vd['labeldata'][ind][1:]
		ol=[]
		for i in range(len(out[ind])):
			ol.append(float(out[ind][i]))
		c=pearsonr(ol,v0)
		coef+=c[0]
	prediction = torch.argmax(out, 1)
	lc.append(prediction)
	correct += (prediction == label).sum().float()
	total += len(label)
lc=np.array(lc)
v=np.array(vd['ce'])
print('acc:',correct.item()/total,'Coef:',coef/total,'F-score:',f1_score(v,lc,average='macro'))'''