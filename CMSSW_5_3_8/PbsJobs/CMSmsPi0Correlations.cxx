#include <iostream>
#include "TVector3.h"
#include "CMSmsPi0Correlations.h"

ClassImp(CMSmsPi0Correlations);

CMSmsPi0Correlations::CMSmsPi0Correlations(){
    const unsigned int bufferDepth=3;
    const float lowEtaLimit=-1.5;
    const float highEtaLimit=+1.5;
    const float lowPtCut=1.6;
    const float highPtCut=8.0;
    const float clustEnrCut=0.4;
    const float clustS49Cut=0.87;
    
    // aOpenAngleCutParameter/pT + bOpenAngleCutParameter/pT*pT
    const float aOpenAngleCutParameter=0.1699;
    const float bOpenAngleCutParameter=-0.1115;
    
    const float lowTruePairMassCut=0.100;
    const float highTruePairMassCut=0.176;
    const float clustS1Cut = 0.2;
    const float lowZVertex=-15.0;
    const float highZVertex=+15.0;
    const float subtractedStart=0.090;
    const float subtractedEnd=0.180;
    
    //Used for the CF
    double etaMin_ass_ = -2.0;
    double etaMax_ass_ = 2.0;
    double ptMin_ass_ = 1.6;
    double ptMax_ass_ = 8.0;
    int bkgFactor_ = 10;
    vector<TVector3> *pVect_trg;
    vector<TVector3> *pVect_ass;
    int nMult_trg;
    int nMult_ass;
} //Constructor

CMSmsPi0Correlations::~CMSmsPi0Correlations()
{  } //Destructor

void CMSmsPi0Correlations::ReadTTree(const char *FileName){
 
    TFile *f1 = new TFile(FileName, "r");
	if (!f1) {
        cerr << "\n Unable to find file " << FileName;
        cerr << endl;
        return;
	}
    
    TTree *h1 = (TTree*)f1->Get("h1");
	if(!h1) {
        cerr << "\n Unable to find h1 tree";
        cerr << "\n Skipping kFile " << " " << FileName << endl;
        cerr << endl;
	}
    
    // Set branch addresses.
	h1->SetBranchAddress("Run",&Run);
	h1->SetBranchAddress("Event",&Event);
	h1->SetBranchAddress("LumiSection",&LumiSection);
	h1->SetBranchAddress("cent_val",&cent_val);
	h1->SetBranchAddress("cent_bin",&cent_bin);
	h1->SetBranchAddress("nHITracks",&nHITracks);
	h1->SetBranchAddress("zVertEvt",&zVertEvt);
	h1->SetBranchAddress("zVertEvtS",&zVertEvtS);
	h1->SetBranchAddress("PGAngle",&PGAngle);
	h1->SetBranchAddress("NGAngle",&NGAngle);
	h1->SetBranchAddress("HFAngle",&HFAngle);
	h1->SetBranchAddress("nCry",&nCry);
	h1->SetBranchAddress("eCry",eCry);
	h1->SetBranchAddress("ptCry",ptCry);
	h1->SetBranchAddress("timeCry",timeCry);
	h1->SetBranchAddress("flagCry",flagCry);
	h1->SetBranchAddress("ietaCry",ietaCry);
	h1->SetBranchAddress("iphiCry",iphiCry);
	h1->SetBranchAddress("iCry",iCry);
	h1->SetBranchAddress("iSM",iSM);
	h1->SetBranchAddress("etaCry",&etaCry);
	h1->SetBranchAddress("phiCry",&phiCry);
	h1->SetBranchAddress("nClu",&nClu);
	h1->SetBranchAddress("ptClu",ptClu);
	h1->SetBranchAddress("etaClu",etaClu);
	h1->SetBranchAddress("phiClu",phiClu);
	h1->SetBranchAddress("S1Clu",S1Clu);
	h1->SetBranchAddress("S4Clu",S4Clu);
	h1->SetBranchAddress("S9Clu",S9Clu);
	h1->SetBranchAddress("S25Clu",S25Clu);
	h1->SetBranchAddress("timeClu",timeClu);
	h1->SetBranchAddress("nCryClu",nCryClu);
	h1->SetBranchAddress("indexCryClu",indexCryClu);
    
    Long64_t nEntries = h1->GetEntries();
    cout << "\n Entries in this file = " << nEntries << endl;
    
    //Loop over the number of events
    for(int Counter=0; Counter<nEntries; Counter++){
        h1->GetEntry(Counter);
        
    }// loop over the number of events
    
}



