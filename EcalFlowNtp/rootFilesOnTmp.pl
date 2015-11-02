#!/usr/bin/perl -w
# the line above this one should be the first line of the script
#
# Script for adding ROOT files in a given /tmp directory
#

use strict;

my $topName = "/tmp/maguirc";
if(-e $topName) {
    print "\ Working directory is $topName\n";
}
else {
    die "\n\n Unable to find working directory $topName\n\n";
}

my $storeDirectory = "/tmp/maguirc/";
if(-e $storeDirectory) {
    print "\n Location of root files is $storeDirectory\n";
}
else {
    print "\n\n ERROR: Location of root files is incorrect at $storeDirectory\n";
    die "\n Abnormal termination\n";
}

my $storePath = $storeDirectory;

#
# Number of input files to give to the hadd command
#
my $fileListSplit = 20;
my $fileListSplitPlus1 = $fileListSplit + 1;

my $skipStoreFilesList = 0; # if skip is set to 1, then the existing storeFilesList.txt will not be regenerated; if set to 2 then no hadd will take place
if($skipStoreFilesList != 1) { 
#
# Generate the list of files in this area (assume that the files have a key text in their names)
#
    `ls -al $storeDirectory | grep 24June > tmpFilesList.txt`;

    if(-e "tmpFilesList.txt") {
	open(INPUTLIST, "tmpFilesList.txt");
    }
    else {
	die "\n Unable to find input file list tmpFileList.txt\n";
    }

    if(-z "tmpFilesList.txt") {
	die "\n\n tmpFilesList.txt has zero length\n\n";
    }

    open(OUTPUTLIST, ">rootFilesList.txt");
    my $minimumFileSize = 1000;
    my $numberOfFilesBelowMinimum = 0;
    my $numberOfFilesAccepted = 0;
    my $totalSize = 0;
    my $lineNumber = 0;

    while(<INPUTLIST>) {
	chop $_;
	my $line = $_;
	$lineNumber++;
	my @arrayLine = split(' ', $line);
	my $fileSize = $arrayLine[4];
	my $fileName = $arrayLine[8];
	if($fileSize > $minimumFileSize) {
	    $numberOfFilesAccepted++;
	    my $outFileName = $storePath . $fileName;
	    $totalSize += $fileSize;
	    print OUTPUTLIST "$outFileName\n";
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
    print "\n";
}

if($skipStoreFilesList == 2) {
  print "\n Stop after producing file lists\n";
  die "\n Exiting before adding ROOT files\n";
}

if(-e "rootFilesList.txt") {
   open(INPUTLIST, "rootFilesList.txt");
}
else {
    die "\n Unable to find input file list rootFilesList.txt\n";
}

my $totalFilesAdded = 0;
my $fileCount = 0;
my $inputString = "";
my $inputSet = 0;
my $outputSet = 0;
my $newOutputFileName = "";
my $inputListNameSet = "inputListNameSet_1";
my $finalString = "";
open(LISTNAMESET, ">$inputListNameSet");
while(<INPUTLIST>) {
    chop $_;
    my $fileName = $_;
    $totalFilesAdded++;
    $fileCount++;
    if($fileCount < $fileListSplitPlus1) {
	print LISTNAMESET "\n $fileCount) $fileName";
	$inputString = $inputString . " " . $fileName;
    }
    else {
	#
        # Have accumulated $fileListSplit input file names
	#
	$inputSet++;
	$newOutputFileName = "pPbFileSum_" . $inputSet . ".root";
	if(-f $newOutputFileName) {
	    `rm $newOutputFileName`;
	}
	print "\n Current output file set $newOutputFileName";
	`hadd $newOutputFileName $inputString`;
	$finalString = $finalString . $newOutputFileName . " ";
	$inputString = $fileName;
	$fileCount = 1;
	print LISTNAMESET "\n";
	close(LISTNAMESET);
	my $newSetNumber = $inputSet + 1;
	$inputListNameSet = "inputListNameSet_" . $newSetNumber;
	open(LISTNAMESET, ">$inputListNameSet");
    } # check if $fileListSplit input file names have been accumulated
}

if($fileCount > 0) {
    $inputSet++;
    $newOutputFileName = "pPbFileSum_" . $inputSet . ".root";
    print "\n Producing last output file set $newOutputFileName from remaining $fileCount files";
    if(-f $newOutputFileName) {
	`rm $newOutputFileName`;
    }
    `hadd $newOutputFileName $inputString`;
    $finalString = $finalString . $newOutputFileName . " ";
    print LISTNAMESET "\n";
    close(LISTNAMESET);
}

if($totalFilesAdded > 0) {
    print "\n\n Producing pPbAllInputSets.root from $finalString";
    if(-f "pPbAllInputSets.root") {
	`rm pPbAllInputSets.root`;
    }
    `hadd pPbAllInputSets.root $finalString`;
}

print "\n\n Total files added $totalFilesAdded";
print "\n";

__END__
