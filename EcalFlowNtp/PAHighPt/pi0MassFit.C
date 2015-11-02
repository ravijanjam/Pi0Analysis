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

// two-parameter linear background function
Double_t linearBackground(Double_t *x, Double_t *par) {
  return par[0] + par[1]*x[0];
}

// Gauss peak function
Double_t gaussPeak(Double_t *x, Double_t *par) {
  if(par[2] != 0.0) {
    double arg = x[0] - par[1];
    return par[0]*exp(-arg*arg/(2.0*par[2]*par[2]));
  }
  return 0.0;
}
// sum of two-parameter linear background and a Gaussian peak function
Double_t fitFunctionLinear(Double_t *x, Double_t *par) {
  return linearBackground(x,par) + gaussPeak(x,&par[2]);
}

void Canvas()
{
  gStyle->SetOptStat(0);
  gStyle->SetOptFit(0);
  gStyle->SetPalette(1);
  gStyle->SetFrameFillColor(0);
  gStyle->SetCanvasColor(0);
  gStyle->SetPadBorderSize(0);
  gStyle->SetCanvasBorderSize(0);
  gStyle->SetFrameLineColor(1);
  gStyle->SetFrameLineWidth(1.0);
  gStyle->SetCanvasColor(0); 
  gStyle->SetCanvasBorderMode(0); 
  gStyle->SetPadColor(0);   
  gStyle->SetPadBorderMode(0);
  gStyle->SetPadTickX(1); 
  gStyle->SetPadTickY(1);
  gStyle->SetLegendBorderSize(0);
  gStyle->SetErrorX(0.001);
  
  gStyle->SetTextFont(42);
  gStyle->SetLabelFont(42,"x");
  gStyle->SetLabelFont(42,"y");
  gStyle->SetLabelFont(42,"z");
  gStyle->SetTitleFont(42,"x");
  gStyle->SetTitleFont(42,"y");
  gStyle->SetTitleFont(42,"z");
  gStyle->SetEndErrorSize(1);
}

