import json
import matplotlib.pyplot as plt
import numpy as np
import matplotlib.colors as mcolors
from PIL import Image

# BUGS:
# Two plots might not have comparible colors if they have different max values. Maybe set a false maximum and plot it on the graph?
# Whole plot shifts posiotion on the map if it does not contain the correct western-most (and maybe also northern/southern-most) coordinate. Find what this coordinate is and always alter the input data to have a value at this position


f = open('\\\\insrvr2\\folders$\\Kieran\\Desktop\\Py\\Geocoding\\final_postcodes.json', 'r')
I = Image.open('\\\\insrvr2\\folders$\\Kieran\\Desktop\\Py\\Geocoding\\australia4.png')
err = open('C:\\Users\\Kieran\\Downloads\\err.txt', 'a')
src = f.read()
codes = json.loads(src)

def transparent_cmap(cmap, N=255):
    "Copy colormap and set alpha values"

    mycmap = cmap
    mycmap._init()
    mycmap._lut[:,-1] = np.linspace(0, -0.5, N+4)
    return mycmap

mycmap = transparent_cmap(plt.cm.hot)

def getCoordinate(postcode):
	try:
		val = codes[str(postcode)]
		# x,y = -val[3]/6.4, val[4]/7.55
		x,y = -val[3]/6.4, val[4]/7.4
		return x,y
	except:
		# print('Invalid: ' + postcode)
		err.write(str(postcode) + '\n')
		return [0,0]

def plot(postcodes, artificialMaximum =1):
	pointSize = 2
	coordinates = []
	for postcode in postcodes:
		x, y = getCoordinate(postcode)
		if x == 0: 
			continue
		coordinates.append([round(x*100),round(y*100)])
	print(coordinates[1])
	# coordinates.append([round(1000/6.4),round(10550/7.55)])
	coordinates.append([round(1000/6.4),round(10550/7.4)])
	coordinates = np.array(coordinates)
	maxX = np.max(coordinates[:,0])
	maxY = np.max(coordinates[:,1])
	# minX = np.min(coordinates[:,0])+23
	# minY = np.min(coordinates[:,1])+83
	minX = np.min(coordinates[:,0])+13
	minY = np.min(coordinates[:,1])+92
	print(maxX)
	print(maxY)
	display = np.zeros((maxX-minX+pointSize,maxY-minY+pointSize))
	for coordinate in coordinates:
		for i in range(0,pointSize-1):
			for j in range(0,pointSize-1):
				display[coordinate[0]-minX+i,coordinate[1]-minY+j] = display[coordinate[0]-minX+i,coordinate[1]-minY+j] + 1
	display[0,0] = artificialMaximum
	fig, ax = plt.subplots(1, 1)
	
	ax.imshow(I)
	
	plt.imshow(display, cmap=transparent_cmap(plt.cm.hot), interpolation='none',norm=mcolors.LogNorm())
	plt.colorbar()
	

def plot2(postcodes, values):
	values2 = list(set(values))
	values2.insert(0, '')
	pointSize = 3
	coordinates = []
	for i in range(0, len(postcodes)-1):
		x, y = getCoordinate(postcodes[i])
		if x == 0: 
			continue
		coordinates.append([round(x*100),round(y*100), values2.index(values[i])])
	coordinates = np.array(coordinates)
	maxX = np.max(coordinates[:,0])
	maxY = np.max(coordinates[:,1])
	minX = np.min(coordinates[:,0])+23
	minY = np.min(coordinates[:,1])+83
	display = np.zeros((maxX-minX+pointSize,maxY-minY+pointSize))
	for coordinate in coordinates:
		for i in range(0,pointSize-1):
			for j in range(0,pointSize-1):
				display[coordinate[0]-minX+i,coordinate[1]-minY+j] = coordinate[2]
	fig, ax = plt.subplots(1, 1)
	ax.imshow(I)
	plt.imshow(display, cmap=transparent_cmap(plt.cm.gist_rainbow), interpolation='cubic')
	cbar = plt.colorbar()
	cbar.set_ticks(list())
	for index, label in enumerate(values2):
		x = 10
		y = (2 * index) / (2)
		cbar.ax.text(x, y, label)
	
def show():
	plt.show()
