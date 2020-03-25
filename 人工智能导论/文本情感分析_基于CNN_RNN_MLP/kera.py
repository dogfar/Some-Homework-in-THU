import keras
from keras.layers.core import Activation, Dense
from keras.layers.embeddings import Embedding
from keras.layers.recurrent import LSTM
from keras.models import Sequential
from keras import optimizers
from keras.preprocessing import sequence
from keras.utils.np_utils import to_categorical
from keras.callbacks import ModelCheckpoint
from sklearn.metrics import f1_score
import numpy as np
import json
from loaddata import word_emb
from scipy.stats import pearsonr
import random

embedding=word_emb()
d={}
vd={}
target_dir='data.json'
valid_target='valid.json'
SHUFFLE=True

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

Xtrain=[]
ytrain=[]
for indx in indexlist:
	Xtrain.append(d['textdata'][indx])
	ytrain.append(d['ce'][indx])

Xtest=[]
ytest=[]

for idx in range(len(vd['labeldata'])):
	Xtest.append(vd['textdata'][idx])
	ytest.append(vd['ce'][idx])

Xtrain=np.array(Xtrain)
Xtest=np.array(Xtest)


ytrain=to_categorical(ytrain,8)
ytest=to_categorical(ytest,8)

ite=np.array(embedding.ite)

EMBEDDING_SIZE= 300
HIDDEN_LAYER_SIZE=100
vocab_size=336537

checkpointer = ModelCheckpoint(filepath="weights-0.5drop.hdf5", verbose=1, save_best_only=True,mode='min')
w=embedding.ite
model=Sequential()
model.add(Embedding(vocab_size,EMBEDDING_SIZE,input_length=1500,weights=[ite],mask_zero=True,trainable=False))###
model.add(LSTM(HIDDEN_LAYER_SIZE,dropout=0.5,recurrent_dropout=0.5))
model.add(Dense(8,activation='sigmoid'))

##FOR TEST
##model.load_weights(filepath="weights-0.5drop.hdf5")
ada=optimizers.Adam(lr=0.001)
model.compile(loss="categorical_crossentropy",optimizer=ada,metrics=["accuracy"])

BATCH_SIZE = 128
NUM_EPOCHS = 15

model.fit(Xtrain, ytrain, batch_size=BATCH_SIZE, epochs=NUM_EPOCHS,validation_split=0.1,shuffle=False,callbacks=[checkpointer])


'''
##FOR TEST
predict=model.predict(Xtest)
pred=np.argmax(predict,axis=1)
total=0
correct=0
coef=0
v=np.array(vd['ce'])
fscore=f1_score(v,pred,average='macro')
print(v)
print(pred)
for indx in range(len(pred)):
	total+=1
	v0=np.array(vd['labeldata'][indx][1:])
	c=pearsonr(predict[indx],v0)
	coef+=c[0]
	if ytest[indx][pred[indx]]==1:
		correct+=1
print('acc:',correct/total,'coef:',coef/total,'Fscore:',fscore)'''