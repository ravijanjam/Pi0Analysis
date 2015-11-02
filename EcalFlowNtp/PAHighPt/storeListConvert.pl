#!/usr/bin/perl -w

# the line above this one should be the first line of the script
#
# Script for converting storeList output jobs to list of files for the pbsFlowParallel.pl script
#
#
my $topName = "/gpfs21/scratch/maguire/parallel/cent08_10/";
if(-e $topName) {
    print "\ Working directory is $topName\n";
}
else {
    die "\n\n Unable to find working directory $topName\n\n";
}

if(-e "storeFileList.txt") {
   open(INPUTLIST, "storeFileList.txt");
}
else {
    die "\n Unable to find input file list storeFileList.txt\n";
}

my $storeArea = "/store/user/maguirc1/cent20_30/";
open(OUTPUTLIST, ">romapi0FileList.txt");

my $minimumFileSize = 10000;
my $numberOfFilesBelowMinimum = 0;
my $numberOfFilesAccepted = 0;
my $totalSize = 0;
while(<INPUTLIST>) {
    chop $_;
    my $line = $_;
    my @arrayLine = split(' ', $line);
    my $fileSize = $arrayLine[2];
    my $fileName = $arrayLine[9];
    if($fileSize > $minimumFileSize) {
	$numberOfFilesAccepted++;
	my $outFileName = $storeArea . $fileName;
	$totalSize += $fileSize;
	print OUTPUTLIST "$outFileName\n";
    }
    else {
	$numberOfFilesBelowMinimum++;
    }
} # loop over storeFileList
close(OUTPUTLIST);
close(INPUTLIST);

$totalSize = $totalSize/1.0e9;
print "\n\n Number of files accepted $numberOfFilesAccepted with total size $totalSize GBytes";
print "\n   number of files below minimum size $numberOfFilesBelowMinimum";
print "\n";

__END__
