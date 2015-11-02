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
#include <TLine.h>

#include <DataFormats/Math/interface/deltaPhi.h>

using namespace std;

// v2 fit function
Double_t v2Fit(Double_t *x, Double_t *par) {
  return 1.0 + 2.0*par[0]*cos(2.0*x[0]);
}

void toyV2Generator(const unsigned int numberEvents=300,
		    const unsigned int particlesPerEvent=500,	
		    const bool useFlow=true,
		    const float v2Factor=0.20,
		    const bool writeHistogramFile=true,
		    const bool readHistogramFile=false,
		    const unsigned int nBinsOneD=100,
		    const unsigned int nBinsX=40,
		    const unsigned int nBinsY=40,
		    const unsigned int iBinXMinPlot=3,
		    const unsigned int iBinYMinPlot=3,
		    const unsigned int iBinXMaxPlot=37,
		    const unsigned int iBinYMaxPlot=37) {

  if(readHistogramFile && writeHistogramFile) {
    cerr << "\n Cannot do a simultaneous read and write of the histogram file";
    cerr << endl;
    return;
  }

  const unsigned int particlesPerEventLessOne = particlesPerEvent - 1;
  float particleEta[particlesPerEvent];
  float particlePhi[particlesPerEvent];
  float particlePhiLab[particlesPerEvent];

  float particleEtaPreviousEvent[particlesPerEvent];
  float particlePhiLabPreviousEvent[particlesPerEvent];

  //
  // Function to provide azimuthal angles according to a v2 distribution
  //
  char flowFunction[200];
  sprintf(flowFunction, "1.0 + %4.2f*2.0*cos(2.0*x)", v2Factor);
  TF1 *v2Flow = new TF1("v2Flow", flowFunction, 0.0, 2.0*TMath::Pi());

  const float highEtaBin = 3.0;
  const float lowEtaBin = -3.0;
  const float highPhiBin = 1.5*TMath::Pi();
  const float lowPhiBin = -0.5*TMath::Pi();

  float mixedEventWeight = float(particlesPerEvent)*float(particlesPerEvent - 1)/(2.0*float(particlesPerEvent*particlesPerEvent));

  //
  // Single particle range in eta will be half the maximum for deltaEta
  //
  const float diffEta = 0.5*(highEtaBin - lowEtaBin);

  TH1D *particlePhiHistogram = 0;
  TH1D *particlePhiLabHistogram = 0;
  TH1D *particleEtaHistogram = 0;

  TH1D *pairDeltaPhiHistogram = 0;
  TH1D *pairDeltaPhiHistogramMixed = 0;
  TH1D *pairDeltaPhiHistogramNormalized = 0;

  TH1D *pairDeltaEtaHistogram = 0;
  TH1D *pairDeltaEtaHistogramMixed = 0;
  TH1D *pairDeltaEtaHistogramNormalized = 0;

  TH2D *pairDeltaEtaDeltaPhiHistogram = 0;
  TH2D *pairDeltaEtaDeltaPhiHistogramMixed = 0;
  TH2D *pairDeltaEtaDeltaPhiHistogramNormalized = 0;

  if(!readHistogramFile) {

    particlePhiHistogram = new TH1D("particlePhiHistogram", "Particle azimuthal distribution in reaction plane", nBinsOneD, 0.0, 2.0*TMath::Pi());
    particlePhiHistogram->SetXTitle("Particle azimuthal angle #phi (radians)");
    particlePhiHistogram->SetYTitle("Counts per 0.063 radians bin");

    particlePhiLabHistogram = new TH1D("particlePhiLabHistogram", "Particle azimuthal distribution in lab frame", nBinsOneD, 0.0, 2.0*TMath::Pi());
    particlePhiLabHistogram->SetXTitle("Particle azimuthal angle #phi (radians)");
    particlePhiLabHistogram->SetYTitle("Counts per 0.063 radians bin");

    particleEtaHistogram = new TH1D("particleEtaHistogram", "Particle azimuthal distribution", nBinsOneD, lowEtaBin, highEtaBin);
    particleEtaHistogram->SetXTitle("Particle #eta");
    particleEtaHistogram->SetYTitle("Counts per 0.015 bin");

    pairDeltaPhiHistogram = new TH1D("pairDeltaPhiHistogram", "#Delta #phi pairs in lab frame", nBinsOneD, lowPhiBin, highPhiBin);
    pairDeltaPhiHistogram->SetXTitle("#Delta #phi (radians)");
    pairDeltaPhiHistogram->SetYTitle("Counts");

    pairDeltaPhiHistogramMixed = new TH1D("pairDeltaPhiHistogramMixed", "#Delta #phi pairs in lab frame, mixed-event", nBinsOneD, lowPhiBin, highPhiBin);
    pairDeltaPhiHistogramMixed->SetXTitle("#Delta #phi (radians)");
    pairDeltaPhiHistogramMixed->SetYTitle("Counts");

    pairDeltaPhiHistogramNormalized = new TH1D("pairDeltaPhiHistogramNormalized", "Normalized #Delta #phi pairs in lab frame", nBinsOneD, lowPhiBin, highPhiBin);
    pairDeltaPhiHistogramNormalized->SetXTitle("#Delta #phi (radians)");
    pairDeltaPhiHistogramNormalized->SetYTitle("Counts");

    pairDeltaEtaHistogram = new TH1D("pairDeltaEtaHistogram", "#Delta #eta Pairs, Same Event", nBinsOneD, lowEtaBin, highEtaBin);
    pairDeltaEtaHistogram->SetXTitle("#Delta #eta (radians)");
    pairDeltaEtaHistogram->SetYTitle("Counts");

    pairDeltaEtaHistogramMixed = new TH1D("pairDeltaEtaHistogramMixed", "#Delta #eta Pairs, Mixed Event", nBinsOneD, lowEtaBin, highEtaBin);
    pairDeltaEtaHistogramMixed->SetXTitle("#Delta #eta (radians)");
    pairDeltaEtaHistogramMixed->SetYTitle("Counts");

    pairDeltaEtaHistogramNormalized = new TH1D("pairDeltaEtaHistogramNormalized", "#Delta #eta Pairs, Normalized Event", nBinsOneD, lowEtaBin, highEtaBin);
    pairDeltaEtaHistogramNormalized->SetXTitle("#Delta #eta (radians)");
    pairDeltaEtaHistogramNormalized->SetYTitle("Counts");
    
    pairDeltaEtaDeltaPhiHistogram = new TH2D("pairDeltaEtaDeltaPhiHistogram", "Angular Correlation Pairs", nBinsX, lowEtaBin, highEtaBin, nBinsY, lowPhiBin, highPhiBin);
    pairDeltaEtaDeltaPhiHistogram->SetXTitle("#Delta #eta");
    pairDeltaEtaDeltaPhiHistogram->SetYTitle("#Delta #phi");

    pairDeltaEtaDeltaPhiHistogramMixed = new TH2D("pairDeltaEtaDeltaPhiHistogramMixed", "Angular Correlation Pairs", nBinsX, lowEtaBin, highEtaBin, nBinsY, lowPhiBin, highPhiBin);
    pairDeltaEtaDeltaPhiHistogramMixed->SetXTitle("#Delta #eta");
    pairDeltaEtaDeltaPhiHistogramMixed->SetYTitle("#Delta #phi");

    pairDeltaEtaDeltaPhiHistogramNormalized = new TH2D("pairDeltaEtaDeltaPhiHistogramNormalized", "Normalized Angular Correlation Pairs", nBinsX, lowEtaBin, highEtaBin, nBinsY, lowPhiBin, highPhiBin);
    pairDeltaEtaDeltaPhiHistogramNormalized->SetXTitle("#Delta #eta");
    pairDeltaEtaDeltaPhiHistogramNormalized->SetYTitle("#Delta #phi");

    //
    // Random number generator object
    //
    TRandom1 *particleKinematics = new TRandom1();
    particleKinematics->SetSeed(1);
		
    unsigned int numberEvents10 = numberEvents/10;

    for(unsigned int kEvent=0; kEvent<numberEvents; kEvent++) {
			
      if(kEvent>0 && kEvent%numberEvents10==0) {
	cout << "\n At kEvent = " << kEvent;
      }
			
      //
      // Randomize the reaction plane angle in the lab frame
      //
      float reactionPlaneAngleThisEvent = 2.0*(particleKinematics->Rndm())*TMath::Pi();
			
      //
      // Loop over particles per event
      //
      for(unsigned int kParticle=0; kParticle<particlesPerEvent; kParticle++) {
	particleEta[kParticle] = lowEtaBin + diffEta*(0.5 - particleKinematics->Rndm());
	if(useFlow) {
	  particlePhi[kParticle] = v2Flow->GetRandom();
	  if(particlePhi[kParticle] > 2.0*TMath::Pi())
	    particlePhi[kParticle] -= 2.0*TMath::Pi();

	  particlePhiLab[kParticle] =  particlePhi[kParticle] + reactionPlaneAngleThisEvent;
	  if(particlePhiLab[kParticle] > 2.0*TMath::Pi())
	    particlePhiLab[kParticle] -= 2.0*TMath::Pi();
	}
	else {
	  particlePhi[kParticle] = 2.0*(particleKinematics->Rndm())*TMath::Pi();
	  particlePhiLab[kParticle] =  particlePhi[kParticle];
	}
	particleEtaHistogram->Fill(particleEta[kParticle]);
	particlePhiHistogram->Fill(particlePhi[kParticle]);
 	particlePhiLabHistogram->Fill(particlePhiLab[kParticle]);

      } // loop over particles

      if(kEvent > 0) {
	//
	// Fill the pair histograms for the same event
	//
	for(unsigned int kParticle=0; kParticle<particlesPerEventLessOne; kParticle++) {
	  float phi1 = particlePhiLab[kParticle];
	  float eta1 = particleEta[kParticle];
	  unsigned int jParticleStart = kParticle + 1;
	  for(unsigned int jParticle=jParticleStart; jParticle<particlesPerEvent; jParticle++) {
	    float phiDelta = deltaPhi(phi1, particlePhiLab[jParticle]);

	    //
	    // Change the phiDelta range for plot purposes
	    //
	    if(phiDelta < -0.5*TMath::Pi())
	      phiDelta = TMath::Pi() + TMath::Pi() + phiDelta;

	    float etaDelta = eta1 - particleEta[jParticle];
	    pairDeltaPhiHistogram->Fill(phiDelta);
	    pairDeltaEtaHistogram->Fill(etaDelta, 0.5);
	    pairDeltaEtaHistogram->Fill(-etaDelta, 0.5);
	    pairDeltaEtaDeltaPhiHistogram->Fill(etaDelta, phiDelta, 0.5);
	    pairDeltaEtaDeltaPhiHistogram->Fill(-etaDelta, phiDelta, 0.5);
	  } // loop over second particle in same event pair

	} // loop over first particle in same event pair

	//
	// Fill the pair histograms for the mixed event
	//
	for(unsigned int kParticle=0; kParticle<particlesPerEvent; kParticle++) {
	  float phi1 = particlePhiLab[kParticle];
	  float eta1 = particleEta[kParticle];
	  for(unsigned int jParticle=0; jParticle<particlesPerEvent; jParticle++) {
	    float phiDelta = deltaPhi(phi1, particlePhiLabPreviousEvent[jParticle]);

	    //
	    // Change the phiDelta range for plot purposes
	    //
	    if(phiDelta < -0.5*TMath::Pi())
	      phiDelta = TMath::Pi() + TMath::Pi() + phiDelta;

	    pairDeltaPhiHistogramMixed->Fill(phiDelta, mixedEventWeight);
	    float etaDelta = eta1 - particleEtaPreviousEvent[jParticle];
	    pairDeltaEtaHistogramMixed->Fill(etaDelta,0.5);
	    pairDeltaEtaHistogramMixed->Fill(-etaDelta,0.5);
	    pairDeltaEtaDeltaPhiHistogramMixed->Fill(etaDelta, phiDelta, 0.5);
	    pairDeltaEtaDeltaPhiHistogramMixed->Fill(-etaDelta, phiDelta, 0.5);

	  } // loop over particle in previous event

	} // loop over particle in current event


      } // check on beyond the first event

      //
      // Move particles from current event to previous event arrays
      //
      for(unsigned int kParticle=0; kParticle<particlesPerEvent; kParticle++) {
	particlePhiLabPreviousEvent[kParticle] = particlePhiLab[kParticle];
	particleEtaPreviousEvent[kParticle] = particleEta[kParticle];
      }

    } // loop over events
    cout << "\n Finished NTUPLE scan" << endl;

    //
    // Normalize the delta-phi histograms with the mixed-event yields
    //
    float sumSameEventPhi1D = 0.0;
    float sumMixedEventPhi1D = 0.0;
    for(unsigned int iBinX=1; iBinX<nBinsOneD; iBinX++) {
      sumSameEventPhi1D += pairDeltaPhiHistogram->GetBinContent(iBinX);
      sumMixedEventPhi1D += pairDeltaPhiHistogramMixed->GetBinContent(iBinX);
    }
    if(sumSameEventPhi1D > 0.0 && sumMixedEventPhi1D > 0.0) {
      float normalizationFactor1D = sumMixedEventPhi1D/sumSameEventPhi1D;
      for(unsigned int iBinX=0; iBinX<nBinsOneD; iBinX++) {
	pairDeltaPhiHistogramNormalized->SetBinContent(iBinX,0.0);
	float sameEventContent = pairDeltaPhiHistogram->GetBinContent(iBinX);
	float mixedEventContent = pairDeltaPhiHistogramMixed->GetBinContent(iBinX);
	if(mixedEventContent > 0.0) {
	  float normalizedYield = normalizationFactor1D*sameEventContent/mixedEventContent;
	  pairDeltaPhiHistogramNormalized->SetBinContent(iBinX, normalizedYield);
	} // check for non-zero denominator
      } // loop over phi bins
    } // check for non-zero totals
		
    //
    // Normalize the delta-eta histograms with the mixed-event yields
    //
    float sumSameEvent1D = pairDeltaEtaHistogram->GetEntries();
    float sumMixedEvent1D = pairDeltaEtaHistogramMixed->GetEntries();
    if(sumSameEvent1D > 0.0 && sumMixedEvent1D > 0.0) {
      float normalizationFactor1D = sumMixedEvent1D/sumSameEvent1D;
      for(unsigned int iBinX=0; iBinX<nBinsOneD; iBinX++) {
	pairDeltaEtaHistogramNormalized->SetBinContent(iBinX,0.0);
	float sameEventContent = pairDeltaEtaHistogram->GetBinContent(iBinX);
	float mixedEventContent = pairDeltaEtaHistogramMixed->GetBinContent(iBinX);
	if(mixedEventContent > 0.0) {
	  float normalizedYield = normalizationFactor1D*sameEventContent/mixedEventContent;
	  pairDeltaEtaHistogramNormalized->SetBinContent(iBinX, normalizedYield);
	} // check for non-zero denominator
      } // loop over eta bins
    } // check for non-zero totals
		
    float sumSameEvent2D = pairDeltaEtaDeltaPhiHistogram->GetEntries();
    float sumMixedEvent2D = pairDeltaEtaDeltaPhiHistogramMixed->GetEntries();

    if(sumSameEvent2D > 0.0 && sumMixedEvent2D > 0.0) {
      float normalizationFactor2D = sumMixedEvent2D/sumSameEvent2D;
      for(unsigned int iBinX=0; iBinX<nBinsX; iBinX++) {
	for(unsigned int iBinY=0; iBinY<nBinsY; iBinY++) {
	  pairDeltaEtaDeltaPhiHistogramNormalized->SetBinContent(iBinX, iBinY, 0.0);
	  if(iBinX<iBinXMinPlot || iBinX>iBinXMaxPlot ||
	     iBinY<iBinYMinPlot || iBinY>iBinYMaxPlot)
	    continue;  // limit the fiducial area of the plot because of possible low statistics

	  float sameEventContent = pairDeltaEtaDeltaPhiHistogram->GetBinContent(iBinX, iBinY);
	  float mixedEventContent = pairDeltaEtaDeltaPhiHistogramMixed->GetBinContent(iBinX, iBinY);
	  if(mixedEventContent > 0.0) {
	    float normalizedYield = normalizationFactor2D*sameEventContent/mixedEventContent;
	    pairDeltaEtaDeltaPhiHistogramNormalized->SetBinContent(iBinX, iBinY, normalizedYield);
	  } // check for non-zero mixed event content
	} // loop over phi bins
      } // loop over eta bins
    } // check for non-zero total counts

  } // check on not reading histogram file

  if(readHistogramFile) {

    char inputFileName[200];
    sprintf(inputFileName, "toyV2Generator%dEvents%dParticlesPerEvent%4.2fV2.root", numberEvents, particlesPerEvent, v2Factor);
    TFile *toyV2GeneratorFile = new TFile(inputFileName);
		
    if(!toyV2GeneratorFile) {
      cerr << "\n Unable to find ROOT file " <<  inputFileName << endl;
      return;
    }

    cout << "\n Using input ROOT file " << inputFileName << endl;
		
    particlePhiHistogram = (TH1D*)toyV2GeneratorFile->Get("particlePhiHistogram");
    if(!particlePhiHistogram) {
      cerr << "\n Cannot find particlePhiHistogram" << endl;
      return;
    }

    particlePhiLabHistogram = (TH1D*)toyV2GeneratorFile->Get("particlePhiLabHistogram");
    if(!particlePhiLabHistogram) {
      cerr << "\n Cannot find particlePhiLabHistogram" << endl;
      return;
    }

    particleEtaHistogram = (TH1D*)toyV2GeneratorFile->Get("particleEtaHistogram");
    if(!particleEtaHistogram) {
      cerr << "\n Cannot find particleEtaHistogram" << endl;
      return;
    }
		
    pairDeltaPhiHistogram = (TH1D*)toyV2GeneratorFile->Get("pairDeltaPhiHistogram");
    if(!pairDeltaPhiHistogram) {
      cerr << "\n Cannot find pairDeltaPhiHistogram" << endl;
      return;
    }		

    pairDeltaPhiHistogramMixed = (TH1D*)toyV2GeneratorFile->Get("pairDeltaPhiHistogramMixed");
    if(!pairDeltaPhiHistogramMixed) {
      cerr << "\n Cannot find pairDeltaPhiHistogramMixed" << endl;
      return;
    }

    pairDeltaPhiHistogramNormalized = (TH1D*)toyV2GeneratorFile->Get("pairDeltaPhiHistogramNormalized");
    if(!pairDeltaPhiHistogramNormalized) {
      cerr << "\n Cannot find pairDeltaPhiHistogramNormalized" << endl;
      return;
    }

    pairDeltaEtaHistogram = (TH1D*)toyV2GeneratorFile->Get("pairDeltaEtaHistogram");
    if(!pairDeltaEtaHistogram) {
      cerr << "\n Cannot find pairDeltaEtaHistogram" << endl;
      return;
    }

    pairDeltaEtaHistogramMixed = (TH1D*)toyV2GeneratorFile->Get("pairDeltaEtaHistogramMixed");
    if(!pairDeltaEtaHistogramMixed) {
      cerr << "\n Cannot find pairDeltaEtaHistogramMixed" << endl;
      return;
    }

    pairDeltaEtaHistogramNormalized = (TH1D*)toyV2GeneratorFile->Get("pairDeltaEtaHistogramNormalized");
    if(!pairDeltaEtaHistogramNormalized) {
      cerr << "\n Cannot find pairDeltaEtaHistogramNormalized" << endl;
      return;
    }

    pairDeltaEtaDeltaPhiHistogram = (TH2D*)toyV2GeneratorFile->Get("pairDeltaEtaDeltaPhiHistogram");
    if(!pairDeltaEtaDeltaPhiHistogram) {
      cerr << "\n Cannot find pairDeltaEtaDeltaPhiHistogram" << endl;
      return;
    }

    pairDeltaEtaDeltaPhiHistogramMixed = (TH2D*)toyV2GeneratorFile->Get("pairDeltaEtaDeltaPhiHistogramMixed");
    if(!pairDeltaEtaDeltaPhiHistogramMixed) {
      cerr << "\n Cannot find pairDeltaEtaDeltaPhiHistogramMixed" << endl;
      return;
    }

    pairDeltaEtaDeltaPhiHistogramNormalized = (TH2D*)toyV2GeneratorFile->Get("pairDeltaEtaDeltaPhiHistogramNormalized");
    if(!pairDeltaEtaDeltaPhiHistogramNormalized) {
      cerr << "\n Cannot find pairDeltaEtaDeltaPhiHistogramNormalized" << endl;
      return;
    }

  } // check on readHistogramFile

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

  c1->Divide(2,2);

  c1->cd(1);
  
  if(useFlow) {
    particlePhiHistogram->SetStats(0);
    particlePhiHistogram->SetMinimum(0);
    float fMaximum = particlePhiHistogram->GetMaximum();
    int iMaximum = 1.5*fMaximum;
    particlePhiHistogram->SetMaximum(iMaximum);
		
    particlePhiHistogram->SetLineColor(4);
    particlePhiHistogram->Draw();
    particlePhiLabHistogram->SetLineColor(1);
    particlePhiLabHistogram->Draw("same");
		
    char labelBufferTitle[200];
    sprintf(labelBufferTitle, "Events = %d, Particles/Event = %d, V2 factor = %4.2f", numberEvents, particlesPerEvent, v2Factor);
    TLatex *text1 = new TLatex(0.5, 0.90*iMaximum, labelBufferTitle);
    text1->SetTextColor(4);
    text1->SetTextSize(0.045);
    text1->Draw();
		
    char labelBuffer2[200];
    sprintf(labelBuffer2, "Blue: azimuthal distribution relative to reaction plane");
    TLatex *text2 = new TLatex(0.5, 0.20*iMaximum, labelBuffer2);
    text2->SetTextColor(4);
    text2->SetTextSize(0.035);
    text2->Draw();
		
    char labelBuffer3[200];
    sprintf(labelBuffer3, "Black: azimuthal distribution relative to lab frame");
    TLatex *text3 = new TLatex(0.5, 0.10*iMaximum, labelBuffer3);
    text3->SetTextColor(1);
    text3->SetTextSize(0.035);
    text3->Draw();
		
  }
  else {
    particlePhiLabHistogram->SetStats(0);
    float fMaximum = particlePhiLabHistogram->GetMaximum();
    int iMaximum = 1.5*fMaximum;
    particlePhiLabHistogram->SetMaximum(iMaximum);
    particlePhiLabHistogram->SetMinimum(0);
    particlePhiLabHistogram->Draw();
		
    char labelBufferTitle[200];
    sprintf(labelBufferTitle, "Events = %d, Particles/Event = %d, No Flow", numberEvents, particlesPerEvent);
    TLatex *text1 = new TLatex(0.5, 0.90*iMaximum, labelBufferTitle);
    text1->SetTextColor(4);
    text1->SetTextSize(0.045);
    text1->Draw();
		
  }

  c1->cd(2);
  //pairDeltaPhiHistogramNormalized->SetStats(0);
  pairDeltaPhiHistogramNormalized->SetMaximum(1.3);
  pairDeltaPhiHistogramNormalized->SetMinimum(0.7);
  pairDeltaPhiHistogramNormalized->SetLineColor(2);

  TF1* fitFcnV2 = new TF1("fitFcnV2", v2Fit, -0.5*TMath::Pi(), 1.5*TMath::Pi(), 1);
  fitFcnV2->SetParameters(0, 0.20);
  fitFcnV2->SetParName(0, "Coeff");

  pairDeltaPhiHistogramNormalized->Fit("fitFcnV2", "", "",  -0.5*TMath::Pi(), 1.5*TMath::Pi());

  char labelBuffer12[200];
  sprintf(labelBuffer12, "Blue: fit with 1.0 + 2.0*Coeff*cos(2#Delta#phi), Coeff = %4.3f", fitFcnV2->GetParameter(0));
  TLatex *text12 = new TLatex(-0.5, 0.83, labelBuffer12);
  text12->SetTextColor(4);
  text12->SetTextSize(0.035);
  text12->Draw();

  char labelBuffer22[200];
  sprintf(labelBuffer22, "Red: normalized pair #Delta#phi distribution in lab frame");
  TLatex *text22 = new TLatex(-0.5, 0.77, labelBuffer22);
  text22->SetTextColor(2);
  text22->SetTextSize(0.035);
  text22->Draw();

  c1->cd(3);
  pairDeltaEtaHistogramNormalized->SetStats(0);
  pairDeltaEtaHistogramNormalized->SetMaximum(1.5);
  pairDeltaEtaHistogramNormalized->SetMinimum(0);
  pairDeltaEtaHistogramNormalized->Draw();
	
  c1->cd(4);
  pairDeltaEtaDeltaPhiHistogramNormalized->SetStats(0);
  pairDeltaEtaDeltaPhiHistogramNormalized->SetMaximum(1.3);
  pairDeltaEtaDeltaPhiHistogramNormalized->SetMinimum(0.7);
  pairDeltaEtaDeltaPhiHistogramNormalized->Draw("surf1");

  if(writeHistogramFile) {
    TFile *toyV2GeneratorFile;
		
    char outputFileName[200];
    sprintf(outputFileName, "toyV2Generator%dEvents%dParticlesPerEvent%4.2fV2.root", numberEvents, particlesPerEvent, v2Factor);
    char outputFileTitle[200];
    sprintf(outputFileTitle, "Toy V2 Generator with %d Events, %d Particles/Event, and V2 = %4.2f", numberEvents, particlesPerEvent, v2Factor);
    toyV2GeneratorFile = new TFile(outputFileName, "recreate", outputFileTitle);

    particlePhiHistogram->Write();
    particlePhiLabHistogram->Write();
    particleEtaHistogram->Write();

    pairDeltaPhiHistogram->Write();
    pairDeltaPhiHistogramMixed->Write();
    pairDeltaPhiHistogramNormalized->Write();

    pairDeltaEtaHistogram->Write();
    pairDeltaEtaHistogramMixed->Write();
    pairDeltaEtaHistogramNormalized->Write();

    pairDeltaEtaDeltaPhiHistogram->Write();
    pairDeltaEtaDeltaPhiHistogramMixed->Write();
    pairDeltaEtaDeltaPhiHistogramNormalized->Write();
		
    toyV2GeneratorFile->Write();
    toyV2GeneratorFile->Close();

  }

  return;

}
