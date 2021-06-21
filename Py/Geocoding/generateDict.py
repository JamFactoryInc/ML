import json
import requests
import random

# MAPQUEST API
# f = open('C:\\Users\\Kieran\\Downloads\\postcodes.json', 'a')
# f.write('{\n')
# f.close()
# for postalCode in range(800,9729):
# 	f = open('C:\\Users\\Kieran\\Downloads\\postcodes.json', 'a')
# 	response = requests.get("http://open.mapquestapi.com/geocoding/v1/address?key=NOsXsaIvUlQaArYNGdI7aNuyRN7pvfZB&country=Australia&postalCode=" + str(postalCode)).json()
# 	response_dict = response['results'][0]['locations']
# 	location = response_dict[0]
# 	if(location['latLng']['lat'] != -24.776109):
# 		concat = '"'+str(postalCode) +'":['+'"'+str(postalCode)+'","'+location['adminArea6'] + '","' + location['adminArea3'] + '",' + str(location['latLng']['lat']) + ',' +str(location['latLng']['lng']) + '],\n'
# 		f.write(concat)
# 		print('Successfully added ' + str(postalCode) + '.')
# 	else:
# 		print('Skipped ' + str(postalCode) + ' as it does not exist')
# 	f.close()

# f = open('C:\\Users\\Kieran\\Downloads\\postcodes.json', 'a')
# f.write('}')
# f.close()



# POSITIONSTACK API
# f = open('C:\\Users\\Kieran\\Downloads\\postcodes2.json', 'a')
# f.write('{\n')
# f.close()
# for postalCode in range(200,799):
# 	f = open('C:\\Users\\Kieran\\Downloads\\postcodes2.json', 'a')
# 	err = open('C:\\Users\\Kieran\\Downloads\\err.txt', 'a')

# 	postalCode = str(postalCode).zfill(4)
# 	print('Querying postalcode ' + postalCode)
# 	response = requests.get("http://api.positionstack.com/v1/forward?access_key=32c62dc140e2d5ccf9c4d3bab2a76174&query=Australia " + postalCode).text
# 	response_dict = json.loads(response)['data']
# 	if type(response_dict) == list and len(response_dict) > 0:
# 		err.write(postalCode + '\n')
# 		continue
# 	response_dict = response_dict[0]
# 	if(response_dict['country'] == 'Australia' and response_dict['latitude'] != -23.992438):
# 		f.write( '"'+postalCode +'":['+'"'+postalCode+'","'+ (response_dict['locality'] if response_dict['locality'] else '') + '","' + (response_dict['region_code'] if response_dict['region_code'] else '') + '",' + str(response_dict['latitude']) + ',' +str(response_dict['longitude']) + '],\n')
# 		print('Successfully added ' + postalCode + '.')
# 	else:
# 		print('Skipped ' + postalCode + ' as it does not exist')
# 	f.close()
# 	err.close()
# f = open('C:\\Users\\Kieran\\Downloads\\postcodes2.json', 'a')
# f.write('}')
# f.close()

# Parse australian_postcodes
# f = open('C:\\Users\\Kieran\\Downloads\\postcodes3.json', 'a')
# src = open('C:\\Users\\Kieran\\Downloads\\australian_postcodes.json', 'r')
# text = src.read()
# src.close()
# json = json.loads(text)
# f.write('{\n')
# done = ""
# for d in json:
# 	if done !=d['postcode']:
# 		f.write( '"'+d['postcode'] +'":['+'"'+d['postcode']+'","'+ (d['locality'] if d['locality'] else '') + '","' + (d['state'] if d['state'] else '') + '",' + str(d['lat']) + ',' +str(d['long']) + '],\n')
# 		done = d['postcode']
# f.write('}')
# f.close()




# cross-reference all 4 sources into final_postcodes.json
def myround(x, base=.05):
    return base * round(x/base)
def most_frequent(List):
    return max(set(List), key = List.count)