void pi0MassFit(const int iMultOption = 0,
		const int iFitOption = 0,
		const float fitStart = 0.095,
		const float fitEnd = 0.175,
		const bool usePbPbData = true,
		const bool usepPbData = false,
		const bool useSimData = false) {

  // 
  // iMultOption = 0, 1, 2, 3 controls the track multiplicity selection [120-150, 150-195, 185-220, 220-260]
  // iFitOption = 0 or 1 controls the background fitting choice as mixed event or linear parameterized background
  //
  
  bool goodDataSource = false;
  char *dataText = new char[200];
  if(usePbPbData) {
    if(usepPbData || useSimData) {
      cerr << "\n Cannot only specify one data source as true" << endl;
      return;
    }
    goodDataSource = true;
    cout << "\n Using PbPbData source" << endl;
    sprintf(dataText, "CMS PbPb #sqrt{s_{NN}}=2.76 TeV");
  }
  if(usepPbData) {
    if(usePbPbData || useSimData) {
      cerr << "\n Cannot only specify one data source as true" << endl;
      return;
    }
    goodDataSource = true;
    cout << "\n Using pPbData source" << endl;
    sprintf(dataText, "CMS pPb #sqrt{s_{NN}}=5.0 TeV");
  }
  if(useSimData) {
    if(usePbPbData || usepPbData) {
      cerr << "\n Cannot only specify one data source as true" << endl;
      return;
    }
    goodDataSource = true;
    cout << "\n Using SimData source" << endl;
    sprintf(dataText, "HIJING PbPb #sqrt{s_{NN}}=2.76 TeV");
  }

  if(!goodDataSource) {
    cerr << "\n The data source was not specified" << endl;
    return;
  }


  bool mixedEventBackgroundFit = true;
  if(iFitOption !=0 && iFitOption !=1) {
    cerr << "\n Invalid choice of iFitOption " << iFitOption << endl;
    return;
  }

  if(iFitOption == 0) {
    cout << "\n Using mixed-event background fitting" << endl;
  }

  TF1 *parameterizedBackgroundFit[4] = {0, 0, 0, 0};
  TF1 *parameterizedBackground[4] = {0, 0, 0, 0};

  if(iFitOption == 1) {
    mixedEventBackgroundFit = false;
    cout << "\n Using linear parameterized background fitting";
    cout << "\n Start fit region at " << fitStart << ", end fit region at " << fitEnd;
    cout << endl;
    for(int kPt=0; kPt<4; kPt++) {
      char *fitName = new char[200];
      sprintf(fitName, "parametrizedFit%d", kPt);
      parameterizedBackgroundFit[kPt] = new TF1(fitName, fitFunctionLinear, fitStart, fitEnd, 5);
      parameterizedBackgroundFit[kPt]->SetParName(0, "bkgConst");
      parameterizedBackgroundFit[kPt]->SetParName(1, "bkgLin");
      parameterizedBackgroundFit[kPt]->SetParName(2, "peakAmpl");
      parameterizedBackgroundFit[kPt]->SetParName(3, "peakCent");
      parameterizedBackgroundFit[kPt]->SetParName(4, "peakSigma");
      parameterizedBackgroundFit[kPt]->SetParameters(-30., 2000., 1800., 0.134, 0.012); // initialized guesses for the fit

      sprintf(fitName, "parametrizedBackground%d", kPt); 
      parameterizedBackground[kPt] = new TF1(fitName, fitFunctionLinear, fitStart, fitEnd, 2); // used for the background evaluation after the fits have been made
      parameterizedBackground[kPt]->SetParName(0, "bkgConst");
      parameterizedBackground[kPt]->SetParName(1, "bkgLin");

    } // assume 4 pT bins
  } // check on iFitOption = 1

  TCanvas *c1 = new TCanvas("c1","",112,22,1019,540);
  c1->SetFillColor(0);
  c1->SetBorderMode(0);
  c1->SetBorderSize(0);
  c1->SetLeftMargin(0.2);
  c1->SetRightMargin(0.02325581);
  c1->SetBottomMargin(0.15);
  c1->SetFrameLineWidth(2);
  c1->SetFrameBorderMode(0);
  c1->Divide(4,2,0.0,0.0);
  
  Canvas();
    
  TString _trueHistogramFile = "inputTrue.root";
  
  TFile *_ftrueHistogram = new TFile(_trueHistogramFile, "r");
  if(!_ftrueHistogram) {
    cerr << "\n Unable to find input histogram file " << _trueHistogramFile << endl;
    return;
  }

  char *multText = new char[10];
  char *signalText = new char[100];
  char *bkgText = new char[100];

  char *multiplicityText = new char[200];
  int lowMultiplicity = 120;
  int highMultiplicity = 150;
  bool goodMultOption = false;
  if(iMultOption == 0) {
    sprintf(multText, "EcalFlowNtpMult100");
    goodMultOption = true;
    sprintf(multiplicityText, "120 #leq N_{track}^{offline} < 150");
  }
  if(iMultOption == 1) {
    sprintf(multText, "EcalFlowNtpMult130");
    lowMultiplicity = 150;
    highMultiplicity = 185;
    goodMultOption = true;
    sprintf(multiplicityText, "150 #leq N_{track}^{offline} < 185");
  }
  if(iMultOption == 2) {
    sprintf(multText, "EcalFlowNtpMult160");
    lowMultiplicity = 185;
    highMultiplicity = 220;
    goodMultOption = true;
    sprintf(multiplicityText, "185 #leq N_{track}^{offline} < 220");
  }
  if(iMultOption == 3) {
    sprintf(multText, "EcalFlowNtpMult190");
    lowMultiplicity = 220;
    highMultiplicity = 260;
    goodMultOption = true;
    sprintf(multiplicityText, "220 #leq N_{track}^{offline} < 260");
  }

  if(goodMultOption) {
    sprintf(signalText, "%s/NeutralPions/pi0MassSameEventPtBin", multText);
    sprintf(bkgText, "%s/NeutralPions/pi0MassMixedEventPtBin", multText);
  }
  else {
    cerr << "\n Multiplicity option " << iMultOption << " is not valid" << endl;
    return;
  }

  char *histogramName = new char[200];

  const int iRange = 10;
  TH1D *_mixedHisto[iRange];
  TH1D *_trueHisto[iRange];
  TH1D *pi0MassSubtracted[iRange];
  TH1D *pi0MassMixedCopy[iRange];
  TF1 *fitFcn[iRange];
  float peakCentroid[iRange];
  float peakCentroidError[iRange];
  float peakWidth[iRange];
  float peakWidthError[iRange];
  float fMaxHistValue[iRange];
    
  const int iFile=9;
  double _PeakRegion[iFile], _PeakRegionErr[iFile];
  double _SideBand[iFile], _SideBandErr[iFile];
  double v2Sig[iFile], v2SigErr[iFile];
    
  char *_filePeakRegion = new char[200];
  char *_fileSideBand = new char[200];
  sprintf(_filePeakRegion, "PeakRegion_%dMult%d.txt", lowMultiplicity, highMultiplicity);
  sprintf(_fileSideBand, "SideBand_%dMult%d.txt", lowMultiplicity, highMultiplicity);

  ifstream PeakRegion;
  PeakRegion.open(_filePeakRegion, ifstream::in);
  if(!PeakRegion.is_open()) {
    cerr << "\n Unable to open peak region text file " << _filePeakRegion << endl;
    return;
  } // safety check
  int nPoints=0;
    
  if(PeakRegion.is_open())
    {
      cout << "---< Reading peak region data points first >---" << _filePeakRegion <<endl;
      std::string line;
      while(std::getline(PeakRegion,line,'\n'))
        {
	  double x,ex;
	  sscanf(line.c_str(),"%lg %lg",&x,&ex); // res variable is not used
         
	  _PeakRegion[nPoints] = x;
	  _PeakRegionErr[nPoints] = ex;
            
	  cout << "x=" << _PeakRegion[nPoints] << '\t' << "ex=" << _PeakRegionErr[nPoints] << endl;
	  nPoints++;
        }
    }    
    
  ifstream SideBand;
  SideBand.open(_fileSideBand, ifstream::in);
  if(!SideBand.is_open()) {
    cout << "\n Unable to open sideband text file " << _fileSideBand << endl;
    return;
  } // safety check
  int nPoints1=0;
    
  if(SideBand.is_open())
    {
      cout << "---< Reading side band data points next >---" << _fileSideBand << endl;
      std::string line1;
      while(std::getline(SideBand,line1,'\n'))
        {
	  double x1,ex1;
	  sscanf(line1.c_str(),"%lg %lg",&x1,&ex1); // variable is not used
          
	  _SideBand[nPoints1] = x1;
	  _SideBandErr[nPoints1] = ex1;
            
	  cout << "x=" << _SideBand[nPoints1] << '\t' << "ex=" << _SideBandErr[nPoints1]<<endl;
	  nPoints1++;
        }
    }
    
  const int nMassBins = 200;
  const float lowFalsePairMassCut=0.200;
  const float highFalsePairMassCut=0.250;
  const float subtractedStart=0.06;
  const float subtractedEnd=0.20;
  const float maximumPi0MassForHistogram = 0.30;
    
  cout << "\n Fitting the foreground histograms" << endl;

  for(int iptBin=0; iptBin<8; iptBin++)
    {
              
      sprintf(histogramName, "%s%d", signalText, iptBin);

      _trueHisto[iptBin] = (TH1D*)_ftrueHistogram->Get(histogramName);
      if(!_trueHisto[iptBin]) {
	cerr << "\n For iptBin = " << iptBin << " unable to find " << histogramName << endl;
	return;
      }

      sprintf(histogramName, "%s%d", bkgText, iptBin);
      _mixedHisto[iptBin] = (TH1D*)_ftrueHistogram->Get(histogramName);
      if(!_mixedHisto[iptBin]) {
	cerr << "\n For iptBin = " << iptBin << " unable to find " << histogramName << endl;
	return;
      }
    }
  
  const float pTbins[11] = {0.7, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 5.0, 6.0, 8.0};
  
  float histogramMaximumValue = _trueHisto[0]->GetMaximum();
  const int iPad = 8;
  for(int nn=0; nn<iPad; nn++)
    {


      if(nn < 4){
	c1->cd(nn+1);

	if(!_trueHisto[nn]) {
	  cerr << "\n  _trueHisto[nn] = " << _trueHisto[nn] << endl;
	  return;
	}

	_trueHisto[nn]->SetTitle("");
	_trueHisto[nn]->SetMarkerStyle(20);
	_trueHisto[nn]->SetMarkerSize(0.8);
	_trueHisto[nn]->SetMaximum(57000);
	_trueHisto[nn]->SetMinimum(-1087.21);
	_trueHisto[nn]->GetYaxis()->SetTitle("dN/dm_{#gamma#gamma} [MeV/c^{2}]^{-1}");
	_trueHisto[nn]->GetYaxis()->SetNoExponent();
	_trueHisto[nn]->GetYaxis()->SetLabelFont(42);
	_trueHisto[nn]->GetYaxis()->SetLabelSize(0.05);
	_trueHisto[nn]->GetYaxis()->SetTitleSize(0.08);
	_trueHisto[nn]->GetYaxis()->SetTitleFont(42);
	_trueHisto[nn]->GetYaxis()->SetTitleOffset(1.4);

	char name1[8];
	sprintf(name1,"h2_%d",nn);
	pi0MassSubtracted[nn] = new TH1D(name1, "", nMassBins, 0.0, maximumPi0MassForHistogram);
	pi0MassSubtracted[nn]->SetMarkerStyle(20);
	pi0MassSubtracted[nn]->SetMarkerSize(0.8);
	pi0MassSubtracted[nn]->GetXaxis()->SetTitle("m_{#gamma#gamma} [GeV/c^{2}]");
	pi0MassSubtracted[nn]->GetXaxis()->SetLabelFont(42);
	pi0MassSubtracted[nn]->GetXaxis()->SetLabelSize(0.05);
	pi0MassSubtracted[nn]->GetXaxis()->SetTitleSize(0.06);
	pi0MassSubtracted[nn]->GetXaxis()->SetTitleFont(42);
	pi0MassSubtracted[nn]->GetYaxis()->SetTitle("dN/dm_{#gamma#gamma} [MeV/c^{2}]^{-1}");
	pi0MassSubtracted[nn]->GetYaxis()->SetLabelFont(42);
	pi0MassSubtracted[nn]->GetYaxis()->SetLabelSize(0.05);
	pi0MassSubtracted[nn]->GetYaxis()->SetTitleSize(0.07);
	pi0MassSubtracted[nn]->GetYaxis()->SetTitleOffset(1.4);
	pi0MassSubtracted[nn]->GetYaxis()->SetTitleFont(42);
	pi0MassSubtracted[nn]->GetZaxis()->SetLabelFont(42);
	pi0MassSubtracted[nn]->GetZaxis()->SetLabelSize(0.035);
	pi0MassSubtracted[nn]->GetZaxis()->SetTitleSize(0.035);
	pi0MassSubtracted[nn]->GetZaxis()->SetTitleFont(42);

	if(mixedEventBackgroundFit) {

	  _trueHisto[nn]->Draw();

	  if(!_mixedHisto[nn]) {
	    cerr << "\n  _mixedHisto[nn] = " << _mixedHisto[nn] << endl;
	    return;
	  }
	  cout << "\n _mixedHisto[nn] = " << _mixedHisto[nn] << endl;

	  _mixedHisto[nn]->SetLineColor(kRed);
	  _mixedHisto[nn]->SetLineWidth(2);
      
	  char name[8];
	  sprintf(name,"h1_%d",nn);
            
	  pi0MassMixedCopy[nn] = new TH1D(name,"", nMassBins, 0.0, maximumPi0MassForHistogram);
	  pi0MassMixedCopy[nn]->GetYaxis()->SetTitle("dN/dm_{#gamma#gamma} [MeV/c^{2}]^{-1}");
	  pi0MassMixedCopy[nn]->GetYaxis()->SetNoExponent();
	  pi0MassMixedCopy[nn]->GetYaxis()->SetLabelFont(42);
	  pi0MassMixedCopy[nn]->GetYaxis()->SetLabelSize(0.05);
	  pi0MassMixedCopy[nn]->GetYaxis()->SetTitleSize(0.08);
	  pi0MassMixedCopy[nn]->GetYaxis()->SetTitleFont(42);
      
	  double sameEventCount = 0.0;
	  double MixedEventCount = 0.0;
	  // float MixedEventNormalizationFactor = 0.0;        // not used
	  // float MixedEventNormalizationErrorFactor = 0.0;   // not used
      
	  for(int kBin=1; kBin<nMassBins; kBin++) {
	    double binCenter = _mixedHisto[nn]->GetBinCenter(kBin);
	    if(binCenter >= lowFalsePairMassCut && binCenter <= highFalsePairMassCut) {
	      sameEventCount += _trueHisto[nn]->GetBinContent(kBin);
	      MixedEventCount += _mixedHisto[nn]->GetBinContent(kBin);
	    } // check if mass bin is within the normalization region
	  } // loop over mass bins
      
	  if(MixedEventCount > 0.0 && sameEventCount > 0.0 ) { // background subtraction for unpartitioned yields
	    double sameEventYield = 0.0;
	    double sameEventYieldError = 0.0;
        
	    double sameEventTotal = 0.0;
	    double normalizationFactorMixed = sameEventCount/MixedEventCount;
	    // MixedEventNormalizationFactor = normalizationFactorMixed;  // not used
	    // MixedEventNormalizationErrorFactor = sqrt(1.0/sameEventCount + 1.0/MixedEventCount);  // not used
	    for(int kBin=1; kBin<=nMassBins; kBin++) {
	      double sameEventContent = _trueHisto[nn]->GetBinContent(kBin);
	      double MixedEventContent = _mixedHisto[nn]->GetBinContent(kBin);
	      double MixedEventFractionalErrorSquared = 0.0;
	      if(MixedEventContent > 0.0) MixedEventFractionalErrorSquared = 1.0/MixedEventContent;
	      double MixedEventNormalizedContent = normalizationFactorMixed*MixedEventContent;
	      pi0MassMixedCopy[nn]->SetBinContent(kBin, MixedEventNormalizedContent);
	      double combinedErrorSquared = sameEventContent + MixedEventNormalizedContent*MixedEventNormalizedContent*MixedEventFractionalErrorSquared;
	      sameEventYieldError += combinedErrorSquared;
	      double binCenter = _trueHisto[nn]->GetBinCenter(kBin);
	      double sameEventSubtracted = sameEventContent - MixedEventNormalizedContent;
	      double sameEventSubtractedError = sqrt(combinedErrorSquared);
          
	      if(binCenter >= subtractedStart && binCenter <= subtractedEnd) {
		sameEventTotal += sameEventContent;
		sameEventYield += sameEventSubtracted;
	      }
	      if(sameEventContent > 0.0) {
		pi0MassSubtracted[nn]->SetBinContent(kBin, sameEventSubtracted);
		pi0MassSubtracted[nn]->SetBinError(kBin, sameEventSubtractedError);
	      } // loop over mixed event histogram
        
	    }  // background subtraction for unpartitioned yields
      
	    pi0MassMixedCopy[nn]->SetLineColor(kRed);
	    pi0MassMixedCopy[nn]->GetXaxis()->SetTitle("#gamma#gamma Invariant mass (GeV/c^{2})");
	    pi0MassMixedCopy[nn]->Draw("same");

	  } // check  non-zero same-event and mixed-event counts
	} // check on doing mixed-event background fit


	if(!mixedEventBackgroundFit) {
	  char *fitName = new char[200];
	  sprintf(fitName, "parametrizedFit%d", nn);

	  parameterizedBackgroundFit[nn]->SetLineColor(kBlue);
	  _trueHisto[nn]->Fit(fitName, "", "", fitStart, fitEnd);

	  float bkgConst = parameterizedBackgroundFit[nn]->GetParameter(0);
  	  float bkgLin = parameterizedBackgroundFit[nn]->GetParameter(1);

	  peakCentroid[nn] = parameterizedBackgroundFit[nn]->GetParameter(3);
	  peakCentroidError[nn] = parameterizedBackgroundFit[nn]->GetParError(3);
	  peakWidth[nn] = parameterizedBackgroundFit[nn]->GetParameter(4);
	  peakWidthError[nn] = parameterizedBackgroundFit[nn]->GetParError(4);

	  parameterizedBackground[nn]->SetParameters(bkgConst, bkgLin);
	  parameterizedBackground[nn]->SetLineColor(kRed);;
	  parameterizedBackground[nn]->Draw("same");

	  for(int kBin=1; kBin<=nMassBins; kBin++) {

	    double binCenter = _trueHisto[nn]->GetBinCenter(kBin);
	    if(binCenter < fitStart || binCenter > fitEnd) {
	      pi0MassSubtracted[nn]->SetBinContent(kBin, 0.0);
	      pi0MassSubtracted[nn]->SetBinError(kBin, 0.0);
	    } // check for mass value outside the fit range
	    else {
	      double sameEventContent = _trueHisto[nn]->GetBinContent(kBin);
	      double sameEventError = _trueHisto[nn]->GetBinError(kBin);
	      double calculatedBackground = parameterizedBackground[nn]->Eval(binCenter);
	      double subtractedYield = sameEventContent - calculatedBackground;
	      pi0MassSubtracted[nn]->SetBinContent(kBin, subtractedYield);
	      pi0MassSubtracted[nn]->SetBinError(kBin, sameEventError);
	    } // mass value within the fitted range

	  } // loop over mass bins

	} // check on doing parameterized background fit

	if(nn==0){
	  c1->cd(nn+1);
	  TLatex *tex = new TLatex(0.02, 0.9*histogramMaximumValue, dataText);
	  tex->SetTextFont(42);
	  tex->SetTextSize(0.06974556);
	  tex->SetLineWidth(2);
	  tex->Draw();
	  tex = new TLatex(0.02, 0.8*histogramMaximumValue,"|#eta|<1.5");
	  tex->SetTextFont(42);
	  tex->SetTextSize(0.06974556);
	  tex->SetLineWidth(2);
	  tex->Draw();
                
	  tex = new TLatex(0.09, 0.20*histogramMaximumValue, multiplicityText);
	  tex->SetTextFont(42);
	  tex->SetTextSize(0.06974556);
	  tex->SetLineWidth(2);
	  tex->Draw();
	  TLatex *tex2 = new TLatex(0.08, 0.10*histogramMaximumValue, Form("%5.1f < p_{T} < %5.1f (GeV/c)",pTbins[nn],pTbins[nn+1]));
	  tex2->SetTextFont(42);
	  tex2->SetTextSize(0.06974556);
	  tex2->SetLineWidth(2);
	  tex2->Draw();
	}
	
	if(nn>0){
	  TLatex *tex = new TLatex(0.014, 0.6*histogramMaximumValue ,Form("%5.1f < p_{T} < %5.1f (GeV/c)",pTbins[nn],pTbins[nn+1]));
	  tex->SetTextFont(42);
	  tex->SetTextSize(0.06974556);
	  tex->SetLineWidth(2);
	  tex->Draw();
	} // check on upper left panel

	(c1->cd(nn+1))->SetGrid();

      } // Check on < 4 condition (top set of plots)

      if(nn >=4 && nn<=7)
	{

	  c1->cd(nn+1);
	  cout<<"nn = "<<nn<<'\t'<<nn-4<<endl;

	  fMaxHistValue[nn-4] = 2.0*pi0MassSubtracted[nn-4]->GetBinContent(pi0MassSubtracted[nn-4]->GetMaximumBin());
	  pi0MassSubtracted[nn-4]->SetMaximum(fMaxHistValue[nn-4]);
	  pi0MassSubtracted[nn-4]->SetMinimum(-0.07*fMaxHistValue[nn-4]);

	  float sumSubtractedYield = 0;
	  float sumSubtractedError = 0.0;
	  float backgroundYield = 0.0;
	  float backgroundYieldError = 0.0;

	  if(!mixedEventBackgroundFit) {

	    float bkgConstError = parameterizedBackgroundFit[nn-4]->GetParError(0);
	    float bkgLin = parameterizedBackgroundFit[nn-4]->GetParameter(1);
	    float bkgLinError = fabs(parameterizedBackgroundFit[nn-4]->GetParError(1));
	    float bkgFractionalError = 0.0;
	    if(bkgLin > 0.0) {
	      bkgFractionalError =  bkgLinError/bkgLin;
	    }

	    for(int kBin=1; kBin<=nMassBins; kBin++) {

	      double binCenter = pi0MassSubtracted[nn-4]->GetBinCenter(kBin);
	      if(binCenter >= fitStart && binCenter <= fitEnd) {
		sumSubtractedYield += pi0MassSubtracted[nn-4]->GetBinContent(kBin);
		double error =  pi0MassSubtracted[nn-4]->GetBinError(kBin);
		sumSubtractedError += error*error;
		backgroundYield += parameterizedBackground[nn-4]->Eval(binCenter);
		double backgroundLinearError =  bkgFractionalError*binCenter;
		backgroundYieldError += backgroundLinearError*backgroundLinearError;
	      } // mass value within the fitted range

	    } // loop over mass bins
	    
	    sumSubtractedError = sqrt(sumSubtractedError);
	    backgroundYieldError = sqrt(backgroundYieldError + bkgConstError* bkgConstError);  // according to the background fit parameter errors

	  } // check on parameterized background fit

	  if(mixedEventBackgroundFit) {
	    char name2[100];
	    sprintf(name2,"fitFcn_%d",nn);
	    fitFcn[nn-4] =  new TF1(name2, gaussPeak, subtractedStart, subtractedEnd, 3);
	    fitFcn[nn-4]->SetParName(0, "peak Amplitude");
	    fitFcn[nn-4]->SetParName(1, "peak Centroid");
	    fitFcn[nn-4]->SetParName(2, "peak Sigma");
	    fitFcn[nn-4]->SetParameters(13519, 0.135, 0.03);
	    pi0MassSubtracted[nn-4]->Fit(name2, "", "", subtractedStart, subtractedEnd);
	    fitFcn[nn-4]->SetLineColor(kRed);
          
	    pi0MassSubtracted[nn-4]->Draw();
          
	    peakCentroid[nn-4] = fitFcn[nn-4]->GetParameter(1);
	    peakCentroidError[nn-4] = fitFcn[nn-4]->GetParError(1);
	    peakWidth[nn-4] = fabs(fitFcn[nn-4]->GetParameter(2));
	    peakWidthError[nn-4] = fitFcn[nn-4]->GetParError(2);
	  } // check on mixed-event background fit

	  char fName[200];
	  sprintf(fName, "Mass = %5.1f #pm %5.1f MeV", 1000.0*peakCentroid[nn-4], 1000.0*peakCentroidError[nn-4]);
	  TLatex *tSB1 = new TLatex(0.04, 0.9*fMaxHistValue[nn-4], fName);
	  tSB1->SetTextColor(4);
	  tSB1->SetTextSize(0.055);
	  tSB1->Draw();
                
	  char fName1[200];
	  sprintf(fName1, "Width = %5.1f #pm %5.1f MeV", 1000.0*peakWidth[nn-4], 1000.0*peakWidthError[nn-4]);
	  TLatex *tSB2 = new TLatex(0.04, 0.8*fMaxHistValue[nn-4], fName1);
	  tSB2->SetTextColor(4);
	  tSB2->SetTextSize(0.055);
	  tSB2->Draw();
          	  
	  TLine *line3 = new TLine(0.00,0.0,0.3,0.0);
	  line3->SetLineColor(kGreen);
	  line3->SetLineWidth(2);
	  line3->Draw();
                
	  TLine *line2 = new TLine(peakCentroid[nn-4],0.0,peakCentroid[nn-4],fMaxHistValue[nn-4]/2.0);
	  line2->SetLineWidth(2);
	  line2->SetLineColor(kMagenta);
	  line2->Draw();
                
	  if(mixedEventBackgroundFit) {

	    // float subtractedYieldErrors = 0.0;
	    float binLowForYield = peakCentroid[nn-4] - 2.0*peakWidth[nn-4];
	    float binHighForYield = peakCentroid[nn-4] + 2.0*peakWidth[nn-4];          
        
	    for(int kBin=1; kBin<=nMassBins; kBin++) {
	      double binCenter = pi0MassSubtracted[nn-4]->GetBinCenter(kBin);
	      if(binCenter >= binLowForYield && binCenter <= binHighForYield) {
		sumSubtractedYield += pi0MassSubtracted[nn-4]->GetBinContent(kBin);
		backgroundYield += pi0MassMixedCopy[nn-4]->GetBinContent(kBin);
		double binError = pi0MassSubtracted[nn-4]->GetBinError(kBin);
		sumSubtractedError += binError*binError;
	      } // check mass bin
	    } // sum over mass bins
                
	    sumSubtractedError = sqrt(sumSubtractedError);
	    //  float backgroundYieldError = MixedEventNormalizationErrorFactor*
	    //  MixedEventNormalizationErrorFactor*backgroundYield;

	    //
	    //  the variable  MixedEventNormalizationErrorFactor  has not been defined for this code segment
	    //
	    float MixedEventNormalizationErrorFactor  = 0.1; // guess at correct value
	    backgroundYieldError = MixedEventNormalizationErrorFactor*backgroundYield;

	    //
	    // The subtractedYieldErrors variable is not used
	    //
	    // subtractedYieldErrors = sqrt(sumSubtractedError*sumSubtractedError + backgroundYieldError*backgroundYieldError);
	    //
	  } // check on doing mixedEvent background fitting

	  char fName3[200];
	  sprintf(fName3, "Signal yield = %d #pm %d", int(sumSubtractedYield), int(sumSubtractedError));
	  TLatex *tSB3 = new TLatex(0.02, 0.72*fMaxHistValue[nn-4], fName3);
	  tSB3->SetTextColor(4);
	  tSB3->SetTextSize(0.050);
	  tSB3->Draw();
                
	  char fName4[200];
	  sprintf(fName4, "Background yield = %d #pm %d", int(backgroundYield), int(backgroundYieldError));
	  TLatex *tSB4 = new TLatex(0.02, 0.64*fMaxHistValue[nn-4], fName4);
	  tSB4->SetTextColor(4);
	  tSB4->SetTextSize(0.050);
	  tSB4->Draw();
                
	  char fName5[200];
	  sprintf(fName5, "S/(S+B) = %5.3f", (sumSubtractedYield/(sumSubtractedYield+backgroundYield)));
	  TLatex *tSB5 = new TLatex(0.02, 0.54*fMaxHistValue[nn-4], fName5);
	  tSB5->SetTextColor(kBlue);
	  tSB5->SetTextSize(0.055);
	  tSB5->Draw();
                
	  // float S_B = sumSubtractedYield/backgroundYield; // variable not used
	  float FracSig = sumSubtractedYield/(sumSubtractedYield+backgroundYield);
	  float FracBkg = 1-FracSig;
	  float a0 = sumSubtractedYield;
	  float c0 = sumSubtractedYield+backgroundYield;
	  float b0 = backgroundYield;
	  // float Db0 = backgroundYieldError;  // variable not used
	  float Da0 = sumSubtractedError;
                
	  //Alternative method:
	  double v2Signal1  = ((_PeakRegion[nn-4])*(c0/a0)) - ((_SideBand[nn-4])*(b0/a0));
                
	  double v2Obs = FracSig*_PeakRegion[nn-4] + FracBkg*_SideBand[nn-4];
	  double v2Signal = (v2Obs - FracBkg*_SideBand[nn-4])/FracSig;
	  v2Sig[nn-4] = (v2Obs - FracBkg*_SideBand[nn-4])/FracSig;
                
	  double TermI = (c0/a0)*(c0/a0)*_PeakRegionErr[nn-4]*_PeakRegionErr[nn-4];
	  double TermII = (b0/a0)*(b0/a0)*_SideBandErr[nn-4]*_SideBandErr[nn-4];
	  double TermIII = (_PeakRegion[nn-4] - _SideBand[nn-4])*(_PeakRegion[nn-4] - _SideBand[nn-4])*(c0/a0)*(c0/a0)*(Da0/a0)*(Da0/a0);
                
	  double Error = TermI+TermII+TermIII;
                
	  // double v2SigError = Error;
	  double v2SigError = sqrt((_PeakRegionErr[nn-4]*_PeakRegionErr[nn-4]) + (FracBkg*FracBkg*_SideBandErr[nn-4]*_SideBandErr[nn-4]))/FracSig;
	  v2SigErr[nn-4] = sqrt((_PeakRegionErr[nn-4]*_PeakRegionErr[nn-4]) + (FracBkg*FracBkg*_SideBandErr[nn-4]*_SideBandErr[nn-4]))/FracSig;
                
	  cout<<"***********************************"<<endl;
	  cout<<Form("%5.1f < p_{T} < %5.1f (GeV/c)",pTbins[nn-4],pTbins[nn-3])<<endl;
	  cout<<"------------"<<nn-4<<"-------------"<<endl;
	  cout<<_PeakRegionErr[nn-4]<<'\t'<<_SideBandErr[nn-4]<<endl;
	  cout<<"a0 ="<<a0<<'\t'<<"b0 = "<<b0<<'\t'<<"c0 = "<<c0<<endl;
	  cout<<"Term I = "<<TermI<<'\t'<<"Term II = "<<TermII<<endl;
	  cout<<"******* pi0 v2 value = "<<v2Signal<<'\t'<<v2Signal1<<'\t'<<Error<<endl;
	  cout<<"******* pi0 v2 value = "<<v2Sig[nn-4]<<endl;
	  cout<<"********pi0 v2 error = "<<v2SigError<<endl;
	  cout<<"********pi0 v2 error = "<<v2SigErr[nn-4]<<endl;
	  cout<<"***********************************"<<endl;

	  char fName6[200];
	  sprintf(fName6, "v_{2} = %4.3f #pm %4.3f",v2Signal, v2SigError );
	  TLatex *v2Text = new TLatex(0.15, 0.45*fMaxHistValue[nn-4], fName6);
	  v2Text->SetTextColor(4);
	  v2Text->SetTextSize(0.053);
	  v2Text->Draw();

	} // check for nn>=4 and nn<=7

    } // loop over 8 panels

  return;
    
  cout<<"***********************************"<<endl;
  for(int nn=0; nn<4; nn++)
    {
        cout<<Form("%5.1f < p_{T} < %5.1f (GeV/c)",pTbins[nn],pTbins[nn+1])<<'\t'<<"v2 Signal = "<<v2Sig[nn]<<'\t'<<"v2 signal error = "<<v2SigErr[nn]<<endl;
    }
    cout<<"***********************************"<<endl;
}
