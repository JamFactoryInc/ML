import json
from numpy import dtype, genfromtxt
from collections import OrderedDict

src = list(genfromtxt('\\\\insrvr2\\folders$\\Kieran\\Desktop\\TF\\test.csv', delimiter=',', dtype=str))
words = []

for s in src:
	words.append(s)

vocab = OrderedDict()

serial = 0

for s in words:
	if s not in vocab.keys():
		vocab[s] = serial
		serial += 1

print(json.dumps(vocab))

f = open('\\\\insrvr2\\folders$\\Kieran\\Desktop\\TF\\test.csv', 'w')
f.write(json.dumps(vocab))
f.close()