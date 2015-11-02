#ifndef PI0EFFICIENCYPLOT
#define PI0EFFICIENCYPLOT
#include  <iostream>
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
#include <TRandom3.h>
#include <TLatex.h>
#include <TF1.h>
#include <TMultiGraph.h>
#include <TGraphErrors.h>
#include <TAxis.h>
#include <TLine.h>
#include <TDatime.h>
#endif

//
// ROOT macro for checking pi0 efficiency root file
// The macro assumes that the pi0 efficiency root file has the name "efficiencyPi0.root"
// The root file contains three two-D histograms in (pT, eta)
// The three histograms are the generator yields, the reconstructed yields, and the reco/gen efficiency ratio
// The pT bins and eta bin boundaries are in the arrays below, along with the numbers of bins in each dimension
//

void pi0EfficiencyPlot() {

  TFile f("efficiencyPi0.root");
  if(f.IsZombie()) {
   cerr << "\n\n Unable to open efficiencyPi0.root input file" << endl << endl;
   return;
  }
  f.Close();

  TFile *efficiencyPi0File = new TFile("efficiencyPi0.root", "READ");

  TH2D *efficiencyPi0Yields = (TH2D*)efficiencyPi0File->Get("efficiencyPi0Yields");
  if(!efficiencyPi0Yields) {
    cerr << "\n Unable to find efficiencyPi0Yields histogram in input file" << endl << endl;
    return;
  }


  efficiencyPi0Yields->Draw("surf3");

  TH2D *generatorPi0Yields = (TH2D*)efficiencyPi0File->Get("generatorPi0Yields");
  if(!generatorPi0Yields) {
    cerr << "\n Unable to find generatorPi0Yields histogram in input file" << endl << endl;
    return;
  }

  TH2D *reconstructedPi0Yields = (TH2D*)efficiencyPi0File->Get("reconstructedPi0Yields");
  if(!reconstructedPi0Yields) {
    cerr << "\n Unable to find reconstructedPi0Yields histogram in input file" << endl << endl;
    return;
  }

  const int nEtaBins = 10;
  const int nPtBins = 15;

  float etabinsy[11]  = { -1.5, -1.2, -0.9, -0.6, -0.3, 0, 0.3, 0.6, 0.9, 1.2, 1.5};
  float ptbinsx[16]  = { 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.2, 1.4, 1.6, 1.8, 2.0, 2.4, 2.8, 3.2, 4.0, 5.0}; 

  for(int kEtaBin=0; kEtaBin<nEtaBins; kEtaBin++) {
    cout << "\n Efficiencies for " << etabinsy[kEtaBin] << " < eta < " << etabinsy[kEtaBin+1];
    float etaMean = 0.5*(etabinsy[kEtaBin] + etabinsy[kEtaBin+1]);

    for(int kPtBin=0; kPtBin<nPtBins; kPtBin++) {
      cout << "\n " << kPtBin+1 << ") " << ptbinsx[kPtBin] << " < pT < " << ptbinsx[kPtBin+1];
      float ptMean = 0.5*(ptbinsx[kPtBin] + ptbinsx[kPtBin+1]);

      double efficiency = efficiencyPi0Yields->GetBinContent(efficiencyPi0Yields->FindBin(ptMean, etaMean));
      cout << "   efficiency = " << efficiency; 

      double genYield = generatorPi0Yields->GetBinContent(generatorPi0Yields->FindBin(ptMean, etaMean));
      double recoYield = reconstructedPi0Yields->GetBinContent(reconstructedPi0Yields->FindBin(ptMean, etaMean));
      double error = 0.0;
      if(genYield > 0.0 && recoYield > 0.0) {
	error = efficiency*sqrt(1.0/genYield + 1.0/recoYield);
      }
      cout << " +/- " << error;
      cout << ",   (generated = " << int(genYield) << ", reconstructed = " << int(recoYield) << ")";

    } // loop over pT bins
    cout << endl;

  } // loop over eta bins
  cout << endl;

  return;
}
