#!/usr/bin/perl -w
# The line above this one should be the first line of the script
#
# Script for checking status of CRAB jobs according to run number, retrieving jobs, and resubmitting jobs
#
# Operating assumptions
#       There is a top working directory containing one or more CRAB run subdirectories in which CRAB jobs were created and submitted previously
#       In the top working directory there is a text file  "runDirectoriesList.txt"  which contains the names of the CRAB run subdirectories
#
# Usage: perl -w crabStatusCheck.pl -firstRun=I -lastRun=J -retrieveJobs=K -resubmitAllJobs=L -resubmitFailedJobs=M -resubmitAbortedJobs=N -resubmitTerminatedJobs=P -recycle=Q -extraRetrieve=R -killResubmit=S -skipStatusMake=T
#        None the input parameters needs to be explicitly provided since there are defaults for each of them
#        I and J are positive integers (I> 0, J >= I);  K, L, M, N, P are option switches either 0 or 1
#        firstRun = start position in list of Run subdirectories, default value is 1
#        lastRun = end position in list of Run subdirectories, default value is firstRun value
#        retrieveJobs ===> 0 means do not retrieve terminated jobs, 1 means retrieve terminated jobs if they exist (default)
#        resubmitAllJobs ===> 0 means do not resubmit both aborted and failed (default), 1 means resubmit both aborted and failed jobs  (overrides resubmitFailedJobs and resubmitAbortedJobs)
#        resubmitFailedJobs ===> 0 means do not resubmit failed jobs (default), 1 means resubmit failed jobs      (overidden by resubmitAllJobs option)
#        resubmitAbortedJobs ===> 0 means do not resubmit aborted jobs (default), 1 means resubmit aborted jobs   (overidden by resubmitAllJobs option)
#        resubmitTerminatedJobs ===> 0 means do not force resubmit terminated jobs (default), 1 means force resubmit terminated jobs
#        recycle === > 0 means do not do a second crab -status call after the retrieve jobs (default), 1 means do a second crab -status call after the retrieve jobs
#        extraRetrieve === > 1 means do an extra retrieve step for the terminated jobs not already retrieved
#        killResubmit ===> 1 means kill jobs still in submission state, and forceResubmit these
#        skipStatusMake ===> 1 skip the generation of new status.txt files 
#
# Output: Success and failure results for the individual subdirectories are given in order, and the cumulative total results are given at the end
#

#
# debugOption = 0 means no special checking
# debugOption = 1 means stop if the total jobs does not equal the sum of (cleared + aborted + still-submitted + still-created + still-ready + still-running)
# debugOption = 2 means stop if the total cleared jobs does not equal the sum of all the identified exit code jobs
#
my $debugOption = 2;

#
# Working directory
#
my $topName = "/gpfs22/home/maguirc/CMSSW_3_9_9_patch1/src/Pi0Analysis/EcalFlowNtp/crabSubmit3x3/cent28_32/";
if(-e $topName) {
    print "\ Working directory is $topName\n";
}
else {
    die "\n\n Unable to find working directory $topName\n\n";
}
#
# Subdirectories list
#
if(-e "runDirectoriesList.txt") {
    open(FILE, "runDirectoriesList.txt");
}
else {
    die "\n Unable to find runDirectoriesList.txt input file\n";
}

use strict;
use Getopt::Long;

#
# Run counting input variables
#
my $firstRun;  # start position in list of Run subdirectories
my $lastRun;   # end position in list of Run subdirectories
#
# Job action input switches
#
my $retrieveJobs;
my $resubmitAllJobs = 0;
my $resubmitAbortedJobs;
my $resubmitFailedJobs;
my $resubmitTerminatedJobs;
my $recycle;
my $extraRetrieve = 0;
my $killResubmit = 0;
my $skipStatusMake = 0;

GetOptions("firstRun=s" => \$firstRun, "lastRun=s" => \$lastRun, "retrieveJobs=s" => \$retrieveJobs, "resubmitAllJobs=s" => \$resubmitAllJobs, "resubmitFailedJobs=s" => \$resubmitFailedJobs, "resubmitAbortedJobs=s" => \$resubmitAbortedJobs, "resubmitTerminatedJobs=s" => \$resubmitTerminatedJobs, "recycle=s" => \$recycle, "extraRetrieve=s" => \$extraRetrieve, "killResubmit=s" => \$killResubmit, "skipStatusMake=s" => \$skipStatusMake);
#
# Check input variables
#
if($firstRun) {
    if($firstRun < 1) {
	die "\n The minimum value for firstRun is 1\n";
    }
    print "\n First run position $firstRun";
}
else {
    $firstRun = 1;
    print "\n Using default value for firstRun to be 1";
}

if($lastRun) {
    if($lastRun < $firstRun) {
	die "\n Cannot have lastRun less than firstRun\n";
    }
    print "\n Last run position $lastRun";
}
else {
    $lastRun = $firstRun;
    print "\n Default to have lastRun = firstRun = $firstRun";
}

if($resubmitAllJobs == 1) {
    $resubmitFailedJobs = 1; 
    $resubmitAbortedJobs = 1; 
}

if($resubmitFailedJobs) {
    if($resubmitFailedJobs == 1) {
	print "\n Failed jobs will be resubmitted";
    }
    else {
	$resubmitFailedJobs = 0;
	print "\n Failed jobs will not be resubmitted";
    }
}
else {
    $resubmitFailedJobs = 0;
    print "\n Default to have failed jobs not be resubmitted";
}

if($resubmitAbortedJobs) {
    if($resubmitAbortedJobs == 1) {
	print "\n Aborted jobs will be resubmitted";
    }
    else {
	$resubmitAbortedJobs = 0;
	print "\n Aborted jobs will not be resubmitted";
    }
}
else {
    $resubmitAbortedJobs = 0;
    print "\n Default to have aborted jobs not be resubmitted";
}

if($resubmitTerminatedJobs) {
    if($resubmitTerminatedJobs == 1) {
	print "\n Terminated jobs will be force resubmitted";
	$retrieveJobs = 0;
    }
    else {
	$resubmitTerminatedJobs = 0;
	print "\n Terminated jobs will not be force resubmitted";
    }
}
else {
    $resubmitTerminatedJobs = 0;
    print "\n Default to have terminated jobs not be force resubmitted";
}

if($retrieveJobs || $resubmitTerminatedJobs == 1) {
    if($retrieveJobs == 1) {
	print "\n Terminated jobs will be retrieved";
    }
    else {
	$retrieveJobs = 0;
	print "\n Terminated jobs will not be retrieved";
    }
}
else {
    $retrieveJobs = 1;
    print "\n Default is to retrieve terminated job";
}

if($killResubmit == 1) {
    print "\n Jobs still in submission state will be killed, and force resubmitted";
}
else {
    $killResubmit = 0;
    print "\n Jobs still in submission state will not be changed";
}

if($skipStatusMake == 1) {
    print "\n Generation of new statusCheck.txt files will be skipped";
}
else {
    $skipStatusMake = 0;
    print "\n Normal generation of new statusCheck.txt files";
}

if($extraRetrieve && $retrieveJobs == 1) {
    print "\n Extra step to retrieve terminated jobs not already retrieved";
}
else {
    $extraRetrieve = 0;
    print "\n No extra step to retrieve terminated jobs not already retrieved";
}

