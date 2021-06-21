import matplotlib.pyplot as plt
import numpy as np
import math
import matplotlib.patheffects as PathEffects

def plotPoints(xdata, ydata, error = [], color='#009999', label='Data', width='auto', xlabel = '', ylabel = '', ax=None):
    if(ax==None):
        fig, ax = plt.subplots()
    p = np.polyfit(xdata,ydata)
    if(len(error) == len(xdata)):
        ax.errorbar(xdata,ydata,error,marker='o',color=color, linestyle='None')
    else:
        ax.plot(xdata,ydata, 'o',color=color,label=label)
    if width=='auto':
        linespace = np.linspace(0,max(xdata),res)
    else:
        linespace = np.linspace(0,width,res)
    if xlabel != '':
        ax.xlabel(xlabel)
    if ylabel != '':
        ax.ylabel(ylabel)
    return ax

def plotLineChart(xdata, ydata, error = [], color='#000099', label='Line Chart', xlabel = '', ylabel = '', ax=None, labelYValues=False):
    if(ax==None):
        fig, ax = plt.subplots()
    ax.plot(xdata,ydata, color=color,label=label)
    if xlabel != '':
        ax.xlabel(xlabel)
    if ylabel != '':
        ax.ylabel(ylabel)
    if(len(error) == len(xdata)):
        ax.errorbar(xdata,ydata,error,marker='o',color=color, linestyle='None')
    else:
        ax.plot(xdata,ydata, 'o',color=color)  
    if labelYValues:
        for i in range(0, len(xdata) - 1):
            plt.annotate(str(round(ydata[i],1)),(xdata[i],ydata[i]),textcoords="offset points", xytext=(10,0), ha='center') 
    return ax

def plotPoly(xdata, ydata, error = [], degree=1, color='#009900', label='Regression', res=100, width='auto', xlabel = '', ylabel = '', ax=None):
    if(ax==None):
        fig, ax = plt.subplots()
    p = np.polyfit(xdata,ydata,degree)
    if(len(error) == len(xdata)):
        ax.errorbar(xdata,ydata,error,marker='o',color=color, linestyle='None')
    else:
        ax.plot(xdata,ydata, 'o',color='#009900')
    if width=='auto':
        linespace = np.linspace(0,max(xdata),res)
    else:
        linespace = np.linspace(0,width,res)

    fn = 0

    for i in range(0,degree+1):
        fn += p[degree - i] * linespace**i
    
    ax.plot(linespace,fn,label=label, color=color)
    if xlabel != '':
        ax.xlabel(xlabel)
    if ylabel != '':
        ax.ylabel(ylabel)
    return ax

def stdev(arr):
    mean = sum(arr)/len(arr)
    sumDist = 0
    for i in arr:
        sumDist += abs(mean - i)**2
    sumDist /= len(arr)
    return math.sqrt(sumDist)

def TwoDArrayToYvaluesSTDEV(arr2D):
    avgs = []
    err = []
    for arr in arr2D:
        mean = sum(arr)/len(arr)
        avgs.append(mean)
        err.append(stdev(arr))
    return avgs, err
    
def PieChart(labels, values, colors=[]):
    fig, ax = plt.subplots()

    if (len(colors) == len(labels)):
        ax.pie(values, labels=labels, autopct=lambda val: str(round( val/100 * sum(values),1)) + '\n' + str(round(val, 1)) + '%',
         startangle=90, colors=colors) 
    else:
        ax.pie(values, labels=labels, autopct=lambda val: str(round( val/100 * sum(values),1)) + '\n' + str(round(val, 1)) + '%',
         startangle=90) 


def BarChart(values, labels,colors=['#FF9999','#9999FF'], values2=[], legend=['Before','After'], annotateValues=True, annotateDelta=False, deltaInPct = False):
    arr = []
    for item in values:
        arr.append(float(item.replace('\'','')))
    values = arr
    arr = []
    for item in values2:
        arr.append(float(item.replace('\'','')))
    values2 = arr
    
    fig, ax = plt.subplots()
    spacing=[]
    for i in range(len(values)):
        spacing.append(i)

    if(len(values2) == len(values)):
        spacing = np.arange(len(values))
        ax.bar(spacing+0.2, np.zeros(len(values)) ,tick_label=labels, width=0.8)
        ax.bar(spacing, values, color=colors[0],width=0.4, label=legend[0])
        ax.bar(spacing + 0.4, values2, color=colors[1],width=0.4, label=legend[1])
        
        for i in range(len(values)):
            if annotateValues:
                plt.annotate(str(round(values[i],1)),(spacing[i],values[i]),textcoords="offset points", xytext=(0,3), ha='center') 
                plt.annotate(str(round(values2[i],1)),(spacing[i]+0.4,values2[i]),textcoords="offset points", xytext=(0,3), ha='center')
            if annotateDelta:
                if deltaInPct:
                    txt = plt.annotate('Δ=' + str(round((values2[i] - values[i])/values[i] * 100,1)) + '%',(spacing[i]+0.2,(values[i] + values2[i]) /4),
                        textcoords="offset points", xytext=(0,3), ha='center',color=("#00FF00" if (values2[i] - values[i] > 0) else "#FF0000"),size=12)
                    txt.set_path_effects([PathEffects.withStroke(linewidth=1, foreground='black')])
                else:
                    txt = plt.annotate('Δ=' + str(round(values2[i] - values[i],1)),(spacing[i]+0.2,(values[i] + values2[i]) /4),
                        textcoords="offset points", xytext=(0,3), ha='center',color=("#00FF00" if (values2[i] - values[i] > 0) else "#FF0000"),size=12)
                    txt.set_path_effects([PathEffects.withStroke(linewidth=1, foreground='black')])
            

        ax.legend() 
    else:
        print(values)
        ax.bar(spacing, values, tick_label=labels, color=colors[0])
        for i in range(len(values)):
            if annotateValues:
                plt.annotate(str(values[i]),(spacing[i],values[i]),textcoords="offset points", xytext=(0,3), ha='center') 

def show():
    plt.show()





#plotPoly([1,2,3,4,5,6,7],[1,2,4,7,9,11,12], degree=0,error=[0,0,0,0,0,0,0])

#avgs, err = TwoDArrayToYvaluesSTDEV([[1,2,3,2,1,2,2,1,2,2,2,1,3,2],[3,5,4,4,3,5,4,4,3,3,4,5,4,4,4,5,4],[7,6,7,8,8,7,7,7,7,7,6,7,8,7,7,7,7],[10,10,10,10,10,10,10,10,10,10,10,11]])
#plotPoly([1,2,3,4],avgs, degree=2,error=err)

# ax = plotLineChart([1,2,3,4],[1,2,4,3], labelYValues=True)
# plotPoly([1,2,3,4],[1,4,1,2],degree=3,ax=ax)

# plt.xlim([0, 5])
# plt.ylim([0, 5])
# PieChart(['male','female'], [69,60],colors=['#0077FF','#FF5599'])
# BarChart([1,2,3,1],['one','two','three','four'], values2=[1.1,2.1,2.9,1.5],annotateDelta=True,deltaInPct=True)
# ax.legend()
# plt.show()

