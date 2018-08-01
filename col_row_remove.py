import numpy as np
import re
import glob
import fileinput
import os
from os.path import basename




converters = {0: lambda s: float(s.strip('"'))}


for filename in glob.glob("/home/ngs/vivek/python/scripts/matrices/All_Species/*.txt"):
#for l in fileinput.input(): #Usage -> ls -1 | python parse.py
	fname = os.path.basename(filename)
	print fname
	
	data = np.loadtxt(filename, delimiter='\t', skiprows = 1, usecols= (1,2,3,4),converters=converters)
	t = data.transpose()
	t = re.sub(r"\n\s+0", "  0", str(t))
	line = re.sub(r"\[", "", str(t))
	line = re.sub(r"\]", "", str(line))
	line = re.sub(r"\n\s", "\n", str(line))
	#print filename
	print "\n\n"
	print line
	
	file = open('./matrices/converted/All_Species/' + fname, "w")
	file.write(line)