if($recycle) {
    if($retrieveJobs == 0 && $recycle == 1) {
	print "\n";
	die "\n ERROR: cannot request a second crab -status command if there is no job retrieval\n";
    }
    if($recycle == 1) {
	print "\n crab -status command will be repeated after job retrieval";
    }
    else {
	print "\n There will NOT be a crab -status command after job retrieval";
    }
}
else {
    $recycle = 0;
    if($retrieveJobs == 1) {
	print "\n Default to not have a crab -status command after job retrieval";
    }
}

print "\n End of input variable checking\n";

my $numberOfRunDirectories = 0;
my $countNumberOfFilesScanned = 0;
print "\n Starting initial scan of CRAB run directories\n";
while(<FILE>) {
    chop $_;
    my $subDirectoryName = $_;
    my $fullPath = $topName . $subDirectoryName;
    if(-e $fullPath) {
	chdir $fullPath;
    }
    else {
	die "\n\n Run subdirectory $fullPath does not exist\n";
    } # safety check

    $numberOfRunDirectories++;
    if($numberOfRunDirectories >= $firstRun && $numberOfRunDirectories <= $lastRun) {
       $countNumberOfFilesScanned++;

       if($skipStatusMake == 0) {
	   if(-e "statusCheck.txt") {
	       unlink("statusCheck.txt");
	   }
	   `crab -status > statusCheck.txt`;
	   print "\n Produced statusCheck.txt file for subdirectory $subDirectoryName , cumulative count $countNumberOfFilesScanned";
       } # check on skipStatusMake
   } # check on directory within limits
} # initial loop over subdirectories
close(FILE);

print "\n Total number of run subdirectories = $numberOfRunDirectories";
print " ;  number of run subdirectories to be scanned = $countNumberOfFilesScanned, with firstRun = $firstRun and lastRun = $lastRun\n";

my $numberOfDirectoriesRemaining = $lastRun - $firstRun + 1;
#
# Examine the statusCheck.txt file in each subdirectory
# Retrieve any completed jobs if retrieveJobs = 1
# Re-submit any aborted jobs if resubmitAbortedJobs = 1
# Re-submit any failed jobs if resubmitFailedJobs = 1
#

my $dev;
my $inode;
my $mode;
my $nlink;
my $uid;
my $gid;
my $rdev;
my $size;
my $atime;
my $mtime;
my $ctime;
my $bsize;
my $blocks;
my $sleepCounter = 100;
my $numberOfFilesScanned =0;
my $sumTotalJobs = 0;
my $minSize = 600;
my $sumTotalSubmittedJobs = 0;
my $sumTotalReSubmittedJobs = 0;
my $sumTotalCreatedJobs = 0;
my $sumTotalReadyJobs = 0;
my $sumTotalTerminatedJobs = 0;
my $sumTotalRunningJobs = 0;
my $sumTotalCancelledJobs = 0;
my $sumTotalAbortedJobs = 0;
my $sumTotalClearedJobs = 0;
my $sumTotalExitCodeZeroJobs = 0;
my $sumTotalExitCode8001Jobs = 0;
my $sumTotalExitCode8018Jobs = 0;
my $sumTotalExitCode8020Jobs = 0;
my $sumTotalExitCode8021Jobs = 0;
my $sumTotalExitCode10016Jobs = 0;
my $sumTotalExitCode50115Jobs = 0;
my $sumTotalExitCode50664Jobs = 0;
my $sumTotalExitCode50700Jobs = 0;
my $sumTotalExitCode60303Jobs = 0;
my $sumTotalExitCode60307Jobs = 0;
my $sumTotalExitCode60317Jobs = 0;
my $sumTotalExitCode60318Jobs = 0;

my $sumTotalRunsWithCreatedJobs = 0;
my $sumTotalRunsWithScheduledJobs = 0;
my $sumTotalRunsWithReadyJobs = 0;
my $sumTotalRunsWithSubmittedJobs = 0;
my $sumTotalRunsWithRunningJobs = 0;
my @arrayOfRunsWithCreatedJobs;
my @arrayOfRunsWithScheduledJobs;
my @arrayOfRunsWithReadyJobs;
my @arrayOfRunsWithSubmittedJobs;
my @arrayOfRunsWithRunningJobs;

#
# Node usage arrays
#
my $maximumNumberOfNodes = 2000;
my $maximumNodeNumberUsed = -1;
my $minimumNodeNumberUsed = $maximumNumberOfNodes + 1;
my @arrayOfUsedNodes;
my @arrayOfSuccessNodeInstances;
my @arrayOfFailureNodeInstances;
#
# Initialize the node arrays
#
for(my $kNode=0; $kNode<$maximumNumberOfNodes; $kNode++) {
    push @arrayOfUsedNodes, 0;
    push @arrayOfSuccessNodeInstances, 0;
    push @arrayOfFailureNodeInstances, 0;
} # loop to initialize nodes

#
# Failure mode arrays
#
my $numberOfFailures = 0;
my @arrayFailureDirectory;
my @arrayFailureExeNode;
my @arrayFailureJobID;
my @arrayFailureMode;
my @arrayFailureNode;
my @arrayFailureDate;
my @arrayFailureTime;
my @arrayFailureDateEnd;
my @arrayFailureTimeEnd;
my @arrayFailurePbsNumber;

#
# Success mode arrays
#
my $printSuccessResults = 1;
my $numberOfSuccesses = 0;
my @arraySuccessDirectory;
my @arraySuccessExeNode;
my @arraySuccessNode;
my @arraySuccessJobID;
my @arraySuccessDate;
my @arraySuccessTime;
my @arraySuccessDateEnd;
my @arraySuccessTimeEnd;
my @arraySuccessCpuPercent;
my @arraySuccessPbsNumber;

