import torch 
import torch.nn as nn
import numpy as np
from torch.nn import functional as F

class CNN(nn.Module):
	def __init__(self,args):
		super(CNN,self).__init__()
		input_channel=1
		kernel_num=args['kernel_num']
		class_num=8
		emb_dim=300
		kernel_size=args['kernel_size']
		dropout=args['dropout']
		vocab_size=args['vocab_size']
		self.embed=nn.Embedding(vocab_size, emb_dim)
		pretrained_weight = np.array(args['preword'])
		self.embed.weight.data.copy_(torch.from_numpy(pretrained_weight))
		self.conv11=nn.Conv2d(input_channel, kernel_num, (kernel_size[0], emb_dim))
		self.conv12=nn.Conv2d(input_channel, kernel_num, (kernel_size[1], emb_dim))
		self.conv13=nn.Conv2d(input_channel, kernel_num, (kernel_size[2], emb_dim))
		self.dropout=nn.Dropout(dropout)
		self.fc=nn.Linear(len(kernel_size)*kernel_num, class_num)
	
	def forward(self,x):
		x=self.embed(x)
		x=x.unsqueeze(1)
		x1=self.conv11(x)
		x1=F.relu(x1.squeeze(3))
		x1=F.max_pool1d(x1,x1.size(2)).squeeze(2)
		x2=self.conv12(x)
		x2=F.relu(x2.squeeze(3))
		x2=F.max_pool1d(x2,x2.size(2)).squeeze(2)
		x3=self.conv13(x)
		x3=F.relu(x3.squeeze(3))
		x3=F.max_pool1d(x3,x3.size(2)).squeeze(2)

		x=torch.cat((x1,x2,x3),1)
		x=self.dropout(x)
		logit=self.fc(x)
		return logit