#!/usr/bin/perl -w
# the line above this one should be the first line of the script
#
# Script for expanding tgz file in a res directoru
#

use strict;

my $topName = "/gpfs22/home/maguirc/CMSSW_5_3_8_HI_patch2/src/Pi0Analysis/EcalFlowNtp/simRun2013V3/crab_0_140129_174448/res/";
if(-e $topName) {
    print "\ Working directory is $topName\n";
}
else {
    die "\n\n Unable to find working directory $topName\n\n";
}

if(-e "outFileList.txt") {
    print "\n Found outFileList.txt\n";
}
else {
    print "\n\n ERROR: Did not find outFileList.txt\n";
    die "\n Abnormal termination\n";
}

open(OUTFILELIST, "outFileList.txt");
my $numberOfFiles = 0;
while(<OUTFILELIST>) {
    chop $_;
    my $fileName = $_;
    print "\n $numberOfFiles) Exapanding file $fileName";
    `tar -xf $fileName`;
    `rm $fileName`;
    $numberOfFiles++;
} # loop over outFileList
close(OUTFILELIST);

print "\n\n Total files expanded = $numberOfFiles";
print "\n\n";

__END__