chdir $topName;
open(FILE, "runDirectoriesList.txt");
while(<FILE>) {
    #
    # Read names of the run subdirectories
    #
    chop $_;
    my $subDirectoryName = $_;
    $numberOfFilesScanned++;
    my $recyclePass = 0;
    my $foundCreatedJobs = 0;
    my $foundReadyJobs = 0;
    my $foundScheduledJobs = 0;
    my $foundSubmittedJobs = 0;
    my $foundRunningJobs = 0;
    my $foundRetrieveJobsLine = 0;
    my $foundJobsAbortedLine = 0;
    my $foundJobsAbortedLineNumber = 0;
    my $numberOfSubmittedJobs = 0;
    my $numberOfCreatedJobs = 0;
    my $numberOfReadyJobs = 0;
    my $numberOfRunningJobs = 0;
    my $numberOfCancelledJobs = 0;
    my $numberOfAbortedJobs = 0;
    my $numberOfClearedJobs = 0;
    my $numberOfExitCodeZeroJobs = 0;
    my $numberOfExitCode10016Jobs = 0;
    my $numberOfExitCode50115Jobs = 0;
    my $numberOfExitCode50664Jobs = 0;
    my $numberOfExitCode50700Jobs = 0;
    my $numberOfExitCode60303Jobs = 0;
    my $numberOfExitCode60307Jobs = 0;
    my $numberOfExitCode60317Jobs = 0;
    my $numberOfExitCode60318Jobs = 0;
    my $numberOfExitCode8001Jobs = 0;
    my $numberOfExitCode8018Jobs = 0;
    my $numberOfExitCode8020Jobs = 0;
    my $numberOfExitCode8021Jobs = 0;
    while($recyclePass == 0 || ($recyclePass == 1 && $recycle == 1)) {  # allow for recycle of the scans after the retrieval of the job outputs in this subdirectory
	chdir $topName;
	chdir $subDirectoryName;
	if($numberOfFilesScanned >= $firstRun && $numberOfFilesScanned <= $lastRun) {
	    #
	    # This run is within the first and last run limits
	    #
	    if($recyclePass == 0) {
		$numberOfDirectoriesRemaining--;
	    }
	    print "\n Begin processing subdirectory $subDirectoryName at recylePass = $recyclePass ,  number of directories remaining = $numberOfDirectoriesRemaining\n";
	    my $foundStatusCompleteFile = 0;
	    if(-e "statusCheck.txt") {
		for(my $iSleep=0; $iSleep<$sleepCounter; $iSleep++) {
		    ($dev, $inode, $mode, $nlink, $uid, $gid, $rdev,
		     $size, $atime, $mtime, $ctime, $bsize, $blocks) = stat "statusCheck.txt";
		    if($size > $minSize) {
			$foundStatusCompleteFile = $iSleep + 1;
			sleep 1;
			last;
		    }
		    sleep 2;
		} # wait for status.txt file to complete
	    }
	    else {
		die "\n Unable to find 'statusCheck.txt' file in subdirectory $subDirectoryName\n";
	    }

	    if($foundStatusCompleteFile == 0) {
		die "\n Unable to find statusComplete file in 200 seconds in subdirectory $subDirectoryName\n";
	    }
	    print "\n Found statusCheck.txt file at iteration $foundStatusCompleteFile with size $size in subdirectory $subDirectoryName\n";

	    my $countLinesWith_crabcolon = 0;
	    my $totalJobsThisRun = 0;
	    my $foundWorkingDirectoryLine = 0;
	    my $fullPathWorkingDirectory = 0;
	    my $foundTotalJobsLine = 0;
	    my $totalJobsLineNumber = 0;
	    my $retrieveJobsLineNumberNext = 0;
	    my $foundExitCodesSummaryLine = 0;
	    my $countLines = 0;
	    my $lineExitCodesSummaryNext = 0;
	    my $foundIDLine = 0;
	    my $errorJobsListLine = -1;
	    my $numberOfScheduledJobs = 0;
	    my $numberOfDoneJobs = 0;
	    my $numberOfTerminatedJobs = 0;
            my $retrieveTerminated = 0;
	    my $numberOfRetrievedJobs = 0;

	    open(STATUS, "statusCheck.txt");
	    while(<STATUS>) {
		chop $_;
		my $line = $_;
		$countLines++;
		my @arrayLineContents = split(' ', $line);
		my $arraySize = $#arrayLineContents + 1;
		if($arraySize > 0) {
		    #
		    # check for crab: lines
		    #
		    if($arrayLineContents[0] eq "crab:") {
			$countLinesWith_crabcolon++;
			if($arraySize == 4 && $arrayLineContents[2] eq "Total" and $arrayLineContents[3] eq "Jobs") {
			    $foundTotalJobsLine = 1;
			    $totalJobsLineNumber = $countLines;
			    $totalJobsThisRun = $arrayLineContents[1]; 
			    print "\n Total jobs = $totalJobsThisRun in subdirectory $subDirectoryName\n";
			    $sumTotalJobs += $totalJobsThisRun;
			    if($totalJobsThisRun == 0) {
				last;  # skip rest of scan
			    } # check for 0 total jobs
			} # check for Total Jobs line
			if($arraySize == 3 && $arrayLineContents[1] eq "ExitCodes" and $arrayLineContents[2] eq "Summary") {
			    $foundExitCodesSummaryLine = 1;
			    $lineExitCodesSummaryNext = $countLines + 1;
			}  # check for ExitCodes line
		    } # check for "crab:" first line element $countLines

		    if($totalJobsLineNumber > 0 && $countLines == $totalJobsLineNumber+2 && $killResubmit == 1) {

			print "\n Two lines past total jobs line number, at line $countLines";
			print "\n Line is $line";
			print "\n Array contents @arrayLineContents";
			if($arrayLineContents[0] eq 'List' &&
			   $arrayLineContents[1] eq 'of' &&
			   $arrayLineContents[2] eq 'jobs' &&
			   $arrayLineContents[3] eq 'Submitted:') {
			    print "\n List of jobs in submission state which will be killed:  $arrayLineContents[4]\n";
			    `crab -kill $arrayLineContents[4] > killList.txt`;
			    print "\n List of jobs in submission state which will be resubmitted:  $arrayLineContents[4]\n";
			    `crab -forceResubmit $arrayLineContents[4] > forceResubmitList.txt &`;
			}
			print "\n";
			#die "\n Temporary stop\n";
			
		    } # checking for kill/resubmit of jobs still in submission state

		    #
		    # Check for working directory line
		    #
		    if($arraySize == 3 && $arrayLineContents[0] eq "working" and $arrayLineContents[1] eq "directory") {
			$foundWorkingDirectoryLine = 1;
			$fullPathWorkingDirectory = $arrayLineContents[2];
		    }

		    #
		    # check for ID line
		    #
		    if($arraySize == 7 && $arrayLineContents[0] eq "ID" and $arrayLineContents[6] eq "E_HOST") {
			$foundIDLine = 1;
		    }

		    #
		    # check for individual job status information
		    #
		    if($foundIDLine == 1 && $arraySize == 4 && $arrayLineContents[2] eq "Submitted") {
			$numberOfSubmittedJobs++;
			if($foundSubmittedJobs == 0) {
			    $foundSubmittedJobs = 1;
			    $sumTotalRunsWithSubmittedJobs++;
			    push @arrayOfRunsWithSubmittedJobs, $subDirectoryName;
			}
		    }
		    if($foundIDLine == 1 && $arraySize == 4 && $arrayLineContents[2] eq "Created") {
			$numberOfCreatedJobs++;
			if($foundCreatedJobs == 0) {
			    $foundCreatedJobs = 1;
			    $sumTotalRunsWithCreatedJobs++;
			    push @arrayOfRunsWithCreatedJobs, $subDirectoryName;
			}
		    }
		    if($foundIDLine == 1 && ($arrayLineContents[$arraySize - 1] eq "ce1.accre.vanderbilt.edu" || $arrayLineContents[$arraySize - 1] eq "ce2.accre.vanderbilt.edu") ) {
			my $jobStatus = $arrayLineContents[2];
			if($jobStatus eq "Ready") {
			    $numberOfReadyJobs++;
			    if($foundReadyJobs == 0) {
				$foundReadyJobs = 1;
				$sumTotalRunsWithReadyJobs++;
				push @arrayOfRunsWithReadyJobs, $subDirectoryName;
			    }
			}
			if($jobStatus eq "Scheduled") {
			    $numberOfScheduledJobs++;
			    if($foundScheduledJobs == 0) {
				$foundScheduledJobs = 1;
				$sumTotalRunsWithScheduledJobs++;
				push @arrayOfRunsWithScheduledJobs, $subDirectoryName;
			    }
			}

			my $thisJobFailed = 0;

			if($jobStatus eq "Cancelled") {
			    $numberOfCancelledJobs++;
			    $thisJobFailed = 2;
			    $numberOfFailures++;
			    push @arrayFailureMode, "Cancelled";
			    push @arrayFailureDirectory, $subDirectoryName;
			    push @arrayFailureJobID, $arrayLineContents[0];
			    my @arrayExeNodeFull = split('\.', $arrayLineContents[$arraySize - 1]);
			    if($#arrayExeNodeFull < 2) {
				print "\n ExeNode parse failure for aborted job, with line contents = @arrayLineContents  and  ExePath = @arrayExeNodeFull\n";
				die "\n Software failure\n";
			    }
			    else {
				push @arrayFailureExeNode, $arrayExeNodeFull[0];
				push @arrayFailureNode, "NA";
				push @arrayFailureDate, "NA";
				push @arrayFailureTime, "NA";
				push @arrayFailureDateEnd, "NA";
				push @arrayFailureTimeEnd, "NA";
				push @arrayFailurePbsNumber, "NA";
			    }
			}

			if($jobStatus eq "Aborted") {
			    $numberOfAbortedJobs++;
			    $thisJobFailed = 2;
			    $numberOfFailures++;
			    push @arrayFailureMode, "Aborted";
			    push @arrayFailureDirectory, $subDirectoryName;
			    push @arrayFailureJobID, $arrayLineContents[0];
			    my @arrayExeNodeFull = split('\.', $arrayLineContents[$arraySize - 1]);
			    if($#arrayExeNodeFull < 2) {
				print "\n ExeNode parse failure for aborted job, with line contents = @arrayLineContents  and  ExePath = @arrayExeNodeFull\n";
				die "\n Software failure\n";
			    }
			    else {
				push @arrayFailureExeNode, $arrayExeNodeFull[0];
				push @arrayFailureNode, "NA";
				push @arrayFailureDate, "NA";
				push @arrayFailureTime, "NA";
				push @arrayFailureDateEnd, "NA";
				push @arrayFailureTimeEnd, "NA";
				push @arrayFailurePbsNumber, "NA";
			    }
			}

			if($jobStatus eq "Running") {
			    $numberOfRunningJobs++;
			    if($foundRunningJobs == 0) {
				$foundRunningJobs = 1;
				$sumTotalRunsWithRunningJobs++;
				push @arrayOfRunsWithRunningJobs, $subDirectoryName;
			    }
			}

			if($jobStatus eq "Done") {
			    $numberOfDoneJobs++;
			}
			if($jobStatus eq "Retrieved") {
			    $numberOfRetrievedJobs++;
			}

			my $jobAction = $arrayLineContents[3];
			if($jobAction eq "Terminated") {
			    $numberOfTerminatedJobs++;
			}

			if($jobAction eq "Cleared") {
			    $numberOfClearedJobs++;

			    #
			    # Check for correct number of data fields
			    #
			    my $ExeExitCode = $arrayLineContents[4];
			    my $JobExitCode = $arrayLineContents[$arraySize -2];
			    if($ExeExitCode eq "ce1.accre.vanderbilt.edu" ||
			       $ExeExitCode eq "ce2.accre.vanderbilt.edu" ||
			       $arraySize == 5) {
				print "\n\n Cleared job $arrayLineContents[0] with missing exit code field $ExeExitCode";
				print "\n Line contents array size = $arraySize";
				print "\n\n";
				$ExeExitCode = 0;
				$JobExitCode = 60318;
			    }
			    if($ExeExitCode == 0 && $JobExitCode == 0) {
				$numberOfExitCodeZeroJobs++;
			    }

			    if($ExeExitCode == 8001) {
				$numberOfExitCode8001Jobs++;
				$thisJobFailed = 1;
				$numberOfFailures++;
				push @arrayFailureMode, 8001;
			    }
			    if($ExeExitCode == 8018) {
				$numberOfExitCode8018Jobs++;
				$thisJobFailed = 1;
				$numberOfFailures++;
				push @arrayFailureMode, 8018;
			    }
			    if($ExeExitCode == 8020) {
				$numberOfExitCode8020Jobs++;
				$thisJobFailed = 1;
				$numberOfFailures++;
				push @arrayFailureMode, 8020;
			    }
			    if($ExeExitCode == 8021) {
				$numberOfExitCode8021Jobs++;
				$thisJobFailed = 1;
				$numberOfFailures++;
				push @arrayFailureMode, 8021;
			    }

			    if($JobExitCode == 10016) {
				$numberOfExitCode10016Jobs++;
				$thisJobFailed = 1;
				$numberOfFailures++;
				push @arrayFailureMode, 10016;
			    }

			    if($JobExitCode == 50115) {
				$numberOfExitCode50115Jobs++;
				$thisJobFailed = 1;
				$numberOfFailures++;
				push @arrayFailureMode, 50115;
			    }

			    if($JobExitCode == 50664) {
				$numberOfExitCode50664Jobs++;
				$thisJobFailed = 1;
				$numberOfFailures++;
				push @arrayFailureMode, 50664;
			    }

			    if($JobExitCode == 50700) {
				$numberOfExitCode50700Jobs++;
				$thisJobFailed = 1;
				$numberOfFailures++;
				push @arrayFailureMode, 50700;
			    }

			    if($JobExitCode == 60303) {
				$numberOfExitCode60303Jobs++;
				$thisJobFailed = 1;
				$numberOfFailures++;
				push @arrayFailureMode, 60303;
			    }

			    if($JobExitCode == 60307) {
				$numberOfExitCode60307Jobs++;
				$thisJobFailed = 1;
				$numberOfFailures++;
				push @arrayFailureMode, 60307;
			    }

			    if($JobExitCode == 60317) {
				$numberOfExitCode60317Jobs++;
				$thisJobFailed = 1;
				$numberOfFailures++;
				push @arrayFailureMode, 60317;
			    }

			    if($JobExitCode == 60318) {
				$numberOfExitCode60318Jobs++;
				$thisJobFailed = 1;
				$numberOfFailures++;
				push @arrayFailureMode, 60318;
			    }

			    #
			    # Get Date/Time and node information
			    # Need to open the CMSSW_JobID.stdout file in the res subdirectory
			    #
			    my $thisDate = "NF";
			    my $thisTime = "NF";
			    my $thisDateEnd = "NF";
			    my $thisTimeEnd = "NF";
			    my $thisCpuPercent = "NF";
			    my $thisPbsNumber = "NF";
			    my $thisNodeVampire = "NF";
			    my $thisNode = "NF";
			    my $nodeNumber = "NF";
			    my $nodeIndex = -1;
			    if($foundWorkingDirectoryLine == 1) {
				my $stdoutName = $fullPathWorkingDirectory . "res/" . "CMSSW_" . $arrayLineContents[0] . ".stdout";
				if($debugOption == 3) {
				    print "\n Looking for stdout file $stdoutName\n";
				}
				if(-e $stdoutName) {
				    my $linesInStdOut = 0;
				    open(CMSSWSTDOUT, $stdoutName);
				    while(<CMSSWSTDOUT>) {
					chop $_;
					my $thisOutLine = $_;
					if($debugOption == 3) {
					    print "\n $linesInStdOut )  $thisOutLine \n"
					    }
					my @arrayThisOutLine = split(' ', $thisOutLine);
					my $lastArrayIndex = $#arrayThisOutLine;
					if($linesInStdOut == 1) {
					    my @arrayRunningContents = split('\/', $thisOutLine);
					    $thisPbsNumber = $arrayRunningContents[2];
					    #print "\n At line number 1";
					    #print "\n Line text $thisOutLine";
					    #print "\n Line contents split @arrayRunningContents";
					    #print "\n Zeroth content $arrayRunningContents[0]";
					    #print "\n Second content $arrayRunningContents[2]";
					    #print "\n thisPbsNumber $thisPbsNumber";
					    #print "\n";
					    #die "\n\n Temporary stop\n\n";
					} # check for line number 1, counting from 0
					if($linesInStdOut == 2) {
					    $thisDate = $arrayThisOutLine[3] . " " . $arrayThisOutLine[4] . ", " . $arrayThisOutLine[7];
					    $thisTime = $arrayThisOutLine[5];
					} # check for line number 2 
					if($linesInStdOut == 3) {
					    $thisNodeVampire = $arrayThisOutLine[4];
					    my @arrayNodeContents = split('\.', $thisNodeVampire);
					    $thisNode = $arrayNodeContents[0];
					    my @arrayNodeNumber = split('p', $thisNode);
					    $nodeNumber = $arrayNodeNumber[1];
					    $thisNodeVampire = "vmp$nodeNumber";
					    if($nodeNumber < 1 || $nodeNumber >  $maximumNumberOfNodes) {
						die "\n Bad node number $nodeNumber from original $thisNodeVampire going to $thisNode\n";
					    }
					    if($minimumNodeNumberUsed > $nodeNumber) {
						$minimumNodeNumberUsed = $nodeNumber;
					    }
					    if($maximumNodeNumberUsed < $nodeNumber) {
						$maximumNodeNumberUsed = $nodeNumber;
					    }
					    $nodeIndex = $nodeNumber - 1;
					    $arrayOfUsedNodes[$nodeIndex]++;
					} # check for line number 3
					$linesInStdOut++;
					if($linesInStdOut >= 4 && $lastArrayIndex > 6) {
					    if($arrayThisOutLine[0] eq '>>>' && $arrayThisOutLine[1] eq 'cmsRun' &&
					       $arrayThisOutLine[2] eq 'ended' && $arrayThisOutLine[3] eq 'at') {
						$thisDateEnd = $arrayThisOutLine[4] . " " . $arrayThisOutLine[5] . ", " . $arrayThisOutLine[6];
						$thisTimeEnd = $arrayThisOutLine[7];
					    }
					}
					if($linesInStdOut >= 4 && $lastArrayIndex == 0) {
					    my @arrayThisOutLine2 = split('=', $arrayThisOutLine[0]);
					    if($#arrayThisOutLine2 == 1) {
						if($arrayThisOutLine2[0] eq 'CrabCpuPercentage') {
						    $thisCpuPercent = $arrayThisOutLine2[1];
						} # check for CpuPercentage line
					    } # check for two text elements separated by the = sign
					} # checking for any line after the third
				    } # loop over CMSSWSTDOUT first 4 lines
				    close(CMSSWSTDOUT);
				} # check for presence of .stdout file
				else {
				    print "\n Unable to find stdout file $stdoutName\n";
				}
			    } # check for foundWorkingDirectory line
			    else {
				die "\n Unable to find working directory line in $subDirectoryName\n";
			    } 
 
			    if($thisJobFailed == 0) {
				$numberOfSuccesses++;
				push @arraySuccessDirectory, $subDirectoryName;
				push @arraySuccessJobID, $arrayLineContents[0]; 
				push @arraySuccessExeNode, $arrayLineContents[$arraySize - 1];
				push @arraySuccessDate, $thisDate;
				push @arraySuccessTime, $thisTime;
				push @arraySuccessNode, $thisNodeVampire;
				push @arraySuccessDateEnd, $thisDateEnd;
				push @arraySuccessTimeEnd, $thisTimeEnd;
				push @arraySuccessCpuPercent, $thisCpuPercent;
				push @arraySuccessPbsNumber, $thisPbsNumber;
			    }
   
			    if($thisJobFailed == 1) {
				push @arrayFailureDirectory, $subDirectoryName;
				push @arrayFailureJobID, $arrayLineContents[0]; 
				push @arrayFailureExeNode, $arrayLineContents[$arraySize - 1];
				push @arrayFailureDate, $thisDate;
				push @arrayFailureTime, $thisTime;
				push @arrayFailureNode, $thisNodeVampire;
				push @arrayFailureDateEnd, $thisDateEnd;
				push @arrayFailureTimeEnd, $thisTimeEnd;
				push @arrayFailurePbsNumber, $thisPbsNumber;

				if($nodeIndex > -1) {
				    $arrayOfFailureNodeInstances[$nodeIndex]++;
				}
			    } # check for job failure (but not aborted nor cancelled)
			    
			    if($thisJobFailed == 0 && $nodeIndex > -1) {
				$arrayOfSuccessNodeInstances[$nodeIndex]++;
			    }

			} # check for cleared job action status

			my $lastIndexFailureDirectory = $#arrayFailureDirectory;
			my $lastIndexJobID = $#arrayFailureJobID;
			my $lastIndexFailureNode = $#arrayFailureNode;
			my $lastIndexExeNode = $#arrayFailureExeNode;
			if(($lastIndexFailureDirectory != $lastIndexJobID) || ($lastIndexFailureDirectory != $lastIndexFailureNode) ||
			   ($lastIndexFailureDirectory != $lastIndexExeNode)) {
			    print "\n Array index mis-match";
			    print "\n Directory $lastIndexFailureDirectory";
			    print "\n JobID $lastIndexJobID";
			    print "\n FailureNode $lastIndexFailureNode";
			    print "\n ExeNode $lastIndexExeNode";
			    print "\n";
			    die "\n Software error for failure array indexing\n";
			}
			if($thisJobFailed != 0 && $debugOption == 3) {
			    print "\n Failure number $numberOfFailures ) has failure type $thisJobFailed";
			    my $arrayIndex = $numberOfFailures - 1;
			    print "\n Dir  = $arrayFailureDirectory[$arrayIndex]";
			    print "\n Job  = $arrayFailureJobID[$arrayIndex]";
			    print "\n Mode = $arrayFailureMode[$arrayIndex]";
			    print "\n Node = $arrayFailureNode[$arrayIndex]";
			    print "\n [Local] Start Date = $arrayFailureDate[$arrayIndex]";
			    print "\n Start Time = $arrayFailureTime[$arrayIndex]";
			    print "\n [UTC] End Date = $arrayFailureDateEnd[$arrayIndex]";
			    print "\n End Time = $arrayFailureTimeEnd[$arrayIndex]";
			    print "\n";
			    if($numberOfFailures >= 13) {
				die "\n Temporary stop too many failures\n";
			    }
			} # check for debug print
			
		    } # individual job status

		    #
		    # Check for line following ExitCodes summary
		    #
		    if($foundExitCodesSummaryLine == 1 && $countLines == $lineExitCodesSummaryNext) {
			if($arrayLineContents[$arraySize -1] eq ':') {
			    print "\n Non-zero ExitCodes Summary Line: $line is missing an error code value (presumably 60318)"; 
			    $errorJobsListLine = $countLines + 1;
			}
			else {
			    if($arrayLineContents[$arraySize -1] != 0) {
				print "\n Non-zero ExitCodes Summary Line: $line";
				$errorJobsListLine = $countLines + 1;
			    }
			}
		    }

		    if($countLines == $errorJobsListLine) {
			if($resubmitFailedJobs == 1) {
			    print "\n Resubmitting jobs $arrayLineContents[$arraySize -1]\n";
			    `crab -resubmit $arrayLineContents[$arraySize -1] &`;
			    $sumTotalReSubmittedJobs++;
			    print "\n Current number of resubmitted jobs $sumTotalReSubmittedJobs\n";
			}
			else {
			    print "\n Jobs to be resubmitted $arrayLineContents[$arraySize -1]\n";
			}
			$errorJobsListLine = -1;
		    }

		    #
		    # Check for retrieve jobs line
		    #
		    if($foundTotalJobsLine == 1) {
			if($arraySize == 4 &&  $arrayLineContents[2] eq "Jobs" &&  $arrayLineContents[3] eq "Aborted") {
			    $foundJobsAbortedLine = 1;
			    $foundJobsAbortedLineNumber = $countLines;
			}
			if($foundJobsAbortedLine = 1 && $countLines == $foundJobsAbortedLineNumber + 2) {
			    if($resubmitAbortedJobs == 1) {
				print "\n Resubmission for aborted jobs $arrayLineContents[$arraySize - 1]\n";
				`crab -resubmit  $arrayLineContents[$arraySize - 1] &`;
				$sumTotalReSubmittedJobs++;
				print "\n Current number of resubmitted jobs $sumTotalReSubmittedJobs\n";
			    }
			    else {
				print "\n Aborted jobs which could be resubmitted = $arrayLineContents[$arraySize - 1]\n";
			    }
			}
			if($arraySize == 10 && $arrayLineContents[2] eq "retrieve" && $arrayLineContents[3] eq "them") {
			    $foundRetrieveJobsLine = 1;
			    $retrieveJobsLineNumberNext = $countLines + 1;
			}

			if($foundRetrieveJobsLine == 1 && $countLines == $retrieveJobsLineNumberNext) {
			    if($retrieveJobs == 1) {
				print "\n Retrieving jobs $arrayLineContents[3] in subdirectory $subDirectoryName\n";
				`crab -getoutput $arrayLineContents[3] > getOutputList.txt`;
				$retrieveTerminated = 1;
			    }
			    else {
				print "\n Retrieve jobs command will be crab -getoutput $arrayLineContents[3] in subdirectory $subDirectoryName\n";
			    }
			    if($resubmitTerminatedJobs == 1) {
				print "\n Doing a forced resbumit of terminated jobs $arrayLineContents[3] in subdirectory $subDirectoryName\n";
				`crab -forceResubmit  $arrayLineContents[3] > forceResubmitList.txt &`;
			    }
			} # check on line following the "Jobs terminated: retrieve them ..." line

		    } # check of $foundTotalJobsLine = 1
		
		} # check for non-blank line
	    } # scanning the CRAB status file;

	    close(STATUS);

	    if($retrieveTerminated == 0 && $retrieveJobs == 1 && $numberOfTerminatedJobs > 0) {
		if($extraRetrieve == 1) {
		    print "\n Doing extra retrieve step for $numberOfTerminatedJobs number of terminated jobs\n";
		    `crab -get > extraCrabGet.txt`;
		}
		else {
		    $sumTotalTerminatedJobs += $numberOfTerminatedJobs;
		}
	    }

	    print "\n Number of crab: lines in this file = $countLinesWith_crabcolon in subdirectory $subDirectoryName";
	    print "\n Number of Submitted jobs = $numberOfSubmittedJobs";
	    print "\n Number of Ready jobs = $numberOfReadyJobs";
	    print "\n Number of Scheduled jobs = $numberOfScheduledJobs";
	    print "\n Number of Created jobs = $numberOfCreatedJobs";
	    print "\n Number of Running jobs = $numberOfRunningJobs";
	    print "\n Number of Done jobs = $numberOfDoneJobs";
	    print "\n Number of Terminated jobs = $numberOfTerminatedJobs";
	    print "\n Number of Retrieved jobs = $numberOfRetrievedJobs";
	    print "\n Number of Cleared jobs = $numberOfClearedJobs";
	    if($numberOfClearedJobs > 0) {
		print "\n Number of ExeExitCode 0 jobs =  $numberOfExitCodeZeroJobs";
		print "\n Number of ExeExitCode 8001 jobs = $numberOfExitCode8001Jobs";
		print "\n Number of ExeExitCode 8018 jobs = $numberOfExitCode8018Jobs";
		print "\n Number of ExeExitCode 8020 jobs = $numberOfExitCode8020Jobs";
		print "\n Number of ExeExitCode 8021 jobs = $numberOfExitCode8021Jobs";
		print "\n Number of JobExitCode 10016 jobs = $numberOfExitCode10016Jobs";
		print "\n Number of JobExitCode 50115 jobs = $numberOfExitCode50115Jobs";
		print "\n Number of JobExitCode 50664 jobs = $numberOfExitCode50664Jobs";
		print "\n Number of JobExitCode 50700 jobs = $numberOfExitCode50700Jobs";
		print "\n Number of JobExitCode 60303 jobs = $numberOfExitCode60303Jobs";
		print "\n Number of JobExitCode 60307 jobs = $numberOfExitCode60307Jobs";
		print "\n Number of JobExitCode 60317 jobs = $numberOfExitCode60317Jobs";
		print "\n Number of JobExitCode 60318 jobs = $numberOfExitCode60318Jobs";
	    }
	    if($foundExitCodesSummaryLine == 1) {
		print "\n An ExitCodes Summary line was found in subdirectory $subDirectoryName\n";
	    }
	    else {
		print "\n An ExitCodes Summary line was NOT found in subdirectory $subDirectoryName\n";
	    }

	    if($foundTotalJobsLine == 0 ) {
		die "\n Did not find Total Jobs line in status file which has $countLines lines\n";
	    }
	} # check on first and last run numbers to be scanned

	$recyclePass++;
	if($foundRetrieveJobsLine == 0) {
	    $recyclePass = 2;  # no need for a recycle of crab -status if there were no retrieved jobs
	}
	if($recyclePass < 2 && $recycle == 1) {
	    unlink("statusCheck.txt");
	    print "\n Recycle of CRAB status after a retrieval of jobs in subdirectory $subDirectoryName\n";
	    `crab -status >& statusCheck.txt &`;
	    $foundRetrieveJobsLine = 0;
	    $numberOfAbortedJobs = 0;
	    $numberOfCancelledJobs = 0;
	    $numberOfClearedJobs = 0;
	    $numberOfExitCodeZeroJobs = 0;
	    $numberOfExitCode10016Jobs = 0;
	    $numberOfExitCode50115Jobs = 0;
	    $numberOfExitCode50664Jobs = 0;
	    $numberOfExitCode50700Jobs = 0;
	    $numberOfExitCode60303Jobs = 0;
	    $numberOfExitCode60307Jobs = 0;
	    $numberOfExitCode60317Jobs = 0;
	    $numberOfExitCode60318Jobs = 0;
	    $numberOfExitCode8001Jobs = 0;
	    $numberOfExitCode8018Jobs = 0;
	    $numberOfExitCode8020Jobs = 0;
	    $numberOfExitCode8021Jobs = 0;
	    $numberOfSubmittedJobs = 0;
	    $numberOfCreatedJobs = 0;
	    $numberOfReadyJobs = 0;
	    $numberOfRunningJobs = 0;
	    $foundJobsAbortedLine = 0;
	    $foundJobsAbortedLineNumber = 0;
	}

    } # recycle check

    $sumTotalSubmittedJobs += $numberOfSubmittedJobs;
    $sumTotalAbortedJobs += $numberOfAbortedJobs;
    $sumTotalCancelledJobs += $numberOfCancelledJobs;
    $sumTotalCreatedJobs += $numberOfCreatedJobs;
    $sumTotalReadyJobs += $numberOfReadyJobs;
    $sumTotalRunningJobs += $numberOfRunningJobs;
    $sumTotalClearedJobs += $numberOfClearedJobs;
    $sumTotalExitCodeZeroJobs += $numberOfExitCodeZeroJobs;
    $sumTotalExitCode8001Jobs += $numberOfExitCode8001Jobs;
    $sumTotalExitCode8018Jobs += $numberOfExitCode8018Jobs;
    $sumTotalExitCode8020Jobs += $numberOfExitCode8020Jobs;
    $sumTotalExitCode8021Jobs += $numberOfExitCode8021Jobs;
    $sumTotalExitCode10016Jobs += $numberOfExitCode10016Jobs;
    $sumTotalExitCode50115Jobs += $numberOfExitCode50115Jobs;
    $sumTotalExitCode50664Jobs += $numberOfExitCode50664Jobs;
    $sumTotalExitCode50700Jobs += $numberOfExitCode50700Jobs;
    $sumTotalExitCode60303Jobs += $numberOfExitCode60303Jobs;
    $sumTotalExitCode60307Jobs += $numberOfExitCode60307Jobs;
    $sumTotalExitCode60317Jobs += $numberOfExitCode60317Jobs;
    $sumTotalExitCode60318Jobs += $numberOfExitCode60318Jobs;

    if($debugOption == 1 && ($sumTotalJobs - $sumTotalCancelledJobs - $sumTotalAbortedJobs - $sumTotalReadyJobs - $sumTotalRunsWithScheduledJobs - $sumTotalSubmittedJobs - 
			     $sumTotalClearedJobs - $sumTotalRunningJobs - $sumTotalCreatedJobs) != 0) {
	print "\n Total jobs discrepancy in subdirectory $subDirectoryName";
	print "\n Sum of all jobs still in submission state = $sumTotalSubmittedJobs";
	print "\n Sum of all jobs still in ready state =  $sumTotalReadyJobs";
	print "\n Sum of all created jobs = $sumTotalCreatedJobs";
	print "\n Sum of all jobs in scheduled state =  $sumTotalRunsWithScheduledJobs";
	print "\n Sum of all running jobs = $sumTotalRunningJobs";
	print "\n Sum of all total jobs = $sumTotalJobs";
	print "\n Sum of all aborted jobs = $sumTotalAbortedJobs";
	print "\n Sum of all cancelled jobs = $sumTotalCancelledJobs";
	print "\n Sum of all cleared jobs = $sumTotalClearedJobs";
	print "\n";
	die "\n\n Debug stop\n";
    }
    
    my $testMissingExitCodeJobs =  $sumTotalClearedJobs - $sumTotalExitCodeZeroJobs - $sumTotalExitCode8001Jobs - $sumTotalExitCode8018Jobs - $sumTotalExitCode8020Jobs -
	$sumTotalExitCode8021Jobs - $sumTotalExitCode10016Jobs - $sumTotalExitCode50115Jobs - $sumTotalExitCode50664Jobs  - $sumTotalExitCode50700Jobs - $sumTotalExitCode60303Jobs -
	$sumTotalExitCode60307Jobs - $sumTotalExitCode60317Jobs - $sumTotalExitCode60318Jobs;
    if($debugOption == 2 && $testMissingExitCodeJobs != 0) {
	print "\n Cleared jobs discrepancy in subdirectory $subDirectoryName";
	print "\n Sum of all jobs still in submission state = $sumTotalSubmittedJobs";
	print "\n Sum of all total jobs = $sumTotalJobs";
	print "\n Sum of all cancelled jobs = $sumTotalCancelledJobs";
	print "\n Sum of all aborted jobs = $sumTotalAbortedJobs";
	print "\n Sum of all cleared jobs = $sumTotalClearedJobs";
	print "\n Sum of all ExitCodeZero jobs = $sumTotalExitCodeZeroJobs";
	print "\n Sum of all ExitCode8001 jobs = $sumTotalExitCode8001Jobs";
	print "\n Sum of all ExitCode8018 jobs = $sumTotalExitCode8018Jobs";
	print "\n Sum of all ExitCode8020 jobs = $sumTotalExitCode8020Jobs";
	print "\n Sum of all ExitCode8021 jobs = $sumTotalExitCode8021Jobs";
	print "\n Sum of all ExitCode10016 jobs = $sumTotalExitCode10016Jobs";
	print "\n Sum of all ExitCode50115 jobs = $sumTotalExitCode50115Jobs";
	print "\n Sum of all ExitCode50664 jobs = $sumTotalExitCode50664Jobs";
	print "\n Sum of all ExitCode50700 jobs = $sumTotalExitCode50700Jobs";
	print "\n Sum of all ExitCode60303 jobs = $sumTotalExitCode60303Jobs";
	print "\n Sum of all ExitCode60307 jobs = $sumTotalExitCode60307Jobs";
	print "\n Sum of all ExitCode60317 jobs = $sumTotalExitCode60317Jobs";
	print "\n Sum of all ExitCode60318 jobs = $sumTotalExitCode60318Jobs";
	print "\n Number of missing exit code jobs =  $testMissingExitCodeJobs";
	print "\n";
	die "\n\n Debug stop\n";
    }
    if($numberOfFilesScanned > $lastRun) {
	last;
    }

} # second loop over subdirectories

