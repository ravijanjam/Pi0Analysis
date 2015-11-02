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
#include <TGraphErrors.h>
#include <TLine.h>

#include <DataFormats/Math/interface/deltaPhi.h>

using namespace std;

// v2 fit function for single particles
Double_t v2SinglesFit(Double_t *x, Double_t *par) {
  return par[0]*(1.0 + 2.0*par[1]*cos(2.0*x[0]));
}

// v2 pT dependence

Double_t v2Pt(Double_t x) {
  
  return (pow(x/2.6, 3.2)/(1.0+pow(x/2.1, 3.2)))*(0.00005 + pow(1.0/x, 0.8));

}

Double_t pTEfficiency(Double_t x) {

  // return 0.254868 + 0.3874/x - 0.95576/(x*x);  for 0.33 to 0.67 eta 

  if(x > 0.0)
    return 0.45209 - 0.28005/x - 0.081905/(x*x);
  else
    return 0.0;

}

void toyV2Efficiency(const int iOption=0,
		     const unsigned int numberParticles=100,
		     const bool uniformPt=true,
		     const bool realEfficiency=true,
		     const bool lowEtaRange=true,
		     const bool rescalePt=false,
		     const double rescalePtFactor=1.08,
		     const bool uniformV2=false,
		     const double v2Fixed=0.15,
		     const double rescaleV2Factor=1.00) {

  TDatime *dateTime = new TDatime;
  dateTime->Set();     // set to system date/time
  int date = dateTime->GetDate();
  cout << "\n Date " << date << endl;

  /*
  cout << "\n For pT = 1.781 GeV/c, v2 = " << v2Pt(1.781);
  cout << "\n For pT = 1.800 GeV/c, v2 = " << v2Pt(1.80);
  cout << "\n For pT = 1.813 GeV/c, v2 = " << v2Pt(1.813);
  cout << endl;
  return;
  */

  const unsigned int NPTBINS = 6;
  //
  // Complete pT range for 6 pT bins, as in paper
  //
  const float lowPtBin[NPTBINS] =  {1.6, 2.0, 2.5, 3.0, 4.0, 6.0};
  const float highPtBin[NPTBINS] = {2.0, 2.5, 3.0, 4.0, 6.0, 8.0};

  //
  // Evenly spaced range for 6 pT bins, to check embedding
  //
  // const float lowPtBin[NPTBINS] =  {1.6, 2.5, 3.4, 4.3, 5.2, 6.1};
  // const float highPtBin[NPTBINS] = {2.5, 3.4, 4.3, 5.2, 6.1, 7.0};

  const float minimumPt = 1.0;
  const float maximumPt = highPtBin[NPTBINS - 1] + 1.0;
  float deltaPt = maximumPt - minimumPt;
  //
  // pT distribution from 1.0 to 10.0 GeV/c
  //	f(pT) = pT*exp(-pT/0.5)
  //

  char ptFunction[200];
  sprintf(ptFunction, "50000*x*exp(-x/0.5)"); 
  TF1 *ptF = new TF1("ptF", ptFunction, minimumPt, maximumPt);
	
  char eFunction[200];
  if(lowEtaRange)
    sprintf(eFunction, "0.45209 - 0.28005/x - 0.081905/(x*x)"); 
    else
      sprintf(eFunction, "0.254868 + 0.3874/x - 0.95576/(x*x)"); 
  TF1 *eF = new TF1("eF", eFunction, minimumPt, maximumPt);
	
  const unsigned int NETABINS = 1;
  const float lowEtaBin[NETABINS] =  {0.00};
  const float highEtaBin[NETABINS] = {0.80};

  const unsigned int NPHIBINS = 6;
  const float lowPhiBin6[6] =  {0.0,              TMath::Pi()/12.0, TMath::Pi()/6.0, TMath::Pi()/4.0, TMath::Pi()/3.0,      5.0*TMath::Pi()/12.0};
  const float highPhiBin6[6] = {TMath::Pi()/12.0, TMath::Pi()/6.0,  TMath::Pi()/4.0, TMath::Pi()/3.0, 5.0*TMath::Pi()/12.0, TMath::Pi()/2.0};

  const float lowPhiBin9[9] =  {0.0,                 TMath::Pi()/9.0,     2.0*TMath::Pi()/9.0, TMath::Pi()/3.0,     4.0*TMath::Pi()/9.0, 5.0*TMath::Pi()/9.0, 
				2.0*TMath::Pi()/3.0, 7.0*TMath::Pi()/9.0, 8.0*TMath::Pi()/9.0};
  const float highPhiBin9[9] = {TMath::Pi()/9.0,     2.0*TMath::Pi()/9.0, TMath::Pi()/3.0,     4.0*TMath::Pi()/9.0, 5.0*TMath::Pi()/9.0, 2.0*TMath::Pi()/3.0,
				7.0*TMath::Pi()/9.0, 8.0*TMath::Pi()/9.0, TMath::Pi()};

  float lowPhiBin[NPHIBINS];
  float highPhiBin[NPHIBINS];
  for(unsigned int iPhi=0; iPhi<NPHIBINS; iPhi++) {
    if(NPHIBINS == 6) {
      lowPhiBin[iPhi] =  lowPhiBin6[iPhi];
      highPhiBin[iPhi] =  highPhiBin6[iPhi];
    }
    else {
      lowPhiBin[iPhi] =  lowPhiBin9[iPhi];
      highPhiBin[iPhi] =  highPhiBin9[iPhi];
    }
  } // initialize the phi bin limits, according to the size of NPHIBINS (6 or 9)

  double pi0GeneratedEtaPhiPtHistogramYield[NETABINS][NPHIBINS][NPTBINS];
  double pi0ReconstructedEtaPhiPtHistogramYield[NETABINS][NPHIBINS][NPTBINS];

  double pi0GeneratedEtaPhiPtHistogramPt[NETABINS][NPTBINS];
  double pi0GeneratedEtaPhiPtHistogramV2[NETABINS][NPTBINS];
  double pi0GeneratedEtaPhiPtHistogramV2Sum[NETABINS][NPTBINS];

  double pi0ReconstructedEtaPhiPtHistogramPt[NETABINS][NPTBINS];
  double pi0ReconstructedEtaPhiPtHistogramV2[NETABINS][NPTBINS];
  double pi0ReconstructedEtaPhiPtHistogramV2Sum[NETABINS][NPTBINS];

  for(unsigned int kEta=0; kEta<NETABINS; kEta++) {
    for(unsigned int kPt=0; kPt<NPTBINS; kPt++) {

      pi0GeneratedEtaPhiPtHistogramV2Sum[kEta][kPt] = 0.0;
      pi0GeneratedEtaPhiPtHistogramV2[kEta][kPt] = 0.0;
      pi0GeneratedEtaPhiPtHistogramPt[kEta][kPt] = 0.0;

      pi0ReconstructedEtaPhiPtHistogramV2Sum[kEta][kPt] = 0.0;
      pi0ReconstructedEtaPhiPtHistogramV2[kEta][kPt] = 0.0;
      pi0ReconstructedEtaPhiPtHistogramPt[kEta][kPt] = 0.0;

      for(unsigned int kPhi=0; kPhi<NPHIBINS; kPhi++) {

	pi0GeneratedEtaPhiPtHistogramYield[kEta][kPhi][kPt] = 0.0;

	pi0ReconstructedEtaPhiPtHistogramYield[kEta][kPhi][kPt] = 0.0;

      } // loop over phi bins

    } // loop over pT bins

  } // loop over eta bins

  const float highEtaBin2 = 0.8;
  const float lowEtaBin2 = -0.8;

  //
  // Single particle range in eta will be half the maximum for deltaEta
  //
  const float diffEta = 0.5*(highEtaBin2 - lowEtaBin2);

  //
  // Random number generator object
  //
  TRandom1 *particleKinematics = new TRandom1();
  particleKinematics->SetSeed(1);
		
  bool debugPrint = false;
  unsigned int totalGeneratorAccepted = 0;
  unsigned int numberParticles10 = numberParticles/10;

  unsigned int nPtHistBins = 200;
  TH1D *generatedPt = new TH1D("generatedPt", "Generated #pi^{0} (blue), and reconstructed (red)", nPtHistBins, minimumPt, maximumPt);
  TH1D *reconstructedPt = new TH1D("reconstructedPt", "Reconstructed #pi^{0}", nPtHistBins, minimumPt, maximumPt);
  TH1D *efficiencyPt = new TH1D("efficiencyPt", "Efficiency for reconstructed #pi^{0}", nPtHistBins, minimumPt, maximumPt);

  generatedPt->SetXTitle("Transverse momentum p_{T} (GeV/c)");
  reconstructedPt->SetTitle("Transverse momentum p_{T} (GeV/c)");
  efficiencyPt->SetXTitle("Transverse momentum p_{T} (GeV/c)");

  generatedPt->SetYTitle("Yield");
  reconstructedPt->SetYTitle("Yield");
  efficiencyPt->SetYTitle("Efficiency");

  generatedPt->SetLineColor(4);
  reconstructedPt->SetLineColor(2);
  efficiencyPt->SetLineColor(kMagenta);
	
  const unsigned int nV2HistBins = nPtHistBins;
  double minimumV2 = 0.0;
  double maximumV2 = 0.25*rescaleV2Factor;
  TH2D *v2PtHist = new TH2D("v2PtHist", "v_{2} vs p_{T}, according to a parameterization", nPtHistBins, minimumPt, maximumPt, nV2HistBins, minimumV2, maximumV2);
  v2PtHist->SetXTitle("Transverse momentum p_{T} (GeV/c)");
  v2PtHist->SetYTitle("v_{2}");
										
  for(unsigned int kParticle=0; kParticle<numberParticles; kParticle++) {

    if(kParticle > 0 && kParticle%numberParticles10 == 0) {
      cout << "\n At particle " << kParticle;
    }
	
    //
    // Loop over particles per event
    //
    double particleEta = lowEtaBin2 + diffEta*particleKinematics->Rndm();
    //
    // Generate pT value
    //
    double pTValue = 0.0;
    if(uniformPt) {
      pTValue = minimumPt + deltaPt*particleKinematics->Rndm();
    }
    else {
      pTValue = ptF->GetRandom();
    }
		
    double v2Factor = v2Pt(pTValue);
    if(uniformV2)
      v2Factor = v2Fixed;
		
    v2Factor *= rescaleV2Factor;

    v2PtHist->Fill(pTValue, v2Factor);
		
    //
    // Function to provide azimuthal angles according to a v2 distribution
    //
    char flowFunction[200];
    sprintf(flowFunction, "1.0 + %4.2f*2.0*cos(2.0*x)", v2Factor);
    TF1 *v2Flow = new TF1("v2Flow", flowFunction, 0.0, TMath::Pi()/2.0);
    double phiValue = v2Flow->GetRandom();

    unsigned int kReactionPlaneIndex = NPHIBINS;
    for(unsigned int kPhi=0; kPhi<NPHIBINS; kPhi++) {
      if(phiValue >= lowPhiBin[kPhi] && phiValue < highPhiBin[kPhi]) {
	kReactionPlaneIndex = kPhi;
	break;
      }
    } // check reaction plane index

    unsigned int kPtGeneratedIndex = NPTBINS;
    for(unsigned int kPt=0; kPt<NPTBINS; kPt++) {
      if(pTValue >= lowPtBin[kPt] && pTValue < highPtBin[kPt]) {
	kPtGeneratedIndex = kPt;
	break;
      }
    } // check pT generated index

    if(debugPrint && kPtGeneratedIndex == NPTBINS) {
      cout << "\n Skipping kPtGeneratedIndex " << kPtGeneratedIndex << " with pTValue " << pTValue << endl;
    } // safety check

    if(debugPrint) {
      cout << "\n pTValue " << pTValue;
      cout << ",  v2Factor " << v2Factor;
      cout << ",  phiValue " << phiValue;
      cout << ",  etaParticle " << particleEta;
      cout << ",  phiIndex " << kReactionPlaneIndex;
      cout << ",  pTIndex " << kPtGeneratedIndex;

      cout << endl << endl;

      return;

    }

    unsigned int kPtReconstructedIndex = kPtGeneratedIndex;
    float pTReco = pTValue;
    if(rescalePt) {
      kPtReconstructedIndex = NPTBINS;
      pTReco = rescalePtFactor*pTValue;
      for(unsigned int kPt=0; kPt<NPTBINS; kPt++) {
	if(pTReco >= lowPtBin[kPt] && pTReco < highPtBin[kPt]) {
	  kPtReconstructedIndex = kPt;
	  break;
	}
      } // check pT reconstructed index
    } // check for pT reconstructed change

    generatedPt->Fill(pTValue);

    double efficiency = 1.0;
    if(realEfficiency)
      efficiency = pTEfficiency(pTReco);

    bool recoPossible = false;
    if(efficiency > particleKinematics->Rndm())
      recoPossible = true;

    if(recoPossible)
      reconstructedPt->Fill(pTReco);

    if(kReactionPlaneIndex < NPHIBINS) {
      if(kPtGeneratedIndex < NPTBINS) {

	pi0GeneratedEtaPhiPtHistogramYield[0][kReactionPlaneIndex][kPtGeneratedIndex] += 1.0;
	pi0GeneratedEtaPhiPtHistogramV2[0][kPtGeneratedIndex] += v2Factor;
	pi0GeneratedEtaPhiPtHistogramPt[0][kPtGeneratedIndex] += pTValue;
	pi0GeneratedEtaPhiPtHistogramV2Sum[0][kPtGeneratedIndex] += 1.0;

	totalGeneratorAccepted++;
      }
      if(kPtReconstructedIndex < NPTBINS) {	
	if(recoPossible) {
	  pi0ReconstructedEtaPhiPtHistogramYield[0][kReactionPlaneIndex][kPtReconstructedIndex] += 1.0;
	  pi0ReconstructedEtaPhiPtHistogramV2[0][kPtReconstructedIndex] += v2Factor;
	  pi0ReconstructedEtaPhiPtHistogramPt[0][kPtReconstructedIndex] += pTReco;
	  pi0ReconstructedEtaPhiPtHistogramV2Sum[0][kPtReconstructedIndex] += 1.0;

	} // check efficiency at this pT
      } // check for valid reconstructed pT bin
    } // check reaction plane index

    delete v2Flow;

  } // loop over particles

  cout << "\n\n Total generator accepted " <<  totalGeneratorAccepted << endl << endl;

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

  if(iOption == 0) {
    c1->Divide(1,3);

    c1->cd(1);
    if(uniformPt)
      generatedPt->SetMinimum(0.0);
    generatedPt->Draw();
    reconstructedPt->Draw("same");
    if(!uniformPt)
      (c1->cd(1))->SetLogy();
		
    (c1->cd(1))->SetGridx();
    (c1->cd(1))->SetGridy();

    c1->cd(2);
    for(unsigned int kPt=0; kPt<nPtHistBins; kPt++) {
      double generatedYield = generatedPt->GetBinContent(kPt);
      double reconstructedYield = reconstructedPt->GetBinContent(kPt);
      if(generatedYield > 0.0 && reconstructedYield > 4.0) {
	double efficiency = reconstructedYield/generatedYield;
	double error = 1.0/generatedYield;
	if(reconstructedYield > 0.0)
	  error += 1.0/reconstructedYield;

	efficiencyPt->SetBinContent(kPt, efficiency);
	efficiencyPt->SetBinError(kPt, sqrt(error)*efficiency);	
	
      } // check for non-zero counts
    } // loop over bins

    efficiencyPt->SetStats(0);
    if(realEfficiency)
      efficiencyPt->SetMaximum(0.5);
    else
      efficiencyPt->SetMaximum(1.5);

    if(lowEtaRange)
       efficiencyPt->SetMaximum(0.6);

    efficiencyPt->SetMinimum(0.0);
    efficiencyPt->SetMarkerStyle(20);
    efficiencyPt->SetMarkerColor(kMagenta);
    efficiencyPt->SetMarkerSize(0.5);
    efficiencyPt->Draw();
		
    if(realEfficiency) {
      eF->SetLineColor(3);
      eF->Draw("same");
    }
		
    (c1->cd(2))->SetGridx();
    (c1->cd(2))->SetGridy();
		
    c1->cd(3);
    v2PtHist->SetStats(0);
    v2PtHist->Draw();
    (c1->cd(3))->SetGridx();
    (c1->cd(3))->SetGridy();

    if(realEfficiency) {
      TLine *lowLine = new TLine(lowPtBin[0], 0.0, lowPtBin[0], 0.18*rescaleV2Factor);
      lowLine->SetLineColor(kMagenta);
      lowLine->SetLineWidth(2);
      lowLine->SetLineStyle(2);
      lowLine->Draw();

      TLine *highLine = new TLine(highPtBin[0], 0.0, highPtBin[0], 0.18*rescaleV2Factor);
      highLine->SetLineColor(kMagenta);
      highLine->SetLineWidth(2);
      highLine->SetLineStyle(2);
      highLine->Draw();

      if(pi0GeneratedEtaPhiPtHistogramV2Sum[0][0] > 0.0 && pi0ReconstructedEtaPhiPtHistogramV2Sum[0][0] ) {
	double averageV2Gen = pi0GeneratedEtaPhiPtHistogramV2[0][0]/pi0GeneratedEtaPhiPtHistogramV2Sum[0][0];
	double averagePtGen = pi0GeneratedEtaPhiPtHistogramPt[0][0]/pi0GeneratedEtaPhiPtHistogramV2Sum[0][0];

	double averageV2Reco = pi0ReconstructedEtaPhiPtHistogramV2[0][0]/pi0ReconstructedEtaPhiPtHistogramV2Sum[0][0];
	double averagePtReco = pi0ReconstructedEtaPhiPtHistogramPt[0][0]/pi0ReconstructedEtaPhiPtHistogramV2Sum[0][0];

	char v2GenBuffer[200];
	sprintf(v2GenBuffer, "For lowest p_{T} bin: <v_{2}> = %4.3f, weighted by generator p_{T} distribution; <p_{T}> = %4.3f", averageV2Gen, averagePtGen);
	TLatex *v2Gen = new TLatex(1.8, 0.23*rescaleV2Factor, v2GenBuffer);
	v2Gen->SetTextColor(4);
	v2Gen->SetTextSize(0.060);
	v2Gen->Draw();

	char v2RecoBuffer[200];
	sprintf(v2RecoBuffer, "For lowest p_{T} bin: <v_{2}> = %4.3f, weighted by reconstructed p_{T} distribution; <p_{T}> = %4.3f", averageV2Reco, averagePtReco);
	TLatex *v2Reco = new TLatex(1.8, 0.21*rescaleV2Factor, v2RecoBuffer);
	v2Reco->SetTextColor(4);
	v2Reco->SetTextSize(0.060);
	v2Reco->Draw();

	char v2RescaleBuffer[200];
	if(rescalePt)
	  sprintf(v2RescaleBuffer, "Reconstructed p_{T} is rescaled by a factor %4.3f", rescalePtFactor);
	else
	   sprintf(v2RescaleBuffer, "Reconstructed p_{T} is not being rescaled");
	
	TLatex *v2Rescale = new TLatex(2.5, 0.075*rescaleV2Factor, v2RescaleBuffer);
	v2Rescale->SetTextColor(4);
	v2Rescale->SetTextSize(0.060);
	v2Rescale->Draw();

      }
    }
		
    return;

  }

  for(unsigned int kEta=0; kEta<NETABINS; kEta++) {
    for(unsigned int kPt=0; kPt<NPTBINS; kPt++) {
      float xPlot[NPHIBINS];
      float yPlot[NPHIBINS];
      float xPlotErrors[NPHIBINS];
      float yPlotErrors[NPHIBINS];
      float yMax = 0.0;
      float yMin = 1.0e+30;
      for(unsigned int kPhi=0; kPhi<NPHIBINS; kPhi++) {
	xPlot[kPhi] = 0.5*(lowPhiBin[kPhi] + highPhiBin[kPhi]);
	xPlotErrors[kPhi] = 0.0;
	yPlot[kPhi] = pi0GeneratedEtaPhiPtHistogramYield[kEta][kPhi][kPt];
	yPlotErrors[kPhi] = sqrt(yPlot[kPhi]); 

	if(yPlot[kPhi] > yMax)
	  yMax = yPlot[kPhi];
	if(yPlot[kPhi] < yMin)
	  yMin = yPlot[kPhi];
      } // loop over phi bins

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

      TGraphErrors *graphFlow = new TGraphErrors(NPHIBINS, xPlot, yPlot, xPlotErrors, yPlotErrors);
      graphFlow->SetLineColor(1);
      graphFlow->SetLineWidth(2);
      graphFlow->SetMarkerColor(4);
      graphFlow->SetMarkerStyle(20);
      graphFlow->SetMarkerSize(1.25);
      char graphTitle[200]; 
      sprintf(graphTitle, "Generator #pi^{0} With v_{2} Flow: %5.2f < |#eta| < %5.2f, %5.2f < p_{T} < %5.2f ",
	      lowEtaBin[kEta], highEtaBin[kEta], lowPtBin[kPt], highPtBin[kPt]);

      graphFlow->SetTitle(graphTitle);
      graphFlow->GetXaxis()->SetTitle("#Phi_{Lab} _ #Phi_{EP} (radians)");	
      graphFlow->GetYaxis()->SetTitle("Generator Yield");	
      graphFlow->GetXaxis()->SetLimits(lowPhiBin[0], highPhiBin[NPHIBINS - 1]);
      cout << "\n First: yMin " << yMin << " yMax " << yMax << " iMinY " << iMinY << " iMaxY " << iMaxY;
      graphFlow->SetMinimum(yMin);
      graphFlow->SetMaximum(yMax);										 
      graphFlow->Draw("AP");
      c1->SetGridx();
      c1->SetGridy();

      TF1 *flowFitFcn =  new TF1("flowFitFcn", v2SinglesFit, 0.0, 2.0*TMath::Pi(), 2);
      flowFitFcn->SetParName(0, "Normalization");
      flowFitFcn->SetParName(1, "v_{2}");
      flowFitFcn->SetParameter(0, 0.5*(yMin + yMax));
      flowFitFcn->SetParameter(1, 0.01);
      graphFlow->Fit("flowFitFcn", "", "", 0.0, 2.0*TMath::Pi());

      cout << "\n Yield in this bin " << pi0GeneratedEtaPhiPtHistogramV2Sum[0][kPt];
      if(pi0GeneratedEtaPhiPtHistogramV2Sum[0][kPt] > 0.0) {
	double averageV2 = pi0GeneratedEtaPhiPtHistogramV2[kEta][kPt]/pi0GeneratedEtaPhiPtHistogramV2Sum[0][kPt];
	double averagePt = pi0GeneratedEtaPhiPtHistogramPt[kEta][kPt]/pi0GeneratedEtaPhiPtHistogramV2Sum[0][kPt];
	cout << ",  average v2 value " << averageV2;
	cout << ",  average pT value " <<  averagePt;
	char genBuffer[200];
	sprintf(genBuffer, "Actual average v_{2} = %4.3f for produced average p_{T} = %4.2f GeV/c", averageV2, averagePt);
	TLatex *tGen = new TLatex(0.10, yMin + 0.10*(yMax - yMin), genBuffer);
	tGen->SetTextColor(4);
	tGen->SetTextSize(0.030);
	tGen->Draw();

	char genBuffer2[200];
	double nominalMidPt = 0.5*(lowPtBin[kPt] + highPtBin[kPt]);
	double predictedV2 = v2Pt(nominalMidPt);
	sprintf(genBuffer2, "Predicted v_{2} = %4.3f for nominal mid-point p_{T} = %4.2f GeV/c", predictedV2, nominalMidPt);
	TLatex *tGen2 = new TLatex(0.10, yMin + 0.20*(yMax - yMin), genBuffer2);
	tGen2->SetTextColor(4);
	tGen2->SetTextSize(0.030);
	tGen2->Draw();

      }

      cout << endl;

      char graphOutputFileName[200];
      sprintf(graphOutputFileName, "pi0GeneratorFlowYields_Pt%3.1f-%3.1f_Eta%4.2f-%4.2f_%d.C", lowPtBin[kPt], highPtBin[kPt], lowEtaBin[kEta], highEtaBin[kEta], date);
      c1->Print(graphOutputFileName);  // C macro
      sprintf(graphOutputFileName, "pi0GeneratorFlowYields_Pt%3.1f-%3.1f_Eta%4.2f-%4.2f_%d.gif", lowPtBin[kPt], highPtBin[kPt], lowEtaBin[kEta], highEtaBin[kEta], date);
      c1->Print(graphOutputFileName);  // gif file
      sprintf(graphOutputFileName, "pi0GeneratorFlowYields_Pt%3.1f-%3.1f_Eta%4.2f-%4.2f_%d.pdf", lowPtBin[kPt], highPtBin[kPt], lowEtaBin[kEta], highEtaBin[kEta], date);
      c1->Print(graphOutputFileName);  // pdf file

      yMax = 0.0;
      yMin = 1.0e+30;
      for(unsigned int kPhi=0; kPhi<NPHIBINS; kPhi++) {
	xPlot[kPhi] = 0.5*(lowPhiBin[kPhi] + highPhiBin[kPhi]);
	xPlotErrors[kPhi] = 0.0;
	yPlot[kPhi] = pi0ReconstructedEtaPhiPtHistogramYield[kEta][kPhi][kPt];
	yPlotErrors[kPhi] = sqrt(yPlot[kPhi]); 

	if(yPlot[kPhi] > yMax)
	  yMax = yPlot[kPhi];
	if(yPlot[kPhi] < yMin)
	  yMin = yPlot[kPhi];
      } // loop over phi bins

      yMinDefault = yMin/2.5;
      yMaxDefault = yMax*1.7;
 
      iMinY = yMin/100.0;
      yMin = 100.0*(iMinY - 2);
      if(yMin < 0.0)
	yMin = 0.0;
    
      if(yMin < yMinDefault)
	yMin = yMinDefault;
    
      iMaxY = yMax/100.0;
      if(iMaxY < 5)
	yMax = 100.0*(iMaxY + 2);
      else
	yMax = 100.0*(iMaxY + 4);
				 
      if(yMax > yMaxDefault)
	yMax = yMaxDefault;

      TGraphErrors *graphFlowReco = new TGraphErrors(NPHIBINS, xPlot, yPlot, xPlotErrors, yPlotErrors);
      graphFlowReco->SetLineColor(1);
      graphFlowReco->SetLineWidth(2);
      graphFlowReco->SetMarkerColor(4);
      graphFlowReco->SetMarkerStyle(20);
      graphFlowReco->SetMarkerSize(1.25);
      sprintf(graphTitle, "Reconstructed #pi^{0} With v_{2} Flow: %5.2f < |#eta| < %5.2f, %5.2f < p_{T} < %5.2f ",
	      lowEtaBin[kEta], highEtaBin[kEta], lowPtBin[kPt], highPtBin[kPt]);

      graphFlowReco->SetTitle(graphTitle);
      graphFlowReco->GetXaxis()->SetTitle("#Phi_{Lab} _ #Phi_{EP} (radians)");	
      graphFlowReco->GetYaxis()->SetTitle("Generator Yield");	
      graphFlowReco->GetXaxis()->SetLimits(lowPhiBin[0], highPhiBin[NPHIBINS - 1]);
      cout << "\n First: yMin " << yMin << " yMax " << yMax << " iMinY " << iMinY << " iMaxY " << iMaxY;
      graphFlowReco->SetMinimum(yMin);
      graphFlowReco->SetMaximum(yMax);										 
      graphFlowReco->Draw("AP");
      c1->SetGridx();
      c1->SetGridy();

      TF1 *flowFitFcnReco =  new TF1("flowFitFcnReco", v2SinglesFit, 0.0, 2.0*TMath::Pi(), 2);
      flowFitFcnReco->SetParName(0, "Normalization");
      flowFitFcnReco->SetParName(1, "v_{2}");
      flowFitFcnReco->SetParameter(0, 0.5*(yMin + yMax));
      flowFitFcnReco->SetParameter(1, 0.01);
      graphFlowReco->Fit("flowFitFcnReco", "", "", 0.0, 2.0*TMath::Pi());

      cout << "\n Yield in this bin " << pi0ReconstructedEtaPhiPtHistogramV2Sum[0][kPt];
      if(pi0ReconstructedEtaPhiPtHistogramV2Sum[0][kPt] > 0.0) {
	double averageV2 = pi0ReconstructedEtaPhiPtHistogramV2[kEta][kPt]/pi0ReconstructedEtaPhiPtHistogramV2Sum[0][kPt];
	double averagePt = pi0ReconstructedEtaPhiPtHistogramPt[kEta][kPt]/pi0ReconstructedEtaPhiPtHistogramV2Sum[0][kPt];
	cout << ",  average v2 value " << averageV2;
	cout << ",  average pT value " <<  averagePt;
	char recBuffer[200];
	sprintf(recBuffer, "Actual average v_{2} = %4.3f for reconstructed average p_{T} = %4.2f GeV/c", averageV2, averagePt);
	TLatex *tRec = new TLatex(0.10, yMin + 0.10*(yMax - yMin), recBuffer);
	tRec->SetTextColor(4);
	tRec->SetTextSize(0.030);
	tRec->Draw();

	char recBuffer2[200];
	double nominalMidPt = 0.5*(lowPtBin[kPt] + highPtBin[kPt]);
	double predictedV2 = v2Pt(nominalMidPt);
	sprintf(recBuffer2, "Predicted v_{2} = %4.3f for nominal mid-point p_{T} = %4.2f GeV/c", predictedV2, nominalMidPt);
	TLatex *tRec2 = new TLatex(0.10, yMin + 0.20*(yMax - yMin), recBuffer2);
	tRec2->SetTextColor(4);
	tRec2->SetTextSize(0.030);
	tRec2->Draw();

      }

      cout << endl;

      sprintf(graphOutputFileName, "pi0ReconstructFlowYields_Pt%3.1f-%3.1f_Eta%4.2f-%4.2f_%d.C", lowPtBin[kPt], highPtBin[kPt], lowEtaBin[kEta], highEtaBin[kEta], date);
      c1->Print(graphOutputFileName);  // C macro
      sprintf(graphOutputFileName, "pi0ReconstructFlowYields_Pt%3.1f-%3.1f_Eta%4.2f-%4.2f_%d.gif", lowPtBin[kPt], highPtBin[kPt], lowEtaBin[kEta], highEtaBin[kEta], date);
      c1->Print(graphOutputFileName);  // gif file
      sprintf(graphOutputFileName, "pi0ReconstructFlowYields_Pt%3.1f-%3.1f_Eta%4.2f-%4.2f_%d.pdf", lowPtBin[kPt], highPtBin[kPt], lowEtaBin[kEta], highEtaBin[kEta], date);
      c1->Print(graphOutputFileName);  // pdf file

      return;

    } // loop over pT bins for generated

  } // loop over eta bins

}
