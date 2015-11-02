#include <iostream>
#include <fstream>
#include <math.h>

#include <TROOT.h>
#include <TFile.h>
#include <TSystem.h>
#include <TStyle.h>
#include <TNtuple.h>
#include <TCanvas.h>
#include <TH1F.h>
#include <TH2F.h>
#include <TMath.h>
#include <TRandom1.h>
#include <TLatex.h>
#include <TF1.h>
#include <TMultiGraph.h>
#include <TGraphErrors.h>
#include <TAxis.h>
#include <TLine.h>
#include <TDatime.h>
using namespace std;

// v2 fit function for single particles
Double_t v2SinglesFit(Double_t *x, Double_t *par) {
  return par[0]*(1.0 + 2.0*par[1]*cos(2.0*x[0]));
}

// v2 fit function for pairs
Double_t v2Fit(Double_t *x, Double_t *par) {
  return 1.0 + 2.0*par[0]*cos(2.0*x[0]);
}

Double_t v2FitPlusGaussian(Double_t *x, Double_t *par) {
  if(par[3] != 0) {
    return par[1]*(1.0 + 2.0*par[0]*cos(2.0*x[0])) +
      par[2]*exp(-x[0]*x[0]/(par[3]*par[3]));
  }
  else {
    return 0.0; 
  }
}

// constant background
Double_t constantBackground(Double_t *x, Double_t *par) {
  return par[0];
}

// one parameter linear background function
Double_t linearBackgroundOneParameter(Double_t *x, Double_t *par) {
  return  par[0]*x[0];
}

// two-parameter linear background function
Double_t linearBackground(Double_t *x, Double_t *par) {
  return par[0] + par[1]*x[0];
}

// Quadratic background function
Double_t quadraticBackground(Double_t *x, Double_t *par) {
  return par[0] + par[1]*x[0] + par[2]*x[0]*x[0];
}

// Gauss peak function
Double_t gaussPeak(Double_t *x, Double_t *par) {
  if(par[2] != 0.0) {
    double arg = x[0] - par[1];
    return par[0]*exp(-arg*arg/(par[2]*par[2]));
  }
  return 0.0;
}

// sum of quadratic background and peak function
Double_t fitFunctionQuadratic(Double_t *x, Double_t *par) {
  return quadraticBackground(x,par) + gaussPeak(x,&par[3]);
}

// sum of one-parameter linear background and peak function
Double_t fitFunctionOneLinear(Double_t *x, Double_t *par) {
  return linearBackgroundOneParameter(x,par) + gaussPeak(x,&par[1]);
}

// sum of two-linear background and peak function
Double_t fitFunctionLinear(Double_t *x, Double_t *par) {
  return linearBackground(x,par) + gaussPeak(x,&par[2]);
}

// sum of constant background and peak function
Double_t fitFunctionConstant(Double_t *x, Double_t *par) {
  return constantBackground(x,par) + gaussPeak(x,&par[1]);
}

// sum of linear background and two peak functions
Double_t fitFunctionLinear2Peaks(Double_t *x, Double_t *par) {
  return linearBackground(x,par) + gaussPeak(x,&par[2]) + gaussPeak(x,&par[5]);
}

#include <DataFormats/Math/interface/deltaPhi.h>

const double rECal = 1.29;                         // radial distance of ECAL

const bool composeFileName = false;
//
// Input file control: two cases
//   If composeFileName = true, then a single input file ROOT based on the runNumber will be processed
//    In this case, the nFilesToProcess must be set as 1
//
//   If composeFileName = false, then the text file   pi0TreeFilesNameList.txt  is scanned for the names of the input files
//
//   The text file pi0TreeFilesNameList.txt must be present in both cases, but it is ignored in the first case
//

