#!/usr/bin/perl -w

# the line above this one should be the first line of the script
#
# Script for making CRAB files for processing RECO data on l-store, using 10 lumi per job
#
use strict;

my $topName = "/home/sharmam/CMSSW_5_3_8_HI_patch2/src/Pi0Analysis/EcalFlowNtp/pPbRunFullStat/";
if(-e $topName) {
    print "\ Working directory is $topName\n";
}
else {
    die "\n\n Unable to find working directory $topName\n\n";
}

#
# Set processMode to 1 for automatic crab -create
# Set processMode to 2 for automatic crab -create followed by crab -submit
#
my $processMode = 2; 

my $lumisPerJob = 1;

#
# There are 75 different Run number positions
# Positions 3, 2, and 1  correspond to Runs 152701 (1 - 110 lumi), 152955 (89 - 104 lumi), and 152957 (1 - 974 lumi); Dec. 4
# Position 18, 17, 16 corresonds to Run 152642 (1 - 1196 lumi), 152643 (1 - 128), 152652 (89 - 932); Nov. 28
# Position 21 corresponds to Run 152602 (1 - 964)
# Positions 37, 38 correspond to Run 152113 (1 - 616 lumi), and 152112 (84 -696 lumi); Nov. 23
# Positions 46, 47 correspond to Run 151353 (1 - 494 lumi), and 151878 (102 -930 lumi); these successive runs in DB were taken on Nov. 17 and then Nov. 21
# Positions 62, 63 correspond to Run 151058 (141 - 1226 lumi), and 151027 (1 - 1103); Nov. 13-14
# Positions 71, 72 correspond to Run 150590 (29 - 1786 lumi), and 150476 (1 - 1420); Nov. 9-10
#

my $overWriteProtect = 1;  # safety switch to not overwrite existing run subdirectory

my $firstRun = 5;  # start position in arrayOfRunNumbers counting from 1
my $lastRun = 6;  # end position in arrayOfRunNumbers counting from 1

my @arrayOfRunNumbers; 
my @arrayOfLumiStartNumbers;
my @arrayOfLumiEndNumbers;
my @arrayOfLumiNumbers;

#
# To get the complete set of Run numbers with starting and ending lumi sections, the 75-line file HIData2010_Luminosity.csv will be scanned
# This file is the comma-separated version of the HIData2010_Luminosity.xls spreadsheet file: RunNumber, StartLumi, EndLumi, ...
#
# Using a modified version of this file with only one line for Run 152957
# Original version had two lines for same Run number: 152957,82,974,1258833,2,...  and  152957,1,81,98304,3,... 
# Different scale downs, merged into one line
#
#
# Scan of luminosity file
#
if(-e "HIData2010_Luminosity.csv") {
    open(LUMIFILE, "HIData2010_Luminosity.csv");
}
else {
    die "\n\n Unable to open lumi file HIData2010_Luminosity.csv\n\n";
}

my $numberOfRuns = 0;
my $printInformationCSV = 1;
if($printInformationCSV == 1) {
    print "\n Begin scan of CVS lumi file\n";
}
my $totalLumis = 0;
my $maximumEndLumi = 0;

while(<LUMIFILE>) {
    chop $_;
    my $lumiLine = $_;
    my @lineContents = split(',', $lumiLine);
    my $thisRun = $lineContents[0];
    my $thisStartLumi = $lineContents[1];
    my $thisEndLumi = $lineContents[2];

    $totalLumis += $thisEndLumi;
    if($thisEndLumi > $maximumEndLumi) {
	$maximumEndLumi = $thisEndLumi;
    }

    push @arrayOfRunNumbers, $thisRun;
    push @arrayOfLumiStartNumbers, $thisStartLumi;
    push @arrayOfLumiEndNumbers, $thisEndLumi;
    push @arrayOfLumiNumbers, $thisEndLumi;

    $numberOfRuns++;

    if($numberOfRuns > 1) {
	my $iRunMax = $numberOfRuns - 1;
	for(my $iRun=0; $iRun<$iRunMax; $iRun++) {
	    if($thisRun == $arrayOfRunNumbers[$iRun]) {
		die "\n Duplicate run number $thisRun at previous index $iRun\n";
	    } # check on duplicated run number
	} # loop over previous run numbers to check for duplications
    } # do check for 2 or more run numbers

    if($printInformationCSV == 1) {
	print "$numberOfRuns) $thisRun $thisStartLumi $thisEndLumi\n";
    }

} # loop over CSV file

if($printInformationCSV == 1) {
    print "\n\n Number of runs found $numberOfRuns having $totalLumis total lumis, with maximum number of lumis = $maximumEndLumi\n";
}
close(LUMIFILE);

if($lastRun < $firstRun) {
    die "\n last run number position $lastRun is inconsistent with first run number position $firstRun\n";;
}

if($firstRun < 1) {
    $firstRun = 1;
}

if($lastRun > $numberOfRuns) {
    $lastRun = $numberOfRuns;
}

