import pyodbc as pydb
import GenerateCSV as csv
import Plot
import numpy as np
import pandas as pd
import heatmap

# serverName = "tcp:insql2,13000"
# dbName = "DSExam"

# connection = pydb.connect("Driver=SQL Server Native Client 11.0;"
#     +"Server=" + serverName + ";"
#     +"Database=" + dbName + ";"
#     +"Trusted_Connection=yes;")

serverName = "insql1,13000"
dbName = "MyPayNow1"
username = "sa"
password = "inmarket3142"

connection = pydb.connect("Driver=SQL Server Native Client 11.0;"
    +"Server=" + serverName + ";"
    +"Database=" + dbName + ";"
    +"UID=" + username + ";"
    +"PWD=" + password + ";"
    +"Trusted_Connection=yes;")


cursor = connection.cursor()

def genSpaces(str, valLen, char=' '):
    ret = ''
    for _ in range(len(str) - valLen):
        ret += char
    return ret

maxResultLen = 35
maxResults = 719
targetSQLFile = ''

results = []

sqlVars = ['']

for sqlVar in sqlVars:
    csv.labels = []
    csv.results = []
    f = open("\\\\insrvr2\\folders$\\Kieran\\Desktop\\Py\\pyodbc\\testsql.sql", "r")
    sqlString = f.read()
    sqlString = sqlString.replace('$', sqlVar)
    
    cursor.execute(sqlString)

    print('\n')
    rows = cursor.fetchall()
    print('Showing ' + str( min(maxResults, len(rows))) + ' of ' + str(len(rows)) + ' rows')
    print('')
    columns = [column[0] for column in cursor.description]
    concat = ""
    for col in columns:
        if len(col) > maxResultLen:
            col = col[:maxResultLen]
        concat += col + genSpaces('', -maxResultLen + len(col)) + ' \u2502 '
        csv.labels.append(col)
        results.append([])
    print(concat)
    concat = ''
    for col in columns:
        concat += genSpaces('', -maxResultLen, char='\u2500') + '\u2500\u253c\u2500'
    print(concat)


    for i in range(0, len(rows)):
        arr = []
        concat = ''
        for j in range(len(rows[i])):
            concat += str(rows[i][j])[:maxResultLen] + genSpaces('', -maxResultLen + len(str(rows[i][j]))) +' \u2502 '
            if str(rows[i][j]) != 'None':
                arr.append(str(rows[i][j]))
            else:
                arr.append(str(''))
            results[j].append(rows[i][j])
        
        csv.results.append(arr)
        if i < maxResults:
            print(concat)    

    

csv.gen('temp' + str(sqlVar), csv.labels, csv.results)
# df = pd.read_csv('\\\\insrvr2\\folders$\\Kieran\\Desktop\\Py\\' + 'temp' + '.csv')
# df.to_clipboard(excel = True)

# res = np.rot90(csv.results)
# res = np.array(res)
# Plot.BarChart(list(res[1]), list(res[0]))

#Plot.show()

# heatmap.plot(results[0])
# heatmap.plot(results[0])
# # heatmap.plot2(results[0],results[1])
# heatmap.show()

f.close()