close(FILE);
print "\n Sum of all total jobs = $sumTotalJobs";
print "\n Sum of all jobs still in submission state = $sumTotalSubmittedJobs";
print "\n Sum of all jobs still in scheduled state = $sumTotalRunsWithScheduledJobs";
print "\n Sum of all jobs still in ready state = $sumTotalRunsWithReadyJobs";
print "\n Sum of all cancelled jobs = $sumTotalCancelledJobs";
print "\n Sum of all aborted jobs = $sumTotalAbortedJobs";
print "\n Sum of all created jobs = $sumTotalCreatedJobs";
print "\n Sum of all running jobs = $sumTotalRunningJobs";
print "\n Sum of all terminated jobs not retrieved = $sumTotalTerminatedJobs";
print "\n Sum of all cleared jobs = $sumTotalClearedJobs";
print "\n Sum of all ExitCodeZero jobs = $sumTotalExitCodeZeroJobs";
print "\n Sum of all ExitCode8001 jobs = $sumTotalExitCode8001Jobs";
print "\n Sum of all ExitCode8018 jobs = $sumTotalExitCode8018Jobs";
print "\n Sum of all ExitCode8020 jobs = $sumTotalExitCode8020Jobs";
print "\n Sum of all ExitCode8021 jobs = $sumTotalExitCode8021Jobs";
print "\n Sum of all ExitCode10016 jobs = $sumTotalExitCode10016Jobs";
print "\n Sum of all ExitCode50115 jobs = $sumTotalExitCode50115Jobs";
print "\n Sum of all ExitCode50664 jobs = $sumTotalExitCode50664Jobs";
print "\n Sum of all ExitCode50700 jobs = $sumTotalExitCode50700Jobs";
print "\n Sum of all ExitCode60303 jobs = $sumTotalExitCode60303Jobs";
print "\n Sum of all ExitCode60307 jobs = $sumTotalExitCode60307Jobs";
print "\n Sum of all ExitCode60317 jobs = $sumTotalExitCode60317Jobs";
print "\n Sum of all ExitCode60318 jobs = $sumTotalExitCode60318Jobs";
my $missingExitCodeJobs =  $sumTotalClearedJobs - $sumTotalExitCodeZeroJobs - $sumTotalExitCode8001Jobs - $sumTotalExitCode8018Jobs - $sumTotalExitCode8020Jobs -
    $sumTotalExitCode8021Jobs - $sumTotalExitCode10016Jobs - $sumTotalExitCode50115Jobs - $sumTotalExitCode50664Jobs - $sumTotalExitCode50700Jobs - $sumTotalExitCode60303Jobs -
    $sumTotalExitCode60307Jobs - $sumTotalExitCode60317Jobs - $sumTotalExitCode60318Jobs;
