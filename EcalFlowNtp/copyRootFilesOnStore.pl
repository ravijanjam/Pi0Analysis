#!/usr/bin/perl -w
# the line above this one should be the first line of the script
#
# Script for copying ROOT files in a given store directory to the present working (/tmp) directory
#

use strict;

my $storeDirectory = "/user/maguirc/hiRun2013pPb/";
my $storePath = "/store" . $storeDirectory;

#
# Generate the list of files in this area (assume that the files have key text in their names)
#
`lio_ls /lio/lfs/cms/store/user/maguirc/hiRun2013pPb/ | grep 24Jun > storeFilesList.txt`;

if(-e "storeFilesList.txt") {
   open(INPUTLIST, "storeFilesList.txt");
}
else {
    die "\n Unable to find input file list storeFileList.txt\n";
}

if(-z "storeFilesList.txt") {
    die "\n\n The storeFileList.txt has zero length\n\n";
}

my $numberFirstFile = 1;
my $numberLastFile = 500;
my $numberOfFilesSelected = 0;

open(OUTPUTLIST, ">rootFilesList.txt");
my $minimumFileSize = 1000;
my $numberOfFilesBelowMinimum = 0;
my $numberOfFilesAccepted = 0;
my $totalSize = 0;
my $lineNumber = 0;

print "\n\n Starting scan of storeFilesList.txt\n";

while(<INPUTLIST>) {
    chop $_;
    my $line = $_;
    $lineNumber++;
    my @arrayLine = split(' ', $line);
    my $fileSize = $arrayLine[3];
    my $fileName = $arrayLine[14];
    if($fileSize > $minimumFileSize) {
	$numberOfFilesAccepted++;
	if($numberOfFilesAccepted >= $numberFirstFile &&
	   $numberOfFilesAccepted <= $numberLastFile) {
	    $numberOfFilesSelected++;
	    $totalSize += $fileSize;
	    `lio_cp /lio/lfs$fileName /tmp/maguirc >> download.log`;
	    print OUTPUTLIST "$fileName\n";
	    my $accumulatedMBytes = $totalSize/1.0e6;
	    print "\n $lineNumber) Copy complete for $fileName, $accumulatedMBytes MB accumulated";
	    if($numberOfFilesSelected >=  $numberLastFile) {
		die "\n Temporary stop\n";
	    }
	}
    }
    else {
	print "\n Line number $lineNumber with file name $fileName and file size $fileSize is being skipped";
	$numberOfFilesBelowMinimum++;
    }
} # loop over storeFileList
close(OUTPUTLIST);
close(INPUTLIST);

$totalSize = $totalSize/1.0e6;
print "\n\n Number of files accepted $numberOfFilesAccepted with total size $totalSize MBytes";
print "\n   number of files below minimum size $numberOfFilesBelowMinimum";
print "\n   number of files selected $numberOfFilesSelected";
print "\n";

__END__
