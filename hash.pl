#!/usr/bin/perl


%hash={};
open(IN1,"Human");
$x=<IN1>;
$count = 0;
while(<IN1>)
{
 $_ =~ s/\n//;
 @a= split('\t',$_);
 $key = $a[15]."@".$count;
 $hash{$key}=$_;
#print  "$key\n";
$count++;

}
#open(IN,"gene_name.txt") or die "cannot open gene";
open(IN,"gene.txt");

open (OUT, ">Gene_ID_.txt");
$x=<IN>;
$x=0;
while (<IN>){
$x++;
         $input=$_;

                $input =~ s/\n//;
                #$input =~ s/\r//;
               # print "$input\n";

         foreach $key (keys %hash){
                  if ($key =~ m/$input\@/){
                       print OUT "$x\t".$hash{$key}."\n";
                       }
                  else{
                       #print "$x\t$input\tnot matching\n";
                       }
         }
         }



               #if (exists $hash{$input} )
               #{
               #print OUT "$x\t".$hash{$input}."\n";

               #}
               #else
               #{
               # print OUT "$x\t$input\tnot matching\n";

               #}
         #}

         print "total=$x";
