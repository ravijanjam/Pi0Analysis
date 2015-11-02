//
// Macro  closurePlot.C
// Last revision May 4, 14:50
//
// Plotting closure v2 results for HIN-14-011
//

#include <iostream>
#include <fstream>
#include <math.h>
#include <TROOT.h>
#include <TFile.h>
#include <TSystem.h>
#include <TStyle.h>
#include <TNtuple.h>
#include <TCanvas.h>
#include <TRandom.h>
#include <TH1F.h>
#include <TH2F.h>
#include <TMath.h>
#include <TRandom1.h>
#include <TLatex.h>
#include <TF1.h>
#include <TLine.h>
#include <TLegend.h>
#include <TMultiGraph.h>
#include <TGraphErrors.h>
#include <TAxis.h>
#include <TDatime.h>

void closurePlot(const int iOption = 0) {
 
  TCanvas *c1 = new TCanvas("c1", "Plotting EPOS Closure results", 200, 10, 700, 500);
  //
  // Use ROOT's gStyle function to set up plot options
  //
  gStyle->SetOptStat(1110);
  gStyle->SetStatTextColor(kBlue);
  gStyle->SetFuncColor(kBlue);
  gStyle->SetFuncWidth(2);
  gStyle->SetOptFit(1111);
  gStyle->SetFitFormat("6.5g");
  gStyle->SetPalette(1);
	
  c1->SetFillColor(kWhite);

  cout << "\n Closure plot with iOption choice = " << iOption;
  cout << "\n Date of last source code change: May 4, 2014";
  cout << endl;

  const int nPtBins = 8;
  const float xDataRecoObs[8] =      {0.85, 1.27, 1.75, 2.25, 2.75, 3.23, 3.75, 4.5};
  const float xDataRecoCorr[8] =     {0.85, 1.23, 1.75, 2.25, 2.75, 3.23, 3.75, 4.5};
  const float xError[8] =     {0., 0., 0, 0., 0., 0., 0., 0.};

  const float simRecoObsResults[8] = {0.384, 0.503, 0.578, 0.587, 0.606, 0.609, 0.727, 0.407};
  const float simRecoObsErrors[8] =  {0.002, 0.003, 0.007, 0.013, 0.021, 0.035, 0.052, 0.068};

  const float simRecoCorrResults[8] = {0.448, 0.498, 0.532, 0.523, 0.555, 0.566, 0.748, 0.280};
  const float simRecoCorrErrors[8] =  {0.030, 0.025, 0.020, 0.015, 0.060, 0.090, 0.140, 0.200};

  const float xDataGen[8] =      {0.87, 1.27, 1.75, 2.25, 2.75, 3.27, 3.75, 4.5};
  float generatorResults[8] = {0.343, 0.436, 0.509, 0.540, 0.561, 0.569, 0.567, 0.558};
  float generatorErrors[8] =  {0.002, 0.002, 0.003, 0.005, 0.007, 0.010, 0.014, 0.016};

  TGraphErrors *graphGeneratorResults = new TGraphErrors(nPtBins, xDataGen, generatorResults, xError, generatorErrors);
  graphGeneratorResults->SetTitle("Closure Test Results for the v_{2} of the #pi^{0}");
  graphGeneratorResults->SetMarkerColor(2);
  graphGeneratorResults->SetMarkerStyle(21);
  graphGeneratorResults->SetMarkerSize(1.00);
  graphGeneratorResults->SetMinimum(0.0);
  graphGeneratorResults->SetMaximum(1.1);
  (graphGeneratorResults->GetXaxis())->SetTitle("pT (GeV/c)");
  (graphGeneratorResults->GetYaxis())->SetTitle("v_{2}(#pi^{0})");

  TGraphErrors *graphSimRecoObsResults = new TGraphErrors(nPtBins, xDataRecoObs, simRecoObsResults, xError, simRecoObsErrors);
  graphSimRecoObsResults->SetTitle("Closure Test Results for the v_{2} of the #pi^{0}");
  graphSimRecoObsResults->SetMarkerColor(4);
  graphSimRecoObsResults->SetMarkerStyle(22);
  graphSimRecoObsResults->SetMarkerSize(1.00);
  graphSimRecoObsResults->SetMinimum(0.0);
  graphSimRecoObsResults->SetMaximum(1.1);
  (graphSimRecoObsResults->GetXaxis())->SetTitle("p_{T}(GeV/c)");
  (graphSimRecoObsResults->GetYaxis())->SetTitle("v_{2}(#pi^{0})");

  (graphSimRecoObsResults->GetXaxis())->SetLabelSize(0.045);
  (graphSimRecoObsResults->GetXaxis())->SetTitleOffset(1.0);
  (graphSimRecoObsResults->GetXaxis())->SetTitleSize(0.045);
  (graphSimRecoObsResults->GetXaxis())->CenterTitle();
  (graphSimRecoObsResults->GetYaxis())->SetLabelSize(0.045);
  (graphSimRecoObsResults->GetYaxis())->SetTitleOffset(1.0);
  (graphSimRecoObsResults->GetYaxis())->SetTitleSize(0.045);
  (graphSimRecoObsResults->GetYaxis())->CenterTitle();

  TGraphErrors *graphSimRecoCorrResults = new TGraphErrors(8, xDataRecoCorr, simRecoCorrResults, xError, simRecoCorrErrors);
  graphSimRecoCorrResults->SetTitle("Closure Test Results for the v_{2} of the #pi^{0}");
  graphSimRecoCorrResults->SetMarkerColor(kMagenta);
  graphSimRecoCorrResults->SetMarkerStyle(20);
  graphSimRecoCorrResults->SetMarkerSize(1.00);
  graphSimRecoCorrResults->SetMinimum(0.0);
  graphSimRecoCorrResults->SetMaximum(1.1);
  (graphSimRecoCorrResults->GetXaxis())->SetTitle("p_{T}(GeV/c)");
  (graphSimRecoCorrResults->GetYaxis())->SetTitle("v_{2}(#pi^{0})");

  (graphSimRecoCorrResults->GetXaxis())->SetLabelSize(0.045);
  (graphSimRecoCorrResults->GetXaxis())->SetTitleOffset(1.0);
  (graphSimRecoCorrResults->GetXaxis())->SetTitleSize(0.045);
  (graphSimRecoCorrResults->GetXaxis())->CenterTitle();
  (graphSimRecoCorrResults->GetYaxis())->SetLabelSize(0.045);
  (graphSimRecoCorrResults->GetYaxis())->SetTitleOffset(1.0);
  (graphSimRecoCorrResults->GetYaxis())->SetTitleSize(0.045);
  (graphSimRecoCorrResults->GetYaxis())->CenterTitle();
			
  graphSimRecoObsResults->Draw("AP");
  graphGeneratorResults->Draw("P");
  graphSimRecoCorrResults->Draw("P");

  char *runLabelText1 = new char[200];
  sprintf(runLabelText1, "Sampled 60,107 EPOS Events");
  TLatex *runLabel1 = new TLatex(0.75, 1.04, runLabelText1);
  runLabel1->SetTextColor(1);
  runLabel1->SetTextSize(0.035);
  runLabel1->Draw();

  char *runLabelText2 = new char[200];
  sprintf(runLabelText2, "%d < NHITrack < %d and  %d < Z < %d cm", 120, 260, -15, 15);            
  TLatex *runLabel2 = new TLatex(0.75, 0.94, runLabelText2);
  runLabel2->SetTextColor(1);
  runLabel2->SetTextSize(0.035);
  runLabel2->Draw();

  TLatex *runLabel3 = new TLatex(0.75, 0.85, "v_{2}^{Obs} for EPOS-Reconstructed");
  runLabel3->SetTextColor(4);
  runLabel3->SetTextSize(0.035);
  runLabel3->Draw();

  TLatex *runLabel4 = new TLatex(0.75, 0.76, "v_{2} for EPOS-Generator");
  runLabel4->SetTextColor(2);
  runLabel4->SetTextSize(0.035);
  runLabel4->Draw();
  c1->SetGrid();

  TLatex *runLabel5 = new TLatex(0.75, 0.67, "v_{2}^{Sig} for EPOS-Reconstructed");
  runLabel5->SetTextColor(kMagenta);
  runLabel5->SetTextSize(0.035);
  runLabel5->Draw();
  c1->SetGrid();

  return;

}
