#!usr/bin/perl -w

my %infod;

open RD,"$ARGV[0]";#clone.draw
while(<RD>){
	my @a=(split);

		$infod{$a[0]}=1;
	
}
close RD;

open IN,"$ARGV[1]";#meta.txt
open OUT,">$ARGV[2]";
<IN>;
while(<IN>){
	my @a=(split);
	my %fre=();
	my $f="../../input/".$a[0].".txt";
	open File,"$f";
	<File>;
	my %info=();
	
	my ($fu,$fa,$nd,$nc,$u,$a,$uc)=(0,0,0,0,0,0,0);
	while(<File>){
		my @t=(split);
		my $c=$t[3]."|".$t[4]."|".$t[6];
		if(defined $infod{$c}){
			unless( defined $info{$c}){
				$u++;
			}
		}
		unless( defined $info{$c}){
			$info{$c}=1;
			$uc++;
		}
	}
	print OUT $a[0],"\t",$a[1],"\t",$u,"\t",$uc,"\n";
	close File;
}

close IN;
close OUT;