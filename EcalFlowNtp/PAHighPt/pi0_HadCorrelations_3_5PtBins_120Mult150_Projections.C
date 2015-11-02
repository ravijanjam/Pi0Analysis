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

double Function(double *x, double *par)
{ 
  double sig = par[0] + 2*par[1]*TMath::Cos(x[0]) + 2*par[2]*TMath::Cos(2.0*x[0]) + 2*par[3]*TMath::Cos(3.0*x[0]);
  return sig;
}

Double_t v2Fit(Double_t *x, Double_t *par) {
  return par[0]*(1.0 + 2.0*par[1]*cos(2.0*x[0]));
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
  gStyle->SetFrameLineWidth(2.0);  
  gStyle->SetCanvasColor(0); 
  gStyle->SetCanvasBorderMode(0); 
  gStyle->SetPadColor(0);   
  gStyle->SetPadBorderMode(0);
  gStyle->SetPadTickX(1); 
  gStyle->SetPadTickY(1);
  gStyle->SetLegendBorderSize(0);
  gStyle->SetErrorX(0.5);
    
  gStyle->SetTextFont(42);
  gStyle->SetLabelFont(42,"x");
  gStyle->SetLabelFont(42,"y");
  gStyle->SetLabelFont(42,"z");
  gStyle->SetTitleFont(42,"x");
  gStyle->SetTitleFont(42,"y");
  gStyle->SetTitleFont(42,"z");
  gStyle->SetEndErrorSize(1);
}


