open(motif,"liste_motifs.txt") or die "cannot open liste_motifs.txt";
open(seq,"1AT3G17910.txt") or die "cannot open 1AT3G17910";
open(out,">output.txt");
print out "Motif Given\tNumber of Matches\tFirst Matched Seq\tIndex\tMotif Name\n";
$seq=<seq>;
#print "$seq";
$count = 0;
$total_motif_count=0;
while(<motif>)
{
$count = 0;
        @array=split /;/, $_;
        $motif=$array[1];
        $motif=~ s/\+//;
        $motif_name=$array[3];
        if($seq =~ /($motif)/)
        {
                $matched_seq=$1;
                $seq_dup=$seq;
                $index=index($seq,$matched_seq);
                $index+=1;
                $count = scalar($seq_dup =~ s/$motif/xxxx/g);

                print out "$motif\t$count\t$matched_seq\t$index\t$motif_name\n";

        }
        else
        {
                #print out "$motif\tNIL\tNIL\t$motif_name\n";
        }

}

print "\n Output is written to output.txt inthe same folder\n Open with excel as 'tab' seperated\n\n";
