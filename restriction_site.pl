#usr/bin/perl
#Restriction enzymes have been used for sequence analyses of DNA and for cloning and amplifying DNA.
#***********PROGRAM FOR RESTRICTION SITES DETECTION***********

print "ENTER THE FILE NAME:";
$fasta=<STDIN>;
chomp($fasta);
open(FILE,"$fasta");
while(<FILE>)
{
        print "$_";
}
close(FILE);
        #HASH CONTAINING RESTRICTION ENZYMES AND RESTRICTION SITES IN 5' STRAND
%hash1=("Alu1"        =>"AGCT",
        "Apa1"        =>"GGGCCC",
        "Aaa1"        =>"CGGCCG",
        "Acc11"       =>"CGCG",
        "Ase1"        =>"ATTAAT",
        "BamH1"       =>"GGATCC",
        "Bcc1"        =>"CCATA",
        "Bgl11"       =>"AGATCT",
        "Bin1"        =>"GGATC",
        "Bsa1"        =>"GGTCTC",
        "Cac1"        =>"GATC",
        "Cla1"        =>"ATCGAT",
        "Cst1"        =>"CTGCAG",
        "Dra1"        =>"TTTAAA",
        "EaeA1"       =>"CCCGGG",
        "EagB1"       =>"CAGTCG",
        "EcoR1"       =>"GAATTC",
        "EcoRV"       =>"GATATC",
        "Faq1"        =>"GGGAC",
        "Fba1"        =>"TGATCA",
        "Fgo1"        =>"CTAG",
        "Fok1"        =>"GGATG",
        "Fun1"        =>"AGCGCT",
        "Ga11"        =>"CCGCGG",
        "Gst1"        =>"GGATCC",
        "Hae111"      =>"GGCC",
        "Hga1"        =>"GACGC",
        "Hha1"        =>"GCGC",
        "Hind111"      =>"AAGCTT",
        "Kpn1"        =>"GGTACC",
        "LlaG21"      =>"GCTAGC",
        "Lwe1"        =>"GCATC",
        "Mbi1"        =>"CCGCTC",
        "Mls1"        =>"TGGCCA",
        "Mlu1"        =>"ACGCGT",
        "Mse1"        =>"TTAA",
        "Msp1"        =>"CCGG",
        "MspC1"       =>"CTTAAG",
        "Nae1"        =>"GCCGGC",
        "Nb11"        =>"CGATCG",
        "Nde1"        =>"CATATG",
        "Not1"        =>"GCGGCCGC",
        "Nsi1"        =>"ATGCAT",
        "Pae1"        =>"GCATGC",
        "Pam1"        =>"TGCGCA",
        "Ple1"        =>"GAGTC",
        "Pst1"        =>"CTGCAG",
        "Pvu11"       =>"CAGCTG",
        "Rca1",       =>"TCATGA",
        "Rsa1"        =>"GTAC",
        "Sac1"        =>"GAGCTC",
        "Sfo1"        =>"GGCGCC",
        "Sma1"        =>"CCCGGG",
        "Spe1"        =>"ACTAGT",
        "Taq1"        =>"TCGA",
        "Tas1"        =>"AATT",
        "Tsc1"        =>"ACGT",
        "Vne1"        =>"GTGCAC",
        "Xba1"        =>"TCTAGA",
        "Xcal"        =>"GTATAC",
        "Xho1"        =>"CTCGAG",
        "Zra1"        =>"GACATC",
        "Zrm1"        =>"AGTACT");

#HASH CONTAINING RESTRICTION ENZYMES AND RESTRICTION SITES IN 3' STRAND

