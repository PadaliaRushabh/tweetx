#!/usr/bin/python

# This program attend to read data from a csv file,
# and apply kmean, then output the result.

from numpy import vstack,array
from scipy.cluster.vq import kmeans, vq, whiten

import csv

def normalizeData(fileName):


	data_arr = []
	meal_name_arr = []

    	with open(fileName, 'rb') as f:
        	reader = csv.reader(f)
        	for row in reader:
            		data_arr.append([float(x) for x in row])
            		meal_name_arr.append([row[0]])

    	data = vstack( data_arr )
    	meal_name = vstack(meal_name_arr)

    	# normalization
    	data = whiten(data)
    
	File = "normalized_" + fileName 
	fo = open(File, "w")
    	for subd in data:
		for idx, d in enumerate(subd):
			if(idx < 7): 
				fo.write(str(d) + ',')
			else:
				fo.write(str(d))
		fo.write('\n')

	
