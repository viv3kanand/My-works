#Usage - python pwmsearch_few.py fasta_seq_filename 4.0 0.3 0.2 0.2 0.3 matrix_filename

from Bio import motifs
from Bio.Seq import Seq
from Bio.Alphabet import IUPAC
from Bio import SeqIO
import sys
import glob
import os
from os.path import basename
import re
import csv
from collections import defaultdict
import datetime
import numbers

now = datetime.datetime.now()

data = defaultdict(list)

with open('/home/ngs/vivek/python/scripts/files/ID_IUPAC.csv', 'r') as file:
    reader = csv.DictReader(file)
    for row in reader:
        data[row['ID']].append(row['Gene_name'])
file.close()

instances = [Seq("AATGC")]
m = motifs.create(instances)

file1 = os.path.basename(sys.argv[1])
out = open(os.path.join('/home/ngs/vivek/python/scripts/sequence/',file1), "w")


A, C, G, T = float(sys.argv[3]), float(sys.argv[4]), float(sys.argv[5]), float(sys.argv[6])
background = {'A': A,'C': C,'G': G,'T': T}

list = open(sys.argv[7]).readlines()
print list[0]
check = isinstance(list[0], int)

print check

for record in SeqIO.parse(sys.argv[1], "fasta"):
	test_seq=Seq(str(record.seq), m.alphabet)

	out.write(str(record.id) + "\t" + file1 + "\t" + str(record.seq) + "\n")

	if(check == True):

		#list = open(sys.argv[7]).readlines()
		#print list
		
		for l in list:
			for filename in glob.glob("/home/ngs/vivek/python/scripts/matrices/converted/Homo_sapiens/"+ l.rstrip() +"_top10align_pfm.txt"):
        	                #print filename
	
        	                fname = os.path.basename(filename)
                	        fname = re.sub(r"_top10align_pfm.txt","",str(fname))
                        	test_pwm = motifs.read(open(filename), "pfm")
                       		pwm = test_pwm.counts.normalize(pseudocounts=0.5)
                        	pssm = pwm.log_odds(background)
                        	IUPAC = test_pwm.counts.degenerate_consensus

                        	for position, score in pssm.search (test_seq, threshold = float(sys.argv[2])):
					print str(record.id) + "\t" + str(abs(position)) +"\t"+ str(abs(position)+len(IUPAC)) +"\t"+ str("+" if position > 0 else "-") +"\t"+ str(fname) +"\t"+ str(data[fname]) +"\t"+ str(IUPAC) +"\t"+ str(score) +"\t"+ str(file1) +"\t"+ str(now) +"\t"+ str(file1)


	else:
		test_pwm = motifs.read(open(sys.argv[7]), "pfm")
        	#print sys.argv[7]
		pwm = test_pwm.counts.normalize(pseudocounts=0.5)
                pssm = pwm.log_odds(background)
                IUPAC = test_pwm.counts.degenerate_consensus
		
                for position, score in pssm.search (test_seq, threshold = float(sys.argv[2])):
                	print str(record.id) + "\t" + str(abs(position)) +"\t"+ str(abs(position)+len(IUPAC)) +"\t"+ str("+" if position > 0 else "-") +"\t"+ str(IUPAC) +"\t"+ str(score) +"\t"+ str(file1) +"\t"+ str(now) +"\t"+ str(file1)