%hash2=("Alu1"        =>"TCGA",
        "Apa1"        =>"CCCGGG",
        "Aaa1"        =>"GCCGGC",
        "Acc11"       =>"GCGC",
        "Ase1"        =>"TAATTA",
        "BamH1"       =>"CCTAGG",
        "Bcc1"        =>"GGTAG",
        "Bin1"        =>"CCTAG",
        "Bsa1"        =>"CCAGAG",
        "Bgl11"       =>"TCTAGA",
        "Cac1"        =>"CTAG",
        "Cla1"        =>"TAGCTA",
        "Cst1"        =>"GACGTC",
        "Dra1"        =>"AAATTT",
        "EaeA1"       =>"GGGCCC",
        "EagB1"       =>"GCTAGC",
        "EcoR1"       =>"CTTAAG",
        "EcoRV"       =>"CTATAG",
        "Faq1"        =>"CCCTG",
        "Fba1"        =>"ACTAGT",
        "Fgo1"        =>"GATC",
        "Fok1"        =>"CCTAC",
        "Fun1"        =>"TCGCGA",
        "Ga11"        =>"GGCGCC",
        "Gst1"        =>"CCTAGG",
        "Hae111"      =>"CCGG",
        "Hga1"        =>"CTGCG",
        "Hha1"        =>"CGCG",
        "Hind111"     =>"TTCGAA",
        "Kpn1"        =>"CCATGG",
        "LlaG21"      =>"CGATCG",
        "Lwe1"        =>"CGTAG",
        "Mbi1"        =>"GGCGAG",
        "Mls1"        =>"ACCGGT",
        "Mlu1"        =>"TGCGCA",
        "Msp1"        =>"GGCC",
        "MspC1"       =>"GAATTC",
        "Mse1"        =>"AATT",
        "Nae1"        =>"CGGCCG",
        "Nb11"        =>"GCTAGC",
        "Nde1"        =>"GTATAC",
        "Not1"        =>"CGCCGGCG",
        "Nsi1"        =>"TACGTA",
        "Pae1"        =>"CGTACG",
        "Pam1"        =>"ACGCGT",
        "Ple1"        =>"CTCAG",
        "Pst1"        =>"GACGTC",
        "Pvu11"       =>"GTCGAC",
        "Rca1",       =>"AGTACT",
        "Rsa1"        =>"CATG",
        "Sac1"        =>"CTCGAG",
        "Sfo1"        =>"CCGCGG",
        "Sma1"        =>"GGGCCC",
        "Spe1"        =>"TGATCA",
        "Taq1"        =>"AGCT",
        "Tas1"        =>"TTAA",
        "Tsc1"        =>"TGCA",
        "Vne1"        =>"CACGTG",
        "Xba1"        =>"AGATCT",
        "Xcal"        =>"CATATG",
        "Xho1"        =>"GAGCTC",
        "Zra1"        =>"CTGCAG",
        "Zrm1"        =>"TCATGA");


open(FILE,"$fasta");
$first = <FILE>;
print "\nTHE INFORMATION OF THE SEQUENCE IS:$first\n";
@DNA1=<FILE>;
close(FILE);


@DNA2=reverse(@DNA1);     #3prime to 5prime


$seq1 = join("",@DNA1);
$seq1 =~s/\s//;           #DOUBT
#print "\n $seq1 \n";
$bases1 = length($seq1);
print "NUMBER OF BASES IN THE DNA SEQUENCE 5' TO 3' ARE:$bases1 \n\n";
$seq2 = join("",@DNA2);
$seq2 =~s/\s//;
#print "\n $seq2 \n";
$bases2 = length($seq2);
print "NUMBER OF BASES IN THE DNA SEQUENCE 3' TO 5' ARE:$bases2 \n\n";
$DNA1=join(" ",@DNA1);
$DNA2=join(" ",@DNA2);