void pi0_HadCorrelations_3_5PtBins_120Mult150_Projections(const int iMultOption = 0,
							  const bool peakRegionFile = false,
							  const bool sideBandFile = true) {

  if(peakRegionFile && sideBandFile) {
    cerr << "\n Cannot have the peakRegionFile and the sideBandFile both set to true"<< endl;
    return;
  }
  
  if(!peakRegionFile && !sideBandFile) {
    cerr << "\n Cannot have the peakRegionFile and the sideBandFile both set to false"<< endl;
    return;
  }
  
  TCanvas *c1 = new TCanvas("c1","",900,900);
  Canvas();
  c1->SetFillColor(0);
  c1->SetBorderMode(0);
  c1->SetBorderSize(2);
  c1->SetTickx(1);
  c1->SetTicky(1);
  c1->SetFrameFillStyle(0);
  c1->SetFrameBorderMode(0);
  c1->SetTopMargin(0.05);
  c1->SetBottomMargin(0.1);
  c1->SetLeftMargin(0.1742581);
  c1->SetRightMargin(0.05);
  c1->SetTheta(50.61189);
  c1->SetPhi(40.90062);
  c1->Divide(3,3);
    
  TCanvas *c2 = new TCanvas("c2", "c2",900,900);
  gStyle->SetOptFit(0);
  gStyle->SetOptStat(0);
  gStyle->SetOptTitle(0);
  c2->Range(0,0,1,1);
  c2->SetFillColor(0);
  c2->SetBorderMode(0);
  c2->SetBorderSize(2);
  //c1->SetLogy();
  c2->SetTickx(1);
  c2->SetTicky(1);
  c2->SetLeftMargin(0.16);
  c2->SetRightMargin(0.16);
  c2->SetTopMargin(0.05);
  c2->SetBottomMargin(0.13);
  c2->SetFrameFillStyle(0);
  c2->SetFrameBorderMode(0);
  c2->Divide(3,3);
    
  TH1::SetDefaultSumw2();
 
  // TString _pPbData = "PbPb_HIMinBiasUPC_PeakRegion095_175_NoCuts_YesCorrections_3_5PtBins.root";
  // TString _pPbData = "PbPb_HIMinBiasUPC_SideBand22_28_NoCuts_YesCorrections_3_5ptBin.root";
  TFile *_fpPbData = new TFile("inputFile.root", "r");
  if(!_fpPbData) {
    cerr << "\n Cannot find inputFile.root" << endl;
    return;
  }
  else {
    cout << "\n Found inputFile.root" << endl;
  }

  TH1F * _hEvent_pPb;
  double _nEvents_pPb;
  TH2D *_hSignal_pPb[8];
  TH2D *_hBackground_pPb[8];
    
  char *multText = new char[10];
  char *eventText = new char[100];
  char *signalText = new char[100];
  char *bkgText = new char[100];

  int lowMultiplicity = 120;
  int highMultiplicity = 150;
  bool goodMultOption = false;
  if(iMultOption == 0) {
    sprintf(multText, "EcalFlowNtpMult100");
    goodMultOption = true;
  }
  if(iMultOption == 1) {
    sprintf(multText, "EcalFlowNtpMult130");
    lowMultiplicity = 150;
    highMultiplicity = 185;
    goodMultOption = true;
  }
  if(iMultOption == 2) {
    sprintf(multText, "EcalFlowNtpMult160");
    lowMultiplicity = 185;
    highMultiplicity = 220;
    goodMultOption = true;
  }
  if(iMultOption == 3) {
    sprintf(multText, "EcalFlowNtpMult190");
    lowMultiplicity = 220;
    highMultiplicity = 260;
    goodMultOption = true;
  }

  if(goodMultOption) {
    sprintf(eventText, "%s/ChargedParticles/tHPTracks_", multText);
    sprintf(signalText, "%s/pi0HadCorrFunc/hSignalPtBin", multText);
    sprintf(bkgText, "%s/pi0HadCorrFunc/hBackgroundPtBin", multText);
  }
  else {
    cerr << "\n Multiplicity option " << iMultOption << " is not valid" << endl;
    return;
  } // safety check
   
  ofstream myfile;
  char *myFileName = new char[200];
  if(peakRegionFile) {
    sprintf(myFileName, "PeakRegion_%dMult%d.txt", lowMultiplicity, highMultiplicity);
  }
  if(sideBandFile) {
    sprintf(myFileName, "SideBand_%dMult%d.txt", lowMultiplicity, highMultiplicity);
  }
  cout << "\n Opening output text file " << myFileName << endl;
  myfile.open (myFileName);

  cout << "\n eventText = " << eventText;
  cout << "\n signalText= " << signalText;
  cout << "\n signalText = " << bkgText;
  cout << endl;

  char *_SignalHistoName1 = new char[200];
  char *_BkgHistoName1 = new char[200];
    
  float _pTmin[8] = {0.7, 1.0, 1.5, 2.0, 2.5, 3.0, 5.0, 6.0};
  float _ptMax[8] = {1.0, 1.5, 2.0, 2.5, 3.0, 5.0, 6.0, 8.0};
  float _SignalFraction[8] = {0.09, 0.23, 0.44, 0.59, 0.66, 0.71, 0.73, 0.74};
    
  _hEvent_pPb = (TH1F*)_fpPbData->Get(eventText);
  if(!_hEvent_pPb) {
    cerr << "\n Unable to find hEvent_pPb with name " << eventText << endl;
    return;
  }
  _nEvents_pPb = _hEvent_pPb->Integral();
    
  cout << "\n Number of events _nEvents_pPb = " << _nEvents_pPb << "; setting up 8 histogram names" << endl;
  for(int iCount=0; iCount<8; ++iCount)
    {
      sprintf(_SignalHistoName1, "%s%d", signalText, iCount);
      sprintf(_BkgHistoName1, "%s%d", bkgText, iCount);

      cout << " iCount = " << iCount << '\t' << "Signal name = " << _SignalHistoName1<<endl;
      cout << " iCount = " << iCount << '\t' << "Background name = " << _BkgHistoName1<<endl;
        
      _hSignal_pPb[iCount] = (TH2D*)_fpPbData->Get(_SignalHistoName1);
      if(!_hSignal_pPb[iCount]) {
	cerr << "\n Unable to find _hSignal_pPb[iCount]" << endl;
	return;
      }
      _hBackground_pPb[iCount] = (TH2D*)_fpPbData->Get(_BkgHistoName1);
      if(!_hBackground_pPb[iCount]) {
	cerr << "\n Unable to find _hBackground_pPb[iCount]" << endl;
	return;
      }
        
    } // loop over 8 histogram bins
    
  double  _etabinwidth = _hSignal_pPb[0]->GetXaxis()->GetBinWidth(1);
  double  _phibinwidth = _hSignal_pPb[0]->GetYaxis()->GetBinWidth(1);
    
  for(long iCount=0; iCount<8; ++iCount)
    {
      _hSignal_pPb[iCount]->Divide(_hBackground_pPb[iCount]);
      int _x0 = _hBackground_pPb[iCount]->GetXaxis()->FindBin(0.0);
      int _y0 = _hBackground_pPb[iCount]->GetYaxis()->FindBin(0.0);
      double _B0 = _hBackground_pPb[iCount]->GetBinContent(_x0,_y0);
      _hSignal_pPb[iCount]->Scale(_B0/(_nEvents_pPb));
      _hSignal_pPb[iCount]->Scale(1.0/_etabinwidth/_phibinwidth);
        
      c1->cd(iCount+1);
    
      _hSignal_pPb[iCount]->GetXaxis()->SetRange(5,29);
        
      /*  if(iCount==0) { _hSignal_pPb[iCount]->SetMaximum(3.1);
	  _hSignal_pPb[iCount]->SetMinimum(2.8);}
	  if(iCount==1) { _hSignal_pPb[iCount]->SetMaximum(3.1);
	  _hSignal_pPb[iCount]->SetMinimum(2.75);}
	  if(iCount==2) { _hSignal_pPb[iCount]->SetMaximum(1.18);
	  _hSignal_pPb[iCount]->SetMinimum(1.04);}
	  if(iCount==3) { _hSignal_pPb[iCount]->SetMaximum(0.45);
	  _hSignal_pPb[iCount]->SetMinimum(0.38);}
	  if(iCount==4) { _hSignal_pPb[iCount]->SetMaximum(0.18);
	  _hSignal_pPb[iCount]->SetMinimum(0.145);}
	  if(iCount==5) { _hSignal_pPb[iCount]->SetMaximum(0.072);
	  _hSignal_pPb[iCount]->SetMinimum(0.062);}
	  if(iCount==6) { _hSignal_pPb[iCount]->SetMaximum(0.038);
	  _hSignal_pPb[iCount]->SetMinimum(0.03);}
	  if(iCount==7) { _hSignal_pPb[iCount]->SetMaximum(0.03);
	  _hSignal_pPb[iCount]->SetMinimum(0.0255);}*/
        
      _hSignal_pPb[iCount]->GetXaxis()->SetTitle("#Delta#eta");
      _hSignal_pPb[iCount]->GetXaxis()->SetRange(5,29);
      _hSignal_pPb[iCount]->GetXaxis()->CenterTitle(true);
      _hSignal_pPb[iCount]->GetXaxis()->SetLabelFont(42);
      _hSignal_pPb[iCount]->GetXaxis()->SetLabelSize(0.035);
      _hSignal_pPb[iCount]->GetXaxis()->SetTitleSize(0.05);
      _hSignal_pPb[iCount]->GetXaxis()->SetTitleOffset(1.38);
      _hSignal_pPb[iCount]->GetXaxis()->SetTitleFont(42);
      _hSignal_pPb[iCount]->GetYaxis()->SetTitle("#Delta#phi");
      _hSignal_pPb[iCount]->GetYaxis()->CenterTitle(true);
      _hSignal_pPb[iCount]->GetYaxis()->SetLabelFont(42);
      _hSignal_pPb[iCount]->GetYaxis()->SetLabelSize(0.035);
      _hSignal_pPb[iCount]->GetYaxis()->SetTitleSize(0.05);
      _hSignal_pPb[iCount]->GetYaxis()->SetTitleOffset(1.59);
      _hSignal_pPb[iCount]->GetYaxis()->SetTitleFont(42);
      _hSignal_pPb[iCount]->GetZaxis()->SetTitle("#frac{1}{N_{trig}} #frac{d^{2}N^{pair}}{d#Delta#etad#Delta#phi}");
      _hSignal_pPb[iCount]->GetZaxis()->SetLabelFont(42);
      _hSignal_pPb[iCount]->GetZaxis()->SetLabelSize(0.035);
      _hSignal_pPb[iCount]->GetZaxis()->SetTitleSize(0.035);
      _hSignal_pPb[iCount]->GetZaxis()->SetTitleOffset(2.33);
      _hSignal_pPb[iCount]->GetZaxis()->SetTitleFont(42);
      _hSignal_pPb[iCount]->GetZaxis()->SetNdivisions(505);
      _hSignal_pPb[iCount]->Draw("SURF1");
        
      TLatex * tex = new TLatex(-0.8847018,0.9364877,Form("%5.1f < p_{T} < %5.1f (GeV/c)",_pTmin[iCount],_ptMax[iCount]));
      tex->SetTextSize(0.06);
      tex->Draw();

    } // loop ove 8 histogram bins
    
  cout <<"\n Now drawing the projections..." << endl;
  float etaMin = 2.0;
  float etaMax = 3.6;
    
  TString _Name = "projClone";
  TString _Name2 = "_pi0HadProj";
  TString _Name4 = "FourierDecompose";
  TString _Name1, _Name3, _Name5;
    
  TH2D *_projCorrFunc[9];
  TH1D * _pi0HadCorrProj[9];
  TF1 *_FourierDecompose[9];
  const int n = 9;
  double _Parameter0[n];
  double _Par0Error[n];
  double _Parameter2[n];
  double _Par2Error[n];
  // double _Parameter3[n];  // not used
  // double _Par3Error[n];   // not used
  double _Ratio[n];
  double _Error[n];
    
  for(long iCount=0; iCount<8; ++iCount)
    {
      _Name1 = _Name + iCount;
      _Name3 = _Name2 + iCount;
      _Name5 = _Name4 + iCount;
        
      _projCorrFunc[iCount] = (TH2D*) _hSignal_pPb[iCount]->Clone(_Name1);
      Int_t etabin10m=_projCorrFunc[iCount]->GetXaxis()->FindBin(etaMin+0.01);
      Int_t etabin10p=_projCorrFunc[iCount]->GetXaxis()->FindBin(etaMax-0.01);
    
      _pi0HadCorrProj[iCount] = (TH1D *) _projCorrFunc[iCount]->ProjectionY(_Name3,etabin10m,etabin10p,"e");
      _pi0HadCorrProj[iCount]->GetXaxis()->SetRange(8,24);
            
      c2->cd(iCount+1);
      _pi0HadCorrProj[iCount]->SetMarkerColor(4);
      _pi0HadCorrProj[iCount]->SetMarkerStyle(20);
      _pi0HadCorrProj[iCount]->SetMarkerSize(1.0);
      _pi0HadCorrProj[iCount]->GetXaxis()->SetTitle("#Delta#phi");
      _pi0HadCorrProj[iCount]->GetXaxis()->SetLabelFont(42);
      _pi0HadCorrProj[iCount]->GetXaxis()->SetTitleSize(0.06);
      _pi0HadCorrProj[iCount]->GetXaxis()->SetTitleOffset(0.67);
      _pi0HadCorrProj[iCount]->GetXaxis()->SetTitleFont(42);
      _pi0HadCorrProj[iCount]->GetYaxis()->SetTitle("Associated yield");
      _pi0HadCorrProj[iCount]->GetYaxis()->SetLabelFont(42);
      _pi0HadCorrProj[iCount]->GetYaxis()->SetTitleSize(0.06);
      _pi0HadCorrProj[iCount]->GetYaxis()->SetTitleOffset(0.77);
      _pi0HadCorrProj[iCount]->GetYaxis()->SetTitleFont(42);
      _pi0HadCorrProj[iCount]->GetZaxis()->SetLabelFont(42);
      _pi0HadCorrProj[iCount]->GetZaxis()->SetLabelSize(0.035);
      _pi0HadCorrProj[iCount]->GetZaxis()->SetTitleSize(0.035);
      _pi0HadCorrProj[iCount]->GetZaxis()->SetTitleFont(42);
      _pi0HadCorrProj[iCount]->Draw("E1");
    

      _FourierDecompose[iCount] = new TF1(_Name5, Function, -1.4, 4.88, 4);
      _FourierDecompose[iCount]->SetParNames("Par0","Par1","Par2","Par3");

      _pi0HadCorrProj[iCount]->Fit(_Name5, "", "", -1.4, 4.84); // Fitting the
      // complete range for better statistics
        
      /* _FourierDecompose[iCount] = new TF1(_Name5, v2Fit, -1.4, 4.88, 4);
	 _FourierDecompose[iCount]->SetParName(0, "Normalization");
	 _FourierDecompose[iCount]->SetParName(1, "v_{2}");
	 _FourierDecompose[iCount]->SetParameter(0, 9.0);
	 _FourierDecompose[iCount]->SetParameter(1, 0.01);
	 _pi0HadCorrProj[iCount]->Fit(_Name5, "", "", -1.4, 4.84);*/

        
      _Parameter0[iCount] = _FourierDecompose[iCount]->GetParameter(0);
      _Par0Error[iCount] = _FourierDecompose[iCount]->GetParError(0);
      _Parameter2[iCount] = _FourierDecompose[iCount]->GetParameter(2);
      _Par2Error[iCount] = _FourierDecompose[iCount]->GetParError(2);
      // _Parameter3[iCount] = _FourierDecompose[iCount]->GetParameter(3); // not used
      // _Par3Error[iCount] = _FourierDecompose[iCount]->GetParError(3);   // not used
    
      _Ratio[iCount] = _Parameter2[iCount]/_Parameter0[iCount];
        
      _Ratio[iCount] /= 0.08609;
        
      _Error[iCount] = _Ratio[iCount]*(sqrt((_Par2Error[iCount]/_Parameter2[iCount])*(_Par2Error[iCount]/_Parameter2[iCount]) + 
					    (_Par0Error[iCount]/_Parameter0[iCount])*(_Par0Error[iCount]/_Parameter0[iCount]) + 
					    (0.0001364/0.08609)*(0.0001364/0.08609)));
    
    }

  cout << "\n Now writing to the output text file " << myFileName << endl;
  cout << "------------------------****-------------------" << endl;
  for(long iCount=0; iCount<8; ++iCount)
    {

      cout << "Final v2(pi0) ["<< iCount << "] = " << _Ratio[iCount] << '\t' << _Error[iCount] << '\t' << _Error[iCount]/_SignalFraction[iCount] << endl;
      myfile << _Ratio[iCount] << '\t' << _Error[iCount] << endl;
    }
  cout <<"------------------------****-------------------" << endl;

  myfile.close();

}
