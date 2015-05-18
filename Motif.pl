$file= shift;
open(f,$file) or die "cannot open the file $file";
%hash= {};
$count=0;
while(<f>)
{
#if ($_ =~ /574956988/){	print "$_\n";	exit(0);}
$_ =~ s/\n//;
$_ =~ s/\r//;
	if($_ =~ />gi/)
	{
	$hash{$key}=$seq;
	#	$sub = substr($seq,-500);
	#	$sub =$seq;

	$sub = substr($seq,-150,100);
	$str = $sub."ATA";
	$sub2 = $str;
	
#if ($_ =~ /359465586/){ print "$str\n$key";   exit(0);}
	while(index($str, "ATA") != rindex($str, "ATA"))
	{
#if ($_ =~ /359465586/){ print "$str\n$key\n";   exit(0);}

		#print "$str \n";
		if($str =~ /((.{2})ATA(.{2}))/)
		{
			$index = index($str,$1);	
			$index -= 1;
			$position = 150-$index;
			#$mer = $1;
			$mer = substr $sub2, $index+1, 5;

			#$check  = ($sub2 =~ s/$mer/@@@/g);
			#$check -= 1;
			#$check = $sub2 =~ s/$mer/@@@/g;
			#$check += () = $sub2 =~ /($mer)/g;
			#$check++ while $sub2 =~ m/ATA/g;
	
		#print "$sub2\n$check";
		#exit (0);	
#			if($key =~ />(gi\|(\d+?)\|\w\w\w\|(\w\w\_\d+?\.\d+?\|))/)
                	if($key =~ />gi\|(\d+?)\|/)
			{
                        	$gi=$1;#$1."\t".$2;
                	}
                	
			$end=$position-7;
#if ($_ =~ /359465586/){ print "$str\n$key\n";   exit(0);}

			if($index != 0)
                	{
               			 print "$gi\t$mer\t-$position\t-$end\n";#\t$check\n";
#if ($_ =~ /34528998/){ print "$str\n$key\n";   exit(0);}

                	}
			
			#if($gi==574956988) {exit (0);}	

		}
			
		substr ($str, index($str, "ATA"), 3, "###");

		#print "$str \n";
	
	}
	#	if($gi==662033937) {exit (0);}


		$key=$_;
		$end=0;
		$seq="";
		$index=0;
		$position=0;
		$gi=0;
		$G=0;
		$C=0;
		$Total=0;
		$GC=0;
		$GCperup=0;
		$GCperdown=0;
		$mer="";
		$up="";
		$down="";
		$count++;
		$check=0;
#		print "$count \n";
	}

	else
        {
        	$seq=$seq.$_;
        }
	
	}
#if($count == 4)
#{
#	while (my ($k,$v)=each %hash)
#	{
#		print "$k $v\n";
#	}	
#exit(0);
#}

 print "$count \n";	 