print "\n Number of missing exit code jobs = $missingExitCodeJobs\n";
print "\n Number resubmitted requests = $sumTotalReSubmittedJobs";

if($sumTotalRunsWithCreatedJobs > 0) {
    my $iCreated = 0;
    print "\n Number of runs still having created jobs = $sumTotalRunsWithCreatedJobs";
    for(my $kCreated=0; $kCreated<$sumTotalRunsWithCreatedJobs; $kCreated++) {
	$iCreated++;
	print "\n $iCreated) $arrayOfRunsWithCreatedJobs[$kCreated]";
    }
    print "\n";
}
if($sumTotalRunsWithReadyJobs > 0) {
    my $iReady = 0;
    print "\n Number of runs still having ready jobs = $sumTotalRunsWithReadyJobs";
    for(my $kReady=0; $kReady<$sumTotalRunsWithReadyJobs; $kReady++) {
	$iReady++;
	print "\n $iReady) $arrayOfRunsWithReadyJobs[$kReady]";
    }
    print "\n";
}
if($sumTotalRunsWithScheduledJobs > 0) {
    my $iScheduled = 0;
    print "\n Number of runs still having scheduled jobs = $sumTotalRunsWithScheduledJobs";
    for(my $kScheduled=0; $kScheduled<$sumTotalRunsWithScheduledJobs; $kScheduled++) {
	$iScheduled++;
	print "\n $iScheduled) $arrayOfRunsWithScheduledJobs[$kScheduled]";
    }
    print "\n";
}
if($sumTotalRunsWithSubmittedJobs > 0) {
    my $iSubmitted = 0;
    print "\n Number of runs still having submitted jobs = $sumTotalRunsWithSubmittedJobs";
    for(my $kSubmitted=0; $kSubmitted<$sumTotalRunsWithSubmittedJobs; $kSubmitted++) {
	$iSubmitted++;
	print "\n $iSubmitted) $arrayOfRunsWithSubmittedJobs[$kSubmitted]";
    }
    print "\n";
}
if($sumTotalRunsWithRunningJobs > 0) {
    my $iRunning = 0;
    print "\n Number of runs still having running jobs = $sumTotalRunsWithRunningJobs";
    for(my $kRunning=0; $kRunning<$sumTotalRunsWithRunningJobs; $kRunning++) {
	$iRunning++;
	print "\n $iRunning) $arrayOfRunsWithRunningJobs[$kRunning]";
    }
    print "\n";
}
if($numberOfFailures > 0) {
    print "\n There were $numberOfFailures job failures in this CRAB group\n";
    for(my $kFail=0; $kFail<$numberOfFailures; $kFail++) {
	my $kFail1 = $kFail+1;
	print "\n $kFail1)  ";
	print " $arrayFailureDirectory[$kFail]  ";
	print " Job ID = $arrayFailureJobID[$kFail],  ";
	print " Mode = $arrayFailureMode[$kFail],  ";
        if($arrayFailureMode[$kFail] eq "Aborted" || $arrayFailureMode[$kFail] eq "Cancelled" ) {
	    print " Submission Node  = $arrayFailureExeNode[$kFail]";
	}
	else {
	    print " Node = $arrayFailureNode[$kFail],  ";
	    print " [Local] Start $arrayFailureTime[$kFail]";
	    print " on $arrayFailureDate[$kFail]";
	    print " [UTC] End $arrayFailureTimeEnd[$kFail]";
	    print " on $arrayFailureDateEnd[$kFail]";
            print " from ExeNode $arrayFailureExeNode[$kFail]";
	    print " by PBS $arrayFailurePbsNumber[$kFail]";
	}  # extra information for non-abort failures
    }  # loop over number of failures
    print "\n";
}
else {
    print "\n There were no job failures in this CRAB group\n";
} # check on number of failures

