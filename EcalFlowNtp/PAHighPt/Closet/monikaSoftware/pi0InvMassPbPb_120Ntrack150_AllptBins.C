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

// Gauss peak function
Double_t gaussPeak(Double_t *x, Double_t *par) {
  if(par[2] != 0.0) {
    double arg = x[0] - par[1];
    return par[0]*exp(-arg*arg/(2*par[2]*par[2]));
  }
  return 0.0;
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


void pi0InvMassPbPb_120Ntrack150_AllptBins()
{
  
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
  
 // TString _trueHistogramFile = "PbPb_HIMinBiasUPC_PeakRegion095_175_NoCuts_YesCorrections.root";
  TString _trueHistogramFile = "PbPb_HIMinBiasUPC_PeakRegion095_175_NoCuts_YesCorrections_3_5PtBins.root";
  
  TFile *_ftrueHistogram = new TFile(_trueHistogramFile, "r");
  
  const int iRange = 10;
  TString _trueHistoName[iRange];
  TString _mixedHistoName[iRange];
  TString _baseNameTrue = "EcalFlowNtpMult100/NeutralPions/pi0MassSameEventPtBin";
  TString _baseNameMixed = "EcalFlowNtpMult100/NeutralPions/pi0MassMixedEventPtBin";
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
  double _PeakRegion_120M150[iFile], _PeakRegionErr_120M150[iFile];
  double _SideBand_120M150[iFile], _SideBandErr_120M150[iFile];
  double v2Sig[iFile], v2SigErr[iFile];
  

  TString _filePeakRegion_120M150 = "/Users/monikas/Project2-diPionCorrelations/pPbJan2013/Jan062014/PbPbData/PbPbData/NoCutsYesCorrections/PeakRegion/120Mult150/PeakRegion_120Mult150.txt";

  TString _fileSideBand_120M150 = "/Users/monikas/Project2-diPionCorrelations/pPbJan2013/Jan062014/PbPbData/PbPbData/NoCutsYesCorrections/SideBand/120Mult150/SideBand_120Mult150.txt";
    
  ifstream PeakRegion120M150;
  PeakRegion120M150.open(_filePeakRegion_120M150, ifstream::in);
  int nPoints=0;
    
  if(PeakRegion120M150.is_open())
    {
        cout << "---< Reading peak region data points first >---" <<_filePeakRegion_120M150<<endl;
        std::string line;
        while(std::getline(PeakRegion120M150,line,'\n'))
        {
            double x,ex;
            int res = sscanf(line.c_str(),"%lg %lg",&x,&ex);
         
            _PeakRegion_120M150[nPoints]=x;
            _PeakRegionErr_120M150[nPoints]=ex;
            
            cout <<"x="<<_PeakRegion_120M150[nPoints]<<'\t'<<"ex="<<_PeakRegionErr_120M150[nPoints]<<endl;
            nPoints++;
        }
    }
    else cout<< "---< Oops there is a problem with peak region file....." <<endl;
    
    
  ifstream SideBand120M150;
  SideBand120M150.open(_fileSideBand_120M150, ifstream::in);
  int nPoints1=0;
    
  if(SideBand120M150.is_open())
    {
        cout << "---< Reading side band data points first >---" <<_fileSideBand_120M150<<endl;
        std::string line1;
        while(std::getline(SideBand120M150,line1,'\n'))
        {
            double x1,ex1;
            int res = sscanf(line1.c_str(),"%lg %lg",&x1,&ex1);
          
            _SideBand_120M150[nPoints1]=x1;
            _SideBandErr_120M150[nPoints1]=ex1;
            
            cout <<"x="<<_SideBand_120M150[nPoints1]<<'\t'<<"ex="<<_SideBandErr_120M150[nPoints1]<<endl;
           // cout <<"x="<<x1<<'\t'<<"ex="<<ex1<<endl;
            nPoints1++;
        }
    }
    else cout<< "---< Oops there is a problem with side band file....." <<endl;
    
  const int nMassBins = 200;
  const float lowFalsePairMassCut=0.200;
  const float highFalsePairMassCut=0.250;
  const float subtractedStart=0.06;
  const float subtractedEnd=0.20;
  const float maximumPi0MassForHistogram = 0.30;
    
  for(long iptBin=0; iptBin<8; iptBin++)
    {
	_trueHistoName[iptBin] = _baseNameTrue+iptBin;
	cout<<_baseNameTrue+iptBin<<endl;
	_mixedHistoName[iptBin] = _baseNameMixed+iptBin;
        
	_trueHisto[iptBin] = (TH1D*)_ftrueHistogram->Get(_trueHistoName[iptBin]);
	_mixedHisto[iptBin] = (TH1D*)_ftrueHistogram->Get(_mixedHistoName[iptBin]);
    }
  
  const float pTbins[11] = {0.7, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 5.0, 6.0, 8.0};
  
  const int iPad = 8;
  for(int nn=0; nn<iPad; nn++)
    {
        if(nn < 4){
            c1->cd(nn+1);
            _trueHisto[nn]->SetTitle("");
            _trueHisto[nn]->SetMarkerStyle(20);
            _trueHisto[nn]->SetMarkerSize(0.8);
            _trueHisto[nn]->SetMaximum(57000);
            _trueHisto[nn]->SetMinimum(-1087.21);
            _trueHisto[nn]->GetYaxis()->SetTitle("dN/dm_{#gamma#gamma} [1 MeV/c^{2}]");
            _trueHisto[nn]->GetYaxis()->SetNoExponent();
            _trueHisto[nn]->GetYaxis()->SetLabelFont(42);
            _trueHisto[nn]->GetYaxis()->SetLabelSize(0.05);
            _trueHisto[nn]->GetYaxis()->SetTitleSize(0.08);
            _trueHisto[nn]->GetYaxis()->SetTitleFont(42);
            _trueHisto[nn]->GetYaxis()->SetTitleOffset(1.4);
            _trueHisto[nn]->Draw();
            _mixedHisto[nn]->SetLineColor(kRed);
            _mixedHisto[nn]->SetLineWidth(2);
      
            char name[8];
            sprintf(name,"h1_%d",nn);
            char name1[8];
            sprintf(name1,"h2_%d",nn);
      
      
            pi0MassMixedCopy[nn] = new TH1D(name,"", nMassBins, 0.0, maximumPi0MassForHistogram);
            pi0MassMixedCopy[nn]->GetYaxis()->SetTitle("dN/dm_{#gamma#gamma} [1 MeV/c^{2}]");
            pi0MassMixedCopy[nn]->GetYaxis()->SetNoExponent();
            pi0MassMixedCopy[nn]->GetYaxis()->SetLabelFont(42);
            pi0MassMixedCopy[nn]->GetYaxis()->SetLabelSize(0.05);
            pi0MassMixedCopy[nn]->GetYaxis()->SetTitleSize(0.08);
            pi0MassMixedCopy[nn]->GetYaxis()->SetTitleFont(42);
      
            pi0MassSubtracted[nn] = new TH1D(name1, "", nMassBins, 0.0, maximumPi0MassForHistogram);
            pi0MassSubtracted[nn]->SetMarkerStyle(20);
            pi0MassSubtracted[nn]->SetMarkerSize(0.8);
            pi0MassSubtracted[nn]->GetXaxis()->SetTitle("m_{#gamma#gamma} [GeV/c^{2}]");
            pi0MassSubtracted[nn]->GetXaxis()->SetLabelFont(42);
            pi0MassSubtracted[nn]->GetXaxis()->SetLabelSize(0.05);
            pi0MassSubtracted[nn]->GetXaxis()->SetTitleSize(0.06);
            pi0MassSubtracted[nn]->GetXaxis()->SetTitleFont(42);
            pi0MassSubtracted[nn]->GetYaxis()->SetTitle("dN/dm_{#gamma#gamma} [1 MeV/c^{2}]");
            pi0MassSubtracted[nn]->GetYaxis()->SetLabelFont(42);
            pi0MassSubtracted[nn]->GetYaxis()->SetLabelSize(0.05);
            pi0MassSubtracted[nn]->GetYaxis()->SetTitleSize(0.07);
            pi0MassSubtracted[nn]->GetYaxis()->SetTitleOffset(1.4);
            pi0MassSubtracted[nn]->GetYaxis()->SetTitleFont(42);
            pi0MassSubtracted[nn]->GetZaxis()->SetLabelFont(42);
            pi0MassSubtracted[nn]->GetZaxis()->SetLabelSize(0.035);
            pi0MassSubtracted[nn]->GetZaxis()->SetTitleSize(0.035);
            pi0MassSubtracted[nn]->GetZaxis()->SetTitleFont(42);
      
            double sameEventCount = 0.0;
            double MixedEventCount = 0.0;
            float MixedEventNormalizationFactor = 0.0;
            float MixedEventNormalizationErrorFactor = 0.0;
      
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
                MixedEventNormalizationFactor = normalizationFactorMixed;
                MixedEventNormalizationErrorFactor = sqrt(1.0/sameEventCount + 1.0/MixedEventCount);
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
            
                if(nn==0){
                    c1->cd(nn+1);
                    TLatex *tex = new TLatex(0.02,28100,"CMS PbPb #sqrt{s_{NN}}=2.76 TeV");
                    tex->SetTextFont(42);
                    tex->SetTextSize(0.06974556);
                    tex->SetLineWidth(2);
                    tex->Draw();
                    tex = new TLatex(0.02,22000,"|#eta|<1.5");
                    tex->SetTextFont(42);
                    tex->SetTextSize(0.06974556);
                    tex->SetLineWidth(2);
                    tex->Draw();
                
                    tex = new TLatex(0.09,1500,"120 #leq N_{track}^{offline} < 150");
                    tex->SetTextFont(42);
                    tex->SetTextSize(0.06974556);
                    tex->SetLineWidth(2);
                    tex->Draw();
                    TLatex *tex = new TLatex(0.08,6000,Form("%5.1f < p_{T} < %5.1f (GeV/c)",pTbins[nn],pTbins[nn+1]));
                    tex->SetTextFont(42);
                    tex->SetTextSize(0.06974556);
                    tex->SetLineWidth(2);
                    tex->Draw();
                }
               if(nn>0){
                TLatex *tex = new TLatex(0.014,22100,Form("%5.1f < p_{T} < %5.1f (GeV/c)",pTbins[nn],pTbins[nn+1]));
                tex->SetTextFont(42);
                tex->SetTextSize(0.06974556);
                tex->SetLineWidth(2);
                tex->Draw();
               }
            }
        }// Loop over <4 condition
      
        if(nn >=4 && nn<=7)
            {
                cout<<"I am here..."<<endl;
                c1->cd(nn+1);
                cout<<"nn = "<<nn<<'\t'<<nn-4<<endl;
                fMaxHistValue[nn-4] = pi0MassSubtracted[nn-4]->GetBinContent(pi0MassSubtracted[nn-4]->GetMaximumBin());
          
                char name2[100];
                sprintf(name2,"fitFcn_%d",nn);
                fitFcn[nn-4] =  new TF1(name2, gaussPeak, subtractedStart, subtractedEnd, 3);
                fitFcn[nn-4]->SetParName(0, "peak Amplitude");
                fitFcn[nn-4]->SetParName(1, "peak Centroid");
                fitFcn[nn-4]->SetParName(2, "peak Sigma");
                fitFcn[nn-4]->SetParameters(13519, 0.135, 0.03);
                pi0MassSubtracted[nn-4]->Fit(name2, "", "", subtractedStart, subtractedEnd);
                fitFcn[nn-4]->SetLineColor(kRed);
          
                pi0MassSubtracted[nn-4]->SetMaximum(10500.0);
                pi0MassSubtracted[nn-4]->SetMinimum(-1000.0);
                pi0MassSubtracted[nn-4]->Draw();
          
                peakCentroid[nn-4] = fitFcn[nn-4]->GetParameter(1);
                peakCentroidError[nn-4] = fitFcn[nn-4]->GetParError(1);
                peakWidth[nn-4] = fabs(fitFcn[nn-4]->GetParameter(2));
                peakWidthError[nn-4] = fitFcn[nn-4]->GetParError(2);
                
                char fName[200];
                sprintf(fName, "Mass = %5.1f #pm %5.1f MeV", 1000.0*peakCentroid[nn-4], 1000.0*peakCentroidError[nn-4]);
                TLatex *tSB1 = new TLatex(0.065,7500, fName);
                tSB1->SetTextColor(4);
                tSB1->SetTextSize(0.055);
                tSB1->Draw();
                
                char fName1[200];
                sprintf(fName1, "Width = %5.1f #pm %5.1f MeV", 1000.0*peakWidth[nn-4], 1000.0*peakWidthError[nn-4]);
                TLatex *tSB2 = new TLatex(0.065, 6800, fName1);
                tSB2->SetTextColor(4);
                tSB2->SetTextSize(0.055);
                tSB2->Draw();
                
                TLine *line3 = new TLine(0.00,0.0,0.3,0.0);
                line3->SetLineWidth(2);
                line3->Draw();
                
                TLine *line2 = new TLine(peakCentroid[nn-4],0.0,peakCentroid[nn-4],fMaxHistValue[nn-4]/1.2);
                line2->SetLineWidth(2);
                line2->SetLineColor(kMagenta);
                line2->Draw();
                
                int sumSubtractedYield = 0;
                float sumSubtractedError = 0.0;
                float mixedEventYield = 0.0;
                float subtractedYieldErrors = 0.0;
                float binLowForYield = peakCentroid[nn-4] - 2.0*peakWidth[nn-4];
                float binHighForYield = peakCentroid[nn-4] + 2.0*peakWidth[nn-4];
              
        
                for(int kBin=1; kBin<=nMassBins; kBin++) {
                    double binCenter = pi0MassSubtracted[nn-4]->GetBinCenter(kBin);
                    if(binCenter >= binLowForYield && binCenter <= binHighForYield) {
                        sumSubtractedYield += pi0MassSubtracted[nn-4]->GetBinContent(kBin);
                        mixedEventYield += pi0MassMixedCopy[nn-4]->GetBinContent(kBin);
                        double binError = pi0MassSubtracted[nn-4]->GetBinError(kBin);
                        sumSubtractedError += binError*binError;
                    } // check mass bin
                } // sum over mass bins
                
                sumSubtractedError = sqrt(sumSubtractedError);
              //  float mixedEventYieldError = MixedEventNormalizationErrorFactor*
                //  MixedEventNormalizationErrorFactor*mixedEventYield;
                float mixedEventYieldError = MixedEventNormalizationErrorFactor*mixedEventYield;
                
                subtractedYieldErrors = sqrt(sumSubtractedError*sumSubtractedError +
                                             mixedEventYieldError*mixedEventYieldError);
                
                char fName3[200];
                sprintf(fName3, "Signal yield = %d #pm %d", int(sumSubtractedYield), int(sumSubtractedError));
                TLatex *tSB3 = new TLatex(0.03, 6000, fName3);
                tSB3->SetTextColor(2);
                tSB3->SetTextSize(0.055);
                tSB3->Draw();
                
                char fName4[200];
                sprintf(fName4, "Mixed-event yield = %d #pm %d", int(mixedEventYield), int(mixedEventYieldError));
                TLatex *tSB4 = new TLatex(0.03, 5200, fName4);
                tSB4->SetTextColor(2);
                tSB4->SetTextSize(0.055);
                tSB4->Draw();
                
                char fName5[200];
                sprintf(fName5, "f= S/(S+B) = %5.2f", (sumSubtractedYield/(sumSubtractedYield+mixedEventYield)));
                TLatex *tSB5 = new TLatex(0.14, 4000, fName5);
                tSB5->SetTextColor(2);
                tSB5->SetTextSize(0.055);
                tSB5->Draw();
                
                float S_B = sumSubtractedYield/mixedEventYield;
                float FracSig = sumSubtractedYield/(sumSubtractedYield+mixedEventYield);
                float FracBkg = 1-FracSig;
                float a0 = sumSubtractedYield;
                float c0 = sumSubtractedYield+mixedEventYield;
                float b0 = mixedEventYield;
                float Db0 = mixedEventYieldError;
                float Da0 = sumSubtractedError;
                
                //Alternative method:
                double v2Signal1  = ((_PeakRegion_120M150[nn-4])*(c0/a0)) - ((_SideBand_120M150[nn-4])*(b0/a0));
                
                double v2Obs = FracSig*_PeakRegion_120M150[nn-4] + FracBkg*_SideBand_120M150[nn-4];
                double v2Signal = (v2Obs - FracBkg*_SideBand_120M150[nn-4])/FracSig;
                v2Sig[nn-4] = (v2Obs - FracBkg*_SideBand_120M150[nn-4])/FracSig;
                
                double TermI = (c0/a0)*(c0/a0)*_PeakRegionErr_120M150[nn-4]*_PeakRegionErr_120M150[nn-4];
                double TermII = (b0/a0)*(b0/a0)*_SideBandErr_120M150[nn-4]*_SideBandErr_120M150[nn-4];
                double TermIII = (_PeakRegion_120M150[nn-4] - _SideBand_120M150[nn-4])*(_PeakRegion_120M150[nn-4] - _SideBand_120M150[nn-4])*(c0/a0)*(c0/a0)*(Da0/a0)*(Da0/a0);
                
                
                double Error = TermI+TermII+TermIII;
                
               // double v2SigError = Error;
                double v2SigError = sqrt((_PeakRegionErr_120M150[nn-4]*_PeakRegionErr_120M150[nn-4]) + (FracBkg*FracBkg*_SideBandErr_120M150[nn-4]*_SideBandErr_120M150[nn-4]))/FracSig;
                v2SigErr[nn-4] = sqrt((_PeakRegionErr_120M150[nn-4]*_PeakRegionErr_120M150[nn-4]) + (FracBkg*FracBkg*_SideBandErr_120M150[nn-4]*_SideBandErr_120M150[nn-4]))/FracSig;
                
                cout<<"***********************************"<<endl;
                cout<<Form("%5.1f < p_{T} < %5.1f (GeV/c)",pTbins[nn-4],pTbins[nn-3])<<endl;
                cout<<"------------"<<nn-4<<"-------------"<<endl;
                cout<<_PeakRegionErr_120M150[nn-4]<<'\t'<<_SideBandErr_120M150[nn-4]<<endl;
                cout<<"a0 ="<<a0<<'\t'<<"b0 = "<<b0<<'\t'<<"c0 = "<<c0<<endl;
                cout<<"Term I = "<<TermI<<'\t'<<"Term II = "<<TermII<<endl;
                cout<<"******* pi0 v2 value = "<<v2Signal<<'\t'<<v2Signal1<<'\t'<<Error<<endl;
                cout<<"******* pi0 v2 value = "<<v2Sig[nn-4]<<endl;
                cout<<"********pi0 v2 error = "<<v2SigError<<endl;
                cout<<"********pi0 v2 error = "<<v2SigErr[nn-4]<<endl;
                cout<<"***********************************"<<endl;
            }
        
    }
    
    cout<<"***********************************"<<endl;
    for(int nn=0; nn<4; nn++)
    {
        cout<<Form("%5.1f < p_{T} < %5.1f (GeV/c)",pTbins[nn],pTbins[nn+1])<<'\t'<<"v2 Signal = "<<v2Sig[nn]<<'\t'<<"v2 signal error = "<<v2SigErr[nn]<<endl;
    }
    cout<<"***********************************"<<endl;
}
