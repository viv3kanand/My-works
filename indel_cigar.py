import re
import sys


#a = '12M1I3D4I4I'
with open(sys.argv[1], 'r') as cigar:
	for line in cigar.readlines():
		parts= line.split()
		#print parts[1]
		I=0
		D=0
		if 'I' or 'M' in parts[1]:
			matchI = re.findall(r'(\d+)I', parts[1])
			for i in matchI:
        			I=I+int(i)	
			matchD = re.findall(r'(\d+)D', parts[1])
			for d in matchD:
        			D=D+int(d)
		#print parts[0]
		print parts[0]+"\t"+"Insertion="+str(I)+"\t"+"Deletion="+str(D)