my $firstRunIndex = $firstRun - 1;
my $lastRunIndex = $lastRun;

my $outputRootFileNamePreface = "pPbpi0Ntuple_";

my $numberOfDirectoriesMade = 0;
my $numberOfCrabCreations = 0;
my $numberOfCrabSubmissions = 0;
my $numberOfSubmittedLumis = 0;

#
# For composing the output ROOT file name in the pset file
#
my $outputLinePreface = "process.EcalFlowNtp.OutputFile = cms.untracked.string(\'";
my $outputLineSuffix = "\')";

#
# Loop over the number of requested Runs
#
for(my $kRun=$firstRunIndex; $kRun<$lastRunIndex; $kRun++) {
    chdir $topName;

    #
    # make Run subdirectory
    #
    my $thisRun = $arrayOfRunNumbers[$kRun];
    my $thisLumis = $arrayOfLumiNumbers[$kRun];
    my $thisDirectory = $topName . "run" . $thisRun;
    if(-e $thisDirectory) {
	if($overWriteProtect == 1) {
	    print "\n\n  Cannot overwrite an existing run subdirectory $thisDirectory\n";
	    die "\n CRAB creation script is exiting\n";
	}
	else {
	    `rm -rf $thisDirectory`;  # remove previous version of this subdirectory if it still exists
	}
    }
    `mkdir $thisDirectory`;
    chdir $thisDirectory;
    $numberOfDirectoriesMade++;

    #
    # make soft-links in the Run directory
    #
#    `ln -fs ../flatparms.db .`;
    `ln -fs ../runpi0Preface.txt .`;
    `ln -fs ../runpi0Suffix.txt .`;
    `ln -fs ../crabPreface.txt .`;
    `ln -fs ../crabSuffix.txt .`;
 
    #
    # make the pSet file in the Run directory
    #
    my $pythonScriptName = "ecalflowntp_cfg.py";
    if(-e $pythonScriptName) {
	`rm $pythonScriptName`;  # file should not exist in any case
    } # safety delete
   `cat runpi0Preface.txt >> $pythonScriptName`;

    open(PYTHONSCRIPTNAME, '>>', $pythonScriptName) or die "Unable to open pythonscript file";
    my $outputRootFileName = $outputRootFileNamePreface . $thisRun . ".root";
    print PYTHONSCRIPTNAME $outputLinePreface . $outputRootFileName . $outputLineSuffix ."\n";
    close(PYTHONSCRIPTNAME);
    `cat runpi0Suffix.txt >> $pythonScriptName`;

    #
    # make the crab.cfg file in the Run directory
    #
    my $crabScriptName = "crab.cfg";
    if(-e $crabScriptName) {
	`rm $crabScriptName`;  # file should not exist in any case
    } # safety delete
    `cat crabPreface.txt >> crab.cfg`;

    open(CRABSCRIPTNAME, '>>', $crabScriptName);
    print CRABSCRIPTNAME "### Splitting parameters\n";
    print CRABSCRIPTNAME "runselection = $thisRun\n";
    print CRABSCRIPTNAME "total_number_of_lumis = $thisLumis\n";
    print CRABSCRIPTNAME "lumis_per_job = $lumisPerJob\n\n";

    print CRABSCRIPTNAME "### The output files (comma separated list)\n";
    print CRABSCRIPTNAME "output_file = $outputRootFileName\n";
    print CRABSCRIPTNAME "skip_TFileService_output=1\n\n";
    close(CRABSCRIPTNAME);
    `cat crabSuffix.txt >> crab.cfg`;

    close(CRABSCRIPTNAME);

    #
    # create the CRAB jobs in the Run directory
    #
    if($processMode == 1 || $processMode == 2) {
	print "\n Creating CRAB job for Run $thisRun\n";
	`crab -create`;
	$numberOfCrabCreations++;
    }

    #
    # submit the CRAB jobs in the Run directory
    #
    if($processMode == 2) {
	print "\n Submitting CRAB job for Run $thisRun\n";
	#my $submitReturn = `crab -submit`;
	#
	# A length of 1697 indicates no compatible site
        #
	#my $lenReturn = length($submitReturn);
	#print "\n Length of submitReturn = $lenReturn";
	#print "\n Text of submitReturn:\n $submitReturn\n";
	`crab -submit > crabSubmit.log`;
	$numberOfSubmittedLumis += $thisLumis;
	$numberOfCrabSubmissions++;
    }
    
}  # loop over run numbers

my $numberOfCrabJobs = $numberOfSubmittedLumis/$lumisPerJob;

print "\n\n Total number of Run subdirectories made = $numberOfDirectoriesMade";
print "\n Total number of CRAB creations = $numberOfCrabCreations";
print "\n Total number of CRAB submissions = $numberOfCrabSubmissions\n";
print "\n Total number of lumi files process = $numberOfSubmittedLumis";
print ",  giving approximately $numberOfCrabJobs jobs\n";

__END__