if($numberOfSuccesses >0) {
    my $crabSuccessTimesName = "crabSuccessTimes.txt";
    open(OUTFILE, ">$topName$crabSuccessTimesName");
    print "\n There were $numberOfSuccesses successes in this CRAB group\n";
    my @arrayOutput;
    if($printSuccessResults == 1) {
	for(my $kSuccess=0; $kSuccess<$numberOfSuccesses; $kSuccess++) {
	    my $kSuccess1 = $kSuccess+1;
	    print "\n $kSuccess1)  ";
	    print OUTFILE " $kSuccess";
	    print " $arraySuccessDirectory[$kSuccess]  ";

	    @arrayOutput = split("n", $arraySuccessDirectory[$kSuccess]);
	    print OUTFILE " $arrayOutput[1]";

	    print " Job ID = $arraySuccessJobID[$kSuccess]";
	    print OUTFILE " $arraySuccessJobID[$kSuccess]";

	    print " Node = $arraySuccessNode[$kSuccess],  ";
	    print " Success for";
	    @arrayOutput = split("p", $arraySuccessNode[$kSuccess]);
	    print OUTFILE " $arrayOutput[1]";

	    print " [Local] Start $arraySuccessTime[$kSuccess]";
	    @arrayOutput = split(":", $arraySuccessTime[$kSuccess]);
	    print OUTFILE " Local Start $arrayOutput[0] $arrayOutput[1] $arrayOutput[2]";

	    print " on $arraySuccessDate[$kSuccess]";
	    @arrayOutput = split(",", $arraySuccessDate[$kSuccess]);
	    print OUTFILE " $arrayOutput[0]";

	    print " [UTC] End $arraySuccessTimeEnd[$kSuccess]";
	    @arrayOutput = split(":", $arraySuccessTimeEnd[$kSuccess]);
	    print OUTFILE " UTC End $arrayOutput[0] $arrayOutput[1] $arrayOutput[2]";

	    print " on $arraySuccessDateEnd[$kSuccess]";
	    @arrayOutput = split(",", $arraySuccessDateEnd[$kSuccess]);
	    my @arrayOutput2 = split(" ", $arrayOutput[0]);
	    print OUTFILE " $arrayOutput2[1]$arrayOutput[1]";

	    print " from ExeNode $arraySuccessExeNode[$kSuccess]";

	    print " with WN CPU efficiency $arraySuccessCpuPercent[$kSuccess]";
	    @arrayOutput = split("%", $arraySuccessCpuPercent[$kSuccess]);
	    print OUTFILE " Efficiency $arrayOutput[0]";

            print " by PBS $arraySuccessPbsNumber[$kSuccess]";
	    @arrayOutput = split('\.', $arraySuccessPbsNumber[$kSuccess]);
	    print OUTFILE " PBS $arrayOutput[0]\n";
	    		
	} # loop over successes
	print "\n";

	close(OUTFILE);

    } # check on printing success results
}
else {
    print "\n There were no successes in this CRAB group\n";
} # check on number of successess

print "\n The minimum node number used was $minimumNodeNumberUsed , and the maximum node number used was $maximumNodeNumberUsed";
print "\n List of nodes used";
my $jNode = 0;
for(my $iNode=0; $iNode<$maximumNumberOfNodes; $iNode++) {
    if($arrayOfUsedNodes[$iNode] > 0) {
	$jNode++;
	my $nodeNumber = $iNode + 1;
	print "\n $jNode) vmp.$nodeNumber used $arrayOfUsedNodes[$iNode] times, with $arrayOfSuccessNodeInstances[$iNode] successes and  $arrayOfFailureNodeInstances[$iNode] failures";
    }
}
print "\n";
__END__
