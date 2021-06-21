from random import Random
import numpy as np
import matplotlib.pyplot as plt
import random
import math

map = []

startPos = None
endPos = None

def init():
	genMap((100,100))
	createStartPos()
	map[startPos[0]][startPos[1]].value = 'S'
	map[endPos[0]][endPos[1]].value = 'E'
	

def genMap(size, threshold = .2):
	global map

	linx = np.linspace(0,5,size[0],endpoint=False)
	liny = np.linspace(0,5,size[1],endpoint=False)
	x,y = np.meshgrid(linx,liny)
	for i, v1 in enumerate(list(perlin(x,y,seed=random.randint(0,1000000)))):
		map.append([])
		for j, v2 in enumerate(list(v1)):
			map[i].append(Node((i,j), 'X' if v2 > threshold else ' '))

def showMap():
	concat = ''
	for i in map:
		concat += '\n'
		for j in i:
			concat += j.value
	print(concat)

def createStartPos():
	global startPos,endPos
	mapsize = (len(map)-1,len(map[0])-1)
	startPos = (random.randint(0,1) * mapsize[0], random.randint(0,1) * mapsize[1])
	while endPos == startPos or endPos == None:
		endPos = (random.randint(0,1) * mapsize[0], random.randint(0,1) * mapsize[1])

def getStartNode():
	return map[startPos[0]][startPos[1]]
	
def getEndNode():
	return map[endPos[0]][endPos[1]]
			
def perlin(x,y,seed=0,scale=8):
	x *= scale
	y *= scale
	# permutation table
	np.random.seed(seed)
	p = np.arange(256,dtype=int)
	np.random.shuffle(p)
	p = np.stack([p,p]).flatten()
	# coordinates of the top-left
	xi = x.astype(int)
	yi = y.astype(int)
	# internal coordinates
	xf = x - xi
	yf = y - yi
	# fade factors
	u = fade(xf)
	v = fade(yf)
	# noise components
	n00 = gradient(p[p[xi]+yi],xf,yf)
	n01 = gradient(p[p[xi]+yi+1],xf,yf-1)
	n11 = gradient(p[p[xi+1]+yi+1],xf-1,yf-1)
	n10 = gradient(p[p[xi+1]+yi],xf-1,yf)
	# combine noises
	x1 = lerp(n00,n10,u)
	x2 = lerp(n01,n11,u) # FIX1: I was using n10 instead of n01
	return lerp(x1,x2,v) # FIX2: I also had to reverse x1 and x2 here

def lerp(a,b,x):
    "linear interpolation"
    return a + x * (b-a)

def fade(t):
    "6t^5 - 15t^4 + 10t^3"
    return 6 * t**5 - 15 * t**4 + 10 * t**3

def gradient(h,x,y):
    "grad converts h to the right gradient vector and return the dot product with (x,y)"
    vectors = np.array([[0,1],[0,-1],[1,0],[-1,0]])
    g = vectors[h%4]
    return g[:,:,0] * x + g[:,:,1] * y

class Node:
	nodes = []
	openSet = set()
	closedSet = set()

	def __init__(self, pos, value):
		self.value = value
		self.pos = pos
		self.closed = False
		self.distance = None
		Node.nodes.append(self)
		

	def distanceTo(self, other):
		return math.sqrt((self.pos[0] - other.pos[0])**2 + (self.pos[1] - other.pos[1])**2)

	def close(self):
		self.distance = self.distanceTo(getEndNode())
		self.closed = True
		Node.closedSet.add(self)
		if len(Node.openSet) > 0:
			Node.openSet.remove(self)
		Node.openSet |= self.neighbors()

	def neighbors(self):
		ret = set()
		for n in Node.nodes:
			if (abs(n.pos[0] - self.pos[0]) <= 1 and abs(n.pos[1] - self.pos[1]) <= 1) and not n.closed and n.pos != self.pos:
				ret.add(n)
		return ret
	
	def __str__(self):
		return '(' + str(self.pos[0]) + ', ' + str(self.pos[1]) + ', ' + self.value + ')'

	def __repr__(self):
		return str(self)

	def __hash__(self):
		return hash(self.pos)
	def __eq__(self, other):
		return self.pos == other.pos
