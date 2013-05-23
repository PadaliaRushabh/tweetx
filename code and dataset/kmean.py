import sys,csv,math,random,time
import numpy as np 
import normalize

class Point:
    def __init__(self, coordinates):
        self.coordinates = coordinates
        self.n = len(coordinates)
    def __repr__(self):
        return str(self.coordinates)

class Cluster:
    def __init__(self, points):
        if len(points) == 0: raise Exception("ERROR:The cluster cluster is empty")
        self.points = points
        self.n = points[0].n
        for p in points:
            if p.n != self.n: raise Exception("ERROR: uneven dimensions")
        self.centroid = self.calculateCentroid()
    def __repr__(self):
        return str(self.points)
    def updateCentroids(self, points):
        old_centroid = self.centroid
        self.points = points
        self.centroid = self.calculateCentroid()
        return calcDistance(old_centroid, self.centroid)
    def calculateCentroid(self):
        reduced_coordinates = lambda i:reduce(lambda x,p : x + p.coordinates[i],self.points,0.0)    
        centroid_coordinates = [reduced_coordinates(i)/len(self.points) for i in range(self.n)] 
        return Point(centroid_coordinates)

def kmeans(points, k, cutoff):
    initial = random.sample(points, k)
    clusters = [Cluster([p]) for p in initial]
    total_iteration = 0	
    while True:
	total_iteration = total_iteration + 1
        lists = [ [] for c in clusters]
        for p in points:
            smallest_distance = calcDistance(p,clusters[0].centroid)
            index = 0
            for i in range(len(clusters[1:])):
                distance = calcDistance(p, clusters[i+1].centroid)
                if distance < smallest_distance:
                    smallest_distance = distance
                    index = i+1
            lists[index].append(p)
        biggest_shift = 0.0
        for i in range(len(clusters)):
            shift = clusters[i].updateCentroids(lists[i])
            biggest_shift = max(biggest_shift, shift)
        if biggest_shift < cutoff: 
            break
    print "Total Iteration =" , total_iteration
    return clusters

def calcDistance(a, b):
    if a.n != b.n: raise Exception("ERROR: unable to comparable points")
    ret = reduce(lambda x,y: x + pow((a.coordinates[y]-b.coordinates[y]), 2),range(a.n),0.0)
    return math.sqrt(ret)


def getDataFromFile():
	cr = csv.reader(open("normalized_twitter_dataset.csv","rb"))
	return  cr


def getinfo(row):
	return Point([np.float32(x) for x in row])

def main():
	
	normalize.normalizeData('twitter_dataset.csv')
	cutoff =  0.5
	k = int(raw_input("Input Number of cluster:"))
	start_time = time.time()
    	reader = getDataFromFile()
    	points = []
	point_counter = 0
    	for row in reader:
		points.append(getinfo(row[1:]))
		point_counter = point_counter + 1
    	clusters = kmeans(points, k, cutoff)
	#total_points ,final_centroids = clusters
	cluster_per = []
	end_time = time.time() - start_time 

    	for i,c in enumerate(clusters):
		count = 0 
        	for p in c.points:
            		print " Cluster: ",i + 1,"\t Point :", p
			count = count + 1
		print "no of instance for cluster" , i + 1 ,":" ,count
		cluster_per.append(np.float32(((np.float32(count) / np.float32(point_counter)) * 100)))

	print "Time:" , end_time, "Seconds"
	print "Number of Clusters:" , k
	for idx,cp in enumerate(cluster_per):
		print "cluster", idx + 1 , ":" , cp , "%"
		
		 

if __name__ == "__main__": 
	main()