#***********CALLING SUBROUTINES***********
$ch='y';
while($ch eq 'y')
{
print "**********************MENU********************** \n";
print "1.RESTRICTION SITE DETECTION IN 5' to 3' strand \n";
print "2.RESTRICTION SITE DETECTION IN 3' to 5' strand \n";
print "3.INSERTION OF DNA AT RESTRICTION CUT SITE \n";
print "4.RESTRICTION MAP \n";
print "Enter your choice:";
chomp($choice=<STDIN>);
if($choice==1)
{
        print "RESTRICTION SITE DETECTION IN 5' TO 3' STRAND \n";
        strand1();
}
elsif($choice==2)
{
        print "RESTRICTION SITE DETECTION IN 3' TO 5' STRAND \n";
        strand2();
}
elsif($choice==3)
{
        print "INSERTION OF DESIRED DNA SEQUENCE AT RESTRICTION SITE \n";
        insertion();
        translation(\@DNA1);
}
elsif($choice==4)
{
        print "RESTRICTION MAP\n";
        lookup();
}
else
{
        print "OUT OF RANGE \n";
}
print "Do you wish to continue:";
chomp($ch=<STDIN>);
}

sub strand1()
{
        base_position1();
        line_position1();
}
sub base_position1
{
print "***************  SUBROUTINE FOR BASE POSITION IN 5' TO 3' STRAND************************* \n";

print "ENTER RESTRICTION ENZYME NAME:";
chomp($query=<STDIN>);
if(exists $hash1{$query})
{
        ($site)=split(" ",$hash1{$query});
        $posn=0;
        while(($posn=index($DNA1,"$site",$posn))>=0)
        {
                $n = $posn;
                push(@positions,"$n");
                $posn++;
        }
        print "RESTRICTION SITES FOR CHOSEN ENZYME ARE AT POSITIONS:@positions \n";
}
else
{
        print "CHOSEN ENZYME NOT PRESENT IN HASH \n";
}
print "\n";
}

sub line_position1
{
        print "****************** SUBROUTINE FOR LINE POSITION IN 5' TO 3' STRAND********************** \n";
        print "ENTER RESTRICTION ENZYME NAME:";
        chomp($query=<STDIN>);
        if(exists $hash1{$query})
        {
                $line=0,$count=0;
                print "RESTRICTION SITES FOR CHOSEN ENZYME ARE PRESENT IN LINES: \n";
                ($site)=split(" ",$hash1{$query});
                foreach(@DNA1)
                {
                        $line=$line+1;
                            while($_=~m/$site/g)
                          {
                                print "$site \t $line \n";
                                $count=$count+1;
                         }
                }
        print "NUMBER OF RESTRICTION SITES FOR THE CHOSEN ENZYME ARE:$count \n";
        }
        else
        {
                print "CHOSEN ENZYME NOT PRESENT IN HASH \n";
        }
}


sub strand2
{
        base_position2();
        line_position2();
}
sub base_position2
{
        print "****************** SUBROUTINE FOR BASE POSITION FROM 3' TO 5 ' STRAND********************** \n";
        print "ENTER RESTRICTION ENZYME NAME: ";
        chomp($query=<STDIN>);

        if(exists $hash2{$query})
        {
                ($site)=split(" ",$hash2{$query});
                $posn=0;
                while(($posn=index($DNA2,"$site",$posn))>=0)
                {
                        $n=$posn;
                        push(@position,"$n");
                        $posn++;
                }
                print "RESTRICTION SITES FOR CHOOSEN ENZYME ARE AT POSITIONS:@position\n";
        }
        else
        {
        print "CHOSEN ENZYME NOT PRESENT IN HASH \n";
        }
print "\n";
}

sub line_position2
{
        print "****************SUBROUTINE FOR LINE POSITION FROM 3' TO 5 ' STRAND************ \n";
        print "ENTER RESTRICTION ENZYME NAME:";
        chomp($query=<STDIN>);
        if(exists $hash2{$query})
        {
                $line=0;
                $count=0;
                print "RESTRICTION SITES FOR CHOSEN ENZYME ARE PRESENT IN LINES: \n";
                ($site)=split(" ",$hash2{$query});
                foreach(@DNA2)
                {
                          $line=$line+1;
                          while($_=~m/$site/g)
                            {
                                print "$site \t $line \n";
                                $count=$count+1;
                            }
                  }
                  print "NUMBER OF RESTRICTION SITES FOR THE CHOSEN ENZYME ARE:$count \n";
        }
}


