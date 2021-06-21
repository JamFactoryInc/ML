import numpy

labels = []
results = []

def addCommas(arr, width):
    writestring = ""
    for i in range(width):
        writestring += arr[i]
        if i < width-1:
            writestring += ','
    return writestring + '\n'

# 'labels' should be a 1D array of strings with the same size as the first dimension of the 'arrays' param
def gen(filename, labels, results):
    results = numpy.array(results)
            
    f = open('\\\\insrvr2\\folders$\\Kieran\\Desktop\\Py\\' + filename + '.csv','w')
    writestring = ""
    width = len(labels)
    
    writestring = addCommas(labels, width)
    for i in range(0, len(results)):
        writestring += addCommas(results[i,:], width)
    f.write(writestring)
    f.close()
    return writestring

#gen('test',['one','two','three'],[['1','2'],['3','4'],['5','6']])