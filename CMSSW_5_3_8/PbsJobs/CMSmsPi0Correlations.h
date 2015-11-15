#ifndef CMSmsPi0Correlations_hh
#define CMSmsPi0Correlations_hh

#include "TObject.h"
#include <TROOT.h>
#include <TChain.h>
#include <TFile.h>

const Int_t _kMax = 10000;
const Int_t _kMaxCrystals = 35000;

class CMSmsPi0Correlations : public TObject{
    public :
    //Declaration of leaves types
    Int_t           Run;
    Int_t           Event;
    Int_t           LumiSection;
    Double_t        cent_val;
    Int_t           cent_bin;
    Int_t           nHITracks;
    Double_t        zVertEvt;
    Double_t        zVertEvtS;
    Double_t        PGAngle;
    Double_t        NGAngle;
    Double_t        HFAngle;
    Int_t           nCry;
    Float_t         eCry[_kMaxCrystals];
    Float_t         ptCry[_kMaxCrystals];
    Float_t         timeCry[_kMaxCrystals];
    Int_t           flagCry[_kMaxCrystals];
    Int_t           ietaCry[_kMaxCrystals];
    Int_t           iphiCry[_kMaxCrystals];
    Int_t           iCry[_kMaxCrystals];
    Int_t           iSM[_kMaxCrystals];
    Float_t         etaCry;
    Float_t         phiCry;
    Int_t           nClu;
    Float_t         ptClu[_kMax];
    Float_t         etaClu[_kMax];
    Float_t         phiClu[_kMax];
    Float_t         S1Clu[_kMax];
    Float_t         S4Clu[_kMax];
    Float_t         S9Clu[_kMax];
    Float_t         S25Clu[_kMax];
    Float_t         timeClu[_kMax];
    Int_t           nCryClu[_kMax];
    Int_t           indexCryClu[_kMax][9];
    
    CMSmsPi0Correlations();
    virtual ~CMSmsPi0Correlations();
    
    void ReadTTree(const char *FileName);
    
   
    ClassDef(CMSmsPi0Correlations,1);
};
#endif