sub insertion()
{
        print "****************SUBROUTINE FOR INSERTING A NEW DNA SEQUENCE******************\n";
        strand1_insert();
        strand2_insert();
        sub strand1_insert()
        {
                print "ENTER RESTRICTION ENZYME NAME:";
                chomp($query=<STDIN>);
                if(exists $hash1{$query})
                {
                        print "Enter the DNA sequence:";
                        chomp($a=<STDIN>);
                        ($site)=split(" ",$hash1{$query});
                        $line=0,$count=0;
                        foreach(@DNA1)
                        {
                                $line=$line+1;
                                while($_=~m/$site/g)
                                {
                                        $count=$count+1;
                                        if($_=~s/$site/$a/g)
                                        {
                                                print "$_ \t $line \n";
                                        }
                                        else
                                        {
                                                print "CHOSEN RESTRICTION ENZYME IS NOT PRESENT IN HASH \n";
                                        }
                                }
                        }
                print "NUMBER OF SEQUENCE REPLACED SITES FOR CHOSEN ENZYME ARE:$count \n";
                print "@DNA1 \n";
                }
                else
                {
                        print"RESTRICTION ENZYME NOT PRESENT IN HASH\n";
                }

}
        sub strand2_insert()
        {
                print "ENTER RESTRICTION ENZYME NAME:";
                chomp($query=<STDIN>);
                if(exists $hash2{$query})
                {
                        print "Enter the DNA sequence:";
                        chomp($a=<STDIN>);
                        ($site)=split(" ",$hash2{$query});
                        $line=0,$count=0;
                        foreach(@DNA2)
                        {
                          $line=$line+1;
                          while($_=~m/$site/g)
                          {
                             $count=$count+1;
                             if($_=~s/$site/$a/g)
                             {
                                 print "$_ \t $line \n";
                             }
                             else
                             {
                                print "CHOSEN RESTRICTION ENZYME IS NOT PRESENT IN HASH \n";
                             }
                           }
                        }
                print "NUMBER OF SEQUENCE REPLACED SITES FOR CHOSEN ENZYME ARE:$count \n";
                print "@DNA2 \n";
                }
                else
                {
                print"RESTRICTION ENZYME NOT PRESENT IN HASH\n";
                }
        }
}

sub lookup()
{
        lookup_strand1();
        lookup_strand2();
        sub lookup_strand1()
        {
                $count=0;
                foreach $key(keys %hash1)
                {
                        $value=$hash1{$key};
                        #print "*************$value*************** \n";
                        $count=$count+1;
                        print "FOR RESTRICTION ENZYME:$key \n";
                        print "************************************\n";
                        $line=0;
                        foreach(@DNA1)
                        {
                                $line=$line+1;
                                while($_=~m/$value/g)
                                {
                                        print "$value \t line number-> $line \n";
                                }
                        }
                }
        }
        sub lookup_strand2()
        {
           $count=0;
           foreach $key(keys %hash2)
         {
        $value=$hash2{$key};
            #print "*************$value***************\n";
            $count=$count+1;
            print "FOR RESTRICTION ENZYME:$key \n";
            print "*****************************************\n";
                 $line=0;
                 foreach(@DNA2)
                 {
                     $line=$line+1;
                     while($_=~m/$value/g)
                     {
                          print "$value \t line number-> $line\n";
                     }
                  }
          }
      }
}