void plotPi0Flow(const int iOption=0,
		 const int runNumber=151020,
		 const Long64_t maxReadEntries=0,
		 const unsigned int maximumClusterEntries=0,
		 const unsigned int nFilesToProcess=15,
		 bool writeHistogramFile=true,
		 bool readHistogramFile=false,
                 bool alreadyFlattenedReactionPlane=true,
		 bool flattenReactionPlane=false,
		 bool useReactionPlaneAngle=true,
		 const unsigned int reactionPlaneAngleChoice=1,
		 const unsigned int bufferDepth=4,
		 int minLumiSect=1000000000,
		 int maxLumiSect=0,
		 const float lowEtaLimit=-1.40,
		 const float highEtaLimit=+1.40,
		 const float lowPtCut=1.6,
		 const float highPtCut=9.0,
		 const float lowTruePairMassCut=0.100,
		 const float highTruePairMassCut=0.176,
		 const float lowFalsePairMassCut=0.200,
		 const float highFalsePairMassCut=0.250,
		 const float subtractedYieldWdithFactor=1.5,
		 const float clustEnrCut=0.4,
		 const float clustPtCut=0.0,
		 const float clustS49Cut=0.83,
		 const float clustS25Cut=0.20,
                 const float clusterEnergyAsymmetryCut=-1.0,
		 const float clusterClosestCut=-1.00,
                 const bool useCoreEnergy=false,
                 const float coreEnergyCorrection=1.09,
		 const float centLow=20,
		 const float centHigh=24,
		 const float lowZVertex=-15.0,
		 const float highZVertex=+15.0,
		 float subtractedStart=0.090,
		 float subtractedEnd=0.180,								 
		 int iBackgroundOption=1,
		 unsigned int simulationData=0) {

  if(iOption == 0) {
    cout << endl;
    cout << "\n***********************************************************************************************************************************";
    cout << "\n         iOption choices for plotPi0Flow.C macro";
    cout << "\n iOption=0    Prints this self-documentation";
    cout << "\n iOption=5    Obtains the v2 paramters for the reaction plane decomposition of the aziumuthal yields";
    cout << "\n iOption=10   Obtains a single invaraint mass histogram with a parameterized combinatoric background fit";
    cout << "\n iOption=-10  Obtains a single invaraint mass histogram with a mixed-event combinatoric background subtraction";
    cout << "\n              The single invariant mass histograms are for the complete eta and pT ranges specified in the input control parameters";
    cout << "\n iOption=15   Special purpose option to compare the resolutions of particular event plane choices, no scan of the other two NTUPLEs";
    cout << "\n***********************************************************************************************************************************";
    cout << endl << endl;
    return;
  }

  if(readHistogramFile && writeHistogramFile) {
    cerr << "\n Cannot do a simultaneous read and write of the histogram file";
    cerr << endl;
    return;
  }

  if(bufferDepth < 2) {
    cerr << "\n An events buffer minimum depth of 2 is required";
    cerr << endl;
    return;
  }

  if(composeFileName && nFilesToProcess != 1) {
    cerr << "\n Cannot do a compose file name with nFilesToProcess = " << nFilesToProcess << endl;
    return;
  } // check for single file input
	
  if(reactionPlaneAngleChoice > 1  && reactionPlaneAngleChoice > 9) {
    cerr << "\n Invalid Reaction Plane Choice " << reactionPlaneAngleChoice << endl;
    return;
  }
	
  if(reactionPlaneAngleChoice == 1)
    cout << "\n\n Reaction Plane Angle Choice is HFAllAn" << endl << endl;
	
  if(reactionPlaneAngleChoice == 2)
    cout << "\n\n Reaction Plane Angle Choice is TrMdEtaAn" << endl << endl;

  if(reactionPlaneAngleChoice == 3)
    cout << "\n\n Reaction Plane Angle Choice is TrAlEtaAn" << endl << endl;

  if(reactionPlaneAngleChoice == 4)
    cout << "\n\n Reaction Plane Angle Choice is TrPsEtaAn" << endl << endl;

  if(reactionPlaneAngleChoice == 5)
    cout << "\n\n Reaction Plane Angle Choice is TrNgEtaAn" << endl << endl;

  if(reactionPlaneAngleChoice == 6)
    cout << "\n\n Reaction Plane Angle Choice is etHFAn" << endl << endl;

  if(reactionPlaneAngleChoice == 7)
    cout << "\n\n Reaction Plane Angle Choice is PsEtGapAn" << endl << endl;

  if(reactionPlaneAngleChoice == 8)
    cout << "\n\n Reaction Plane Angle Choice is NgEtGapAn" << endl << endl;
  
  bool usingGapAnglePair = false;
  if(reactionPlaneAngleChoice == 9) {
    cout << "\n\n Reaction Plane Angle Choice is PsEtGap/NgEtGapAn Pair" << endl << endl;
    usingGapAnglePair = true;
  }

  //
  // No longer important parameters for signal + background fitting
  //
  float fitStart=0.108;
  float fitEnd=0.162;
  float peakStart=0.097;
  float peakEnd=0.165;

  //
  // Obtain integer centrality numbers
  //
  int lowCent = 2.5*centLow;
  int highCent = 2.5*centHigh;	

  char fileName[200];
  if(composeFileName && !readHistogramFile) {
    sprintf(fileName, "pi0DataRecoTree18Dec2010Run%dCent%d_%d.root", runNumber, int(centLow), int(centHigh));
    TFile *fCheck = new TFile(fileName);
    if(fCheck->IsZombie()) {
      cerr << "\n File " << fileName << " does not exist" << endl;
      return;
    }
    delete fCheck;
  } // check if composing a file name for single file inputs

  TDatime *dateTime = new TDatime;
  dateTime->Set();     // set to system date/time
  int date = dateTime->GetDate();

  const float clustS1Cut = 0.2;

  unsigned int countSameEventAsymmetryCut = 0;
  unsigned int countMixedEventAsymmetryCut = 0;
  unsigned int countRepeatChecks = 0;
  unsigned const minimumClustersPerEvent = 2;

  const float minimumOpeningAngle = 0.06;
  const float minimumSeparation = 0.10;
  const float minimumSeparationSquared = minimumSeparation*minimumSeparation;

  bool useClusterEnergyAsymmetryCut = clusterEnergyAsymmetryCut > 0.0;

  bool realData = simulationData==0;
  bool toyModel = simulationData==1;
  bool hydjetModel = simulationData==2;
  bool pythiaModel = simulationData==3;
	
  if(toyModel || pythiaModel) {
    lowCent = 0;
    highCent = 99;
  }
	
  TGraphErrors *graphFlow = 0;
  TF1 *flowFitFcn = 0;
  TF1 *flowFitFcn2 = 0;
  TF1 *noFlowFitFcn = 0;
		
  bool useToyModelRPResolution = true;
  float toyModelRPResolution = +0.50;  // radians
  TRandom1 *randomNumber = new TRandom1();
  randomNumber->SetSeed(1);
	
  const bool etaExclude=false;
  const float lowEtaExclude=-0.015;
  const float highEtaExclude=+0.015;

  unsigned int countOutOfRangeDeltaRP = 0;
  unsigned int missedReactionPlane = 0;
  unsigned int goodReactionPlane = 0;
  const unsigned int maximumNumberRPEvents = 900000;
  struct reactionPlaneInformation {
    int thisEvent;
    float reactionPlaneAngle;
    float negEtaGapAngle;
  };
  reactionPlaneInformation reactionPlaneInformationArray[maximumNumberRPEvents];

  unsigned int countClustersStored = 0;
  unsigned int countClustersInGlobalCut = 0;
  unsigned int countMixedClusterExamined = 0;
  unsigned int countClusterEvents = 0;
  unsigned int countClusterEntries = 0;
  unsigned int maximumClustersInSingleEvent = 0;
  const unsigned int maximumNumberAcceptedCluster = 5000;
  struct acceptedClusterInformation {
    Long64_t thisEvent;
    unsigned int kCluster;
    Float_t clustEta;
    Float_t clustPhi;
    Float_t clustPt;
    Float_t clustEnr;
    Float_t clustS49;
    Float_t closestNeighbor;
  };
  acceptedClusterInformation acceptedClusterInformationArray[bufferDepth][maximumNumberAcceptedCluster];
  unsigned int countAcceptedCluster[bufferDepth];
  Long64_t eventNumberCluster[bufferDepth];

  unsigned int totalTrueExcluded = 0;
 	
  //Declaration of leaves types for Reco Pi0
  Float_t         Run;
  Float_t         Event;
  Float_t         LumiSect;
  Float_t         cent_bin;
  Float_t         zVertEvt;
  Float_t         nHITracks;
  Float_t         kEvent;
  Float_t         nClu;
  Float_t         nCry;
  Float_t         kPi0;
  Float_t         recPi0Mas;
  Float_t         recPi0Pt;
  Float_t         recPi0Eta;
  Float_t         recPi0Phi;
  Float_t         recPi0Enr;
  Float_t         kCluster1;
  Float_t         clust1Pt;
  Float_t         clust1Eta;
  Float_t         clust1Phi;
  Float_t         clust1Enr;
  Float_t         clust1S1;
  Float_t         clust1S25;
  Float_t         clust1S49;
  Float_t         clust1NCr;
  Float_t         clust1Clo;
  Float_t         kCluster2;
  Float_t         clust2Pt;
  Float_t         clust2Eta;
  Float_t         clust2Phi;
  Float_t         clust2Enr;
  Float_t         clust2S1;
  Float_t         clust2S25;
  Float_t         clust2S49;
  Float_t         clust2NCr;
  Float_t         clust2Clo;

  //Declaration of leaves types for Clusters
  Float_t         RunC;
  Float_t         kEventC;
  Float_t         LumiSectC;
  Float_t         cent_binC;
  Float_t         zVertEvtC;
  Float_t         nCluster;
  Float_t         kCluster;
  Float_t         clustrPt;
  Float_t         clustrEta;
  Float_t         clustrPhi;
  Float_t         clustrEnr;
  Float_t         clustrS49;
  Float_t         clustrS25;
  Float_t         clustrS1;
  Float_t         clustrClo;
  Float_t         kFileC;
	
  //Declaration of leaves types for Reaction Plane
  Float_t         RunR;
  Float_t         EventR;
  Float_t         cent_binR;
  Float_t         zVertEvtR;
  Float_t         nCluR;
  Float_t         kFileR;
  Float_t         TrMdEtaAn;
  Float_t         TrPsEtaAn;
  Float_t         TrNgEtaAn;
  Float_t         TrAlEtaAn;
  Float_t         PsEtGapAn;
  Float_t         NgEtGapAn;
  Float_t         HFAllAn;
  Float_t         HFPosAn;
  Float_t         HFNegAn;
  Float_t         etHFAn;
  Float_t         etHFPosAn;
  Float_t         etHFNegAn;
	
  unsigned int totalEvents = 0;
  unsigned int totalEventsInCentralityRange = 0;
  unsigned int totalAcceptedPi0 = 0;
  unsigned int totalEventsWithClusters = 0;
  unsigned int countMixedMassInPtAndEtaWindows = 0.0;

  int nMassBins = 75;
  float maximumPi0MassForHistogram = 0.30;
  TH1D *pi0MassHistogram = 0;
  TH1D *pi0EtaTrueHistogram = 0;
  TH1D *pi0PhiTrueHistogram = 0;
  TH1D *pi0PtTrueHistogram = 0;

  TH1D *pi0PhiRPTrueHistogram = 0;	

  TH1D *pi0OpenAngleHistogram = 0;
  TH1D *pi0OpenAngleHistogramMixed = 0;
	
  TH1D *eventAcceptedReactionPlaneAngleHistogram = 0;
  TH1D *pi0AcceptedReactionPlaneAngleHistogram = 0;
	
  TH1D *pi0MassHistogramRepeated = 0;
  TH1D *pi0MassHistogramMixed = 0;
	
  TH1D *etaMassHistogram = 0;
  TH1D *etaMassHistogramMixed = 0;

  TH1D *diffMidEtaHFAngle = 0;	
  TH1D *diffPosEtaGapHFAngle = 0;
  TH1D *diffNegEtaGapHFAngle = 0;
  TH1D *diffEtaGapAngle = 0;
	
  int nBinsOneD = 100;
	
  //const unsigned int NETABINS = 4;
  //const float lowEtaBin[NETABINS] =  {0.00, 0.35, 0.70, 1.05};
  //const float highEtaBin[NETABINS] = {0.35, 0.70, 1.05, 1.40};
	
  const unsigned int NETABINS = 2;
  const float lowEtaBin[NETABINS] =  {0.00, 0.70};
  const float highEtaBin[NETABINS] = {0.70, 1.40};
	
  const unsigned int NPHIBINS = 6;
  const float lowPhiBin[NPHIBINS] =  {0.0,              TMath::Pi()/12.0, TMath::Pi()/6.0, TMath::Pi()/4.0, TMath::Pi()/3.0,      5.0*TMath::Pi()/12.0};
  const float highPhiBin[NPHIBINS] = {TMath::Pi()/12.0, TMath::Pi()/6.0,  TMath::Pi()/4.0, TMath::Pi()/3.0, 5.0*TMath::Pi()/12.0, TMath::Pi()/2.0};
	
  const unsigned int NPTBINS = 4;
  const float lowPtBin[NPTBINS] =  {1.6, 2.0, 2.6, 1.6};
  const float highPtBin[NPTBINS] = {2.0, 2.6, 3.4, 3.4};

  TH1D *pi0MassEtaPhiPtHistogram[NETABINS][NPHIBINS][NPTBINS];
  TH1D *pi0MassEtaPtHistogram[NETABINS][NPTBINS];
  TH1D *pi0MassEtaPtHistogramMixed[NETABINS][NPTBINS];

  const unsigned int NHARMONICS = 4;
  double aFlattenCoefficient[NHARMONICS];
  double bFlattenCoefficient[NHARMONICS];

  if(!readHistogramFile) {

    diffMidEtaHFAngle = new TH1D("diffMidEtaHFAngle", "RP Angle Difference MidEta - HF", nBinsOneD, -TMath::Pi(), +TMath::Pi());
    diffMidEtaHFAngle->SetXTitle("#Delta#Phi_{RP} (radians)");
    diffMidEtaHFAngle->SetYTitle("Counts");

    diffPosEtaGapHFAngle = new TH1D("diffPosEtaGapHFAngle", "RP Angle Difference PosEtaGap - HF", nBinsOneD, -TMath::Pi(), +TMath::Pi());
    diffPosEtaGapHFAngle->SetXTitle("#Delta#Phi_{RP} (radians)");
    diffPosEtaGapHFAngle->SetYTitle("Counts");

    diffNegEtaGapHFAngle = new TH1D("diffNegEtaGapHFAngle", "RP Angle Difference NegEtaGap - HF", nBinsOneD, -TMath::Pi(), +TMath::Pi());
    diffNegEtaGapHFAngle->SetXTitle("#Delta#Phi_{RP} (radians)");
    diffNegEtaGapHFAngle->SetYTitle("Counts");
		
    diffEtaGapAngle = new TH1D("diffEtaGapAngle", "RP Angle Difference PosEtaGap - NegEtaGap", nBinsOneD, -TMath::Pi(), +TMath::Pi());
    diffEtaGapAngle->SetXTitle("#Delta#Phi_{RP} (radians)");
    diffEtaGapAngle->SetYTitle("Counts");				

    pi0MassHistogram = new TH1D("pi0MassHistogram", "#pi^{0} Peak in Heavy Ion Events", nMassBins, 0.0, maximumPi0MassForHistogram);
    pi0MassHistogram->SetXTitle("#gamma#gamma Invariant mass (GeV/c^{2})");
    pi0MassHistogram->SetYTitle("Counts per 4 MeV/c^{2} bin");
		
    char histogramName[200];
    char histogramTitle[200];
    for(unsigned int kEta=0; kEta<NETABINS; kEta++) {
      for(unsigned int kPt=0; kPt<NPTBINS; kPt++) {
	sprintf(histogramName, "pi0MassMixedEtaBin%dPtBin%d", kEta, kPt);
	sprintf(histogramTitle, "Mixed-event #pi^{0} for %5.2f < |#eta| < %5.2f, %5.2f < p_{T} < %5.2f ",
		lowEtaBin[kEta], highEtaBin[kEta], lowPtBin[kPt], highPtBin[kPt]);
	pi0MassEtaPtHistogramMixed[kEta][kPt] = new TH1D(histogramName, histogramTitle, nMassBins, 0.0, maximumPi0MassForHistogram);
	pi0MassEtaPtHistogramMixed[kEta][kPt]->SetXTitle("#gamma#gamma Invariant mass (GeV/c^{2})");
	pi0MassEtaPtHistogramMixed[kEta][kPt]->SetYTitle("Counts per 4 MeV/c^{2} bin");
	sprintf(histogramName, "pi0MassEtaBin%dPtBin%d", kEta, kPt);
	sprintf(histogramTitle, "Same-event #pi^{0} for %5.2f < |#eta| < %5.2f, %5.2f < p_{T} < %5.2f ",
		lowEtaBin[kEta], highEtaBin[kEta], lowPtBin[kPt], highPtBin[kPt]);
	pi0MassEtaPtHistogram[kEta][kPt] = new TH1D(histogramName, histogramTitle, nMassBins, 0.0, maximumPi0MassForHistogram);
	pi0MassEtaPtHistogram[kEta][kPt]->SetXTitle("#gamma#gamma Invariant mass (GeV/c^{2})");
	pi0MassEtaPtHistogram[kEta][kPt]->SetYTitle("Counts per 4 MeV/c^{2} bin");
	for(unsigned int kPhi=0; kPhi<NPHIBINS; kPhi++) {
	  sprintf(histogramName, "pi0MassEtaBin%dPhiBin%dPtBin%d", kEta, kPhi, kPt);
	  sprintf(histogramTitle, "#pi^{0} for %5.2f < |#eta| < %5.2f, %5.2f < #phi < %5.2f, %5.2f < p_{T} < %5.2f ",
		  lowEtaBin[kEta], highEtaBin[kEta], lowPhiBin[kPhi], highPhiBin[kPhi], lowPtBin[kPt], highPtBin[kPt]);
	  pi0MassEtaPhiPtHistogram[kEta][kPhi][kPt] = new TH1D(histogramName, histogramTitle, nMassBins, 0.0, maximumPi0MassForHistogram);
	  pi0MassEtaPhiPtHistogram[kEta][kPhi][kPt]->SetXTitle("#gamma#gamma Invariant mass (GeV/c^{2})");
	  pi0MassEtaPhiPtHistogram[kEta][kPhi][kPt]->SetYTitle("Counts per 4 MeV/c^{2} bin");
	} // loop over phi bins	
      } // loop over pt bins	
    } // loop over eta bins

    pi0OpenAngleHistogram = new TH1D("pi0OpenAngleHistogram", "#pi^{0} Opening Angle in Heavy Ion Events", 3*nBinsOneD, 0.0, 0.1);
    pi0OpenAngleHistogram->SetXTitle("#Delta#theta (radians)");
    pi0OpenAngleHistogram->SetYTitle("Counts");
				
    pi0OpenAngleHistogramMixed = new TH1D("pi0OpenAngleHistogramMixed", "#pi^{0} Opening Angle in Heavy Ion Mixed Events", 3*nBinsOneD, 0.0, 0.1);
    pi0OpenAngleHistogramMixed->SetXTitle("#Delta#theta (radians)");
    pi0OpenAngleHistogramMixed->SetYTitle("Counts");
		
    eventAcceptedReactionPlaneAngleHistogram = new TH1D("eventAcceptedReactionPlaneAngle", "Event Accepted Reaction Plane Angle",
							90, -0.5*TMath::Pi(), +0.5*TMath::Pi());
    eventAcceptedReactionPlaneAngleHistogram->SetXTitle("Event Reaction Plane Angle (radians)");
    eventAcceptedReactionPlaneAngleHistogram->SetYTitle("Counts per 2 degree bin");
		
    pi0AcceptedReactionPlaneAngleHistogram = new TH1D("pi0AcceptedReactionPlaneAngle", "Reaction Plane Angle for Accepted #pi^{0}",
						      90, -0.5*TMath::Pi(), +0.5*TMath::Pi());
    pi0AcceptedReactionPlaneAngleHistogram->SetXTitle("Reaction Plane Angle (radians)");
    pi0AcceptedReactionPlaneAngleHistogram->SetYTitle("Counts per 2 degree bin");

    pi0MassHistogramRepeated = new TH1D("pi0MassHistogramRepeated", "#pi^{0} Peak in Heavy Ion Repeated Events", nMassBins, 0.0, maximumPi0MassForHistogram);
    pi0MassHistogramRepeated->SetXTitle("#gamma#gamma Invariant mass (GeV/c^{2})");
    pi0MassHistogramRepeated->SetYTitle("Counts per 4 MeV/c^{2} bin");		

    pi0MassHistogramMixed = new TH1D("pi0MassHistogramMixed", "#pi^{0} Peak in Heavy Ion Mixed Events", nMassBins, 0.0, maximumPi0MassForHistogram);
    pi0MassHistogramMixed->SetXTitle("#gamma#gamma Invariant mass (GeV/c^{2})");
    pi0MassHistogramMixed->SetYTitle("Counts per 4 MeV/c^{2} bin");
				
    etaMassHistogram = new TH1D("etaMassHistogram", "#eta (547 MeV) Peak in Heavy Ion Events", 35, 0.30, 0.80);
    etaMassHistogram->SetXTitle("#gamma#gamma Invariant mass (GeV/c^{2})");
    etaMassHistogram->SetYTitle("Counts per 17 MeV/c^{2} bin");

    etaMassHistogramMixed = new TH1D("etaMassHistogramMixed", "#eta (547 MeV) Peak in Heavy Ion Mixed Events", 35, 0.30, 0.80);
    etaMassHistogramMixed->SetXTitle("#gamma#gamma Invariant mass (GeV/c^{2})");
    etaMassHistogramMixed->SetYTitle("Counts per 17 MeV/c^{2} bin");
		
    pi0EtaTrueHistogram = new TH1D("pi0EtaTrueHistogram", "True #pi^{0} #eta distribution", nBinsOneD, -1.5, +1.5);
    pi0EtaTrueHistogram->SetXTitle("#eta");
    pi0EtaTrueHistogram->SetYTitle("Counts per 0.015 bin");

    pi0PhiTrueHistogram = new TH1D("pi0PhiTrueHistogram", "True #pi^{0} azimuthal distribution", nBinsOneD, -3.3, +3.3);
    pi0PhiTrueHistogram->SetXTitle("Azimuthal angle #phi (radians)");
    pi0PhiTrueHistogram->SetYTitle("Counts per 0.066 radians bin");

    pi0PhiRPTrueHistogram = new TH1D("pi0PhiRPTrueHistogram", "True #pi^{0} RP azimuthal distribution", nBinsOneD, 0.0, TMath::Pi());
    pi0PhiRPTrueHistogram->SetXTitle("Azimuthal angle #phi (radians)");
    pi0PhiRPTrueHistogram->SetYTitle("Counts per 0.0314 radians bin");

    pi0PtTrueHistogram = new TH1D("pi0PtTrueHistogram", "True #pi^{0} p_{T}", nBinsOneD, 0.0, 7.5);
    pi0PtTrueHistogram->SetXTitle("Transverse momentum p_T (GeV/c)");
    pi0PtTrueHistogram->SetYTitle("Counts per 5 MeV/c bin");

    unsigned int kFile = 0;
    ifstream inFile("pi0TreeFilesNameList.txt");
    if(inFile.eof()) {
      cerr << "\n Unable to find pi0TreeFilesNameList.txt input file";
      cerr << endl;
      return;
    }

    //
    // Loop over input files
    //

    while(!inFile.eof()) {
			
      if(kFile >= nFilesToProcess)
	break;
			
      if(!composeFileName) {
        inFile.getline(fileName, 200);
        if(inFile.eof()) {
	  cout << "\n Breaking from the input file list reading at kFile = " << kFile << endl;
	  break;
        }
      }
		
      TFile *f1 = new TFile(fileName);
      if (!f1) {
	cerr << "\n Unable to find file " << fileName;
	cerr << endl;
	return;
      }
			
      TTree *pi0TreeReconstructed = (TTree*)f1->Get("pi0TreeReconstructed");
      if(!pi0TreeReconstructed) {
	cerr << "\n Unable to find pi0TreeReconstructed NTUPLE";
        kFile++;
        cerr << "\n Skipping kFile " << kFile << " " << fileName << endl;
	cerr << endl;
	continue;
      }

      TTree *pi0TreeClusters = (TTree*)f1->Get("pi0TreeClusters");
      if(!pi0TreeClusters) {
	cerr << "\n Unable to find pi0TreeClusters NTUPLE";
        kFile++;
        cerr << "\n Skipping kFile " << kFile << " " << fileName << endl;
	cerr << endl;
	continue;
      }
			
      TTree *reactionPlane = (TTree*)f1->Get("reactionPlane");
      if(!reactionPlane) {
	cerr << "\n Unable to find reactionPlane NTUPLE";
	cerr << endl;
        kFile++;
        cerr << "\n Skipping kFile " << kFile << " " << fileName << endl;
	cerr << endl;
	continue;
      }			
			
      // Set branch addresses.
      pi0TreeReconstructed->SetBranchAddress("Run",&Run);
      pi0TreeReconstructed->SetBranchAddress("Event",&Event);
      pi0TreeReconstructed->SetBranchAddress("LumiSect",&LumiSect);
      pi0TreeReconstructed->SetBranchAddress("cent_bin",&cent_bin);
      pi0TreeReconstructed->SetBranchAddress("zVertEvt",&zVertEvt);
      pi0TreeReconstructed->SetBranchAddress("nHITracks",&nHITracks);
      pi0TreeReconstructed->SetBranchAddress("kEvent",&kEvent);
      pi0TreeReconstructed->SetBranchAddress("nClu",&nClu);
      pi0TreeReconstructed->SetBranchAddress("nCry",&nCry);
      pi0TreeReconstructed->SetBranchAddress("kPi0",&kPi0);
      pi0TreeReconstructed->SetBranchAddress("recPi0Mas",&recPi0Mas);
      pi0TreeReconstructed->SetBranchAddress("recPi0Pt",&recPi0Pt);
      pi0TreeReconstructed->SetBranchAddress("recPi0Eta",&recPi0Eta);
      pi0TreeReconstructed->SetBranchAddress("recPi0Phi",&recPi0Phi);
      pi0TreeReconstructed->SetBranchAddress("recPi0Enr",&recPi0Enr);
      pi0TreeReconstructed->SetBranchAddress("kCluster1",&kCluster1);
      pi0TreeReconstructed->SetBranchAddress("clust1Pt",&clust1Pt);
      pi0TreeReconstructed->SetBranchAddress("clust1Eta",&clust1Eta);
      pi0TreeReconstructed->SetBranchAddress("clust1Phi",&clust1Phi);
      pi0TreeReconstructed->SetBranchAddress("clust1Enr",&clust1Enr);
      pi0TreeReconstructed->SetBranchAddress("clust1S1",&clust1S1);
      pi0TreeReconstructed->SetBranchAddress("clust1S25",&clust1S25);
      pi0TreeReconstructed->SetBranchAddress("clust1S49",&clust1S49);
      pi0TreeReconstructed->SetBranchAddress("clust1NCr",&clust1NCr);
      pi0TreeReconstructed->SetBranchAddress("clust1Clo",&clust1Clo);
      pi0TreeReconstructed->SetBranchAddress("kCluster2",&kCluster2);
      pi0TreeReconstructed->SetBranchAddress("clust2Pt",&clust2Pt);
      pi0TreeReconstructed->SetBranchAddress("clust2Eta",&clust2Eta);
      pi0TreeReconstructed->SetBranchAddress("clust2Phi",&clust2Phi);
      pi0TreeReconstructed->SetBranchAddress("clust2Enr",&clust2Enr);
      pi0TreeReconstructed->SetBranchAddress("clust2S1",&clust2S1);
      pi0TreeReconstructed->SetBranchAddress("clust2S25",&clust2S25);
      pi0TreeReconstructed->SetBranchAddress("clust2S49",&clust2S49);
      pi0TreeReconstructed->SetBranchAddress("clust2NCr",&clust2NCr);
      pi0TreeReconstructed->SetBranchAddress("clust2Clo",&clust2Clo);

      // Set branch addresses.
      pi0TreeClusters->SetBranchAddress("RunC",&RunC);
      pi0TreeClusters->SetBranchAddress("kEventC",&kEventC);
      pi0TreeClusters->SetBranchAddress("LumiSectC",&LumiSectC);
      pi0TreeClusters->SetBranchAddress("cent_binC",&cent_binC);
      pi0TreeClusters->SetBranchAddress("zVertEvtC",&zVertEvtC);
      pi0TreeClusters->SetBranchAddress("nCluster",&nCluster);
      pi0TreeClusters->SetBranchAddress("kCluster",&kCluster);
      pi0TreeClusters->SetBranchAddress("clustrPt",&clustrPt);
      pi0TreeClusters->SetBranchAddress("clustrEta",&clustrEta);
      pi0TreeClusters->SetBranchAddress("clustrPhi",&clustrPhi);
      pi0TreeClusters->SetBranchAddress("clustrEnr",&clustrEnr);
      pi0TreeClusters->SetBranchAddress("clustrS49",&clustrS49);
      pi0TreeClusters->SetBranchAddress("clustrS25",&clustrS25);
      pi0TreeClusters->SetBranchAddress("clustrS1",&clustrS1);
      pi0TreeClusters->SetBranchAddress("clustrClo",&clustrClo);
      pi0TreeClusters->SetBranchAddress("kFileC",&kFileC);
								
      // Set branch addresses.
      reactionPlane->SetBranchAddress("RunR",&RunR);
      reactionPlane->SetBranchAddress("EventR",&EventR);
      reactionPlane->SetBranchAddress("cent_binR",&cent_binR);
      reactionPlane->SetBranchAddress("zVertEvtR",&zVertEvtR);
      reactionPlane->SetBranchAddress("nCluR",&nCluR);
      reactionPlane->SetBranchAddress("kFileR",&kFileR);
      reactionPlane->SetBranchAddress("TrMdEtaAn",&TrMdEtaAn);
      reactionPlane->SetBranchAddress("TrPsEtaAn",&TrPsEtaAn);
      reactionPlane->SetBranchAddress("TrNgEtaAn",&TrNgEtaAn);
      reactionPlane->SetBranchAddress("TrAlEtaAn",&TrAlEtaAn);
      reactionPlane->SetBranchAddress("PsEtGapAn",&PsEtGapAn);
      reactionPlane->SetBranchAddress("NgEtGapAn",&NgEtGapAn);
      reactionPlane->SetBranchAddress("HFAllAn",&HFAllAn);
      reactionPlane->SetBranchAddress("HFPosAn",&HFPosAn);
      reactionPlane->SetBranchAddress("HFNegAn",&HFNegAn);
      reactionPlane->SetBranchAddress("etHFAn",&etHFAn);
      reactionPlane->SetBranchAddress("etHFPosAn",&etHFPosAn);
      reactionPlane->SetBranchAddress("etHFNegAn",&etHFNegAn);
	
      unsigned int countReactionPlaneStore = 0;
			
      TH1D *reactionPlaneAngleBefore = new TH1D("reactionPlaneAngleBefore", "Reaction Plane Angle Before Flattening",
						90, -0.5*TMath::Pi(), +0.5*TMath::Pi());
      reactionPlaneAngleBefore->SetXTitle("Original Reaction Plane Angle (radians)");
      if(alreadyFlattenedReactionPlane)
	reactionPlaneAngleBefore->SetXTitle("Reaction Plane Angle After Standard Flattening (radians)");
			
      int validEvents = 0;

      Long64_t nEntriesR = reactionPlane->GetEntries();
      cout << "\n Entries in reactionPlane NTUPLE = " << nEntriesR << endl;
			
      Long64_t readEntriesRP = nEntriesR;
      if(maxReadEntries > 0 && readEntriesRP > maxReadEntries) {
	readEntriesRP = maxReadEntries;
      }
      char rpBeforeHistogramTitle[200];
			
      if(alreadyFlattenedReactionPlane || !flattenReactionPlane) {
	for(unsigned int iEntry=0; iEntry<readEntriesRP; iEntry++) {
					
	  reactionPlane->GetEntry(iEntry);
					
	  if(cent_binR < centLow || cent_binR > centHigh)
	    continue;

	  if(iOption == 15) { // check differenes in reaction plane angles
		
	
	    if(TrMdEtaAn > -5.0 && HFAllAn > -5.0) {
	      diffMidEtaHFAngle->Fill(deltaPhi(TrMdEtaAn, HFAllAn));
	    }
	
	    if(PsEtGapAn > -5.0 && HFAllAn > -5.0) {
	      diffPosEtaGapHFAngle->Fill(deltaPhi(PsEtGapAn, HFAllAn));
	    }

	    if(NgEtGapAn > -5.0 && HFAllAn > -5.0) {
	      diffNegEtaGapHFAngle->Fill(deltaPhi(NgEtGapAn, HFAllAn));
	    }
			
	    if(PsEtGapAn != 0.0 && NgEtGapAn != 0.0 && cent_binR >= centLow && cent_binR <= centHigh) {
	      diffEtaGapAngle->Fill(deltaPhi(PsEtGapAn, NgEtGapAn));
	    }																				
	    continue;
			
	  } // check differences in reaction plane angles

	  float reactionPlaneAngle;
					
	  switch(reactionPlaneAngleChoice) {
	  case 1:
	    reactionPlaneAngle = HFAllAn;
	    sprintf(rpBeforeHistogramTitle, "Reaction Plane Angle Before Flattening, HFAllAn choice");
	    if(alreadyFlattenedReactionPlane)
	      sprintf(rpBeforeHistogramTitle, "Reaction Plane With Standard Flattening, HFAllAn choice");
	    break;
	  case 2:
	    reactionPlaneAngle = TrMdEtaAn;
	    sprintf(rpBeforeHistogramTitle, "Reaction Plane Angle Before Flattening, TrMdEtaAn choice");
	    if(alreadyFlattenedReactionPlane)
	      sprintf(rpBeforeHistogramTitle, "Reaction Plane With Standard Flattening, TrMdEta choice");
	    break;
	  case 3:
	    reactionPlaneAngle = TrAlEtaAn;
	    sprintf(rpBeforeHistogramTitle, "Reaction Plane Angle Before Flattening, TrAlEtaAn choice");
	    if(alreadyFlattenedReactionPlane)
	      sprintf(rpBeforeHistogramTitle, "Reaction Plane With Standard Flattening, TrAlEtaAn choice");
	    break;
	  case 4:
	    reactionPlaneAngle = TrPsEtaAn;
	    sprintf(rpBeforeHistogramTitle, "Reaction Plane Angle Before Flattening, TrPsEtaAn choice");
	    break;
	  case 5:
	    reactionPlaneAngle = TrNgEtaAn;
	    sprintf(rpBeforeHistogramTitle, "Reaction Plane Angle Before Flattening, TrNgEtaAn choice");
	    break;
	  case 6:
	    reactionPlaneAngle = etHFAn;
	    sprintf(rpBeforeHistogramTitle, "Reaction Plane Angle Before Flattening, etHFAn choice");
	    if(alreadyFlattenedReactionPlane)
	      sprintf(rpBeforeHistogramTitle, "Reaction Plane With Standard Flattening, etHFAn choice");
	    break;
	  case 7:
	    reactionPlaneAngle = PsEtGapAn;
	    sprintf(rpBeforeHistogramTitle, "Reaction Plane Angle Before Flattening, PsEtGapAn choice");
	    break;
	  case 8:
	    reactionPlaneAngle = NgEtGapAn;
	    sprintf(rpBeforeHistogramTitle, "Reaction Plane Angle Before Flattening, NgEtGapAn choice");
	    break;
	  case 9:
	    reactionPlaneAngle = PsEtGapAn;
	    sprintf(rpBeforeHistogramTitle, "Reaction Plane Angle Pre-Flattened, PsEtGapAn/NgEtGapAn pair choice");
	    break;
	  default:
	    cerr << "\n Undefined reaction plane angle choice" << endl;
	    return;
	  } // switch on reactionPlaneAngleChoice
					
	  if(reactionPlaneAngle >= -5.0) {
	    validEvents++;
	    reactionPlaneAngleBefore->Fill(reactionPlaneAngle);
	    if(usingGapAnglePair)
	      reactionPlaneAngleBefore->Fill(NgEtGapAn);
	    reactionPlaneInformationArray[countReactionPlaneStore].thisEvent = EventR;
	    reactionPlaneInformationArray[countReactionPlaneStore].reactionPlaneAngle = reactionPlaneAngle;
	    reactionPlaneInformationArray[countReactionPlaneStore].negEtaGapAngle = NgEtGapAn;
	    countReactionPlaneStore++;
	  }
					
	} // loop over reaction plane entries, no flattening to be done

	if(iOption != 15) {
	  if(validEvents == 0) {
	    cerr << "\n There are no valid events for the reaction plane angle storage using the no-flatten option" << endl;
	    return;
	  }
	  else {
	    cout << "\n Number of valid events for the reaction plane angle storage using the no-flatten option " << validEvents << endl;
	  }

	  reactionPlaneAngleBefore->SetTitle(rpBeforeHistogramTitle);
				
	  TCanvas *c1RP = new TCanvas("c1RP", "Plotting Reaction Plane Angle", 200, 10, 700, 500);
	  //
	  // Use ROOT's gStyle function to set up plot options
	  //
	  gStyle->SetOptStat(1110);
	  gStyle->SetStatTextColor(kBlue);
	  gStyle->SetFuncColor(kBlue);
	  gStyle->SetFuncWidth(2);
	  gStyle->SetOptFit(1111);
	  gStyle->SetFitFormat("6.5g");
				
	  c1RP->SetFillColor(kWhite);	
				
	  reactionPlaneAngleBefore->SetStats(0);
	  reactionPlaneAngleBefore->SetMinimum(0);
	  reactionPlaneAngleBefore->Draw();
				
	  double maxHistValueBefore = reactionPlaneAngleBefore->GetBinContent(reactionPlaneAngleBefore->GetMaximumBin());
				
	  char labelBuffer1[200];
	  if(realData)
	    sprintf(labelBuffer1, "Pb-Pb #sqrt{s} = 2.76 TeV, Run %d", int(RunR));
	  if(hydjetModel)
	    sprintf(labelBuffer1, "HYDJET sim: Pb-Pb #sqrt{s} = 2.76 TeV");
	  if(pythiaModel)
	    sprintf(labelBuffer1, "Pythia sim: pp #sqrt{s} = 7.0 TeV");
	  if(toyModel)
	    sprintf(labelBuffer1, "Toy Model Simulation");
				
	  TLatex *lhcPbPb = new TLatex(-1.4, 0.40*maxHistValueBefore, labelBuffer1);
	  lhcPbPb->SetTextColor(4);
	  lhcPbPb->SetTextSize(0.060);
	  lhcPbPb->Draw();
				
	  if(realData || hydjetModel) {
	    char centBuffer1[200];
	    sprintf (centBuffer1, "Centralities %d to %d, Min Bias", lowCent, highCent);
	    TLatex *runB1 = new TLatex(-1.4, 0.30*maxHistValueBefore, centBuffer1);
	    runB1->SetTextColor(4);
	    runB1->SetTextSize(0.050);
	    runB1->Draw();
	  }
				
	  char eventsBuffer1[200];
	  sprintf(eventsBuffer1, "Number of valid events %d", validEvents);
	  TLatex *tEB1 = new TLatex(-1.4, 0.20*maxHistValueBefore, eventsBuffer1);
	  tEB1->SetTextColor(4);
	  tEB1->SetTextSize(0.050);
	  tEB1->Draw();
				
	  char meanBuffer1[200];
	  sprintf(meanBuffer1, "Mean value of reaction plane angle %6.3f radians", reactionPlaneAngleBefore->GetMean());
	  TLatex *tMB1 = new TLatex(-1.4, 0.10*maxHistValueBefore, meanBuffer1);
	  tMB1->SetTextColor(4);
	  tMB1->SetTextSize(0.050);
	  tMB1->Draw();
						
	  double averageValue = reactionPlaneAngleBefore->GetEntries()/reactionPlaneAngleBefore->GetNbinsX();
	  TLine *averageLine = new TLine(-0.5*TMath::Pi(), averageValue, +0.5*TMath::Pi(), averageValue);
	  averageLine->SetLineColor(kBlue);
	  averageLine->SetLineWidth(2);
	  averageLine->Draw();
		
	  char graphOutputFileName[200];
	  sprintf(graphOutputFileName, "reactionPlaneNotFlattened_Run%d_Centrality%d-%d_Pt%3.1f-%3.1f_EtaLimit%4.2f_%d.gif", int(RunR), lowCent, highCent, lowPtCut, highPtCut, highEtaLimit, date);
	  c1RP->Print(graphOutputFileName);  // gif file
	  sprintf(graphOutputFileName, "reactionPlaneNotFlattened_Run%d_Centrality%d-%d_Pt%3.1f-%3.1f_EtaLimit%4.2f_%d.pdf", int(RunR), lowCent, highCent, lowPtCut, highPtCut, highEtaLimit, date);
	  c1RP->Print(graphOutputFileName);  // pdf file
				
	  delete c1RP;

	} // check for iOption ! = 15

      } // check for not flattening reaction plane

      else { // Produce coefficients to flatten the reaction plane
		
	double cosineSum[NHARMONICS];
	double sineSum[NHARMONICS];
	for(unsigned int kHarmonic=0; kHarmonic<NHARMONICS; kHarmonic++) {
	  cosineSum[kHarmonic] = 0.0;
	  sineSum[kHarmonic] = 0.0;
	} // initialization
		
	TH1D *reactionPlaneAngleAfter = new TH1D("reactionPlaneAngleAfter", "Reaction Plane Angle After Flattening",
						 90, -0.5*TMath::Pi(), +0.5*TMath::Pi());
	reactionPlaneAngleAfter->SetXTitle("Flattened Reaction Plane Angle (radians)");

	for(unsigned int iEntry=0; iEntry<readEntriesRP; iEntry++) {

	  reactionPlane->GetEntry(iEntry);
	
	  if(cent_binR < centLow || cent_binR > centHigh)
	    continue;
			
	  float reactionPlaneAngle = 0.0; // default assignment
		
	  if(toyModel) {	
	    //
	    // Toy model has identical reaction plane angles for all choices
	    // Use HFAllAn
	    //
	    if(countReactionPlaneStore >= maximumNumberRPEvents) {
	      cerr << "\n Too many RP Events " << countReactionPlaneStore << endl;
	      return;
	    }
	    //
	    // Toy model has the reaction plane angle in the range -pi/2 to +pi/2
	    //
	    reactionPlaneAngle = HFAllAn;
	    if(useToyModelRPResolution) {
	      double aRandom = 0.0;
	      double bRandom = 0.0;
	      randomNumber->Rannor(aRandom, bRandom);
	      if(toyModelRPResolution >= 0.0) {
		reactionPlaneAngle += aRandom*toyModelRPResolution;
		//
		// Keep in -pi/2 to +pi/2 range after resolution broadening
		//
		if(reactionPlaneAngle < -0.5*TMath::Pi())
		  reactionPlaneAngle += 0.5*TMath::Pi();
		if(reactionPlaneAngle > 0.5*TMath::Pi())
		  reactionPlaneAngle += -0.5*TMath::Pi();
	      }
	      else {
		reactionPlaneAngle = -0.5*TMath::Pi() + (randomNumber->Rndm())*TMath::Pi(); // make a random reaction plane angle if toyModelRPResolution < 0.0
	      }
	    } // check on using Toy Model resolution parameter
	    reactionPlaneInformationArray[countReactionPlaneStore].thisEvent = EventR;
	    reactionPlaneInformationArray[countReactionPlaneStore].reactionPlaneAngle = reactionPlaneAngle;
	    countReactionPlaneStore++;
	    continue; // skip rest of processing which applies to non-Toy Model cases
	  } // check if doing a Toy Model Case
		
	  switch(reactionPlaneAngleChoice) {
	  case 1:
	    reactionPlaneAngle = HFAllAn;
	    sprintf(rpBeforeHistogramTitle, "Reaction Plane Angle Before Flattening, HFAllAn choice");
	    break;
	  case 2:
	    reactionPlaneAngle = TrMdEtaAn;
	    sprintf(rpBeforeHistogramTitle, "Reaction Plane Angle Before Flattening, TrMdEtaAn choice");
	    break;
	  case 3:
	    reactionPlaneAngle = TrAlEtaAn;
	    sprintf(rpBeforeHistogramTitle, "Reaction Plane Angle Before Flattening, TrAlEtaAn choice");
	    break;
	  case 4:
	    reactionPlaneAngle = TrPsEtaAn;
	    sprintf(rpBeforeHistogramTitle, "Reaction Plane Angle Before Flattening, TrPsEtaAn choice");
	    break;
	  case 5:
	    reactionPlaneAngle = TrNgEtaAn;
	    sprintf(rpBeforeHistogramTitle, "Reaction Plane Angle Before Flattening, TrNgEtaAn choice");
	    break;
	  case 6:
	    reactionPlaneAngle = etHFAn;
	    sprintf(rpBeforeHistogramTitle, "Reaction Plane Angle Before Flattening, etHFAn choice");
	    break;
	  case 7:
	    reactionPlaneAngle = PsEtGapAn;
	    sprintf(rpBeforeHistogramTitle, "Reaction Plane Angle Before Flattening, PsEtGapAn choice");
	    break;
	  case 8:
	    reactionPlaneAngle = NgEtGapAn;
	    sprintf(rpBeforeHistogramTitle, "Reaction Plane Angle Before Flattening, NgEtGapAn choice");
	    break;
	  default:
	    cerr << "\n Undefined reaction plane angle choice" << endl;
	    return;
	  } // switch on reactionPlaneAngleChoice
		
	  if(reactionPlaneAngle != 0.0) {
	    validEvents++;
				
	    reactionPlaneAngleBefore->Fill(reactionPlaneAngle);
		
	    //
	    // Symmetrization around pi/2 needed to get good flattening result
	    //	
	    if(randomNumber->Rndm() >= 0.5)
	      reactionPlaneAngle = TMath::Pi() - reactionPlaneAngle;  // symmetrize from -pi/2 to +3pi/2
	
	    for(unsigned int kHarmonic=1; kHarmonic<=NHARMONICS; kHarmonic++) {
	      cosineSum[kHarmonic - 1] += cos(kHarmonic*reactionPlaneAngle);
	      sineSum[kHarmonic - 1] += sin(kHarmonic*reactionPlaneAngle);
	    } // sum up to fourth harmonic, according to Barrette et al paper, PRC 56
				
	  } // check for valid event
			
	} // loop over reaction plane entries, to obtain harmonic coefficients
				
	if(!toyModel) {

	  if(validEvents == 0) {
	    cerr << "\n There are no valid events" << endl;
	    return;
	  }
	  //
	  // Compute flattening coefficients
	  //
	  cout << "\n Flattening coefficients for valid events " << validEvents <<":";
	  for(unsigned int kHarmonic=0; kHarmonic<NHARMONICS; kHarmonic++) {
	    int kHarmonicPlusOne = kHarmonic + 1;
	    aFlattenCoefficient[kHarmonic] = -2.0*sineSum[kHarmonic]/(kHarmonicPlusOne*validEvents);
	    bFlattenCoefficient[kHarmonic] = +2.0*cosineSum[kHarmonic]/(kHarmonicPlusOne*validEvents);
	    cout << "\n For harmonic " << kHarmonicPlusOne << ", A = " << aFlattenCoefficient[kHarmonic];
	    cout << ", B = " << bFlattenCoefficient[kHarmonic];
	  }
	  cout << endl;
		
	  double sumRMSDelta = 0;

	  for(unsigned int iEntry=0; iEntry<readEntriesRP; iEntry++) {
			
	    reactionPlane->GetEntry(iEntry);
			
	    if(cent_binR < centLow || cent_binR > centHigh)
	      continue;
			
	    float reactionPlaneAngle = 0.0;
	    switch(reactionPlaneAngleChoice) {
	    case 1:
	      reactionPlaneAngle = HFAllAn;
	      break;
	    case 2:
	      reactionPlaneAngle = TrMdEtaAn;
	      break;
	    case 3:
	      reactionPlaneAngle = TrAlEtaAn;
	      break;
	    case 4:
	      reactionPlaneAngle = TrPsEtaAn;
	      break;
	    case 5:
	      reactionPlaneAngle = TrNgEtaAn;
	      break;
	    case 6:
	      reactionPlaneAngle = etHFAn;
	      break;
	    case 7:
	      reactionPlaneAngle = PsEtGapAn;
	      break;
	    case 8:
	      reactionPlaneAngle = NgEtGapAn;
	      break;
	    default:
	      cerr << "\n Undefined reaction plane angle choice" << endl;
	      return;
	    } // switch on reactionPlaneAngleChoice
			
	    if(reactionPlaneAngle != 0.0) {

	      double originalAngle = reactionPlaneAngle;
				
	      double reactionPlaneAnglePrime = reactionPlaneAngle;
	      for(unsigned int kHarmonic=0; kHarmonic<NHARMONICS; kHarmonic++) {
		int kHarmonicPlusOne = kHarmonic + 1;
		reactionPlaneAnglePrime += aFlattenCoefficient[kHarmonic]*cos(kHarmonicPlusOne*reactionPlaneAngle) +
		  bFlattenCoefficient[kHarmonic]*sin(kHarmonicPlusOne*reactionPlaneAngle);
	      } // sum up to fourth harmonic, according to Barrette et al paper, PRC 56
	      double sineAngle = sin(reactionPlaneAnglePrime);
	      reactionPlaneAnglePrime = asin(sineAngle);
	      reactionPlaneAngleAfter->Fill(reactionPlaneAnglePrime);
	      sumRMSDelta += (reactionPlaneAnglePrime - originalAngle)*(reactionPlaneAnglePrime - originalAngle);

	      if(countReactionPlaneStore >= maximumNumberRPEvents) {
		cerr << "\n Too many RP Events " << countReactionPlaneStore << endl;
		return;
	      }
	      reactionPlaneInformationArray[countReactionPlaneStore].thisEvent = EventR;
	      reactionPlaneInformationArray[countReactionPlaneStore].reactionPlaneAngle = reactionPlaneAnglePrime; // range is -pi/2 to +pi/2
	      countReactionPlaneStore++;

	    } // check for valid event
			
	  } // loop over reaction plane entries
	  sumRMSDelta = sqrt(sumRMSDelta/validEvents);
	  cout << "\n Reaction plane flattening has been completed, with RMS Delta " << sumRMSDelta << " radians" << endl;
		
	  TCanvas *c1RP = new TCanvas("c1RP", "Plotting Reaction Plane Angle", 200, 10, 700, 500);
	  //
	  // Use ROOT's gStyle function to set up plot options
	  //
	  gStyle->SetOptStat(1110);
	  gStyle->SetStatTextColor(kBlue);
	  gStyle->SetFuncColor(kBlue);
	  gStyle->SetFuncWidth(2);
	  gStyle->SetOptFit(1111);
	  gStyle->SetFitFormat("6.5g");
		
	  c1RP->SetFillColor(kWhite);	
		
	  c1RP->Divide(1,2);

	  c1RP->cd(1);
	  reactionPlaneAngleBefore->SetTitle(rpBeforeHistogramTitle);
	  reactionPlaneAngleBefore->SetStats(0);
	  reactionPlaneAngleBefore->SetMinimum(0);
	  reactionPlaneAngleBefore->Draw();
		
	  double maxHistValueBefore = reactionPlaneAngleBefore->GetBinContent(reactionPlaneAngleBefore->GetMaximumBin());
		
	  char labelBuffer1[200];
	  if(realData)
	    sprintf(labelBuffer1, "Pb-Pb #sqrt{s} = 2.76 TeV, Run %d", runNumber);
	  if(hydjetModel)
	    sprintf(labelBuffer1, "HYDJET sim: Pb-Pb #sqrt{s} = 2.76 TeV");
	  if(pythiaModel)
	    sprintf(labelBuffer1, "Pythia sim: pp #sqrt{s} = 7.0 TeV");
		
	  TLatex *lhcPbPb = new TLatex(-1.4, 0.40*maxHistValueBefore, labelBuffer1);
	  lhcPbPb->SetTextColor(4);
	  lhcPbPb->SetTextSize(0.060);
	  lhcPbPb->Draw();
		
	  if(realData || hydjetModel) {
	    char centBuffer1[200];
	    sprintf (centBuffer1, "Centralities %d to %d, Min Bias", lowCent, highCent);
	    TLatex *runB1 = new TLatex(-1.4, 0.30*maxHistValueBefore, centBuffer1);
	    runB1->SetTextColor(4);
	    runB1->SetTextSize(0.050);
	    runB1->Draw();
	  }
		
	  char eventsBuffer1[200];
	  sprintf(eventsBuffer1, "Number of valid events %d", validEvents);
	  TLatex *tEB1 = new TLatex(-1.4, 0.20*maxHistValueBefore, eventsBuffer1);
	  tEB1->SetTextColor(4);
	  tEB1->SetTextSize(0.050);
	  tEB1->Draw();
		
	  char meanBuffer1[200];
	  sprintf(meanBuffer1, "Mean value of reaction plane angle %6.3f radians", reactionPlaneAngleBefore->GetMean());
	  TLatex *tMB1 = new TLatex(-1.4, 0.10*maxHistValueBefore, meanBuffer1);
	  tMB1->SetTextColor(4);
	  tMB1->SetTextSize(0.050);
	  tMB1->Draw();
		
	  c1RP->cd(2);
	  reactionPlaneAngleAfter->SetStats(0);
	  reactionPlaneAngleAfter->SetMinimum(0);
	  reactionPlaneAngleAfter->Draw();
		
	  double maxHistValueAfter = reactionPlaneAngleAfter->GetBinContent(reactionPlaneAngleAfter->GetMaximumBin());
	  char meanBuffer2[200];
	  sprintf(meanBuffer2, "Mean value of reaction plane angle %6.3f radians", reactionPlaneAngleAfter->GetMean());
	  TLatex *tMB2 = new TLatex(-1.4, 0.40*maxHistValueAfter, meanBuffer2);
	  tMB2->SetTextColor(4);
	  tMB2->SetTextSize(0.050);
	  tMB2->Draw();
		
	  char harmBuffer2[200];
	  sprintf(harmBuffer2, "Number of Fourier moments for flattening %d", NHARMONICS);
	  TLatex *tHB2 = new TLatex(-1.4, 0.30*maxHistValueAfter, harmBuffer2);
	  tHB2->SetTextColor(4);
	  tHB2->SetTextSize(0.050);
	  tHB2->Draw();
		
	  char rmsDeltaBuffer2[200];
	  sprintf(rmsDeltaBuffer2, "RMS #Delta#Psi %5.3f radians", sumRMSDelta);
	  TLatex *tRB2 = new TLatex(-1.4, 0.20*maxHistValueAfter, rmsDeltaBuffer2);
	  tRB2->SetTextColor(4);
	  tRB2->SetTextSize(0.050);
	  tRB2->Draw();
		
	  double averageValue = reactionPlaneAngleAfter->GetEntries()/reactionPlaneAngleAfter->GetNbinsX();
	  TLine *averageLine = new TLine(-0.5*TMath::Pi(), averageValue, +0.5*TMath::Pi(), averageValue);
	  averageLine->SetLineColor(kBlue);
	  averageLine->SetLineWidth(2);
	  averageLine->Draw();

	  char graphOutputFileName[200];
	  sprintf(graphOutputFileName, "reactionPlane_Run%d_Centrality%d-%d_Pt%3.1f-%3.1f_EtaLimit%4.2f_%d.gif", int(RunR), lowCent, highCent, lowPtCut, highPtCut, highEtaLimit, date);
	  c1RP->Print(graphOutputFileName);  // gif file
	  sprintf(graphOutputFileName, "reactionPlane_Run%d_Centrality%d-%d_Pt%3.1f-%3.1f_EtaLimit%4.2f_%d.pdf", int(RunR), lowCent, highCent, lowPtCut, highPtCut, highEtaLimit, date);
	  c1RP->Print(graphOutputFileName);  // pdf file
		
	  delete c1RP;

	}
		
      } // Reaction Plane Flattening

      if(iOption != 15 && (maximumClusterEntries == 0 || countClusterEntries < maximumClusterEntries)) {

	Long64_t nEntriesC = pi0TreeClusters->GetEntries();

	cout << "\n Entries in clusters NTUPLE = " << nEntriesC << endl;

	Long64_t nEntries0C = nEntriesC/10;

	Long64_t readEntriesC = nEntriesC;
	if(maximumClusterEntries > 0 && maximumClusterEntries < nEntriesC) {
	  readEntriesC = maximumClusterEntries;
	  nEntries0C = readEntriesC/10;
	}

	for (unsigned int kBuffer=0; kBuffer<bufferDepth; kBuffer++) {
	  countAcceptedCluster[kBuffer] = 0;
	  eventNumberCluster[kBuffer] = 0;
	}

	pi0TreeClusters->GetEntry(0);
	//
	// Should check for valid Run number, and constancy of Run
	//
	Long64_t lastEvent = kEventC;
	int lastRun = RunC;
	Long64_t thisEvent = lastEvent;
	int thisRun = lastRun;
	float lastZVertEvt = zVertEvtC;
	int thiscent_bin = cent_binC;
	int lastcent_bin = cent_binC;
	int lastnClu = nCluster;
	int thisnClu = nCluster;

	unsigned int currentBufferEventIndexCluster = 0;
	unsigned int currentAcceptedClusterNumber = countAcceptedCluster[currentBufferEventIndexCluster];
	eventNumberCluster[currentBufferEventIndexCluster] = thisEvent;

	cout << "\n Begin clusters NTUPLE scan with iOption = " << iOption << " for file " << fileName;
	cout << "\n First event number " << thisEvent  << " with centrality " << cent_binC << " in run " << thisRun;
	cout << ", readEntriesC " << readEntriesC << ", nEntries0C " << nEntries0C;
	cout << endl;

	Long64_t iEntry =0;
	while(iEntry<readEntriesC) {
			
	  pi0TreeClusters->GetEntry(iEntry);
		
	  if(iEntry > 0 && iEntry%nEntries0C == 0) {
	    cout << "\n Entry " << iEntry << " with countMixedMassInPtAndEtaWindows " << countMixedMassInPtAndEtaWindows << " and nCluster " << nCluster;
	    cout << ", mixed clusters examined " << countMixedClusterExamined;
	    cout << ", clusters in global cuts " << countClustersInGlobalCut;
	    cout << ", total clusters stored " << countClustersStored; 
	  }
		
	  int checkRun = RunC;
	  if(composeFileName && checkRun != runNumber) {
	    cerr << "\n Input run number RunC " << RunC << " is inconsistent with specified run number " << runNumber << endl;
	    return;
	  }
		
	  iEntry++;
	  countClusterEntries++;

	  thisEvent = kEventC;
	  if(thisEvent < 0) {
	    cerr << "\n thisEvent = " << thisEvent << ",  kEventC = " << kEventC << endl;
	    return;
	  } // check for negative event number (should not happen)

	  thiscent_bin = cent_binC;
	  thisnClu = nCluster;

	  if(thisEvent != lastEvent || (lastcent_bin != thiscent_bin || zVertEvtC != lastZVertEvt)) {

	    if(thisEvent == lastEvent && (lastcent_bin != thiscent_bin || zVertEvtC != lastZVertEvt || lastnClu != thisnClu)) {
	      cout << "\n iEntry " << iEntry << " this Event " << thisEvent;
	      cout << ": lastcent_bin " << lastcent_bin << ", thiscent_bin " << thiscent_bin;
	      cout << "; zVertEvtC " << zVertEvtC << ", lastZVertEvt " << lastZVertEvt;
	      cout << ": lastnClu " << lastnClu << ", thisnClu " << thisnClu;
	      cout << endl;
	    } // check on wrong event number condition

	    countClusterEvents++;
	    eventNumberCluster[currentBufferEventIndexCluster] = lastEvent;
	    if(currentAcceptedClusterNumber >= minimumClustersPerEvent) {
	      totalEventsWithClusters++;
	      countAcceptedCluster[currentBufferEventIndexCluster] = currentAcceptedClusterNumber; // clusters accepted in the current event
			
	      //
	      // Calculate the mixed-event mass spectrum with the cluster in this event
	      //

	      static int countMixedMassPrint = 0;	
	      if(countMixedMassPrint < 0) {
		cout << "\n Last event " << lastEvent;
		cout << ", next event " << thisEvent;
		cout << ", current buffer index number for clusters = " << currentBufferEventIndexCluster;
		cout << ", current accepted cluster number " << currentAcceptedClusterNumber;
		for(unsigned int jBuffer=0; jBuffer<bufferDepth; jBuffer++) {
		  cout << "\n jBuffer " << jBuffer << ",  eventNumber " << eventNumberCluster[jBuffer];
		  cout << ", clusters in event " << countAcceptedCluster[jBuffer];
		}
		countMixedMassPrint++;
		if(countMixedMassPrint >= 10) {
		  cout << endl;
		}
	      } // check for countMixedMassPrint (old debug print)
		
	      //
	      // Calculate mixed-event mass spectrum
	      //
	      for(unsigned int jCluster1=0; jCluster1<currentAcceptedClusterNumber; jCluster1++) {
		Long64_t currentEvent = acceptedClusterInformationArray[currentBufferEventIndexCluster][jCluster1].thisEvent;
			
		float ptCluster1 = acceptedClusterInformationArray[currentBufferEventIndexCluster][jCluster1].clustPt;
		float etaCluster1 = acceptedClusterInformationArray[currentBufferEventIndexCluster][jCluster1].clustEta;
		float phiCluster1 = acceptedClusterInformationArray[currentBufferEventIndexCluster][jCluster1].clustPhi;
		float enrCluster1 = acceptedClusterInformationArray[currentBufferEventIndexCluster][jCluster1].clustEnr;
		float s49Cluster1 = acceptedClusterInformationArray[currentBufferEventIndexCluster][jCluster1].clustS49;
		float p1x = ptCluster1*cos(phiCluster1);
		float p1y = ptCluster1*sin(phiCluster1);
		float p1z = enrCluster1*cos(2.0*atan(exp(-etaCluster1)));
			
		double clust1Theta = 2.0*atan(exp(-etaCluster1));
			
		float xCluster1 = rECal*cos(phiCluster1);
		float yCluster1 = rECal*sin(phiCluster1);
		float zCluster1 = rECal/tan(clust1Theta);
			
		for(unsigned int kBuffer=0; kBuffer<bufferDepth; kBuffer++) {	
		  bool repeatCheck = false;
		  if(currentEvent == eventNumberCluster[kBuffer]) {
		    repeatCheck = true;
		  }
				
		  unsigned int previousAcceptedNumber = countAcceptedCluster[kBuffer];
		  if(repeatCheck && currentAcceptedClusterNumber != previousAcceptedNumber) {
		    cerr << "\n Programming error, repeat check cluster numbers are not the same";
		    cerr << ";  currentAcceptedClusterNumber " << currentAcceptedClusterNumber;
		    cerr << ",  previousAcceptedNumber " << previousAcceptedNumber;
		    cerr << ",  currentEvent = " << currentEvent;
		    cerr << endl;
		    return;
		  }
		
		  for(unsigned int jCluster2=0; jCluster2<previousAcceptedNumber; jCluster2++) {
		    Long64_t previousEvent = acceptedClusterInformationArray[kBuffer][jCluster2].thisEvent;
		    if(previousEvent == currentEvent && !repeatCheck) {
		      cerr << "\n Programming error: trying to mix clusters with the same event number " << currentEvent;
		      cerr << ",  kBuffer = " << kBuffer << ", clusters in previous event " << previousAcceptedNumber;
		      for(unsigned int jBuffer=0; jBuffer<bufferDepth; jBuffer++) {
			cout << "\n jBuffer " << jBuffer << ",  eventNumber " << eventNumberCluster[jBuffer];
			cout << ", clusters in event " << countAcceptedCluster[jBuffer];
		      }
		      cerr << endl;
		      return;
		    }	
				
		    if(repeatCheck && jCluster2<=jCluster1)
		      continue;
							
		    if(repeatCheck)
		      countRepeatChecks++;

		    countMixedClusterExamined++;
					
		    float ptCluster2 = acceptedClusterInformationArray[kBuffer][jCluster2].clustPt;
		    float etaCluster2 = acceptedClusterInformationArray[kBuffer][jCluster2].clustEta;
		    float enrCluster2 = acceptedClusterInformationArray[kBuffer][jCluster2].clustEnr;
		    float s49Cluster2 = acceptedClusterInformationArray[kBuffer][jCluster2].clustS49;
		    float phiCluster2 = acceptedClusterInformationArray[kBuffer][jCluster2].clustPhi;
		    float p2x = ptCluster2*cos(phiCluster2);
		    float p2y = ptCluster2*sin(phiCluster2);
		    float p2z = enrCluster2*cos(2.0*atan(exp(-etaCluster2)));
					
		    double clust2Theta = 2.0*atan(exp(-etaCluster2));
					
		    double openAngle = acos(cos(clust1Theta)*cos(clust2Theta) + sin(clust1Theta)*sin(clust2Theta)*cos(phiCluster2 - phiCluster1));
		    if(openAngle < minimumOpeningAngle)            // cut does not exist in pi0DataTreeAnalyze.C, need for mixed event overlapping clusters
		      continue;
					
		    float xCluster2 = rECal*cos(phiCluster2);
		    float yCluster2 = rECal*sin(phiCluster2);
		    float zCluster2 = rECal/tan(clust2Theta);
					
		    float dSeparationSquared = (xCluster2 - xCluster1)*(xCluster2- xCluster1) +
		      (yCluster2 - yCluster1)*(yCluster2- yCluster1) +
		      (zCluster2 - zCluster1)*(zCluster2- zCluster1);
					
		    static int separationPrint = 0;
		    if(separationPrint < 0) {
		      separationPrint++;
		      cout << "\n separation squared " << dSeparationSquared;
		      if(separationPrint >= 10) {
			cout << endl;
		      }
		    }  // debug print for separation distances
					
		    if(dSeparationSquared < minimumSeparationSquared)    // cut does not exist in pi0DataTreeAnalyze.C, need for mixed event overlapping clusters    
		      continue;
					
		    //
		    // Compute the reco mass quantities for combinations satisfying pT and eta cuts
		    //
		    float pxsum = p1x + p2x;
		    float pysum = p1y + p2y;
		    float pi0Pt = sqrt(pxsum*pxsum + pysum*pysum);
					
		    float pzsum = p1z + p2z;
		    float totalMomentum = sqrt(pi0Pt*pi0Pt + pzsum*pzsum);
		    float pi0Theta = acos(pzsum/totalMomentum);
		    float pi0Eta = -log(tan(pi0Theta/2.));
		    float absPi0Eta = fabs(pi0Eta);
				
		    float pi0Energy = enrCluster1 + enrCluster2;
		    float mixedEventPi0Mass = sqrt(pi0Energy*pi0Energy - totalMomentum*totalMomentum);

                    if(useCoreEnergy) {
                      if(s49Cluster1<=1.0)
                        mixedEventPi0Mass *= sqrt(coreEnergyCorrection*s49Cluster1);
                      if(s49Cluster2<=1.0)
                        mixedEventPi0Mass *= sqrt(coreEnergyCorrection*s49Cluster2);
                    }

		    if(useClusterEnergyAsymmetryCut && mixedEventPi0Mass < maximumPi0MassForHistogram) {  // asymmetry cut for pi0 mass only
		      float clusterEnergySum = enrCluster2 + enrCluster1;

		      if(clusterEnergySum <= 0.0) {
			cerr << "\n Reconstruction error, cluster energy sum = " << clusterEnergySum;
			cerr << "\n  Cluster1 energy = " <<  enrCluster1;
			cerr << "\n  Cluster2 energy = " <<  enrCluster2;
			cerr << endl;
			return;
		      } // safety check on cluster energy sum

		      float clusterEnergyAsymmetry = fabs(enrCluster2 - enrCluster1)/clusterEnergySum;
		      if(clusterEnergyAsymmetry >  clusterEnergyAsymmetryCut) {
			if(!repeatCheck)
			  countMixedEventAsymmetryCut++;
			continue;  // skip this combination
		      }

		    } // check on using cluster energy asymmetry cut
				
		    if(!repeatCheck && mixedEventPi0Mass > 0.0 && mixedEventPi0Mass < maximumPi0MassForHistogram) {
		      for(unsigned int kEta=0; kEta<NETABINS; kEta++) {
			if(absPi0Eta >= lowEtaBin[kEta] && absPi0Eta < highEtaBin[kEta]) {
			  for(unsigned int kPt=0; kPt<NPTBINS; kPt++) {
			    if(pi0Pt >= lowPtBin[kPt] && pi0Pt < highPtBin[kPt]) {
			      pi0MassEtaPtHistogramMixed[kEta][kPt]->Fill(mixedEventPi0Mass);
			    } // check for inside pt bin
			  } // loop over pt bins
			  break;
			} // check for inside eta bin
		      } // loop over eta bins
		    } // check for inside pi0 mass histogram region to fill mixed-event unpartitioned histograms
		
		    if(pi0Pt < lowPtCut || pi0Pt > highPtCut)
		      continue;
		    if(pi0Eta <= lowEtaLimit || pi0Eta >= highEtaLimit)
		      continue;
					
		    countMixedMassInPtAndEtaWindows++;
					
		    // float pi0Phi = atan2(pysum, pxsum);  We may want to histogram this quantity too
							
		    if(!repeatCheck && mixedEventPi0Mass > 0.3 && mixedEventPi0Mass < 0.80)
		      etaMassHistogramMixed->Fill(mixedEventPi0Mass);
			
		    if(mixedEventPi0Mass > 0.0 && mixedEventPi0Mass < maximumPi0MassForHistogram) {
		      if(repeatCheck) {
			//
			// Make another copy of the same event mass histogram
			//
			pi0MassHistogramRepeated->Fill(mixedEventPi0Mass);
		      }
		      else {
			//
			// These are mixed events
			//
			pi0MassHistogramMixed->Fill(mixedEventPi0Mass);
			double cosOpenAngle = cos(clust1Theta)*cos(clust2Theta) + sin(clust1Theta)*sin(clust2Theta)*cos(phiCluster2 - phiCluster1);
			pi0OpenAngleHistogramMixed->Fill(openAngle);
						
			static int printLowMass = 0;
			if(mixedEventPi0Mass < 0.01 && printLowMass<10) {
			  printLowMass++;
			  cout << "\n mixed event low mass " << mixedEventPi0Mass;
			  cout << ", cosOpenAngle " << cosOpenAngle;
			  cout << ", openAngle " << openAngle;
			  cout << ", pi0Enr " << pi0Energy;
			  cout << ", clust1Theta " << clust1Theta;
			  cout << ", clust2Theta " << clust2Theta;
			  cout << ", phiCluster1 " << phiCluster1;
			  cout << ", phiCluster2 " << phiCluster2;
			  if(printLowMass >= 10) {
			    cout << endl;
			  }
			} // check low mass window
		      } // check for mixed event mode
		    } // check histogram mass window
					
		  } // loop over previous event clusters
				
		} // loop over event buffer
			
	      } // loop over current clusters
			
	      currentBufferEventIndexCluster++;
	      if(currentBufferEventIndexCluster == bufferDepth)
		currentBufferEventIndexCluster = 0;  // roll back to the start of the buffer for filling with the current event
			
	      if(currentBufferEventIndexCluster >= bufferDepth) {
		cerr << "\n Programming error: attempting to set an index beyond the event limit in the buffer";
		cerr << endl;
		return;
	      }

	    } // check for minimum number of clusters in the last event

	    currentAcceptedClusterNumber = 0;
	    lastEvent = thisEvent;
	    lastcent_bin = cent_binC;
	    lastZVertEvt = zVertEvtC;
	    lastnClu = nCluster;

	  } // new event number

	  //
	  // Global cuts for clusters
	  //
	  if(cent_binC >= centLow && cent_binC < centHigh &&
	     zVertEvtC > lowZVertex && zVertEvtC < highZVertex) {
				
	    countClustersInGlobalCut++; 
		
	    unsigned int jCluster = kCluster;
	    if(currentBufferEventIndexCluster >= bufferDepth) {
	      cerr << "\n currentBufferEventIndexCluster " << currentBufferEventIndexCluster << " exceeds buffer depth " << bufferDepth << endl;
	      return;
	    } // safety check
			
	    //
	    // These cuts are also used as the global cuts below for the pi0 mass histograms in the plotDataRidgeSurface.C macro
	    //
	    if(clustrEnr > clustEnrCut && clustrPt > clustPtCut &&
	       clustrS49 > clustS49Cut && clustrS1 > clustS1Cut &&
	       fabs(clustrEta) < 1.49  && fabs(1.0 - clustrS25/clustrEnr) < clustS25Cut &&
	       clustrClo > clusterClosestCut) {
	      //
	      // check to see if this cluster is already stored
	      //
				
	      for(unsigned kClusterCount=0; kClusterCount<currentAcceptedClusterNumber; kClusterCount++) {
		if(jCluster == acceptedClusterInformationArray[currentBufferEventIndexCluster][kClusterCount].kCluster) {
		  cerr << "\n Error: duplicate kCluster index number " << jCluster << " for kFileC = " << kFileC << endl;
		  cerr << "\n This cluster eta = " << clustrEta;
		  cerr << ",  previously stored cluster eta = " << acceptedClusterInformationArray[currentBufferEventIndexCluster][kClusterCount].clustEta;
		  cerr << "\n  jCluster = " << jCluster;
		  cerr << ",   kCluster = " << acceptedClusterInformationArray[currentBufferEventIndexCluster][kClusterCount].kCluster;
		  cerr << ";  currentBufferEventIndexCluster = " << currentBufferEventIndexCluster;
		  cerr << ",  kClusterCount = " << kClusterCount;
		  cerr << ",  thisEvent " << thisEvent;
		  cerr << ",  storedEvent "<< acceptedClusterInformationArray[currentBufferEventIndexCluster][kClusterCount].thisEvent;
		  cerr << ",  currentAcceptedClusterNumber " << currentAcceptedClusterNumber;
		  cerr << endl;
		  return;
		} // safety check if index matches already stored cluster
	      } // loop over already stored clusters

	      if(currentAcceptedClusterNumber >= maximumNumberAcceptedCluster) {
		cerr << "\n currentAcceptedClusterNumber is too large " << currentAcceptedClusterNumber << endl;
		return;
	      } // safety check on too many clusters

	      acceptedClusterInformationArray[currentBufferEventIndexCluster][currentAcceptedClusterNumber].thisEvent = thisEvent;
	      acceptedClusterInformationArray[currentBufferEventIndexCluster][currentAcceptedClusterNumber].kCluster = jCluster;
	      acceptedClusterInformationArray[currentBufferEventIndexCluster][currentAcceptedClusterNumber].clustEta = clustrEta;
	      acceptedClusterInformationArray[currentBufferEventIndexCluster][currentAcceptedClusterNumber].clustPhi = clustrPhi;
	      acceptedClusterInformationArray[currentBufferEventIndexCluster][currentAcceptedClusterNumber].clustPt = clustrPt;
	      acceptedClusterInformationArray[currentBufferEventIndexCluster][currentAcceptedClusterNumber].clustEnr = clustrEnr;
	      acceptedClusterInformationArray[currentBufferEventIndexCluster][currentAcceptedClusterNumber].clustS49 = clustrS49;

	      currentAcceptedClusterNumber++;
	      countClustersStored++;
	      if(currentAcceptedClusterNumber > maximumClustersInSingleEvent)
		maximumClustersInSingleEvent = currentAcceptedClusterNumber;

	    } // check for good cluster

	  } // global cuts for cluster

	} // while loop over cluster entries

	cout << "\n Finished scan of cluster NTUPLE, with countClusterEntries cumulative total = " << countClusterEntries;
	cout << "\n  Currently with pi0 mixed event entries = " << pi0MassHistogramMixed->GetEntries();
	cout << ",  and  eta mixed event entries = " << etaMassHistogramMixed->GetEntries();
	cout << "\n  total number of events for clusters = " << countClusterEvents;
	cout << ",  mixed clusters examined " << countMixedClusterExamined;
	cout << ",  events containing at least one cluster " << totalEventsWithClusters++;
	cout << ",  clusters in global cuts " << countClustersInGlobalCut;

	if(countClusterEntries >=  maximumClusterEntries)
	  cout << "\n  *** Have reached maximumClusterEntries value " << maximumClusterEntries << " ***";
	
	cout << endl;

      } // check for cluster entry limit
			
      if(iOption != 15) {
	Long64_t nEntries = pi0TreeReconstructed->GetEntries();
	cout << "\n Entries in  NTUPLE = " << nEntries << endl;

	Long64_t nEntries0 = nEntries/10;

	Long64_t readEntries = nEntries;
	if(maxReadEntries > 0 && maxReadEntries < nEntries) {
	  readEntries = maxReadEntries;
	  nEntries0 = readEntries/10;
	}
 
	pi0TreeReconstructed->GetEntry(0);
   
	int checkRun = Run;
	if(composeFileName && checkRun != runNumber) {
	  cerr << "\n Input run number Run " << Run << " is inconsistent with specified run number " << runNumber << endl;
	  return;
	}
			
	Long64_t lastEvent = Event;
	int lastRun = Run;
	Long64_t thisEvent = lastEvent;
	int thisRun = lastRun;
	int thiscent_bin = cent_bin;
	int lastcent_bin = cent_bin;
	float lastZVertEvt = zVertEvt;

	//
	// Check for reaction plane angle
	//
	bool reactionPlaneInEvent = false;
	float reactionPlaneAngle = 0.0;
	float reactionPlaneAngleforPositiveEtaPi0 = 0.0;
	if(useReactionPlaneAngle) {
	  for(unsigned int rr=0; rr < countReactionPlaneStore; rr++) {
	    if(thisEvent == reactionPlaneInformationArray[rr].thisEvent) {
	      reactionPlaneInEvent = true;
	      reactionPlaneAngle = reactionPlaneInformationArray[rr].reactionPlaneAngle;
	      reactionPlaneAngleforPositiveEtaPi0 = reactionPlaneInformationArray[rr].negEtaGapAngle;
	      goodReactionPlane++;
	      eventAcceptedReactionPlaneAngleHistogram->Fill(reactionPlaneAngle);
	      break;
	    } // check for correct event
	  } // loop over stored reaction plane events;
	}
	else {
	  reactionPlaneAngle = 0.0;
	}

	if(cent_bin >= centLow && cent_bin < centHigh)
	  totalEventsInCentralityRange++;

	cout << "\n Begin NTUPLE scan with iOption = " << iOption << " for file " << fileName;
	cout << "\n First event number " << thisEvent  << " with centrality " << cent_bin;
	if(reactionPlaneInEvent) {
	  cout << "\n Reaction plane angle = " <<  reactionPlaneAngle << " radians";
	  if(usingGapAnglePair) {
	    cout << " for negative eta pi0";
	    cout << ";  reaction plane angle = " <<  reactionPlaneAngleforPositiveEtaPi0  << " radians";
	    cout << " for positive eta pi0"; 
	  }
	}
	else
	  cout << "\n There is no reaction plane for this event";

	cout << endl;

	for (Long64_t iEntry=0; iEntry<readEntries; iEntry++) {

	  pi0TreeReconstructed->GetEntry(iEntry);
	  thisEvent = Event;
	  if(thisEvent < 0) {
	    cerr << "\n thisEvent = " << thisEvent << "  Event = " << Event << endl;
	    return;
	  } // check for negative event number

	  if(iEntry%nEntries0 == 0) {
	    cout << "\n pi0 entry " << iEntry << ", accept pi0 " << totalAcceptedPi0;
	    cout << ", last event " << lastEvent;
	    cout << ", this event " << thisEvent;
	    cout << ", this pi0 pT " << recPi0Pt;
	    cout << ", tot. events " << totalEvents;
	    cout << ", evts in cent. range " << totalEventsInCentralityRange;
	    cout << ", good RP evts " <<  goodReactionPlane;
	    if(useClusterEnergyAsymmetryCut)
	      cout << ", asymmetry cut (mixed, same) " << countMixedEventAsymmetryCut << ", " << countSameEventAsymmetryCut;
	  }
  
	  int iLumiSect = LumiSect;
	  if(iLumiSect < minLumiSect)
	    minLumiSect = iLumiSect;
	  if(iLumiSect > maxLumiSect)
	    maxLumiSect = iLumiSect;

	  thisRun = Run;
	  thiscent_bin = cent_bin;

	  if(thisEvent != lastEvent || (lastcent_bin != thiscent_bin || zVertEvt != lastZVertEvt)) {
	
	    totalEvents++;
	    if(thisEvent == lastEvent && (lastcent_bin != thiscent_bin || zVertEvt != lastZVertEvt)) {
	      cout << "\n Wrong event number at entry " << iEntry << " with thisEvent " << thisEvent << " lastEvent " << lastEvent;
	      cout << ";  lastcent_bin " << lastcent_bin << "  thiscent_bin " <<  thiscent_bin;
	      cout << ";  lastZVertEvt " << lastZVertEvt << "  zVertEvt " <<  zVertEvt;
	      cout << endl;
	      return;
	    }

	    if(toyModel || (cent_bin >= centLow && cent_bin < centHigh))
	      totalEventsInCentralityRange++;

	    lastEvent = thisEvent;
	    lastcent_bin = cent_bin;
	    lastZVertEvt = zVertEvt;

	    //
	    // Check for reaction plane angle
	    //
	    if(useReactionPlaneAngle) {
	      reactionPlaneInEvent = false;
	      for(unsigned int rr=0; rr < countReactionPlaneStore; rr++) {
		if(thisEvent == reactionPlaneInformationArray[rr].thisEvent) {
		  reactionPlaneInEvent = true;
		  goodReactionPlane++;
		  reactionPlaneAngle =  reactionPlaneInformationArray[rr].reactionPlaneAngle;
		  eventAcceptedReactionPlaneAngleHistogram->Fill(reactionPlaneAngle);
		  if(usingGapAnglePair) {
		    reactionPlaneAngleforPositiveEtaPi0 =  reactionPlaneInformationArray[rr].negEtaGapAngle;
		    eventAcceptedReactionPlaneAngleHistogram->Fill(reactionPlaneAngleforPositiveEtaPi0);
		  }
		  break;
		} // check for correct event
	      } // loop over stored reaction plane events;
	    }
	    else {
	      reactionPlaneAngle = 0.0;
	    }
	  }  // check on a change in the event number 
 
	  //
	  // Global cuts for pi0
	  //
	  static unsigned int pythiaPrint = 0;
	  if((pythiaModel || hydjetModel) && pythiaPrint < 10) {
	    pythiaPrint++;
	    cout << "\n thisEvent " << thisEvent;
	    cout << ": recPi0Mas " << recPi0Mas;
	    cout << ", recPi0Eta " << recPi0Eta;
	    cout << ", recPi0Phi " << recPi0Phi;
	    cout << ", recPi0Pt " << recPi0Pt;
	    cout << ", clust1Enr " << clust1Enr;
	    cout << ", clust2Enr " << clust2Enr;
	    cout << ", clust1Pt " << clust1Pt;
	    cout << ", clust2Pt " << clust2Pt;
	    cout << "\n  clust1S49 " << clust1S49;
	    cout << ", clust2S49 " << clust2S49;
	    cout << ", clust1S1 " << clust1S1;
	    cout << ", clust2S1 " << clust2S1;
	    cout << ", cent_bin " << cent_bin;
	    if(pythiaPrint >= 10) {
	      cout << endl;
	    }
	  }

	  if(cent_bin >= centLow && cent_bin < centHigh &&
	     zVertEvt > lowZVertex && zVertEvt < highZVertex &&
	     recPi0Eta > lowEtaLimit && recPi0Eta < highEtaLimit &&
	     recPi0Pt >= lowPtCut && recPi0Pt <= highPtCut && 
	     clust1Enr > clustEnrCut && clust2Enr > clustEnrCut &&
	     clust1Pt > clustPtCut && clust2Pt > clustPtCut &&
	     clust1S49 > clustS49Cut && clust2S49 > clustS49Cut &&
	     clust1S1 > clustS1Cut && clust2S1 > clustS1Cut &&
	     fabs(clust1Eta) < 1.49 && fabs(clust2Eta) < 1.49 &&
	     clust1Clo > clusterClosestCut &&   clust2Clo > clusterClosestCut) {

	    double clust1S25Ratio = fabs(1.0 - clust1S25/clust1Enr);
	    double clust2S25Ratio = fabs(1.0 - clust2S25/clust2Enr);

	    if(clust1S25Ratio > clustS25Cut)
	      continue;
		
	    if(clust2S25Ratio > clustS25Cut)
	      continue;

	    double clust1Theta = 2.0*atan(exp(-clust1Eta));
	    double clust2Theta = 2.0*atan(exp(-clust2Eta));
	    double openAngle = acos(cos(clust1Theta)*cos(clust2Theta) + sin(clust1Theta)*sin(clust2Theta)*cos(clust1Phi - clust2Phi));
		
	    if((pythiaModel || hydjetModel) && pythiaPrint < 10) {
	      cout << "\n Simulation: opening angle " << openAngle;
	    }
			
	    if(openAngle < minimumOpeningAngle)
	      continue;

	    float xCluster1 = rECal*cos(clust1Phi);
	    float yCluster1 = rECal*sin(clust1Phi);
	    float zCluster1 = rECal/tan(clust1Theta);
		
	    float xCluster2 = rECal*cos(clust2Phi);
	    float yCluster2 = rECal*sin(clust2Phi);
	    float zCluster2 = rECal/tan(clust2Theta);
		
	    float dSeparationSquared = (xCluster2 - xCluster1)*(xCluster2- xCluster1) +
	      (yCluster2 - yCluster1)*(yCluster2- yCluster1) +
	      (zCluster2 - zCluster1)*(zCluster2- zCluster1);
		
	    if(dSeparationSquared < minimumSeparationSquared)
	      continue;
		
	    if(etaExclude &&
	       ((clust1Eta > lowEtaExclude && clust1Eta <highEtaExclude) ||
		(clust2Eta > lowEtaExclude && clust2Eta <highEtaExclude))) {
	      if(recPi0Mas > lowTruePairMassCut && recPi0Mas < highTruePairMassCut)
		totalTrueExcluded++;
	      continue;
	    } // check on excluding an eta range for the clusters

	    if(useReactionPlaneAngle && !reactionPlaneInEvent) {
	      missedReactionPlane++;
	      continue;
	    }
		
	    float testCosineTwoDelta = cos(2.0*(recPi0Phi - reactionPlaneAngle)); 
	    if(usingGapAnglePair && recPi0Eta > 0.0)
	      testCosineTwoDelta = cos(2.0*(recPi0Phi - reactionPlaneAngleforPositiveEtaPi0)); 
	    float testEpsilon = fabs(0.001*testCosineTwoDelta);
	    if(testEpsilon < 1.0e-05)
	      testEpsilon = 1.0e-05;
		
	    float recPi0PhiRP = deltaPhi(recPi0Phi, reactionPlaneAngle);
	    if(usingGapAnglePair && recPi0Eta > 0.0)
	      recPi0PhiRP = deltaPhi(recPi0Phi, reactionPlaneAngleforPositiveEtaPi0);

	    if(recPi0PhiRP < 0)
	      recPi0PhiRP += TMath::Pi();
		
	    if(fabs(cos(2.0*recPi0PhiRP) - testCosineTwoDelta) > testEpsilon) {
	      cerr << "\n Fail cosine(2*Delta) test";
	      cerr << ", testCosineTwoDelta " << testCosineTwoDelta;
	      cerr << ", current cosine(2*Delta) " << cos(2.0*recPi0PhiRP);
	      cerr << ", diff " << fabs(cos(2.0*recPi0PhiRP) - testCosineTwoDelta);
	      cerr << endl;
	      return;
	    }
		
            if(recPi0PhiRP > TMath::Pi()/2.0)
              recPi0PhiRP = TMath::Pi() - recPi0PhiRP;  // Using pi/2 as the upper limit

	    if(recPi0PhiRP < lowPhiBin[0] || recPi0PhiRP > highPhiBin[NPHIBINS-1]) {
	      cerr << "\n recPi0PhiRP out of range:";
	      cerr << " recPi0PhiRP " << recPi0PhiRP;
	      cerr << ", recPi0Phi " << recPi0Phi;
	      cerr << ", reactionPlaneAngle " << reactionPlaneAngle;
	      cerr << ", deltaPhi " << deltaPhi(recPi0Phi, reactionPlaneAngle);
	      cerr << endl;
	      countOutOfRangeDeltaRP++;
	    }

            if(useCoreEnergy) {
              if(clust1S49<=1.0)
                recPi0Mas *= sqrt(coreEnergyCorrection*clust1S49);
              if(clust2S49<=1.0)
                recPi0Mas *= sqrt(coreEnergyCorrection*clust2S49);
            }

	    if(recPi0Mas> 0.0 && recPi0Mas < maximumPi0MassForHistogram) {

	      if(useClusterEnergyAsymmetryCut) { // asymmetry cut for pi0 mass only
		float clusterEnergySum = clust1Enr + clust2Enr;

		if(clusterEnergySum <= 0.0) {
		  cerr << "\n Reconstruction error, cluster energy sum = " << clusterEnergySum;
		  cerr << "\n  Cluster1 energy = " <<  clust1Enr;
		  cerr << "\n  Cluster2 energy = " <<  clust2Enr;
		  cerr << endl;
		  return;
		} // safety check on cluster energy sum

		float clusterEnergyAsymmetry = fabs(clust1Enr - clust2Enr)/clusterEnergySum;
		if(clusterEnergyAsymmetry >  clusterEnergyAsymmetryCut) {
		  countSameEventAsymmetryCut++;
		  continue;  // skip this combination
		}

	      } // check on using cluster energy asymmetry cut

	      pi0AcceptedReactionPlaneAngleHistogram->Fill(reactionPlaneAngle);
	      pi0MassHistogram->Fill(recPi0Mas);
	      pi0OpenAngleHistogram->Fill(openAngle);

	      bool ptCheck = abs(recPi0Eta)<0.0 && recPi0Pt>3.2; // debug check, set to false
	      bool ptStore = false;
	
	      for(unsigned int kEta=0; kEta<NETABINS; kEta++) {
		if(fabs(recPi0Eta) >= lowEtaBin[kEta] && fabs(recPi0Eta) < highEtaBin[kEta]) {
		  for(unsigned int kPt=0; kPt<NPTBINS; kPt++) {
		    if(recPi0Pt >= lowPtBin[kPt] && recPi0Pt < highPtBin[kPt]) {
		      pi0MassEtaPtHistogram[kEta][kPt]->Fill(recPi0Mas);
		      if(ptCheck)
			ptStore = true;
		      for(unsigned int kPhi=0; kPhi<NPHIBINS; kPhi++) {
			if(recPi0PhiRP >= lowPhiBin[kPhi] && recPi0PhiRP < highPhiBin[kPhi]) {
			  pi0MassEtaPhiPtHistogram[kEta][kPhi][kPt]->Fill(recPi0Mas);
			  break;
			} // check for inside phi RP bin
		      } // loop over phi bins
		    } // check for inside pt bin
		  } // loop over pt bins
		  break;
		} // check for inside eta bin
	      } // loop over eta bins	
	      if(ptCheck) {
		cout << "\n ptCheck true for pT " << recPi0Pt << " and eta " << recPi0Eta << " and recPi0Phi " << recPi0Phi;
		if(ptStore)
		  cout << ", pi0 was stored";
		else
		  cout << ", pi0 was not stored";

		cout << endl;
		return;
	      } // debug print
	    } // check for inside pi0 mass histogram region
		
	    if(recPi0Mas> 0.3 && recPi0Mas < 0.80)
	      etaMassHistogram->Fill(recPi0Mas);
		
	    //
	    // Introduce "true" same event mass cuts related to the ridge effect
	    //
	    if(toyModel ||
	       (recPi0Mas > lowTruePairMassCut && recPi0Mas < highTruePairMassCut )) {

	      if(toyModel || (recPi0Mas > lowTruePairMassCut && recPi0Mas < highTruePairMassCut)) {
		pi0EtaTrueHistogram->Fill(recPi0Eta);
		pi0PhiTrueHistogram->Fill(recPi0Phi);
		pi0PhiRPTrueHistogram->Fill(recPi0PhiRP);
		pi0PtTrueHistogram->Fill(recPi0Pt);
	      } // fill true pi0 single histograms

	      totalAcceptedPi0++;   // accepted pi0 in the true mass window

	    } // check on mass cuts

	  } // check on global cuts
  
	} // loop over NTUPLE entries

      } // check on iOption != 15
		
      kFile++;
      cout << "\n Finished processing file " << kFile << " with name " << fileName;
      cout << "\n\n Cumulative accepted pi0 " << totalAcceptedPi0;
      cout << ",  cumulative events " << totalEvents;
      cout << ",  events in centrality range " << totalEventsInCentralityRange;
      cout << ",  missed reaction plane count " << missedReactionPlane;
      cout << ",  out of range deltaRP count " << countOutOfRangeDeltaRP;
      cout <<"\n  Maximum number of clusters in a single event = " <<  maximumClustersInSingleEvent;
      cout << endl;
      if(f1)
	delete f1;

    } // while loop over input files

    cout << "\n\n Finished all NTUPLE scans with total events = " << totalEvents;

  } // check on not reading histogram file

  if(iOption == 15) { // check RP resolution
	
    TCanvas *c1RP = new TCanvas("c1RP", "Plotting Reaction Plane Angle Differences", 200, 10, 700, 500);
    //
    // Use ROOT's gStyle function to set up plot options
    //
    gStyle->SetOptStat(1110);
    gStyle->SetStatTextColor(kBlue);
    gStyle->SetFuncColor(kBlue);
    gStyle->SetFuncWidth(2);
    gStyle->SetOptFit(1111);
    gStyle->SetFitFormat("6.5g");
		
    c1RP->SetFillColor(kWhite);	
		
    c1RP->Divide(2,2);

    c1RP->cd(1);
    diffPosEtaGapHFAngle->SetMaximum(3000);
    diffPosEtaGapHFAngle->SetLineColor(4);
    diffPosEtaGapHFAngle->SetLineWidth(2);
    diffPosEtaGapHFAngle->Draw();

    c1RP->cd(3);
    diffNegEtaGapHFAngle->SetMaximum(3000);
    diffNegEtaGapHFAngle->SetLineColor(4);
    diffNegEtaGapHFAngle->SetLineWidth(2);
    diffNegEtaGapHFAngle->Draw();
	
    c1RP->cd(2);
    diffEtaGapAngle->SetMaximum(3000);
    diffEtaGapAngle->SetLineColor(4);
    diffEtaGapAngle->SetLineWidth(2);
    diffEtaGapAngle->Draw();

    c1RP->cd(4);
    diffMidEtaHFAngle->SetMaximum(3000);
    diffMidEtaHFAngle->SetLineColor(4);
    diffMidEtaHFAngle->SetLineWidth(2);
    diffMidEtaHFAngle->Draw();

    return;

  } // iOption = 15

  if(readHistogramFile) {

    int useRunNumber = runNumber;
    if(toyModel)
      useRunNumber = 0;

    char inputFileName[200];
    sprintf(inputFileName, "pi0FlowPlots_Run%d_Centrality%d-%d_Pt%3.1f-%3.1f_EtaLimit%4.2f.root", useRunNumber, lowCent, highCent, lowPtCut, highPtCut, highEtaLimit);
    TFile *flowPlotsFile = new TFile(inputFileName);

    pi0MassHistogram = (TH1D*)flowPlotsFile->Get("pi0MassHistogram");
    if(!pi0MassHistogram) {
      cerr << "\n Cannot find pi0MassHistogram" << endl;
      return;
    }
		
    pi0MassHistogramRepeated = (TH1D*)flowPlotsFile->Get("pi0MassHistogramRepeated");
    if(!pi0MassHistogramRepeated) {
      cerr << "\n Cannot find pi0MassHistogramRepeated" << endl;
      return;
    }		

    pi0MassHistogramMixed = (TH1D*)flowPlotsFile->Get("pi0MassHistogramMixed");
    if(!pi0MassHistogramMixed) {
      cerr << "\n Cannot find pi0MassHistogramMixed" << endl;
      return;
    }
		
    eventAcceptedReactionPlaneAngleHistogram = (TH1D*)flowPlotsFile->Get("eventAcceptedReactionPlaneAngle");
    if(!eventAcceptedReactionPlaneAngleHistogram) {
      cerr << "\n Cannot find eventAcceptedReactionPlaneAngle" << endl;
      return;
    }
		
    pi0AcceptedReactionPlaneAngleHistogram = (TH1D*)flowPlotsFile->Get("pi0AcceptedReactionPlaneAngle");
    if(!pi0AcceptedReactionPlaneAngleHistogram) {
      cerr << "\n Cannot find pi0AcceptedReactionPlaneAngle" << endl;
      return;
    }
    
    etaMassHistogram = (TH1D*)flowPlotsFile->Get("etaMassHistogram");
    if(!etaMassHistogram) {
      cerr << "\n Unable to find etaMassHistogram histogram in input file";
      cerr << endl;
      return;
    }
 
    etaMassHistogramMixed = (TH1D*)flowPlotsFile->Get("etaMassHistogramMixed");
    if(!etaMassHistogramMixed) {
      cerr << "\n Unable to find etaMassHistogramMixed histogram in input file";
      cerr << endl;
      if(iOption == 20 || iOption == -20)
	return;
    }

    pi0EtaTrueHistogram = (TH1D*)flowPlotsFile->Get("pi0EtaTrueHistogram");
    if(!pi0EtaTrueHistogram) {
      cerr << "\n Cannot find pi0EtaTrueHistogram" << endl;
      return;
    }

    pi0PhiTrueHistogram = (TH1D*)flowPlotsFile->Get("pi0PhiTrueHistogram");
    if(!pi0PhiTrueHistogram) {
      cerr << "\n Cannot find pi0PhiTrueHistogram" << endl;
      return;
    }
		
    pi0PhiRPTrueHistogram = (TH1D*)flowPlotsFile->Get("pi0PhiRPTrueHistogram");
    if(!pi0PhiRPTrueHistogram) {
      cerr << "\n Cannot find pi0PhiTrueHistogram" << endl;
      return;
    }		

    pi0PtTrueHistogram = (TH1D*)flowPlotsFile->Get("pi0PtTrueHistogram");
    if(!pi0PtTrueHistogram) {
      cerr << "\n Cannot find pi0PtTrueHistogram" << endl;
      return;
    }
			
    char histogramName[200];
    char histogramTitle[200];		
    for(unsigned int kEta=0; kEta<NETABINS; kEta++) {
      for(unsigned int kPt=0; kPt<NPTBINS; kPt++) {
	sprintf(histogramName, "pi0MassMixedEtaBin%dPtBin%d", kEta, kPt);
	sprintf(histogramTitle, "Mixed-event #pi^{0} for %5.2f < #eta < %5.2f, %5.2f < p_{T} < %5.2f ",
		lowEtaBin[kEta], highEtaBin[kEta], lowPtBin[kPt], highPtBin[kPt]);
	pi0MassEtaPtHistogramMixed[kEta][kPt] = (TH1D*)flowPlotsFile->Get(histogramName);
	if(!pi0MassEtaPtHistogramMixed[kEta][kPt]) {
	  cerr << "\n Cannot find " <<  histogramName << " with title " << histogramTitle << endl;
	  return;
	}		
	sprintf(histogramName, "pi0MassEtaBin%dPtBin%d", kEta, kPt);
	sprintf(histogramTitle, "Same-event #pi^{0} for %5.2f < |#eta| < %5.2f, %5.2f < p_{T} < %5.2f ",
		lowEtaBin[kEta], highEtaBin[kEta], lowPtBin[kPt], highPtBin[kPt]);
	pi0MassEtaPtHistogram[kEta][kPt] = (TH1D*)flowPlotsFile->Get(histogramName);
	if(!pi0MassEtaPtHistogram[kEta][kPt]) {
	  cerr << "\n Cannot find " <<  histogramName << " with title " << histogramTitle << endl;
	  return;
	}		
	for(unsigned int kPhi=0; kPhi<NPHIBINS; kPhi++) {
	  sprintf(histogramName, "pi0MassEtaBin%dPhiBin%dPtBin%d", kEta, kPhi, kPt);
	  pi0MassEtaPhiPtHistogram[kEta][kPhi][kPt] = (TH1D*)flowPlotsFile->Get(histogramName);
	  sprintf(histogramTitle, "#pi^{0}pi for %5.2f < #eta < %5.2f, %5.2f < #phi < %5.2f, %5.2f < p_{T} < %5.2f ",
		  lowEtaBin[kEta], highEtaBin[kEta], lowPhiBin[kPhi], highPhiBin[kPhi], lowPtBin[kPt], highPtBin[kPt]);
	  if(!pi0MassEtaPhiPtHistogram[kEta][kPhi][kPt]) {
	    cerr << "\n Cannot find " <<  histogramName << " with title " << histogramTitle << endl;
	    return;
	  }							
	} // loop over phi bins
      } // loop over pt bins	
    } // loop over eta bins
		
  
  } // check on reading histogram file
	
  unsigned int useEventsProcessed = eventAcceptedReactionPlaneAngleHistogram->GetEntries();
	
  TCanvas *c1 = new TCanvas("c1", "Plotting Single Pi0", 200, 10, 700, 500);
  //
  // Use ROOT's gStyle function to set up plot options
  //
  gStyle->SetOptStat(1110);
  gStyle->SetStatTextColor(kBlue);
  gStyle->SetFuncColor(kBlue);
  gStyle->SetFuncWidth(2);
  gStyle->SetOptFit(1111);
  gStyle->SetFitFormat("6.5g");
	
  c1->SetFillColor(kWhite);	

  int kOption = iOption;
  if(iOption < 0)
    kOption = -iOption;
	
  if(kOption > 0 && kOption < 6) { // plot the 9 azimuthal distributions for a given eta and pt bin
		
    //
    // Set up utility histograms
    //
    TH1D *pi0MassEtaPhiPtHistogramMixed[NETABINS][NPHIBINS][NPTBINS];
    TH1D *pi0MassEtaPtHistogramCopyMixed[NETABINS][NPTBINS];
    TH1D *pi0MassEtaPhiPtHistogramSubtracted[NETABINS][NPHIBINS][NPTBINS];
    TH1D *pi0MassEtaPtHistogramSubtracted[NETABINS][NPTBINS];
		
    float subtractedYields[NETABINS][NPHIBINS][NPTBINS];
    float subtractedYieldErrors[NETABINS][NPHIBINS][NPTBINS];

    float binLowForYieldArray[NETABINS][NPTBINS];
    float binHighForYieldArray[NETABINS][NPTBINS];
    float mixedEventNormalizationFactor2DArray[NETABINS][NPTBINS];
    float mixedEventNormalizationFactor3DArray[NETABINS][NPHIBINS][NPTBINS];
    float mixedEventNormalizationErrorFactor2DArray[NETABINS][NPTBINS];
    float mixedEventNormalizationErrorFactor3DArray[NETABINS][NPHIBINS][NPTBINS];
	
    for(unsigned int kEta=0; kEta<NETABINS; kEta++) {
      for(unsigned int kPt=0; kPt<NPTBINS; kPt++ ) {
	binLowForYieldArray[kEta][kPt] = 0.0;
	binHighForYieldArray[kEta][kPt] = 0.0;
	mixedEventNormalizationFactor2DArray[kEta][kPt] = 0.0;
	mixedEventNormalizationErrorFactor2DArray[kEta][kPt] = 0.0;
	for(unsigned int kPhi=0; kPhi<NPHIBINS; kPhi++) {
	  subtractedYields[kEta][kPhi][kPt] = 0.0;
	  subtractedYieldErrors[kEta][kPhi][kPt] = 0.0;
	  mixedEventNormalizationFactor3DArray[kEta][kPhi][kPt] = 0.0;
	  mixedEventNormalizationErrorFactor3DArray[kEta][kPhi][kPt] = 0.0;
	}
      }
    }
		
    char histogramName[200];
    char histogramTitle[200];
    for(unsigned int kEta=0; kEta<NETABINS; kEta++) {
      for(unsigned int kPt=0; kPt<NPTBINS; kPt++) {
	sprintf(histogramName, "pi0MassSubtactedEtaBin%dPtBin%d", kEta, kPt);
	sprintf(histogramTitle, "Background-subtracted #pi^{0} for %5.2f < #eta < %5.2f, %5.2f < p_{T} < %5.2f ",
		lowEtaBin[kEta], highEtaBin[kEta], lowPtBin[kPt], highPtBin[kPt]);
	pi0MassEtaPtHistogramSubtracted[kEta][kPt] = new TH1D(histogramName, histogramTitle, nMassBins, 0.0, maximumPi0MassForHistogram);
	pi0MassEtaPtHistogramSubtracted[kEta][kPt]->SetXTitle("#gamma#gamma Invariant mass (GeV/c^{2})");
	pi0MassEtaPtHistogramSubtracted[kEta][kPt]->SetYTitle("Counts per 4 MeV/c^{2} bin");
	sprintf(histogramName, "pi0MassCopyMixedEtaBin%dPtBin%d", kEta, kPt);
	sprintf(histogramTitle, "Copy of Mixed-Event #pi^{0} for %5.2f < #eta < %5.2f, %5.2f < p_{T} < %5.2f ",
		lowEtaBin[kEta], highEtaBin[kEta], lowPtBin[kPt], highPtBin[kPt]);
	pi0MassEtaPtHistogramCopyMixed[kEta][kPt] = new TH1D(histogramName, histogramTitle, nMassBins, 0.0, maximumPi0MassForHistogram);
	pi0MassEtaPtHistogramCopyMixed[kEta][kPt]->SetXTitle("#gamma#gamma Invariant mass (GeV/c^{2})");
	pi0MassEtaPtHistogramCopyMixed[kEta][kPt]->SetYTitle("Counts per 4 MeV/c^{2} bin");
				
	//
	// Partition by azimuthal angle in reaction plane
	//
	for(unsigned int kPhi=0; kPhi<NPHIBINS; kPhi++) {
					
	  sprintf(histogramName, "pi0MassMixedEtaBin%dPhiBin%dPtBin%d", kEta, kPhi, kPt);
	  sprintf(histogramTitle, "Mixed-event #pi^{0} for %5.2f < #eta < %5.2f, %5.2f < #phi < %5.2f, %5.2f < p_{T} < %5.2f ",
		  lowEtaBin[kEta], highEtaBin[kEta], lowPhiBin[kPhi], highPhiBin[kPhi], lowPtBin[kPt], highPtBin[kPt]);
	  pi0MassEtaPhiPtHistogramMixed[kEta][kPhi][kPt] = new TH1D(histogramName, histogramTitle, nMassBins, 0.0, maximumPi0MassForHistogram);
	  pi0MassEtaPhiPtHistogramMixed[kEta][kPhi][kPt]->SetXTitle("#gamma#gamma Invariant mass (GeV/c^{2})");
	  pi0MassEtaPhiPtHistogramMixed[kEta][kPhi][kPt]->SetYTitle("Counts per 4 MeV/c^{2} bin");
					
	  sprintf(histogramName, "pi0MassSubtractedEtaPhiBin%dPhiBin%dPtBin%d", kEta, kPhi, kPt);
	  sprintf(histogramTitle, "Subtracted #pi^{0} for %5.2f < #eta < %5.2f, %5.2f < #phi < %5.2f, %5.2f < p_{T} < %5.2f ",
		  lowEtaBin[kEta], highEtaBin[kEta], lowPhiBin[kPhi], highPhiBin[kPhi], lowPtBin[kPt], highPtBin[kPt]);
	  pi0MassEtaPhiPtHistogramSubtracted[kEta][kPhi][kPt] = new TH1D(histogramName, histogramTitle, nMassBins, 0.0, maximumPi0MassForHistogram);
	  pi0MassEtaPhiPtHistogramSubtracted[kEta][kPhi][kPt]->SetXTitle("#gamma#gamma Invariant mass (GeV/c^{2})");
	  pi0MassEtaPhiPtHistogramSubtracted[kEta][kPhi][kPt]->SetYTitle("Counts per 4 MeV/c^{2} bin");
					
	} // loop over phi bins	
      } // loop over pt bins	
    } // loop over eta bins
	
    unsigned int kPtLow = 0;
    unsigned int kPtHigh = 1;
    if(kOption == 2) {
      kPtLow = 1;
      kPtHigh = 2;
    }
    if(kOption == 3) {
      kPtLow = 2;
      kPtHigh = 3;
    }
    if(kOption == 4) {
      kPtLow = 3;
      kPtHigh = 4;
    }
    if(kOption == 5) {
      kPtLow = 0;
      kPtHigh = 3;
    }
    //
    // Obtain the background-subtracted yields
    //

    unsigned int kEtaLow = 0;
    unsigned int kEtaHigh = NETABINS;

    for(unsigned int kEta=kEtaLow; kEta<kEtaHigh; kEta++) {
      for(unsigned int kPt=kPtLow; kPt<kPtHigh; kPt++) {
	c1->Clear();
	c1->Divide(NPHIBINS/3,3);
	unsigned int kPanel = 1;

	//
	// Get normalization factor for unpartitioned histograms
	//
	double sameEventCountUnPartitioned = 0.0;
	double mixedEventCount = 0.0;
				
	for(int kBin=1; kBin<nMassBins; kBin++) {
	  double binCenter = pi0MassEtaPtHistogramMixed[kEta][kPt] ->GetBinCenter(kBin);
	  if(binCenter >= lowFalsePairMassCut && binCenter <= highFalsePairMassCut) {
	    sameEventCountUnPartitioned += pi0MassEtaPtHistogram[kEta][kPt]->GetBinContent(kBin);
	    mixedEventCount += pi0MassEtaPtHistogramMixed[kEta][kPt]->GetBinContent(kBin);
	  } // check if mass bin is within the normalization region
	} // loop over mass bins
				
	if(mixedEventCount > 0.0 && sameEventCountUnPartitioned > 0 ) { // background subtraction for unpartitioned yields
	  double sameEventYield = 0.0;
	  double sameEventYieldError = 0.0;
					
	  double sameEventTotal = 0.0;
	  double normalizationFactorMixed = sameEventCountUnPartitioned/mixedEventCount;
	  mixedEventNormalizationFactor2DArray[kEta][kPt] = normalizationFactorMixed;
	  mixedEventNormalizationErrorFactor2DArray[kEta][kPt] = sqrt(1.0/sameEventCountUnPartitioned + 1.0/mixedEventCount);
	  for(int kBin=1; kBin<=nMassBins; kBin++) {    
	    double sameEventContent = pi0MassEtaPtHistogram[kEta][kPt]->GetBinContent(kBin);
	    double mixedEventContent = pi0MassEtaPtHistogramMixed[kEta][kPt]->GetBinContent(kBin);
	    double mixedEventFractionalErrorSquared = 0.0;
	    if(mixedEventContent > 0.0)
	      mixedEventFractionalErrorSquared = 1.0/mixedEventContent;
	    double mixedEventNormalizedContent = normalizationFactorMixed*mixedEventContent;
	    pi0MassEtaPtHistogramCopyMixed[kEta][kPt]->SetBinContent(kBin, mixedEventNormalizedContent);
	    double combinedErrorSquared = sameEventContent + mixedEventNormalizedContent*mixedEventNormalizedContent*mixedEventFractionalErrorSquared;
	    sameEventYieldError += combinedErrorSquared;
	    double binCenter = pi0MassEtaPtHistogram[kEta][kPt]->GetBinCenter(kBin);
	    double sameEventSubtracted = sameEventContent - mixedEventNormalizedContent;
	    double sameEventSubtractedError = sqrt(combinedErrorSquared);
						
	    if(binCenter >= subtractedStart && binCenter <= subtractedEnd) {
	      sameEventTotal += sameEventContent;
	      sameEventYield += sameEventSubtracted;
	    }
	    if(sameEventContent > 0.0) {
	      pi0MassEtaPtHistogramSubtracted[kEta][kPt]->SetBinContent(kBin, sameEventSubtracted);
	      pi0MassEtaPtHistogramSubtracted[kEta][kPt]->SetBinError(kBin, sameEventSubtractedError);
	    }
	  } // loop over mixed event histogram
					
	}  // background subtraction for unpartitioned yields
			
	//
	// Partition according to the azimuthal angle in the reaction plane
	//
	for(unsigned int kPhi=0; kPhi<NPHIBINS; kPhi++) {
				
	  //
	  // Get normalization factor for partitioned histograms
	  //
	  double sameEventCount = 0.0;
				
	  for(int kBin=1; kBin<nMassBins; kBin++) {
	    double binCenter = pi0MassEtaPtHistogramMixed[kEta][kPt] ->GetBinCenter(kBin);
	    if(binCenter >= lowFalsePairMassCut && binCenter <= highFalsePairMassCut) {
	      sameEventCount += pi0MassEtaPhiPtHistogram[kEta][kPhi][kPt]->GetBinContent(kBin);
	    } // check if mass bin is within the normalization region
	  } // loop over mass bins
		
	  if(mixedEventCount > 0.0 && sameEventCount > 0.0) {
					
	    double normalizationFactorMixed = sameEventCount/mixedEventCount;
	    mixedEventNormalizationFactor3DArray[kEta][kPhi][kPt] = normalizationFactorMixed;
	    mixedEventNormalizationErrorFactor3DArray[kEta][kPhi][kPt] = sqrt(1.0/sameEventCount + 1.0/mixedEventCount);
	    double normalizationFactorMixedSquared = normalizationFactorMixed*normalizationFactorMixed;
	    for(int kBin=1; kBin<=nMassBins; kBin++) {
	      double sameEventContent = pi0MassEtaPhiPtHistogram[kEta][kPhi][kPt]->GetBinContent(kBin);
	      double mixedEventContent = pi0MassEtaPtHistogramMixed[kEta][kPt]->GetBinContent(kBin);
	      double mixedEventFractionalErrorSquared = 0.0;
	      if(mixedEventContent > 0.0)
		mixedEventFractionalErrorSquared = 1.0/mixedEventContent;
	      double mixedEventNormalizedContent = normalizationFactorMixed*mixedEventContent;
	      pi0MassEtaPhiPtHistogramMixed[kEta][kPhi][kPt]->SetBinContent(kBin, mixedEventNormalizedContent);
	      double combinedErrorSquared = sameEventContent + mixedEventContent*normalizationFactorMixedSquared;
	      double sameEventSubtracted = sameEventContent - mixedEventNormalizedContent;
	      double sameEventSubtractedError = sqrt(combinedErrorSquared);
											
	      if(sameEventContent > 0.0) {
		pi0MassEtaPhiPtHistogramSubtracted[kEta][kPhi][kPt]->SetBinContent(kBin, sameEventSubtracted);
		pi0MassEtaPhiPtHistogramSubtracted[kEta][kPhi][kPt]->SetBinError(kBin, sameEventSubtractedError);
	      }

	    } // loop over mixed event histogram
					
	  } // check on mixed event > 0

	  //
	  // Plot the results
	  //
	  c1->cd(kPanel);
	  float fMaxHistValueMixed = 1.20*pi0MassEtaPhiPtHistogramMixed[kEta][kPhi][kPt]->GetBinContent(pi0MassEtaPhiPtHistogramMixed[kEta][kPhi][kPt]->GetMaximumBin());
	  float fMaxHistValueSameEvent = 1.20*pi0MassEtaPhiPtHistogram[kEta][kPhi][kPt]->GetBinContent(pi0MassEtaPhiPtHistogram[kEta][kPhi][kPt]->GetMaximumBin());

	  float fMaxHistValue = fMaxHistValueMixed;
	  if(fMaxHistValueSameEvent > fMaxHistValueMixed)
	    fMaxHistValue = fMaxHistValueSameEvent;
		
	  pi0MassEtaPhiPtHistogram[kEta][kPhi][kPt]->SetStats(0);
	  pi0MassEtaPhiPtHistogram[kEta][kPhi][kPt]->SetMinimum(0);
	  pi0MassEtaPhiPtHistogram[kEta][kPhi][kPt]->SetMaximum(fMaxHistValue);
	  pi0MassEtaPhiPtHistogram[kEta][kPhi][kPt]->Draw();
	  if(kPanel == 1) {

	    char labelBuffer1[200];
	    if(realData)
	      sprintf(labelBuffer1, "Pb-Pb #sqrt{s} = 2.76 TeV, Run %d", runNumber);
	    if(hydjetModel)
	      sprintf(labelBuffer1, "HYDJET sim: Pb-Pb #sqrt{s} = 2.76 TeV");
	    if(pythiaModel)
	      sprintf(labelBuffer1, "Pythia sim: pp #sqrt{s} = 7.0 TeV");
	    if(toyModel)
	      sprintf(labelBuffer1, "Toy Model Simulation");

	    TLatex *lhcPbPb = new TLatex(0.014, 0.92*fMaxHistValue, labelBuffer1);
	    lhcPbPb->SetTextColor(2);
	    lhcPbPb->SetTextSize(0.05);
	    lhcPbPb->Draw();

	    if(realData || hydjetModel) {
	      char centBuffer1[200];
	      sprintf (centBuffer1, "Centralities %d to %d", lowCent, highCent);
	      TLatex *runB1 = new TLatex(0.014, 0.82*fMaxHistValue, centBuffer1);
	      runB1->SetTextColor(2);
	      runB1->SetTextSize(0.045);
	      runB1->Draw();
	    }
	    
	    if(!useReactionPlaneAngle) {
	      TLatex *noRP1 = new TLatex(0.014, 0.37*fMaxHistValue, "RP NOT USED!");
	      noRP1->SetTextColor(6);
	      noRP1->SetTextSize(0.05);
	      noRP1->Draw();
	    }

	  } // check on first panel

	  pi0MassEtaPhiPtHistogramMixed[kEta][kPhi][kPt]->SetFillColor(kYellow);
	  pi0MassEtaPhiPtHistogramMixed[kEta][kPhi][kPt]->SetLineWidth(2);
	  pi0MassEtaPhiPtHistogramMixed[kEta][kPhi][kPt]->Draw("same");
	  pi0MassEtaPhiPtHistogram[kEta][kPhi][kPt]->SetLineColor(kBlue);
	  pi0MassEtaPhiPtHistogram[kEta][kPhi][kPt]->SetLineWidth(2);
	  pi0MassEtaPhiPtHistogram[kEta][kPhi][kPt]->Draw("same");

	  if(mixedEventCount > 0.0) {			

	    //
	    // Fit the background subtracted result
	    //
	    TF1 *fitFcn =  new TF1("fitFcn", gaussPeak, subtractedStart, subtractedEnd, 3);
	    fitFcn->SetParName(0, "peak Amplitude");
	    fitFcn->SetParName(1, "peak Centroid");
	    fitFcn->SetParName(2, "peak Sigma");
	    fitFcn->SetParameters(fMaxHistValue, 0.13, 0.02);

	    pi0MassEtaPhiPtHistogramSubtracted[kEta][kPhi][kPt]->Fit("fitFcn", "q0", "", subtractedStart, subtractedEnd);
	    float peakCentroid = fitFcn->GetParameter(1);
	    float peakCentroidError = fitFcn->GetParError(1);
	    float peakWidth = fabs(fitFcn->GetParameter(2));
	    float peakWidthError = fitFcn->GetParError(2);

	    TLatex *tSB2 = new TLatex(0.014, 0.75*fMaxHistValue, "Mass fit results (not used for v_{2} fitting)");
	    tSB2->SetTextColor(2);
	    tSB2->SetTextSize(0.043);
	    tSB2->Draw();

	    char signalBuffer3[200];
	    sprintf(signalBuffer3, "Mass = %5.1f #pm %5.1f MeV", 1000.0*peakCentroid, 1000.0*peakCentroidError);
	    TLatex *tSB3 = new TLatex(0.014, 0.68*fMaxHistValue, signalBuffer3);
	    tSB3->SetTextColor(2);
	    tSB3->SetTextSize(0.040);
	    tSB3->Draw();

	    char signalBuffer4[200];
	    sprintf(signalBuffer4, "Width = %5.1f #pm %5.1f MeV", 1000.0*peakWidth, 1000.0*peakWidthError);
	    TLatex *tSB4 = new TLatex(0.014, 0.61*fMaxHistValue, signalBuffer4);
	    tSB4->SetTextColor(2);
	    tSB4->SetTextSize(0.040);
	    tSB4->Draw();

	  } // check if mixed event yield > 0
				
	  kPanel++;
			
	} // loop over phi bins, for this eta and pt range
	
	
	if(iOption > 0) {
					
	  int useRunNumber = runNumber;
	  if(toyModel)
	    useRunNumber = 0;
					
	  //
	  // Partitioned yields before background subtraction (nine panels of azimuth at this eta and pt bin)
	  //
	  char graphOutputFileName[200];
	  sprintf(graphOutputFileName, "pi0FlowYields_Run%d_Centrality%d-%d_Pt%3.1f-%3.1f_Eta%4.2f-%4.2f_%d.C", useRunNumber, lowCent, highCent, lowPtBin[kPt], highPtBin[kPt], lowEtaBin[kEta], highEtaBin[kEta], date);
	  c1->Print(graphOutputFileName);  // C macro
	  sprintf(graphOutputFileName, "pi0FlowYields_Run%d_Centrality%d-%d_Pt%3.1f-%3.1f_Eta%4.2f-%4.2f_%d.gif", useRunNumber, lowCent, highCent, lowPtBin[kPt], highPtBin[kPt], lowEtaBin[kEta], highEtaBin[kEta], date);
	  c1->Print(graphOutputFileName);  // gif file
	  sprintf(graphOutputFileName, "pi0FlowYields_Run%d_Centrality%d-%d_Pt%3.1f-%3.1f_Eta%4.2f-%4.2f_%d.pdf", useRunNumber, lowCent, highCent, lowPtBin[kPt], highPtBin[kPt], lowEtaBin[kEta], highEtaBin[kEta], date);
	  c1->Print(graphOutputFileName);  // pdf file
				 
	  TLine *baseLine = new TLine(0.0, 0.0, maximumPi0MassForHistogram, 0.0);
	  baseLine->SetLineColor(kBlack);
	  baseLine->SetLineWidth(2);
				 
	  //
	  // Fit the unpartitioned background subtracted result for this eta and pt range
	  //
	  TF1 *fitFcnU =  new TF1("fitFcnU", gaussPeak, subtractedStart, subtractedEnd, 3);
	  fitFcnU->SetParName(0, "peak Amplitude");
	  fitFcnU->SetParName(1, "peak Centroid");
	  fitFcnU->SetParName(2, "peak Sigma");
	  float fMaxHistValueU = 1.30*pi0MassEtaPtHistogramSubtracted[kEta][kPt]->GetBinContent(pi0MassEtaPtHistogramSubtracted[kEta][kPt]->GetMaximumBin());
	  fitFcnU->SetParameters(fMaxHistValueU, 0.13, 0.02);
	  pi0MassEtaPtHistogramSubtracted[kEta][kPt]->Fit("fitFcnU", "q0", "", subtractedStart, subtractedEnd);
	  float peakCentroidU = fitFcnU->GetParameter(1);
	  float peakWidthU = fabs(fitFcnU->GetParameter(2));
	  float binLowForYield = peakCentroidU - subtractedYieldWdithFactor*peakWidthU;
	  float binHighForYield = peakCentroidU + subtractedYieldWdithFactor*peakWidthU;
	  binLowForYieldArray[kEta][kPt] = binLowForYield;
	  binHighForYieldArray[kEta][kPt] = binHighForYield;
					
	  for(unsigned int kPhi=0; kPhi<NPHIBINS; kPhi++) {
	    c1->cd(kPhi + 1);
	    float fMaxHistValue = 1.30*pi0MassEtaPhiPtHistogramSubtracted[kEta][kPhi][kPt]->GetBinContent(pi0MassEtaPhiPtHistogramSubtracted[kEta][kPhi][kPt]->GetMaximumBin());
	    pi0MassEtaPhiPtHistogramSubtracted[kEta][kPhi][kPt]->SetMaximum(fMaxHistValue);
	    pi0MassEtaPhiPtHistogramSubtracted[kEta][kPhi][kPt]->SetStats(0);
	    pi0MassEtaPhiPtHistogramSubtracted[kEta][kPhi][kPt]->SetMarkerStyle(20);
	    pi0MassEtaPhiPtHistogramSubtracted[kEta][kPhi][kPt]->SetMarkerColor(2);
	    pi0MassEtaPhiPtHistogramSubtracted[kEta][kPhi][kPt]->SetMarkerSize(0.5);
					
	    float mixedEventYield = 0.0;
	    float sumSubtractedYield = 0.0;
	    float sumSubtractedError = 0.0;
	    for(int kBin=1; kBin<=nMassBins; kBin++) {
	      double binCenter = pi0MassEtaPhiPtHistogramSubtracted[kEta][kPhi][kPt]->GetBinCenter(kBin);
	      if(binCenter >= binLowForYield && binCenter <= binHighForYield) {
		sumSubtractedYield += pi0MassEtaPhiPtHistogramSubtracted[kEta][kPhi][kPt]->GetBinContent(kBin);
		double binError = pi0MassEtaPhiPtHistogramSubtracted[kEta][kPhi][kPt]->GetBinError(kBin);
		sumSubtractedError += binError*binError;
		mixedEventYield += pi0MassEtaPtHistogramMixed[kEta][kPt]->GetBinContent(kBin);
	      } // check mass bin
	    } // sum over mass bins
	    sumSubtractedError = sqrt(sumSubtractedError);
	    subtractedYields[kEta][kPhi][kPt] = sumSubtractedYield;
	    float mixedEventYieldError = mixedEventNormalizationErrorFactor3DArray[kEta][kPhi][kPt]*
	      mixedEventNormalizationFactor3DArray[kEta][kPhi][kPt]*mixedEventYield;

	    subtractedYieldErrors[kEta][kPhi][kPt] = sqrt(sumSubtractedError*sumSubtractedError +
 							  mixedEventYieldError*mixedEventYieldError);
						
	    //
	    // Fit the background subtracted result
	    //
	    TF1 *fitFcn =  new TF1("fitFcn", gaussPeak, subtractedStart, subtractedEnd, 3);
	    fitFcn->SetParName(0, "peak Amplitude");
	    fitFcn->SetParName(1, "peak Centroid");
	    fitFcn->SetParName(2, "peak Sigma");
	    fitFcn->SetParameters(fMaxHistValue, 0.13, 0.02);
	    pi0MassEtaPhiPtHistogramSubtracted[kEta][kPhi][kPt]->Fit("fitFcn", "", "", subtractedStart, subtractedEnd);

	    float peakCentroid = fitFcn->GetParameter(1);
	    float peakCentroidError = fitFcn->GetParError(1);
	    float peakWidth = fabs(fitFcn->GetParameter(2));
	    float peakWidthError = fitFcn->GetParError(2);
						
	    char signalBuffer1[200];
	    sprintf(signalBuffer1, "Mass = %5.1f #pm %5.1f MeV", 1000.0*peakCentroid, 1000.0*peakCentroidError);
	    TLatex *tSB1 = new TLatex(0.014, 0.85*fMaxHistValue, signalBuffer1);
	    tSB1->SetTextColor(4);
	    tSB1->SetTextSize(0.035);
	    tSB1->Draw();
						
	    char signalBuffer2[200];
	    sprintf(signalBuffer2, "Width = %5.1f #pm %5.1f MeV", 1000.0*peakWidth, 1000.0*peakWidthError);
	    TLatex *tSB2 = new TLatex(0.014, 0.75*fMaxHistValue, signalBuffer2);
	    tSB2->SetTextColor(4);
	    tSB2->SetTextSize(0.035);
	    tSB2->Draw();
						
	    char signalBuffer3[200];
	    sprintf(signalBuffer3, "Yield = %d #pm %d", int(sumSubtractedYield), int(sumSubtractedError));
	    TLatex *tSB3 = new TLatex(0.175, 0.85*fMaxHistValue, signalBuffer3);
	    tSB3->SetTextColor(2);
	    tSB3->SetTextSize(0.050);
	    tSB3->Draw();

	    TLatex *tSB4 = new TLatex(0.175, 0.75*fMaxHistValue, "Used for v_{2} fitting");
	    tSB4->SetTextColor(2);
	    tSB4->SetTextSize(0.040);
	    tSB4->Draw();
						
	    baseLine->Draw();
			
	    float lowY = pi0MassEtaPhiPtHistogramSubtracted[kEta][kPhi][kPt]->GetMinimum();
	    float highY = pi0MassEtaPhiPtHistogramSubtracted[kEta][kPhi][kPt]->GetMaximum();
	    TLine *lowYieldCut = new TLine(binLowForYield, lowY, binLowForYield, highY);
	    lowYieldCut->SetLineColor(kMagenta);
	    lowYieldCut->SetLineWidth(1);
	    lowYieldCut->SetLineStyle(3);
	    lowYieldCut->Draw();
			
	    TLine * highYieldCut = new TLine(binHighForYield, lowY, binHighForYield, highY);
	    highYieldCut->SetLineColor(kMagenta);
	    highYieldCut->SetLineWidth(1);
	    highYieldCut->SetLineStyle(3);
	    highYieldCut->Draw();
			
	  } // loop over phi bins
				 
	  //
	  // Partitioned yields after background subtraction (nine panels of azimuth at this eta and pt bin)
	  //
	  sprintf(graphOutputFileName, "pi0FlowSubtractedYields_Run%d_Centrality%d-%d_Pt%3.1f-%3.1f_Eta%4.2f-%4.2f_%d.C", useRunNumber, lowCent, highCent, lowPtBin[kPt], highPtBin[kPt], lowEtaBin[kEta], highEtaBin[kEta], date);
	  c1->Print(graphOutputFileName);  // C macro
	  sprintf(graphOutputFileName, "pi0FlowSubtractedYields_Run%d_Centrality%d-%d_Pt%3.1f-%3.1f_Eta%4.2f-%4.2f_%d.gif", useRunNumber, lowCent, highCent, lowPtBin[kPt], highPtBin[kPt], lowEtaBin[kEta], highEtaBin[kEta], date);
	  c1->Print(graphOutputFileName);  // gif file
	  sprintf(graphOutputFileName, "pi0FlowSubtractedYields_Run%d_Centrality%d-%d_Pt%3.1f-%3.1f_Eta%4.2f-%4.2f_%d.pdf", useRunNumber, lowCent, highCent, lowPtBin[kPt], highPtBin[kPt], lowEtaBin[kEta], highEtaBin[kEta], date);
	  c1->Print(graphOutputFileName);  // pdf file
				 
	  c1->Clear();
				 
	  //
	  // Plot of flow fit at this eta and pt bin (one panel)
	  //
				 
	  c1->cd(1);
	  float xPlot[NPHIBINS];
	  float yPlot[NPHIBINS];
	  float xPlotErrors[NPHIBINS];
	  float yPlotErrors[NPHIBINS];
	  float yMax = 0.0;
	  float yMin = 1.0e+30;
	  for(unsigned int kPhi=0; kPhi<NPHIBINS; kPhi++) {
	    xPlot[kPhi] = 0.5*(lowPhiBin[kPhi] + highPhiBin[kPhi]);
	    xPlotErrors[kPhi] = 0.0;
	    yPlot[kPhi] = subtractedYields[kEta][kPhi][kPt];
	    if(yPlot[kPhi] > yMax)
	      yMax = yPlot[kPhi];
	    if(yPlot[kPhi] < yMin)
	      yMin = yPlot[kPhi];
	    yPlotErrors[kPhi] = subtractedYieldErrors[kEta][kPhi][kPt];
	  }
			
	  float yMinDefault = yMin/2.5;
	  float yMaxDefault = yMax*1.7;
 
	  int iMinY = yMin/100.0;
	  yMin = 100.0*(iMinY - 2);
	  if(yMin < 0.0)
	    yMin = 0.0;

	  if(yMin < yMinDefault)
	    yMin = yMinDefault;

	  int iMaxY = yMax/100.0;
	  if(iMaxY < 5)
	    yMax = 100.0*(iMaxY + 2);
	  else
	    yMax = 100.0*(iMaxY + 4);
				 
	  if(yMax > yMaxDefault)
	    yMax = yMaxDefault;

	  if(graphFlow)
	    delete graphFlow;
				 
	  graphFlow = new TGraphErrors(NPHIBINS, xPlot, yPlot, xPlotErrors, yPlotErrors);
	  graphFlow->SetLineColor(1);
	  graphFlow->SetLineWidth(2);
	  graphFlow->SetMarkerColor(4);
	  graphFlow->SetMarkerStyle(20);
	  graphFlow->SetMarkerSize(1.25);
	  char graphTitle[200];
	  if(toyModel) {
	    sprintf(graphTitle, "Toy Model #pi^{0} With v_{2} Flow: %5.2f < |#eta| < %5.2f, %5.2f < p_{T} < %5.2f ",
		    lowEtaBin[kEta], highEtaBin[kEta], lowPtBin[kPt], highPtBin[kPt]);
	  }
	  if(realData) {
	    sprintf(graphTitle, "#pi^{0} With v_{2} Flow: %d < Centrality < %d, %5.2f < |#eta| < %5.2f, %5.2f < p_{T} < %5.2f ",
		    lowCent, highCent, lowEtaBin[kEta], highEtaBin[kEta], lowPtBin[kPt], highPtBin[kPt]);
	  }
	  graphFlow->SetTitle(graphTitle);
	  graphFlow->GetXaxis()->SetTitle("#Phi_{Lab} _ #Phi_{RP} (radians)");	
	  graphFlow->GetYaxis()->SetTitle("Background Subtracted Yield");	
	  graphFlow->GetXaxis()->SetLimits(lowPhiBin[0], highPhiBin[NPHIBINS - 1]);
	  cout << "\n First: yMin " << yMin << " yMax " << yMax << " iMinY " << iMinY << " iMaxY " << iMaxY;
	  graphFlow->SetMinimum(yMin);
	  graphFlow->SetMaximum(yMax);										 
	  graphFlow->Draw("AP");
	  c1->SetGridx();
	  c1->SetGridy();

	  if(noFlowFitFcn)
	    delete noFlowFitFcn;
					
	  noFlowFitFcn = new TF1("noFlowFitFcn", constantBackground, 0.0, 2.0*TMath::Pi(), 2);
	  noFlowFitFcn->SetParName(1, "Constant");
	  noFlowFitFcn->SetParameter(0, 100.0);
	  graphFlow->Fit("noFlowFitFcn", "q0", "", 0.0, 2.0*TMath::Pi());
					
	  if(flowFitFcn)
	    delete flowFitFcn;
				 
	  flowFitFcn =  new TF1("flowFitFcn", v2SinglesFit, 0.0, 2.0*TMath::Pi(), 2);
	  flowFitFcn->SetParName(0, "Normalization");
	  flowFitFcn->SetParName(1, "v_{2}");
	  flowFitFcn->SetParameter(0, 0.5*(yMin + yMax));
	  flowFitFcn->SetParameter(1, 0.01);
	  graphFlow->Fit("flowFitFcn", "", "", 0.0, 2.0*TMath::Pi());
					
	  if(flowFitFcn2)
	    delete flowFitFcn2;
					
	  flowFitFcn2 = new TF1("flowFitFcn2", v2SinglesFit, 0.0, 2.0*TMath::Pi(), 2);
	  flowFitFcn2->SetParName(0, "Normalization");
	  flowFitFcn2->SetParName(1, "v_{2}");
	  flowFitFcn2->SetParameter(0, flowFitFcn->GetParameter(0));
	  flowFitFcn2->SetParameter(1, 0.15);
	  flowFitFcn2->SetLineColor(2);
	  flowFitFcn2->SetLineStyle(3);
	  if(!toyModel)
	    flowFitFcn2->Draw("same");
					
	  float sumChiSquareV2 = 0.0;
	  for(unsigned int kPhi=0.0; kPhi<NPHIBINS; kPhi++) {
	    if(yPlotErrors[kPhi] > 0.0) {
	      float diff = (yPlot[kPhi] - flowFitFcn2->Eval(xPlot[kPhi]))/yPlotErrors[kPhi];
	      sumChiSquareV2 += diff*diff;
	    }
	  }
					
	  if(toyModel) {
	    char toyRPBuffer[200];
	    if(useToyModelRPResolution) {
	      if(toyModelRPResolution >= 0.0) {
		sprintf(toyRPBuffer, "Assume a RP resolution parameter %4.2f radians", toyModelRPResolution);
	      }
	      else {
		sprintf(toyRPBuffer, "Assume a random Reaction Plane");
	      }
	    }
	    else {
	      sprintf(toyRPBuffer, "Assume a perfect RP resolution parameter");
	    }

	    TLatex *tRP = new TLatex(0.6, yMin + 0.7*(yMax - yMin), toyRPBuffer);
	    tRP->SetTextColor(4);
	    tRP->SetTextSize(0.030);
	    tRP->Draw();
	  }
				 
	  char eventsBuffer[200];
	  sprintf(eventsBuffer, "Events processed %d", useEventsProcessed);
	  TLatex *tEV = new TLatex(1.1, yMin + 0.075*(yMax - yMin), eventsBuffer);
	  tEV->SetTextColor(4);
	  tEV->SetTextSize(0.025);
	  tEV->Draw();
					
	  if(!toyModel) {
	    TLatex *tCO = new TLatex(0.1, yMin + 0.075*(yMax - yMin), "Dotted: compare with v_{2} = 0.15");
	    tCO->SetTextColor(2);
	    tCO->SetTextSize(0.025);
	    tCO->Draw();
					
	    char compareBuffer[200];
	    sprintf(compareBuffer, "Reduced #chi^{2} %4.2f", sumChiSquareV2/(NPHIBINS - 2));
	    TLatex *tCO2 = new TLatex(0.1, yMin + 0.040*(yMax - yMin), compareBuffer);
	    tCO2->SetTextColor(2);
	    tCO2->SetTextSize(0.025);
	    tCO2->Draw();
			
	    char choiceBuffer[200];
	    switch(reactionPlaneAngleChoice) {
	    case 1:
	      sprintf(choiceBuffer, "Reaction Plane Angle Choice: HF");
	      break;
	    case 2:
	      sprintf(choiceBuffer, "Reaction Plane Angle Choice: TracksMidEta");
	      break;
	    case 3:
	      sprintf(choiceBuffer, "Reaction Plane Angle Choice: TracksEta");
	      break;
	    case 4:
	      sprintf(choiceBuffer, "Reaction Plane Angle Choice: TracksPosEta");
	      break;
	    case 5:
	      sprintf(choiceBuffer, "Reaction Plane Angle Choice: TracksNegEta");
	      break;
	    case 6:
	      sprintf(choiceBuffer, "Reaction Plane Angle Choice: etHF");
	      break;
	    case 7:
	      sprintf(choiceBuffer, "Reaction Plane Angle Choice: PosEtaGap");
	      break;
	    case 8:
	      sprintf(choiceBuffer, "Reaction Plane Angle Choice: NegEtaGap");
	      break;
	    case 9:
	      sprintf(choiceBuffer, "Reaction Plane Angle Choice: EtaGapPair");
	      break;
	    default:
	      cerr << "\n Undefined reaction plane angle choice" << endl;
	      return;
	    } // switch according to reaction plane choice
			
	    TLatex *tCH = new TLatex(0.2, yMin + 0.90*(yMax - yMin), choiceBuffer);
	    tCH->SetTextColor(1);
	    tCH->SetTextSize(0.025);
	    tCH->Draw();
			
	    char yieldCutBuffer[200];
	    sprintf(yieldCutBuffer, "Subtracted yield cut interval = %3.1f #sigma around unpartitioned mass centroid", subtractedYieldWdithFactor);
	    TLatex *tCY = new TLatex(0.10, yMin + 0.83*(yMax - yMin), yieldCutBuffer);
	    tCY->SetTextColor(1);
	    tCY->SetTextSize(0.022);
	    tCY->Draw();
			
	  }
	  else {
	    TLatex *tCO = new TLatex(0.1, yMin + 0.075*(yMax - yMin), "Toy model v_{2} = 0.20");
	    tCO->SetTextColor(4);
	    tCO->SetTextSize(0.025);
	    tCO->Draw();
	  }
					
	  sprintf(graphOutputFileName, "pi0FlowFits_Run%d_Centrality%d-%d_Pt%3.1f-%3.1f_Eta%4.2f-%4.2f_%d.C", useRunNumber, lowCent, highCent, lowPtBin[kPt], highPtBin[kPt], lowEtaBin[kEta], highEtaBin[kEta], date);
	  c1->Print(graphOutputFileName);  // C macro
	  sprintf(graphOutputFileName, "pi0FlowFits_Run%d_Centrality%d-%d_Pt%3.1f-%3.1f_Eta%4.2f-%4.2f_%d.gif", useRunNumber, lowCent, highCent, lowPtBin[kPt], highPtBin[kPt], lowEtaBin[kEta], highEtaBin[kEta], date);
	  c1->Print(graphOutputFileName);  // gif file
	  sprintf(graphOutputFileName, "pi0FlowFits_Run%d_Centrality%d-%d_Pt%3.1f-%3.1f_Eta%4.2f-%4.2f_%d.pdf", useRunNumber, lowCent, highCent, lowPtBin[kPt], highPtBin[kPt], lowEtaBin[kEta], highEtaBin[kEta], date);
	  c1->Print(graphOutputFileName);  // pdf file
				 
	}		
      } // loop over pt bins
    } // loop over eta bins
		
    c1->Clear();
    //
    // Unpartitioned yields before and after subtraction (3 pT bins at a given eta bin)
    //
    c1->Divide(3,2);
		
    TLine *baseLine = new TLine(0.0, 0.0, maximumPi0MassForHistogram, 0.0);
    baseLine->SetLineColor(kBlack);
    baseLine->SetLineWidth(2);
		
    for(unsigned int kEta=kEtaLow; kEta<kEtaHigh; kEta++) {
      for (unsigned int kPt=0; kPt<3; kPt++) {
	if(pi0MassEtaPtHistogram[kEta][kPt]->GetEntries() == 0.0)
	  continue;

	c1->cd(kPt+1);
	pi0MassEtaPtHistogram[kEta][kPt]->SetStats(0);
	pi0MassEtaPtHistogram[kEta][kPt]->Draw();

	if(pi0MassEtaPtHistogram[kEta][kPt]->GetEntries() > 0.0) {
	  pi0MassEtaPtHistogramCopyMixed[kEta][kPt]->SetFillColor(kYellow);
	  pi0MassEtaPtHistogramCopyMixed[kEta][kPt]->Draw("same");
	}
	pi0MassEtaPtHistogram[kEta][kPt]->SetLineColor(4);
	pi0MassEtaPtHistogram[kEta][kPt]->SetLineWidth(2);
	pi0MassEtaPtHistogram[kEta][kPt]->Draw("same");
	
	if(pi0MassEtaPtHistogramSubtracted[kEta][kPt]->GetEntries() <= 0.0)
	  continue;

	int sumSubtractedYield = 0;
	float sumSubtractedError = 0.0;
	float binLowForYield = 	binLowForYieldArray[kEta][kPt];
	float binHighForYield =	binHighForYieldArray[kEta][kPt];

	c1->cd(kPt+4);
	float mixedEventYield = 0.0;
	for(int kBin=1; kBin<=nMassBins; kBin++) {
	  double binCenter = pi0MassEtaPtHistogramSubtracted[kEta][kPt]->GetBinCenter(kBin);
	  if(binCenter >= binLowForYield && binCenter <= binHighForYield) {
	    sumSubtractedYield += pi0MassEtaPtHistogramSubtracted[kEta][kPt]->GetBinContent(kBin);
	    mixedEventYield += pi0MassEtaPtHistogram[kEta][kPt]->GetBinContent(kBin);
	    double binError = pi0MassEtaPtHistogramSubtracted[kEta][kPt]->GetBinError(kBin);
	    sumSubtractedError += binError*binError;
	  } // check mass bin
	} // sum over mass bins
	float mixedEventYieldError = mixedEventYield*mixedEventNormalizationFactor2DArray[kEta][kPt]*
	  mixedEventNormalizationErrorFactor2DArray[kEta][kPt];

	sumSubtractedError = sqrt(sumSubtractedError + mixedEventYieldError);
					
	float fMaxHistValue = 1.30*pi0MassEtaPtHistogramSubtracted[kEta][kPt]->GetBinContent(pi0MassEtaPtHistogramSubtracted[kEta][kPt]->GetMaximumBin());
	pi0MassEtaPtHistogramSubtracted[kEta][kPt]->SetMaximum(fMaxHistValue);
	pi0MassEtaPtHistogramSubtracted[kEta][kPt]->SetStats(0);
	pi0MassEtaPtHistogramSubtracted[kEta][kPt]->SetMarkerStyle(20);
	pi0MassEtaPtHistogramSubtracted[kEta][kPt]->SetMarkerColor(2);
	pi0MassEtaPtHistogramSubtracted[kEta][kPt]->SetMarkerSize(0.5);
	//
	// Fit the background subtracted result
	//
	TF1 *fitFcn =  new TF1("fitFcn", gaussPeak, subtractedStart, subtractedEnd, 3);
	fitFcn->SetParName(0, "peak Amplitude");
	fitFcn->SetParName(1, "peak Centroid");
	fitFcn->SetParName(2, "peak Sigma");
	fitFcn->SetParameters(fMaxHistValue, 0.13, 0.02);
	pi0MassEtaPtHistogramSubtracted[kEta][kPt]->Fit("fitFcn", "", "", subtractedStart, subtractedEnd);
	float peakCentroid = fitFcn->GetParameter(1);
	float peakCentroidError = fitFcn->GetParError(1);
	float peakWidth = fabs(fitFcn->GetParameter(2));
	float peakWidthError = fitFcn->GetParError(2);
				
	char signalBuffer1[200];
	sprintf(signalBuffer1, "Mass = %5.1f #pm %5.1f MeV", 1000.0*peakCentroid, 1000.0*peakCentroidError);
	TLatex *tSB1 = new TLatex(0.014, 0.85*fMaxHistValue, signalBuffer1);
	tSB1->SetTextColor(4);
	tSB1->SetTextSize(0.035);
	tSB1->Draw();
				
	char signalBuffer2[200];
	sprintf(signalBuffer2, "Width = %5.1f #pm %5.1f MeV", 1000.0*peakWidth, 1000.0*peakWidthError);
	TLatex *tSB2 = new TLatex(0.014, 0.75*fMaxHistValue, signalBuffer2);
	tSB2->SetTextColor(4);
	tSB2->SetTextSize(0.035);
	tSB2->Draw();
					
	char signalBuffer3[200];
	sprintf(signalBuffer3, "Yield = %d #pm %d", sumSubtractedYield, int(sumSubtractedError));
	TLatex *tSB3 = new TLatex(0.175, 0.80*fMaxHistValue, signalBuffer3);
	tSB3->SetTextColor(2);
	tSB3->SetTextSize(0.040);
	tSB3->Draw();
	
	char signalBuffer4[200];
	sprintf(signalBuffer4, "From %4.3f to %4.3f GeV", binLowForYield, binHighForYield);
	TLatex *tSB4 = new TLatex(0.175, 0.75*fMaxHistValue, signalBuffer4);
	tSB4->SetTextColor(2);
	tSB4->SetTextSize(0.030);
	tSB4->Draw();
			
	baseLine->Draw();
					
	float lowY = pi0MassEtaPtHistogramSubtracted[kEta][kPt]->GetMinimum();
	float highY = pi0MassEtaPtHistogramSubtracted[kEta][kPt]->GetMaximum();
	TLine *lowYieldCut = new TLine(binLowForYield, lowY, binLowForYield, highY);
	lowYieldCut->SetLineColor(kMagenta);
	lowYieldCut->SetLineWidth(1);
	lowYieldCut->SetLineStyle(3);
	lowYieldCut->Draw();
				
	TLine * highYieldCut = new TLine(binHighForYield, lowY, binHighForYield, highY);
	highYieldCut->SetLineColor(kMagenta);
	highYieldCut->SetLineWidth(1);
	highYieldCut->SetLineStyle(3);
	highYieldCut->Draw();
			
      } // loop over 3 pt bins
			
      int useRunNumber = runNumber;
      if(toyModel)
	useRunNumber = 0;
			
      char graphOutputFileName[200];
      sprintf(graphOutputFileName, "pi0UnpartitionedYields_Run%d_Centrality%d-%d_Eta%4.2f-%4.2f_%d.C", useRunNumber, lowCent, highCent, lowEtaBin[kEta], highEtaBin[kEta], date);
      c1->Print(graphOutputFileName);  // C macro
      sprintf(graphOutputFileName, "pi0UnpartitionedYields_Run%d_Centrality%d-%d_Eta%4.2f-%4.2f_%d.gif", useRunNumber, lowCent, highCent, lowEtaBin[kEta], highEtaBin[kEta], date);
      c1->Print(graphOutputFileName);  // gif file
      sprintf(graphOutputFileName, "pi0UnpartitionedYields_Run%d_Centrality%d-%d_Eta%4.2f-%4.2f_%d.pdf", useRunNumber, lowCent, highCent, lowEtaBin[kEta], highEtaBin[kEta], date);
      c1->Print(graphOutputFileName);  // pdf fill
			
    } // loop over eta bins
		
    int sumAllYields = 0;
    float sumAllErrors = 0.0;
    cout << "\n                         Pt Bins";
    cout << "\n Eta Bins        ";
    for(unsigned int kPt=0; kPt<3; kPt++) {
      cout << lowPtBin[kPt] << " - " << highPtBin[kPt];
      cout << "         ";
    } // loop over pT bins for column header
    cout << endl;
    for(unsigned int kEta=kEtaLow; kEta<kEtaHigh; kEta++) {
      cout << "\n " << lowEtaBin[kEta] << " - " << highEtaBin[kEta];
      cout << ":   ";
      for(unsigned int kPt=0; kPt<3; kPt++) {
	int yieldThisEtaThisPt = 0.0;
	float errorThisEtaThisPt = 0.0;
	for(unsigned int kPhi=0; kPhi<NPHIBINS; kPhi++) {
	  yieldThisEtaThisPt += subtractedYields[kEta][kPhi][kPt];
	  errorThisEtaThisPt += float(subtractedYieldErrors[kEta][kPhi][kPt])*float(subtractedYieldErrors[kEta][kPhi][kPt]);
	} // loop over kPhi bins at this eta and pt
	cout << "  " << yieldThisEtaThisPt;
	cout << " +/- " << int(sqrt(errorThisEtaThisPt));
	cout << "  ";
	sumAllYields += yieldThisEtaThisPt;
	sumAllErrors += errorThisEtaThisPt;
      } // loop over kPt bins at this eta, moving horizontally
    } // loop over eta bins, moving vertically
    cout << "\n Sum of all yields " << sumAllYields << " +/- " << int(sqrt(sumAllErrors));
		
    float sumAllSameEvent = 0;
    for(unsigned int kEta=0; kEta<NETABINS; kEta++) {
      for(unsigned int kPt=0; kPt<NPTBINS; kPt++) {
	for(unsigned int kPhi=0; kPhi<NPHIBINS; kPhi++) {
	  sumAllSameEvent += pi0MassEtaPhiPtHistogram[kEta][kPhi][kPt]->GetEntries();
	} // loop over phi bins
      } // loop over pt
    } // loop over eta
    cout << "\n Entries in all partitioned same event histograms " << sumAllSameEvent;
    cout << ";  entries in unpartitioned same event histogram " << pi0MassHistogram->GetEntries();
    cout << ";  entries in unpartitioned repeated histogram " << pi0MassHistogramRepeated->GetEntries();
    cout << endl;
		
		
  } // iOption = 1 to 5, plot the azimuthal distributions for a given eta and pt bin
	
  if(iOption == 6) { // mixed event histograms for the pt bins
		
    c1->Divide(2,2);
    unsigned int kPanel = 1;
    for(unsigned int kPt=0; kPt<NPTBINS; kPt++) {
			
      c1->cd(kPanel);
      pi0MassEtaPtHistogramMixed[0][kPt]->SetStats(0);
      pi0MassEtaPtHistogramMixed[0][kPt]->Draw();
			
      kPanel++;
			
    } // loop over pt bins	
		
  } // iOption = 6, mixed event histograms for the pt bins
	
  if(iOption == 7) { // draw reaction plane angle
    c1->Divide(1,2);
		
    c1->cd(1);
    eventAcceptedReactionPlaneAngleHistogram->SetMinimum(0);
    eventAcceptedReactionPlaneAngleHistogram->Draw();
		
    c1->cd(2);
    pi0AcceptedReactionPlaneAngleHistogram->SetMinimum(0);
    pi0AcceptedReactionPlaneAngleHistogram->Draw();
		
  } // iOption = 7, draw reaction plane angle

  if(iOption == 9) { // plot the azimuthal distribution in the lab
    c1->Divide(1,2);
    c1->cd(1);
    pi0PhiTrueHistogram->Draw();

    c1->cd(2);
    pi0PhiRPTrueHistogram->SetMinimum(0);
    pi0PhiRPTrueHistogram->Draw();

  } // kOption = 9 pi0 same events distribution

  if(iOption == 10 || iOption == -10) { // plot the mass spectrum for this centrality and pT cuts

    if(iOption == -10) {
      c1->Divide(1,3);
      c1->cd(1);
    }
		
    TF1 *fitFcn1 = 0;
    TF1 *backgroundFcn1 = 0;

    if(iBackgroundOption == 0) {
      cout << "\n\n Fitting with one constant background function" << endl << endl;
      fitFcn1 = new TF1("fitFcn1",fitFunctionConstant, fitStart, fitEnd, 4);
      fitFcn1->SetParameters(1., 10., 0.134, 0.022);
      fitFcn1->SetParName(0, "constant bgrnd");
      fitFcn1->SetParName(1, "peak Amplitude");
      fitFcn1->SetParName(2, "peak Centroid"); 
      fitFcn1->SetParName(3, "peak Sigma"); 
      backgroundFcn1 = new TF1("backgroundFcn1",constantBackground, fitStart, fitEnd, 1);
    }

    if(iBackgroundOption == 1) {
      cout << "\n\n Fitting with two parameter background function" << endl << endl;
      fitFcn1 = new TF1("fitFcn1",fitFunctionLinear, fitStart, fitEnd, 5);
      fitFcn1->SetParameters(-40, 1000, 200., 0.131, 0.016);
      fitFcn1->SetParName(0, "constant bgrnd");
      fitFcn1->SetParName(1, "linear bgrnd");
      fitFcn1->SetParName(2, "peak Amplitude");
      fitFcn1->SetParName(3, "peak Centroid"); 
      fitFcn1->SetParName(4, "peak Sigma"); 
      backgroundFcn1 = new TF1("backgroundFcn1",linearBackground, fitStart, fitEnd, 2);
    }
	
    fitFcn1->SetNpx(500);
    fitFcn1->SetLineWidth(2);
    fitFcn1->SetLineColor(4);

    if(pythiaModel)
      pi0MassHistogram->SetTitle("#pi^{0} Peak in Pythia pp Events");

    if(toyModel)
      pi0MassHistogram->SetTitle("#pi^{0} Peak From Toy Model Simulation");

    float fMaxHistValue1 = pi0MassHistogram->GetBinContent(pi0MassHistogram->GetMaximumBin());
    float fDivisor = 200.0;
    if(fMaxHistValue1 < 500.)
      fDivisor = 100.0;
    if(fMaxHistValue1 < 100.0)
      fDivisor = 50.0;
		
    int iDivisor = fDivisor;
    int iMaxHistValue1 = fMaxHistValue1/fDivisor;
    iMaxHistValue1 = iDivisor*(iMaxHistValue1 + 3);
    cout << "\n fMaxHistValue1 " << fMaxHistValue1 << endl;
    pi0MassHistogram->SetMaximum(iMaxHistValue1);
    pi0MassHistogram->Fit("fitFcn1", "", "", fitStart, fitEnd);

    TF1 *peakFcn1 = new TF1("peakFcn1", gaussPeak, peakStart, peakEnd, 3);

    if(iBackgroundOption == 0) {
      peakFcn1->SetParameter(0, fitFcn1->GetParameter(1));
      peakFcn1->SetParameter(1, fitFcn1->GetParameter(2));
      peakFcn1->SetParameter(2, fitFcn1->GetParameter(3));
      backgroundFcn1->SetParameter(0, fitFcn1->GetParameter(0));
    }

    if(iBackgroundOption == 1) {
      peakFcn1->SetParameter(0, fitFcn1->GetParameter(2));
      peakFcn1->SetParameter(1, fitFcn1->GetParameter(3));
      peakFcn1->SetParameter(2, fitFcn1->GetParameter(4));
      backgroundFcn1->SetParameter(0, fitFcn1->GetParameter(0));
      backgroundFcn1->SetParameter(1, fitFcn1->GetParameter(1));
    }

    float sum1Total = 0;
    float sum1Peak = 0;
    float sum1Background = 0;
    float peakSumLow =  peakFcn1->GetParameter(1) - 3.0*fabs(peakFcn1->GetParameter(2));
    float peakSumHigh =  peakFcn1->GetParameter(1) + 3.0*fabs(peakFcn1->GetParameter(2));
    for(int iBin=1; iBin<nMassBins; iBin++) {
      float binCenter = pi0MassHistogram->GetBinCenter(iBin);
      if(binCenter>=peakSumLow && binCenter<=peakSumHigh) {
	float binValue = pi0MassHistogram->GetBinContent(iBin);
	sum1Total += binValue; 
	double bgrnd = backgroundFcn1->Eval(binCenter);
	sum1Peak += binValue - bgrnd;
	sum1Background += bgrnd;
      } // check if within mass peak
    }
    float signal1Error = sqrt(sum1Total + sum1Background);
    float signal1FractionalError = 0.0;
    if(sum1Peak > 0.0)
      signal1FractionalError = signal1Error/sum1Peak;

    float background1Error = sqrt(sum1Background);
    float background1FractionalError = 0.0;
    if(sum1Background > 0.0)
      background1FractionalError = background1Error/sum1Background;   

    cout << "\n\n sum1Total = " << sum1Total;
    cout << "\n sum1Peak = " << int(sum1Peak) << " +/- " << int(signal1Error+1.);
    cout << "\n sum1Background = " << int(sum1Background) << " +/- " << int(background1Error+1.);

    float sbRatio1 = 0.0;
    float sbRatioError1 = 0.0;

    if(sum1Background > 0) {
      sbRatio1 =  sum1Peak/sum1Background;
      sbRatioError1 = sbRatio1*sqrt(signal1FractionalError*signal1FractionalError + background1FractionalError*background1FractionalError); 
      cout << "\n Signal/Background = " << sbRatio1 <<  " +/- " << sbRatioError1;
    }
    cout << endl;

    char labelBuffer1[200];
    if(realData)
      sprintf(labelBuffer1, "Pb-Pb #sqrt{s} = 2.76 TeV, Run %d", runNumber);
    if(hydjetModel)
      sprintf(labelBuffer1, "HYDJET sim: Pb-Pb #sqrt{s} = 2.76 TeV");
    if(pythiaModel)
      sprintf(labelBuffer1, "Pythia sim: pp #sqrt{s} = 7.0 TeV");
    if(toyModel)
      sprintf(labelBuffer1, "Toy Model Simulation");
		
    TLatex *lhcPbPb = new TLatex(0.014, 0.90*iMaxHistValue1, labelBuffer1);
    lhcPbPb->SetTextColor(4);
    lhcPbPb->SetTextSize(0.060);
    lhcPbPb->Draw();

    if(realData || hydjetModel) {
      char centBuffer1[200];
      sprintf (centBuffer1, "Centralities %d to %d, Min Bias", lowCent, highCent);
      TLatex *runB1 = new TLatex(0.014, 0.78*iMaxHistValue1, centBuffer1);
      runB1->SetTextColor(4);
      runB1->SetTextSize(0.050);
      runB1->Draw();
    }
						
    char sbBuffer1[200];
    sprintf (sbBuffer1, "S/B (3#sigma) = %5.3f +/- %5.3f", sbRatio1, sbRatioError1);
    TLatex *tSB1 = new TLatex(0.014, 0.66*iMaxHistValue1, sbBuffer1);
    tSB1->SetTextColor(4);
    tSB1->SetTextSize(0.050);
    tSB1->Draw();

    char etaBuffer1[200];
    sprintf(etaBuffer1, "%4.2f < #eta(#pi^{0}) < %4.2f", lowEtaLimit, highEtaLimit);
    TLatex *tSB2 = new TLatex(0.014, 0.54*iMaxHistValue1, etaBuffer1);
    tSB2->SetTextColor(4);
    tSB2->SetTextSize(0.050);
    tSB2->Draw();

    char ptBuffer1[200];
    sprintf(ptBuffer1, "%3.1f < p_{T} < %3.1f", lowPtCut, highPtCut);
    TLatex *tSB3 = new TLatex(0.014, 0.42*iMaxHistValue1, ptBuffer1);
    tSB3->SetTextColor(4);
    tSB3->SetTextSize(0.050);
    tSB3->Draw();

    char signalBuffer1[200];
    sprintf(signalBuffer1, "Signal = %d #pm %d", int(sum1Peak), int(signal1Error));
    TLatex *tSB4 = new TLatex(0.014, 0.30*iMaxHistValue1, signalBuffer1);
    tSB4->SetTextColor(4);
    tSB4->SetTextSize(0.050);
    tSB4->Draw();

    char backgroundBuffer1[200];
    sprintf(backgroundBuffer1, "Bgrnd = %d #pm %d", int(sum1Background), int(background1Error));
    TLatex *tSB5 = new TLatex(0.014, 0.18*iMaxHistValue1, backgroundBuffer1);
    tSB5->SetTextColor(4);
    tSB5->SetTextSize(0.050);
    tSB5->Draw();

    peakFcn1->SetLineColor(2);
    peakFcn1->Draw("same");
		
    if(iOption == -10) {
		
      c1->cd(2);
      TH1D *pi0MassHistogramCopy = 0;
      pi0MassHistogramCopy = new TH1D("pi0MassHistogramCopy", "#pi^{0} Peak in Heavy Ion Events, With Mixed Event Normalized Background", nMassBins, 0.0, maximumPi0MassForHistogram);
      pi0MassHistogramCopy->SetXTitle("#gamma#gamma Invariant mass (GeV/c^{2})");
      pi0MassHistogramCopy->SetYTitle("Counts per 4 MeV/c^{2} bin");
      if(pythiaModel)
	pi0MassHistogramCopy->SetTitle("#pi^{0} Peak in Pythia pp Events, With Mixed Event Normalized Background");
      if(toyModel)
	pi0MassHistogramCopy->SetTitle("#pi^{0} Peak From Toy Model Simulation");
		
      TH1D *pi0MassHistogramSubtracted = 0;
      pi0MassHistogramSubtracted = new TH1D("pi0MassHistogramSubtracted", "Background-subtracted #pi^{0} Peak in Heavy Ion Events", nMassBins, 0.0, maximumPi0MassForHistogram);
      pi0MassHistogramSubtracted->SetXTitle("#gamma#gamma Invariant mass (GeV/c^{2})");
      pi0MassHistogramSubtracted->SetYTitle("Counts per 4 MeV/c^{2} bin");
      if(pythiaModel)
	pi0MassHistogramSubtracted->SetTitle("Background-subtracted #pi^{0} Peak in Pythia pp Events");
      if(toyModel)
	pi0MassHistogramSubtracted->SetTitle("Background-subtracted #pi^{0} Peak From Toy Model Simulation");
		
      //
      // Get normalization factor
      //
      double sameEventCount = 0.0;
      double mixedEventCount = 0.0;
      for(int kBin=1; kBin<nMassBins; kBin++) {
	double binCenter = pi0MassHistogramMixed->GetBinCenter(kBin);
	if(binCenter >= lowFalsePairMassCut && binCenter <= highFalsePairMassCut) {
	  sameEventCount += pi0MassHistogram->GetBinContent(kBin);
	  mixedEventCount += pi0MassHistogramMixed->GetBinContent(kBin);
	}
      }
      cout << "\n For normalization: same event count = " << sameEventCount << ", mixed event count " << mixedEventCount << endl;
		
      if(mixedEventCount > 0.0) {
		
	double mixedEventNormalizedYieldError = 0;
	double sameEventTotal = 0.0;
	double sameEventYield = 0.0;
	double sameEventYieldError = 0.0;
	double mixedEventNormalizedYield = 0.0;
	double normalizationFactorMixed = sameEventCount/mixedEventCount;
	for(int kBin=1; kBin<=nMassBins; kBin++) {
	  double sameEventContent = pi0MassHistogram->GetBinContent(kBin);
	  pi0MassHistogramCopy->SetBinContent(kBin,sameEventContent);
	  double mixedEventContent = pi0MassHistogramMixed->GetBinContent(kBin);
	  double mixedEventFractionalErrorSquared = 0.0;
	  if(mixedEventContent > 0.0)
	    mixedEventFractionalErrorSquared = 1.0/mixedEventContent;
	  double mixedEventNormalizedContent = normalizationFactorMixed*mixedEventContent;
	  pi0MassHistogramMixed->SetBinContent(kBin, mixedEventNormalizedContent);
	  double combinedErrorSquared = sameEventContent + mixedEventNormalizedContent*mixedEventNormalizedContent*mixedEventFractionalErrorSquared;
	  sameEventYieldError += combinedErrorSquared;
	  double binCenter = pi0MassHistogram->GetBinCenter(kBin);
	  double sameEventSubtracted = sameEventContent - mixedEventNormalizedContent;
	  double sameEventSubtractedError = sqrt(combinedErrorSquared);
				
	  if(binCenter >= subtractedStart && binCenter <= subtractedEnd) {
	    sameEventTotal += sameEventContent;
	    sameEventYield += sameEventSubtracted;
	    mixedEventNormalizedYield += mixedEventNormalizedContent;
	    mixedEventNormalizedYieldError += mixedEventNormalizedContent*mixedEventNormalizedContent*mixedEventFractionalErrorSquared;
	  }
	  if(sameEventContent > 0.0) {
	    pi0MassHistogramSubtracted->SetBinContent(kBin, sameEventSubtracted);
	    pi0MassHistogramSubtracted->SetBinError(kBin, sameEventSubtractedError);
	  }
	} // loop over mixed event histogram
	pi0MassHistogramCopy->SetStats(0);
	pi0MassHistogramCopy->SetLineColor(4);
	pi0MassHistogramCopy->SetLineWidth(2);
	pi0MassHistogramCopy->SetMaximum(iMaxHistValue1);
	pi0MassHistogramCopy->Draw();	
	pi0MassHistogramMixed->SetFillColor(kYellow);
	pi0MassHistogramMixed->Draw("same");
	pi0MassHistogramCopy->Draw("same");	
	cout << "\n Same event total = " << sameEventTotal;
	cout << ",  same event yield = " << sameEventYield;
	cout << ",  normalized background yield = " << mixedEventNormalizedYield;
		
	char massBuffer2[200];
	sprintf(massBuffer2, "Mass integration region from %3.2f to %3.2f GeV", subtractedStart, subtractedEnd);
	TLatex *tMB2 = new TLatex(0.014, 0.74*iMaxHistValue1, massBuffer2);
	tMB2->SetTextColor(4);
	tMB2->SetTextSize(0.055);
	tMB2->Draw();
		
	char signalBuffer2[200];
	sprintf(signalBuffer2, "Background subtracted yield = %d #pm %d", int(sameEventYield), int(sqrt(sameEventYieldError)));
	TLatex *tSB42 = new TLatex(0.014, 0.62*iMaxHistValue1, signalBuffer2);
	tSB42->SetTextColor(4);
	tSB42->SetTextSize(0.055);
	tSB42->Draw();
		
	char bgrndBuffer2[200];
	sprintf(bgrndBuffer2, "Background yield = %d #pm %d", int(mixedEventNormalizedYield), int(sqrt(mixedEventNormalizedYieldError)));
	TLatex *tBG42 = new TLatex(0.014, 0.50*iMaxHistValue1, bgrndBuffer2);
	tBG42->SetTextColor(4);
	tBG42->SetTextSize(0.055);
	tBG42->Draw();
		
	c1->cd(3);
	pi0MassHistogramSubtracted->SetStats(111000);
	pi0MassHistogramSubtracted->SetMarkerStyle(20);
	pi0MassHistogramSubtracted->SetMarkerColor(2);
	pi0MassHistogramSubtracted->SetMarkerSize(1.0);
	pi0MassHistogramSubtracted->Fit("gaus", "", "", subtractedStart, subtractedEnd);
	TLine *baseLine = new TLine(0.0, 0.0, maximumPi0MassForHistogram, 0.0);
	baseLine->SetLineColor(kBlack);
	baseLine->SetLineWidth(2);
	baseLine->Draw();

      } // check on mixed event count

 
      //int time = dateTime->GetTime();
      char graphOutputFileName[200];
      sprintf(graphOutputFileName, "pi0MassFit_Run%d_Centrality%d-%d_Pt%3.1f-%3.1f_EtaLimit%4.2f_%d.C", runNumber, lowCent, highCent, lowPtCut, highPtCut, highEtaLimit, date);
      c1->Print(graphOutputFileName);  // C macro
      sprintf(graphOutputFileName, "pi0MassFit_Run%d_Centrality%d-%d_Pt%3.1f-%3.1f_EtaLimit%4.2f_%d.gif", runNumber, lowCent, highCent, lowPtCut, highPtCut, highEtaLimit, date);
      c1->Print(graphOutputFileName);  // gif file
      sprintf(graphOutputFileName, "pi0MassFit_Run%d_Centrality%d-%d_Pt%3.1f-%3.1f_EtaLimit%4.2f_%d.pdf", runNumber, lowCent, highCent, lowPtCut, highPtCut, highEtaLimit, date);
      c1->Print(graphOutputFileName);  // pdf file
      delete dateTime;
			
    } // check on iOption = -10

  } // check on iOption = 10 or -10

  if(writeHistogramFile) {
    TFile *flowPlotsFile;

    int useRunNumber = runNumber;
    if(toyModel)
      useRunNumber = 0;
		
    char outputFileName[200];
    sprintf(outputFileName, "pi0FlowPlots_Run%d_Centrality%d-%d_Pt%3.1f-%3.1f_EtaLimit%4.2f.root", useRunNumber, lowCent, highCent, lowPtCut, highPtCut, highEtaLimit);
    char outputFileTitle[200];
    sprintf(outputFileTitle, "pi0 Flow Plots for Run %d, Centralities %d to %d, pT %3.1f to %3.1f, |eta| < %3.1f", runNumber, lowCent, highCent, lowPtCut, highPtCut, highEtaLimit);
    flowPlotsFile = new TFile(outputFileName, "recreate", outputFileTitle);
		
    pi0MassHistogram->Write();
    pi0MassHistogramMixed->Write();
    pi0MassHistogramRepeated->Write();
    etaMassHistogram->Write();
    etaMassHistogramMixed->Write();
		
    eventAcceptedReactionPlaneAngleHistogram->Write();
    pi0AcceptedReactionPlaneAngleHistogram->Write();
		
    pi0EtaTrueHistogram->Write();
    pi0PhiTrueHistogram->Write();
    pi0PhiRPTrueHistogram->Write();
    pi0PtTrueHistogram->Write();
		
    for(unsigned int kEta=0; kEta<NETABINS; kEta++) {
      for(unsigned int kPt=0; kPt<NPTBINS; kPt++) {
	pi0MassEtaPtHistogramMixed[kEta][kPt]->Write();
	pi0MassEtaPtHistogram[kEta][kPt]->Write();
	for(unsigned int kPhi=0; kPhi<NPHIBINS; kPhi++) {
	  pi0MassEtaPhiPtHistogram[kEta][kPhi][kPt]->Write();
	} // loop over phi bins		
      } // loop over pt bins		
    } // loop over eta bins
		
    flowPlotsFile->Close();
		
    cout << "\n Wrote histograms to output file " << outputFileName;
    cout << endl;
		
  } // check on writing histogram file	

  cout << "\n Macro is exiting " << endl;
  return;

}
