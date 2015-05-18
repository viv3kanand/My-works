#!/usr/bin/perl
use strict;
#open(IN,"gene_name.txt") or die "cannot open gene";
open(IN,"list.csv") or die "cvcvc";
open (OUT, ">output.txt");
#print"helo";
while (<IN>){
        my $input=$_;
                #print $input;
                $input=~ s/\n//;
                $input=~ s/\r//;
                #print $input;
        #chomp $input;
        my @array=split(/\t/,$input);
        my ($gene)= $array[0];
        open( fh,"input.csv");
        my @file1=<fh>;
        close(fh);
        my @grep=grep (/\b$gene\b/,@file1);
                #my @grep= grep (/'|$gene$'/, @file1);
                print @grep;
                print OUT @grep;
         }