sub translation
        {
        print "***********SUBROUTINE FOR TRANSLATING THE NEW SEQUENCE WITH READING FRAMES*******\n";
                        $adress=shift;
                        @dnaseq=@$adress;
                        $dna=join("",@dnaseq);
                        print $dna,"\n";
                        $dna=~s/[^ATGC]//gi;
                        $dna=~tr/tT/uU/;
                        #print $dna;
                        @dna=split(undef,$dna);
                        #print "@dna\n";

                        $r1=$dna;
                        print "\nREADING FRAME 1 IS:$r1 \n";



                        shift(@dna);
                        $r2=join(undef,@dna);
                        print "\nREADING FRAME 2 IS :$r2 \n";



                        shift(@dna);
                        $r3=join(undef,@dna);
                        print "\nREADING FRAME 3 IS :$r3 \n";


                        $rev=reverse($dna);
                        print "\nREVERSE OF DNA IS :$rev \n";



                        @rev=split(undef,$rev);
                        $r4=$rev;
                        print "\nREADING FRAME 4 IS :$r4 \n";


                        shift(@rev);
                        $r5=join(undef,@rev);
                        print "\nREADING FRAME 5 IS :$r5 \n";


                        shift(@rev);
                        $r6=join(undef,@rev);
                        print "\nREADING FRAME 6 IS :$r6 \n";



                        @trans=("$r1","$r2","$r3","$r4","$r5","$r6");
                        $j=1;



                        foreach $val(@trans)
                        {
                                $l=length($val);
                                #print"\nlen of the sequence =$l";
                                $i=0;
                        while($i<$l)
                        {
                                $str=substr($val,$i,3);
                                $i=$i+3;
                                #print "str: $str\n";
                                if(length($str)==3)
                                {
                                $amino=&translate_codon($str);
                                push(@prot,$amino);
                                }

                        }

                                print "\n\nREADING FRAME $j :\n";
                                $j=$j+1;
                                $len=@prot;
                                #print "\nlength:$len\n";
                                $prot=join(undef,@prot);
                                $prot=~s/\s*//g;
                                print "$prot";
                                @prot=();
                        }

                        sub translate_codon
                        {
                        $codon=shift;
                        #print "codon: $codon \t";
                        if ( $codon =~m /GC[AGCU]/i ) { return A;} # Alanine;

                        if ( $codon =~m/UGC|UGU/i ) { return C;} # Cysteine

                        if ( $codon =~m/GAC|GAU/i ) { return D;} # Aspartic Acid;

                        if ( $codon =~m/GAA|GAG/i ) { return E;} # Glutamine;

                        if ( $codon =~ m/UUC|UUU/i ) { return F;} # Phenylalanine;

                        if ($codon =~m/GG[AGCU]/i ) { return G;} # Glycine;

                        if ( $codon =~ m/CAC|CAU/i ) { return H;} # Histine (start codon);

                        if ( $codon =~ m/AU[AUC]/i ) { return I;} # Isoleucine;

                        if ( $codon =~ m/AAA|AAG/i ) { return K;} # Lysine;

                        if ( $codon =~ m/UUA|UUG|CU[AGCU]/i ) { return L;} # Leucine;

                        if ( $codon =~ m/AUG/i ) { return M;} # Methionine;

                        if ( $codon =~ m/AAC|AAU/i ) { return N;} # Asparagine;

                        if ( $codon =~ m/CC[AGCU]/i ) { return P;} # Proline;

                        if ( $codon =~ m/CAA|CAG/i ) { return Q;} # Glutamine;

                        if ( $codon =~ m/AGA|AGG|CG[AGCU]/i ) { return R;} # Arginine;

                        if ( $codon =~ m/AGC|AGU|UC[AGCU]/i ) { return S;} # Serine;

                        if ( $codon =~ m/AC[AGCU]/i ) { return T;} # Threonine;

                        if ( $codon =~ m/GU[AGCU]/i ) { return V;} # Valine;

                        if ( $codon =~ m/UGG/i ) { return W;} # Tryptophan;

                        if ( $codon =~ m/UAC|UAU/i ) { return Y;} # Tyrosine;

                        if ( $codon =~ m/UAA|UGA|UAG/i ) { return "***" ;} # Stop Codons;
                        }
}
