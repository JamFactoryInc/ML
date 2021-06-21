import Env
import math

Env.init()
Env.showMap()

path = []

Env.getStartNode().close()

print(Env.Node.openSet)

def fillOpenSet():
	for i in range(len(Env.Node.openSet)):
		print(i)