p1src = open('\\\\insrvr2\\folders$\\Kieran\\Desktop\\Py\\Geocoding\\postcodes.json', 'r')
p1 = json.loads(p1src.read())
p1src.close()
p2src = open('\\\\insrvr2\\folders$\\Kieran\\Desktop\\Py\\Geocoding\\postcodes2.json', 'r')
p2 = json.loads(p2src.read())
p2src.close()
p3src = open('\\\\insrvr2\\folders$\\Kieran\\Desktop\\Py\\Geocoding\\postcodes3.json', 'r')
p3 = json.loads(p3src.read())
p3src.close()
p4src = open('\\\\insrvr2\\folders$\\Kieran\\Desktop\\Py\\Geocoding\\postcodes4.json', 'r')
p4 = json.loads(p4src.read())
p4src.close()
default = [0,0,0,1,0]
concat = '{\n'

for i in range(200,9999):
	postalCode = str(i).zfill(4)
	vals = []
	p1val = p1.get(postalCode, default)[0]
	if type(p1val) == int:
		p1val = default
	default = [0,0,0,2,0]
	vals.append(p1val)
	vals.append(p2.get(postalCode, default))
	default = [0,0,0,4,0]
	vals.append(p3.get(postalCode, default))
	default = [0,0,0,5,0]
	vals.append(p4.get(postalCode, default))

	coords = [myround(vals[0][3]), myround(vals[1][3]), myround(vals[2][3]), myround(vals[3][3])]
	
	most = most_frequent(coords)
	if most >= 0:
		continue
	final = vals[coords.index(most)]
	dataAccuracy = coords.count(most)
	

	concat += '"'+postalCode +'":['+'"'+postalCode+'","'+ final[1] + '","' + final[2] + '",' + str(final[3]) + ',' + str(final[4]) + ', ' + str(dataAccuracy) + '],\n'
f = open('C:\\Users\\Kieran\\Downloads\\final_postcodes.json', 'w')
f.write(concat + '}')
f.close()




# POSITIONSTACK API ERROR CHECKING
# arrf = open('C:\\Users\\Kieran\\Downloads\\err2.txt', 'r')
# arr = arrf.read().split('\n')
# arrf.close()
# f = open('C:\\Users\\Kieran\\Downloads\\postcodes2.json', 'a')
# f.write('{\n')
# f.close()
# for postalCode in arr:
# 	f = open('C:\\Users\\Kieran\\Downloads\\postcodes2.json', 'a')
# 	err = open('C:\\Users\\Kieran\\Downloads\\err.txt', 'a')

# 	postalCode = str(postalCode).zfill(4)
# 	print('Querying postalcode ' + postalCode)
# 	response = requests.get("http://api.positionstack.com/v1/forward?access_key=32c62dc140e2d5ccf9c4d3bab2a76174&query=Australia " + postalCode).text
# 	response_dict = json.loads(response)['data']
# 	if type(response_dict) == list:
# 		if len(response_dict) == 0:
# 			err.write(postalCode + '\n')
# 			continue
# 		else:
# 			response_dict = response_dict[0]

# 	if type(response_dict) == list:
# 		if len(response_dict) == 0:
# 			err.write(postalCode + '\n')
# 			continue
# 		else:
# 			response_dict = response_dict[0]

	
# 	if(response_dict['country'] == 'Australia' and response_dict['latitude'] != -23.992438):
# 		f.write( '"'+postalCode +'":['+'"'+postalCode+'","'+ (response_dict['locality'] if response_dict['locality'] else '') + '","' + (response_dict['region_code'] if response_dict['region_code'] else '') + '",' + str(response_dict['latitude']) + ',' +str(response_dict['longitude']) + '],\n')
# 		print('Successfully added ' + postalCode + '.')
# 	else:
# 		print('Skipped ' + postalCode + ' as it does not exist')
# 	f.close()
# 	err.close()
# f = open('C:\\Users\\Kieran\\Downloads\\postcodes2.json', 'a')
# f.write('}')
# f.close()