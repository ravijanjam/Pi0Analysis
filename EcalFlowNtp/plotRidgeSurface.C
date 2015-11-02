#include <iostream>

#include <TROOT.h>
#include <TFile.h>
#include <TSystem.h>
#include <TStyle.h>
#include <TNtuple.h>
#include <TCanvas.h>
#include <TH1F.h>
#include <TH2F.h>
#include <TMath.h>
#include <TLatex.h>
#include <TF1.h>

#include <DataFormats/Math/interface/deltaPhi.h>

using namespace std;

void plotRidgeSurface(const int iOption=5,
		      const bool recoRequired = false,
		      const Long64_t maxReadEntries=0,
		      const float lowEtaLimit = -1.4,
		      const float highEtaLimit = +1.4,
		      const bool takeAll = false,
		      const bool takeRandom = true,
		      const bool takeMountain = false,
		      const bool takeAway = false,
		      const bool takeRidge = true,
		      char *fname="ridgePizeroDecay.root") {

  TCanvas *c1 = new TCanvas("c1", "Plotting Pair Events", 200, 10, 700, 500);
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

  TFile *f1 = new TFile(fname);
  if (!f1) {
    cerr << "\n Unable to find NTUPLE file " << fname << endl;
    return;
  }

  TNtuple *ridgeDecay = (TNtuple*)f1->Get("ridgeDecay");
  if(!ridgeDecay) {
    cerr << "\n Unable to find ridgeDecay in NTUPLE file " << fname << endl;
    return;
  }

  //Declaration of leaves types
  Float_t         iEvent;
  Float_t         kPizero;
  Float_t         mesonPt;
  Float_t         mesonEta;
  Float_t         mesonPhi;
  Float_t         mesonEnr;
  Float_t         photn1Pt;
  Float_t         photn1Eta;
  Float_t         photn1Phi;
  Float_t         photn1Loc;
  Float_t         photn1Enr;
  Float_t         photn2Pt;
  Float_t         photn2Eta;
  Float_t         photn2Phi;
  Float_t         photn2Loc;
  Float_t         photn2Enr;
  Float_t         openAngle;
  Float_t         dSeparate;
  Float_t         rndChoice;
  Float_t         canReco;

  // Set branch addresses.
  ridgeDecay->SetBranchAddress("iEvent",&iEvent);
  ridgeDecay->SetBranchAddress("kPizero",&kPizero);
  ridgeDecay->SetBranchAddress("mesonPt",&mesonPt);
  ridgeDecay->SetBranchAddress("mesonEta",&mesonEta);
  ridgeDecay->SetBranchAddress("mesonPhi",&mesonPhi);
  ridgeDecay->SetBranchAddress("mesonEnr",&mesonEnr);
  ridgeDecay->SetBranchAddress("photn1Pt",&photn1Pt);
  ridgeDecay->SetBranchAddress("photn1Eta",&photn1Eta);
  ridgeDecay->SetBranchAddress("photn1Phi",&photn1Phi);
  ridgeDecay->SetBranchAddress("photn1Loc",&photn1Loc);
  ridgeDecay->SetBranchAddress("photn1Enr",&photn1Enr);
  ridgeDecay->SetBranchAddress("photn2Pt",&photn2Pt);
  ridgeDecay->SetBranchAddress("photn2Eta",&photn2Eta);
  ridgeDecay->SetBranchAddress("photn2Phi",&photn2Phi);
  ridgeDecay->SetBranchAddress("photn2Loc",&photn2Loc);
  ridgeDecay->SetBranchAddress("photn2Enr",&photn2Enr);
  ridgeDecay->SetBranchAddress("openAngle",&openAngle);
  ridgeDecay->SetBranchAddress("dSeparate",&dSeparate);
  ridgeDecay->SetBranchAddress("rndChoice",&rndChoice);
  ridgeDecay->SetBranchAddress("canReco",&canReco);

  float lowEtaBin = -3.0;
  float highEtaBin = +3.0;
  float lowPhiBin = -1.0;
  float highPhiBin = 4.0;

  int nBinsX = 40;
  int nBinsY = 40;
  int nBinsOneD = 100;

  TH1F *deltaPhiHistogram = new TH1F("deltaPhiHistogram", "#Delta #phi All Pairs", nBinsOneD, lowPhiBin, highPhiBin);
  if(takeRidge)
    deltaPhiHistogram->SetTitle("#Delta #phi Near-Side Ridge Pairs");
  if(takeMountain)
    deltaPhiHistogram->SetTitle("#Delta #phi Near-Side Mountain Pairs");
  deltaPhiHistogram->SetXTitle("#Delta #phi");
  deltaPhiHistogram->SetYTitle("Counts");

  TH1F *deltaPhiHistogramMixed = new TH1F("deltaPhiHistogramMixed", "Mixed Event #Delta #phi All Pairs", nBinsOneD, lowPhiBin, highPhiBin);
  deltaPhiHistogramMixed->SetXTitle("#Delta #phi");
  deltaPhiHistogramMixed->SetYTitle("Counts");

  TH1F *deltaEtaHistogram = new TH1F("deltaEtaHistogram", "#Delta #eta All Pairs", nBinsOneD, lowEtaBin, highEtaBin);
  if(takeRidge)
    deltaEtaHistogram->SetTitle("#Delta #eta Near-Side Ridge Pairs");
  if(takeMountain)
    deltaEtaHistogram->SetTitle("#Delta #eta Near-Side Mountain Pairs");
  deltaEtaHistogram->SetXTitle("#Delta #eta");
  deltaEtaHistogram->SetYTitle("Counts");

  TH1F *deltaEtaHistogramMixed = new TH1F("deltaEtaHistogramMixed", "Mixed Event #Delta #eta All Pairs", nBinsOneD, lowEtaBin, highEtaBin);
  deltaEtaHistogramMixed->SetXTitle("#Delta #eta");
  deltaEtaHistogramMixed->SetYTitle("Counts");

  TH1F *deltaEtaHistogramNormalized = new TH1F("deltaEtaHistogramNormalized", "Normalized Yield #Delta #eta All Pairs", nBinsOneD, lowEtaBin, highEtaBin);
  if(takeRidge)
    deltaEtaHistogramNormalized->SetTitle("Normalized Yield #Delta #eta Near-Side Ridge Pairs");
  if(takeMountain)
    deltaEtaHistogramNormalized->SetTitle("Normalized Yield #Delta #eta Near-Side Mountain Pairs");
  deltaEtaHistogramNormalized->SetXTitle("#Delta #eta");
  deltaEtaHistogramNormalized->SetYTitle("Arbitrary Units");

  TH2F *deltaEtaDeltaPhi = new TH2F("deltaEtaDeltaPhi", "Angular Correlation All Pairs", nBinsX, lowEtaBin, highEtaBin, nBinsY, lowPhiBin, highPhiBin);
  if(takeRidge)
    deltaEtaDeltaPhi->SetTitle("Angular Correlation of Near-Side Ridge Pairs");
  if(takeMountain)
    deltaEtaDeltaPhi->SetTitle("Angular Correlation of Near-Side Mountain Pairs");

  deltaEtaDeltaPhi->SetXTitle("#Delta #eta");
  deltaEtaDeltaPhi->SetYTitle("#Delta #phi");

  TH2F *deltaEtaDeltaPhiNormalized = new TH2F("deltaEtaDeltaPhiNormalized", "Normalized Angular Correlation All Pairs", nBinsX, lowEtaBin, highEtaBin, nBinsY, lowPhiBin, highPhiBin);
  if(takeRidge)
    deltaEtaDeltaPhiNormalized->SetTitle("Normalized Angular Correlation of Near-Side Ridge Pairs");
  if(takeMountain)
    deltaEtaDeltaPhiNormalized->SetTitle("Normalized Angular Correlation of Near-Side Mountain Pairs");

  deltaEtaDeltaPhiNormalized->SetXTitle("#Delta #eta");
  deltaEtaDeltaPhiNormalized->SetYTitle("#Delta #phi");

  TH2F *deltaEtaDeltaPhiMixed = new TH2F("deltaEtaDeltaPhiMixed", "Mixed Events Angular Correlation All Pairs", nBinsX, lowEtaBin, highEtaBin, nBinsY, lowPhiBin, highPhiBin);
  deltaEtaDeltaPhiMixed->SetXTitle("#Delta #eta");
  deltaEtaDeltaPhiMixed->SetYTitle("#Delta #phi");

  if(recoRequired)
    cout << ",  recoRequired flag is true";
  else
    cout << ",  recoRequired flag is false";
  cout << endl;

  const unsigned int maxPrint = 10;
  unsigned int countPrint = 0;

  Long64_t nEntries = ridgeDecay->GetEntries();
  cout << "\n Entries in  NTUPLE = " << nEntries << endl;

  Long64_t nEntries0 = nEntries/10;

  Long64_t readEntries = nEntries;
  if(maxReadEntries > 0 && maxReadEntries < nEntries) {
    readEntries = maxReadEntries;
    nEntries0 = readEntries/10;
  }
	
  Long64_t readEntriesMinus1 = readEntries - 1;
  cout << "\n Begin NTUPLE scan with iOption = " << iOption << " for " << readEntries << " entries";

  Long64_t iEntry=0;
  while (iEntry<readEntriesMinus1) {
    ridgeDecay->GetEntry(iEntry);

    if(iEntry !=0  && iEntry%nEntries0 == 0)
      cout << "\n At NTUPLE entry " << iEntry;

    //
    // get first pair member
    //
    int kPizero1 = kPizero;
    if(kPizero1 != 0) {
      cerr << "\n Coding error with kPizero1 = " << kPizero1;
      cerr << endl;
      return;
    }
    float piZeroEta1 = mesonEta;
    float piZeroPhi1 = mesonPhi;
    float canReco1 = canReco;
    float rndChoice1 = rndChoice;
    iEntry++;
    //
    // check for second pair member
    //
    ridgeDecay->GetEntry(iEntry);
    int kPizero2 = kPizero;
    if(kPizero2 != 1)
      continue;

    float piZeroEta2 = mesonEta;
    float piZeroPhi2 = mesonPhi;
    float canReco2 = canReco;
    float rndChoice2 = rndChoice;
    if(rndChoice1 != rndChoice2) {
      cerr << "\n Pair does not have the same random choice" << endl;
      return;
    }

    bool takePair = takeAll;
    if(rndChoice == 1 && takeRandom)
      takePair = true;
    if(rndChoice == 2 && takeMountain)
      takePair = true;
    if(rndChoice == 3 && takeAway)
      takePair = true;
    if(rndChoice == 4 && takeRidge)
      takePair = true;

    double etaDelta = piZeroEta2 - piZeroEta1;

    if(takePair &&
       (!recoRequired || (recoRequired && canReco1 > 0.0 && canReco2 > 0.0)) &&
       piZeroEta1 >= lowEtaLimit && piZeroEta1 <= highEtaLimit &&
       piZeroEta2 >= lowEtaLimit && piZeroEta2 <= highEtaLimit &&
       fabs(etaDelta) < highEtaBin) {

      double phiDelta = piZeroPhi2 - piZeroPhi1;
      if(piZeroPhi2 < piZeroPhi1)
	phiDelta = -phiDelta;
			
      if(phiDelta > TMath::Pi())
	phiDelta = TMath::Pi() + TMath::Pi() - phiDelta;

      bool phiMirror1 = false;
      bool phiMirror2 = false;
      double deltaPhiTest = 2.0*TMath::Pi() - phiDelta ;
			
      deltaPhiHistogram->Fill(phiDelta);
      if(phiDelta > 0.0 && phiDelta < 1.0) {
	deltaPhiHistogram->Fill(-phiDelta);
	phiMirror1 = true;
      }
			
      if(deltaPhiTest > TMath::Pi() && deltaPhiTest < 4.0) {
	if(phiMirror1) {
	  cerr << "\n True same: cannot have phiMirror and phiMirror2 both as true";
	  cerr << endl;
	  return;
	}
	deltaPhiHistogram->Fill(deltaPhiTest);
	phiMirror2 = true;
      }

      deltaEtaHistogram->Fill(etaDelta, 0.5);
      deltaEtaHistogram->Fill(-etaDelta, 0.5);
      deltaEtaDeltaPhi->Fill(etaDelta, phiDelta, 0.5);
      deltaEtaDeltaPhi->Fill(-etaDelta, phiDelta, 0.5);
      if(phiMirror1) {
	deltaEtaDeltaPhi->Fill(etaDelta, -phiDelta, 0.5);
	deltaEtaDeltaPhi->Fill(-etaDelta, -phiDelta, 0.5);
      }
      if(phiMirror2) {
	deltaEtaDeltaPhi->Fill(etaDelta, deltaPhiTest, 0.5);
	deltaEtaDeltaPhi->Fill(-etaDelta, deltaPhiTest, 0.5);
      }


    } // check on size of etaDelta

    iEntry++;
    if(iEntry < readEntries) {
      ridgeDecay->GetEntry(iEntry);
      float piZeroEta3 = mesonEta;
      float piZeroPhi3 = mesonPhi;
      float canReco3 = canReco;

      etaDelta = piZeroEta3 - piZeroEta1;
      if((!recoRequired || (recoRequired && canReco1 > 0.0 && canReco3 > 0.0)) &&
	 piZeroEta1 >= lowEtaLimit && piZeroEta1 <= highEtaLimit &&
	 piZeroEta3 >= lowEtaLimit && piZeroEta3 <= highEtaLimit &&
	 fabs(etaDelta) < highEtaBin) {
	
	double phiDelta = piZeroPhi3 - piZeroPhi1;
	if(piZeroPhi3 < piZeroPhi1)
	  phiDelta = -phiDelta;
			
	if(phiDelta > TMath::Pi())
	  phiDelta = TMath::Pi() + TMath::Pi() - phiDelta;

	bool phiMirror1 = false;
	bool phiMirror2 = false;
	double deltaPhiTest = 2.0*TMath::Pi() - phiDelta ;
			
	deltaPhiHistogramMixed->Fill(phiDelta);
	if(phiDelta > 0.0 && phiDelta < 1.0) {
	  deltaPhiHistogramMixed->Fill(-phiDelta);
	  phiMirror1 = true;
	}
			
	if(deltaPhiTest > TMath::Pi() && deltaPhiTest < 4.0) {
	  if(phiMirror1) {
	    cerr << "\n True same: cannot have phiMirror and phiMirror2 both as true";
	    cerr << endl;
	    return;
	  }
	  deltaPhiHistogramMixed->Fill(deltaPhiTest);
	  phiMirror2 = true;
	}
	
	deltaEtaHistogramMixed->Fill(etaDelta, 0.5);
	deltaEtaHistogramMixed->Fill(-etaDelta, 0.5);
	deltaEtaDeltaPhiMixed->Fill(etaDelta, phiDelta, 0.5);
	deltaEtaDeltaPhiMixed->Fill(-etaDelta, phiDelta, 0.5);
	if(phiMirror1) {
	  deltaEtaDeltaPhiMixed->Fill(etaDelta, -phiDelta, 0.5);
	  deltaEtaDeltaPhiMixed->Fill(-etaDelta, -phiDelta, 0.5);
	}
	if(phiMirror2) {
	  deltaEtaDeltaPhiMixed->Fill(etaDelta, deltaPhiTest, 0.5);
	  deltaEtaDeltaPhiMixed->Fill(-etaDelta, deltaPhiTest, 0.5);
	}	
	
	
      } // check on angle limits using first particle

      etaDelta = piZeroEta3 - piZeroEta2;
      if((!recoRequired || (recoRequired && canReco2 > 0.0 && canReco3 > 0.0)) &&
	 piZeroEta2 >= lowEtaLimit && piZeroEta2 <= highEtaLimit &&
	 piZeroEta3 >= lowEtaLimit && piZeroEta3 <= highEtaLimit &&
	 fabs(etaDelta) < highEtaBin) {

	double phiDelta = piZeroPhi2 - piZeroPhi1;
	if(piZeroPhi2 < piZeroPhi1)
	  phiDelta = -phiDelta;
			
	if(phiDelta > TMath::Pi())
	  phiDelta = TMath::Pi() + TMath::Pi() - phiDelta;

	bool phiMirror1 = false;
	bool phiMirror2 = false;
	double deltaPhiTest = 2.0*TMath::Pi() - phiDelta ;
			
	deltaPhiHistogramMixed->Fill(phiDelta);
	if(phiDelta > 0.0 && phiDelta < 1.0) {
	  deltaPhiHistogramMixed->Fill(-phiDelta);
	  phiMirror1 = true;
	}
			
	if(deltaPhiTest > TMath::Pi() && deltaPhiTest < 4.0) {
	  if(phiMirror1) {
	    cerr << "\n True same: cannot have phiMirror and phiMirror2 both as true";
	    cerr << endl;
	    return;
	  }
	  deltaPhiHistogramMixed->Fill(deltaPhiTest);
	  phiMirror2 = true;
	}

	deltaEtaHistogramMixed->Fill(etaDelta, 0.5);
	deltaEtaHistogramMixed->Fill(-etaDelta, 0.5);
	deltaEtaDeltaPhiMixed->Fill(etaDelta, phiDelta, 0.5);
	deltaEtaDeltaPhiMixed->Fill(-etaDelta, phiDelta, 0.5);
	
	if(phiMirror1) {
	  deltaEtaDeltaPhiMixed->Fill(etaDelta, -phiDelta, 0.5);
	  deltaEtaDeltaPhiMixed->Fill(-etaDelta, -phiDelta, 0.5);
	}
	if(phiMirror2) {
	  deltaEtaDeltaPhiMixed->Fill(etaDelta, deltaPhiTest, 0.5);
	  deltaEtaDeltaPhiMixed->Fill(-etaDelta, deltaPhiTest, 0.5);
	}	

      } // check on angle limits using second particle

    } // check on valid new entry

  } // while loop over entries
  cout << "\n Finished NTUPLE scan" << endl;

  int numberSameEvent = deltaEtaDeltaPhi->GetEntries();
  int numberMixedEvent =  deltaEtaDeltaPhiMixed->GetEntries();

  if(numberSameEvent <= 0) {
    cerr << "\n Bad number in same event histogram = " << numberSameEvent << endl;
    return;
  }

  cout << "\n Entries in 2D same event correlation plot = " << numberSameEvent;
  cout << "\n Entries in 2D mixed event correlation plot = " << numberMixedEvent;
  cout << endl;

  float normalizationFactor2D = float(numberMixedEvent)/float(numberSameEvent);
  //
  // Normalized the same event to the mixed event distribution
  //
  for(int iBinX=0; iBinX<nBinsX; iBinX++) {
    for(int iBinY=0; iBinY<nBinsY; iBinY++) {
      float sameEventContent = deltaEtaDeltaPhi->GetBinContent(iBinX, iBinY);
      float mixedEventContent = deltaEtaDeltaPhiMixed->GetBinContent(iBinX, iBinY);
      if(sameEventContent > 0.0 && mixedEventContent <= 0.0) {
	cerr << "\n sameEventContent = " << sameEventContent;
	cerr << ",  mixedEventContent = " << mixedEventContent;
	cerr << ",  bin = (" << iBinX << ", " << iBinY << ")" << endl;
	cerr << endl;
	continue;
      }
      if(sameEventContent == 0.0 && mixedEventContent == 0.0) {
	deltaEtaDeltaPhiNormalized->SetBinContent(iBinX, iBinY, 0.0);
      }
      if(mixedEventContent > 0.0) {
	float normalizedYield = normalizationFactor2D*sameEventContent/mixedEventContent;
	deltaEtaDeltaPhiNormalized->SetBinContent(iBinX, iBinY, normalizedYield);
	if(countPrint < maxPrint) {
	  countPrint++;
	  cout << "\n sameEventContent = " << sameEventContent;
	  cout << ",  mixedEventContent = " << mixedEventContent;
	  cout << ",  normalizedYield = " << normalizedYield;
	  if(countPrint == maxPrint)
	    cout << endl;

	} // check on countPrint

      } // check on mixed event yield

    } // loop over y bins

  } // loop over x bins

  float singleEtaSame = deltaEtaHistogram->GetEntries();
  float singleEtaMixed =  deltaEtaHistogramMixed->GetEntries();
  if(singleEtaSame > 0.0) {
    float normalizationFactorOneD = singleEtaMixed/singleEtaSame;
    for(int kBin=0; kBin<nBinsOneD; kBin++) {
      float etaHalfValue = 0.5*deltaEtaHistogram->GetBinCenter(kBin);
      if(etaHalfValue < lowEtaLimit || etaHalfValue > highEtaLimit)
	continue;

      float countMixed = deltaEtaHistogramMixed->GetBinContent(kBin);
      float countSame = deltaEtaHistogram->GetBinContent(kBin);
      if(countMixed > 0.0)
	deltaEtaHistogramNormalized->SetBinContent(kBin, normalizationFactorOneD*countSame/countMixed);
      if(countMixed == 0.0 && countSame == 0.0)
	deltaEtaHistogramNormalized->SetBinContent(kBin, 1.0);
      if(countMixed <= 0.0 && countSame > 0.0) {
        cerr << "\n OneD error, mixed event yield = " << countMixed;
	cerr << ",  same event yield = " << countSame;
	cerr << endl;
	return;
      } // safety check
    } // loop over eta bins
  }

  if(iOption == 1)
    deltaPhiHistogram->Draw();

  if(iOption == 2) {
    deltaEtaDeltaPhi->Draw("surf1");
    cout << "\n Entries in 2D correlation plot = " <<  deltaEtaDeltaPhi->GetEntries();
    cout << endl;
  }

  if(iOption == 3) {
    deltaEtaDeltaPhiMixed->Draw("surf1");
    cout << "\n Entries in 2D mixed event correlation plot = " <<  deltaEtaDeltaPhiMixed->GetEntries();
    cout << endl;
  }

  if(iOption == 4) {
    deltaEtaDeltaPhiNormalized->SetStats(0);
    deltaEtaDeltaPhiNormalized->SetMinimum(0.5);
    deltaEtaDeltaPhiNormalized->SetMaximum(2.5);		
    deltaEtaDeltaPhiNormalized->Draw("surf1");
  } // check on iOption = 4

  if(iOption == 5) { // One dimensional plots

    c1->Divide(2,2);

    c1->cd(1);
    deltaPhiHistogram->SetStats(0);
    deltaPhiHistogram->Draw();

    c1->cd(2);
    deltaEtaHistogram->SetStats(0);
    deltaEtaHistogram->Draw();

    c1->cd(3);
    deltaEtaHistogramMixed->SetStats(0);
    deltaEtaHistogramMixed->Draw();

    c1->cd(4);
    deltaEtaHistogramNormalized->SetStats(0);
    deltaEtaHistogramNormalized->Draw();

  } // iOption = 5, One dimensional plots

  TFile *ridgePlotsFile;

  if(recoRequired)
    ridgePlotsFile = new TFile("ridgePlotsRecoRequired.root", "recreate", "Ridge Plots With Reco Required");
  else
    ridgePlotsFile = new TFile("ridgePlotsRecoNotRequired.root", "recreate", "Ridge Plots With Reco Not Required");

  deltaPhiHistogram->Write();
  deltaEtaHistogram->Write();
  deltaPhiHistogramMixed->Write();
  deltaEtaHistogramMixed->Write();
  deltaEtaHistogramNormalized->Write();
  deltaEtaDeltaPhi->Write();
  deltaEtaDeltaPhiMixed->Write();
  deltaEtaDeltaPhiNormalized->Write();

  ridgePlotsFile->Close();

  return;

}
