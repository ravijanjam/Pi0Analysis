// system include files
#include <memory>
// user include files
#include "FWCore/Framework/interface/Frameworkfwd.h"
#include "FWCore/Framework/interface/MakerMacros.h"
#include "FWCore/Framework/interface/Event.h"
#include "FWCore/Framework/interface/EventSetup.h"
#include "FWCore/ParameterSet/interface/ParameterSet.h"   
#include "FWCore/ServiceRegistry/interface/Service.h"

// DQM include files

#include "DQMServices/Core/interface/MonitorElement.h"

// work on collections
#include "DataFormats/EcalRecHit/interface/EcalRecHit.h"
#include "DataFormats/EcalRecHit/interface/EcalRecHitCollections.h"
#include "DataFormats/EcalDetId/interface/EBDetId.h"
#include "DataFormats/HepMCCandidate/interface/GenParticle.h"
#include "CommonTools/UtilAlgos/interface/TFileService.h"

//ES  stuff
#include "Geometry/EcalAlgo/interface/EcalPreshowerGeometry.h"
#include "Geometry/CaloTopology/interface/EcalPreshowerTopology.h"
#include "DataFormats/EcalDetId/interface/EcalSubdetector.h"
#include "DataFormats/EgammaReco/interface/PreshowerClusterFwd.h"

#include "Pi0Analysis/EcalFlowNtp/src/EcalFlowNtp.h"

#include "DataFormats/HeavyIonEvent/interface/Centrality.h"
#include "DataFormats/HeavyIonEvent/interface/CentralityProvider.h"
#include "DataFormats/VertexReco/interface/Vertex.h"
#include "DataFormats/VertexReco/interface/VertexFwd.h"

#include "DataFormats/EgammaReco/interface/BasicCluster.h"
#include "DataFormats/EcalRecHit/interface/EcalRecHitCollections.h"
#include "DataFormats/EcalDetId/interface/EBDetId.h"
#include "DataFormats/DetId/interface/DetId.h"  
#include "DataFormats/Math/interface/Point3D.h"

#include "FWCore/Framework/interface/Event.h"
#include "FWCore/Framework/interface/EventSetup.h"
#include "DataFormats/Common/interface/Handle.h"
#include "FWCore/Framework/interface/ESHandle.h"
#include "FWCore/MessageLogger/interface/MessageLogger.h"

#include "DataFormats/RecoCandidate/interface/RecoEcalCandidate.h"
#include "DataFormats/RecoCandidate/interface/RecoEcalCandidateFwd.h"

#include "RecoEcal/EgammaCoreTools/interface/EcalEtaPhiRegion.h"

#include "TVector3.h"
#include "assert.h"

/// Monte Carlo
#include "SimDataFormats/GeneratorProducts/interface/GenEventInfoProduct.h"
#include "SimDataFormats/GeneratorProducts/interface/HepMCProduct.h" 
#include "SimDataFormats/Track/interface/SimTrack.h"
#include "SimDataFormats/Track/interface/SimTrackContainer.h"
#include "SimDataFormats/Vertex/interface/SimVertex.h"
#include "SimDataFormats/Vertex/interface/SimVertexContainer.h"

#include "SimDataFormats/TrackingAnalysis/interface/TrackingParticle.h"
#include "SimDataFormats/TrackingAnalysis/interface/TrackingParticleFwd.h"
#include "SimDataFormats/TrackingAnalysis/interface/TrackingVertex.h"
#include "SimDataFormats/TrackingAnalysis/interface/TrackingVertexContainer.h"

#include <DataFormats/Math/interface/deltaPhi.h>

const double TWOPI = M_PI + M_PI; // change from #define value of 6.283185308

#include <iostream>
#include <cmath>
#include <fstream>

using namespace std;
using namespace edm;

static int iPrintEtaCorrection = 0;
const int nPrintEtaCorrection = 10;

typedef edm::RefVector< std::vector<TrackingParticle> > TrackingParticleContainer;
typedef std::vector<TrackingParticle>                   TrackingParticleCollection;

const double rECal = 1.29;                         // radial distance of ECAL for eta correction	
CentralityProvider * centProvider;

const bool mergedTrackTruthDebug = false;
const bool trackEcalMatchDebug = false;
const bool simTrackDebug = false;

const double rPrimaryCut = 0.1;
const double zPrimaryCut = 0.1;
const double ptPrimaryCut = 0.01;

const double etaCutForMerge = 1.60;  // used to reduce the size of the output tree
const double ptCutForMerge = 0.30;   // used to reduce the size of the output tree

const bool printPairContributors = false;

//
//
// PDG codes
//   22 is a gamma
//   11 or -11 is a positron or an electron
//  111 is a pi0
//  130 is a K0-long
//  211 or -211 is a pi+ or a pi-
//  213 is rho(770)+, -213 is rho(770)-
//  221 is an eta (548 MeV)
//  223 is an omega (782 MeV, pi+pi-pi0 at 89%, pi0-g at 8%)
//  310 is a K0-short
//  311 is a K0
//  313 is a K0*(892), should be neutral?
//  321 is a K+
//  323 is a K0*(892)+, should be charged
//  331 is an eta-prime
//  421 is a D0
//  433 is a D*s+
//  2112 is a neutron
//  2212 is a proton
//  3122 is a Lambda0
//  3212 is a Sigma0 (1385 MeV, decays to Lambda + pi0, or Sigma + pi)
//

//
// Code for reco track matching with ECAL, originally developed in September 2010
//
const double minimumTrackPtForMatch = 1.5;             // GeV/c, only tracks with have recconstructed pT above this value are considered for ECAL matching
const double phiDeflectionPerInversePt = 0.789;        // radians/(GeV/c)^-1, azimuthal deflection angle per inverse pT in CMS magnetic field, positive for electrons
const int specialEvent = 0;                            // printing for selected event
const bool matchOnlyHighPurity = false;                // switch to restrict track matching to only high purity tracks

const bool useTrackProjectionAzimuthalCorrection = true;
const double trackProjectionAzimuthalCorrectionFactor = 0.0055; // radians per unit of dxy
const bool useTrackProjectionThetaCorrection = true;
const double trackProjectionThetaCorrectionFactor = -0.008; // radians per unit of dz

const double zEcalCut = 60.0;  // Delta-Theta correction grows linearly as a function of zEcal until this Z value, reaching a saturation value
const bool usezEcalCorrection = true;
const double zEcalSaturationValue = 0.01;
const double zEcalCorrectionFactor = zEcalSaturationValue/zEcalCut;

//
// Constructor
//
EcalFlowNtp::EcalFlowNtp(const edm::ParameterSet& ps) :
  nMassBins(200),
  clustEnrCut(0.3),
  clustS1Cut(0.2),
  clustS25Cut(1.0),
  countMixedClusterExamined(0),
  ppConversionCutRadius(-0.20),
  minimumSeparation(0.05),
  countSeparationPtCut(0),
  aSeparationCoefficient(35.657),
  bSeparationCoefficient(-4.1995),
  rescaleSeparationFactor(0.70),
  useFixedOpeningAngleCut(true),
  maximumPi0MassForHistogram(0.80),
  nBinsOneD(100),
  lowPtCut(0.7),
  highPtCut(8.0),
  aOpenAngleCutParameter(0.1699),
  bOpenAngleCutParameter(-0.1115),
  lowEtaLimit(-1.5),
  highEtaLimit(1.5),
  totalEventsWithClusters(0),
  minimumClustersPerEvent(0),
  clusterEnergyAsymmetryCut(-1.0),
  etaMin_trg_(-1.5),
  etaMax_trg_(1.5),
  etaMin_ass_(-2.5),
  etaMax_ass_(2.5),
  ptMin_trg_(0.3),
  ptMax_trg_(8.0),
  ptMin_ass_(0.3),
  ptMax_ass_(3.0),
  bkgFactor_(10),
  eventCounter_(0),
  countPairContributors_(0)

{
	
  vertexSrc_ = ps.getUntrackedParameter<edm::InputTag>("vertexSrc",edm::InputTag("offlinePrimaryVertices"));
  srcTracks_ = ps.getUntrackedParameter<std::string>("qualityString",std::string("highPurity"));
  srcTowers_ = ps.getParameter<edm::InputTag>("srcTowers");
  ptBins_ = ps.getParameter<std::vector<double> >("ptBins");
  NptBins_ = ps.getParameter<std::vector<double> >("NptBins");

  clustS49Cut_ =  ps.getParameter<double>("clustS49Cut");  // introduced into python file as of April 30, 2014

  //
  // Parameters from Monika's EcalFlowNtp code
  //
  etaBins_ = ps.getParameter<std::vector<double> >("etaBins");
  occBins_ = ps.getParameter<std::vector<double> >("occBins");
  occByCentrality_ = ps.getParameter<bool>("occByCentrality");
  diHadronCorrelations_ = ps.getParameter<bool>("diHadronCorrelations");
  pi0HadronCorrelations_ = ps.getParameter<bool>("pi0HadronCorrelations");
  etaHadronCorrelations_ = ps.getParameter<bool>("etaHadronCorrelations");
  lowpi0PtCut_ = ps.getParameter<double>("lowpi0PtCut");
  highpi0PtCut_ = ps.getParameter<double>("highpi0PtCut");

  vertexZMax_ = ps.getParameter<double>("vertexZMax");
  cutMultMin_ = ps.getParameter<double>("cutMultMin");
  cutMultMax_ = ps.getParameter<double>("cutMultMax");
  cutMinTrack_ = ps.getParameter<double>("cutMinTrack");

  cout << "\n Cuts used for pair correlations:";
  cout << "\n Trigger (pi0) particle from " << ptMin_trg_ << " to " << ptMax_trg_ << " GeV/c";
  cout << "\n Associated charged particle from " << ptMin_ass_ << " to " << ptMax_ass_ << " GeV/c";
  cout << endl;

  doSwissThreshold_ = ps.getParameter<bool>("doSwissThreshold");
  swissThreshold_ = ps.getParameter<double>("swissThreshold");
  if(doSwissThreshold_) {
    cout << "\n Swiss cross cut threshold enabled at a value " << swissThreshold_ << endl;
  }

  doOneDimensionTimeCut_ = ps.getParameter<bool>("doOneDimensionTimeCut");
  oneDimensionTimeCut_ = ps.getParameter<double>("oneDimensionTimeCut");
  if(doOneDimensionTimeCut_) {
    cout << "\n One dimensional (fixed window) time cut enabled at a value " << oneDimensionTimeCut_ << endl;
  }

  doTwoDimensionTimeCut_ = ps.getParameter<bool>("doTwoDimensionTimeCut");
  twoDimensionTimeCutFactor_ = ps.getParameter<double>("twoDimensionTimeCutFactor");
  if(doOneDimensionTimeCut_ && doTwoDimensionTimeCut_) {
    cerr <<"\n\n Input parameters conflict: asking for both a one-dimensional and a two-dimensional time cut" << endl << endl;
    return;
  }
  if(doTwoDimensionTimeCut_) {
    cout << "\n Two dimensional (Energy vs time) cut enabled at a value " << twoDimensionTimeCutFactor_ << endl;
  }

  doWeightedTimeCut_ = ps.getParameter<bool>("doWeightedTimeCut");
  if(doWeightedTimeCut_) {
    if(!doTwoDimensionTimeCut_) {
      cerr <<"\n\n Input parameters conflict: asking for a weighted time cut but not asking for a two-dimensional time cut" << endl << endl;
    }
    else {
      cout << "\n The two dimensional weighted time cut (weighted time - seed time) is enabled" << endl;
    }
  }

  lowInvMassCut_ = ps.getParameter<double>("lowInvMassCut");
  highInvMassCut_ = ps.getParameter<double>("highInvMassCut");

  cout << "\n The low invariant mass cut is " << lowInvMassCut_ << " GeV/c^2";
  cout << "\n The high invariant mass cut is " << highInvMassCut_ << " GeV/c^2" << endl;

  if(lowInvMassCut_ >= highInvMassCut_) {
    cerr << "\n Invalid values for the invariant mass cuts" << endl;
    return;
  } // safety check

  cout << "\n The cluster S4/S9 cut is " << clustS49Cut_ << endl;

  centProvider = 0;
  currentBufferEventIndexCluster = 0;
  useClusterEnergyAsymmetryCut = clusterEnergyAsymmetryCut > 0.0;
	
  for (int kBuffer=0; kBuffer<bufferDepth; kBuffer++) {
    countAcceptedCluster[kBuffer] = 0;
    eventNumberCluster[kBuffer] = 0;
  }
	
  cutDzErrMax_ = ps.getUntrackedParameter<double>("cutDzErrMax", 3.0);
  cutDxyErrMax_ = ps.getUntrackedParameter<double>("cutDxyErrMax", 3.0);
  cutPtErrMax_ = ps.getUntrackedParameter<double>("cutPtErrMax", 0.1);
	
  minimumSeparationSquared = minimumSeparation*minimumSeparation;
  usePtDependentSeparation=false;
	
  binWidth = 1000.0*maximumPi0MassForHistogram/nMassBins + 0.001;
  sprintf(countsPerBin, "Counts per %d MeV/c^{2} bin", binWidth);
	
  bins = ptBins_.size()-1;
  bins1 = NptBins_.size()-1;
  cout<<"The pT bin width used are: "<<ptBins_.size()-1<<'\t'<<ptBins_[0]<<'\t'<<ptBins_[bins]<<endl;
  cout<<"pT bins used for the histogram: "<<NptBins_.size()-1<<'\t'<<NptBins_[0]<<'\t'<<NptBins_[bins1]<<endl;  
	
  if(usePtDependentSeparation) {
    cout << "\n Using a pT dependent separation cut parameterization " << aSeparationCoefficient << "/pT - ";
    cout <<  fabs(bSeparationCoefficient)  << "/pT^2";
    cout << ",  with a rescale factor " << rescaleSeparationFactor << endl;
  }
  else {
    cout << "\n Not using a a pT dependent separation cut" << endl;
  }
  
  //
  // 99 MC events have 538 reco tracks above 1.5 GeV/c and an |eta| < 1.49
  //                   150 of these tracks have at least one cluster match (~28%)
  //                   19 of these tracks have two cluster matches (no track has 3 or more matches)
  //
  // 99 MC events have 122 reco tracks above 2.5 GeV/c and an |eta| < 1.49
  //                   49 of these tracks have at least one cluster match (~40%)
  //                   9 of these tracks have two cluster matches (no track has 3 or more matches)
  //
  // 500 MC events have 224 reco tracks above 2.5 GeV/c and an |eta| < 1.49
  //                    97 of these tracks have at least one cluster match (~40%)
  //                    15 of these tracks have two cluster matches (no track has 3 or more matches)
  //
	
  goodAngleMatch_ = ps.getParameter<double> ("goodAngleMatch");
  goodPhiMatch_ = ps.getParameter<double> ("goodPhiMatch");
  goodThetaMatch_ = ps.getParameter<double> ("goodThetaMatch");
	
  cout << "\n The goodAngleMatch opening angle criterion for reco track-cluster matching is " << goodAngleMatch_ << " radians" << endl;
  cout << "\n The goodPhiMatch residual angle criterion for reco track-cluster matching is " << goodPhiMatch_ << " radians" << endl;
  cout << "\n The goodThetaMatch residual angle criterion for reco track-cluster matching is " << goodThetaMatch_ << " radians" << endl;
	
  //
  // Control parameter to do energy re-calibration based on number of crystals in a cluster
  // Energy re-calibration parameterizations were derived from pPb HIJING events
  doEnergyRecalibration_ =  ps.getParameter<bool> ("doEnergyRecalibration");
	
  if(doEnergyRecalibration_)
    cout << "\n Cluster energy value will be recalibrated according to number of crystals in the cluster" << endl;
  else
    cout << "\n There is no recalibration of the cluster energy value" << endl;
	
  useClusterCrystalLimitLowPtOnly_ = ps.getParameter<bool> ("useClusterCrystalLimitLowPtOnly");
  clusterCrystalLimitLowPtOnly_ = ps.getParameter<double> ("clusterCrystalLowPtOnly");

  useClusterCrystalLimit_ = ps.getParameter<bool> ("useClusterCrystalLimit");
  lowCrystalLimit_ = ps.getParameter<int> ("lowCrystalLimit");    // used only if useClusterCrystalLimit is true
  highCrystalLimit_ = ps.getParameter<int> ("highCrystalLimit");  // used only if useClusterCrystalLimit is true
  if(useClusterCrystalLimit_) {
    if(!useClusterCrystalLimitLowPtOnly_) {
      cout << "\n Only a cluster having crystal number from " << lowCrystalLimit_ << " to " << highCrystalLimit_ << " will be accepted"  << endl;
    }
    else {
      cout << "\n For the pi0 candidate with a pT below " << clusterCrystalLimitLowPtOnly_ ;
      cout << " GeV/c then both clusters must have a crystal number in the range " << lowCrystalLimit_ << " to " << highCrystalLimit_ << endl;
    }
    cout << "\n There is no check on the number of crystals in a cluster" << endl;
  } // check on useClusterCrystalLimit
	
  //
  // Control parameter to suppress clusters with a charged particle tracking match
  //
  suppressTrackMatchedClusters_ =  ps.getParameter<bool> ("suppressTrackMatchedClusters");
	
  if(suppressTrackMatchedClusters_)
    cout << "\n Cluster with a charged particle tracking match will not be used" << endl;
  else
    cout << "\n Cluster with charged particle tracking matches are accepted" << endl;
	
  makeOutputTree_ =  ps.getParameter<bool> ("makeOutputTree");
  if(makeOutputTree_)
    cout << "\n An output tree will be generated according to the xxxStore parameters" << endl;
  else
    cout << "\n No output tree will be generated" << endl;
	
  // Control parameters to limit the size of the output hTree
  recoTrackStore_ = ps.getParameter<bool> ("recoTrackStore");
  clusterStore_ = ps.getParameter<bool> ("clusterStore");
  clusterRecoTrackStore_ = ps.getParameter<bool> ("clusterRecoTrackStore");
  crystalStore_ = ps.getParameter<bool> ("crystalStore");
  mcParticleStore_ = ps.getParameter<bool> ("mcParticleStore");
  simTrackStore_ = ps.getParameter<bool> ("simTrackStore");
  simSlimTrackStore_ = ps.getParameter<bool> ("simSlimTrackStore");
  mergedTrackTruthStore_ = ps.getParameter<bool> ("mergedTrackTruthStore");
  mergedTrackTruthPhotonOnly_ = ps.getParameter<bool> ("mergedTrackTruthPhotonOnly");
  genParticleStore_ = ps.getParameter<bool> ("genParticleStore");
  mesonStore_ = ps.getParameter<bool> ("mesonStore");  
  photonStore_ = ps.getParameter<bool> ("photonStore");  
  chmesonStore_ = ps.getParameter<bool> ("chmesonStore");
  pairCorrTracksStore_ = ps.getParameter<bool> ("pairCorrTracksStore");
	
  minimumHITracksCut_ = ps.getParameter<int> ("minimumHITracksCut");
  maximumHITracksCut_ = ps.getParameter<int> ("maximumHITracksCut");
	
  // Initialization of track histograms [Monika Sharma]                                                                 
  edm::Service<TFileService> fs;
  initHistos(fs);
  
  productMonitoredEBpi0_= ps.getUntrackedParameter<edm::InputTag>("AlCaStreamEBpi0Tag");
  productMonitoredEBeta_= ps.getUntrackedParameter<edm::InputTag>("AlCaStreamEBetaTag");
  
  MCTruthCollection_ = ps.getUntrackedParameter<edm::InputTag>("MCTruthCollection");
	
  clusSeedThr_ = ps.getParameter<double> ("clusSeedThr");
  clusEtaSize_ = ps.getParameter<int> ("clusEtaSize");
  clusPhiSize_ = ps.getParameter<int> ("clusPhiSize");
  if ( clusPhiSize_ % 2 == 0 ||  clusEtaSize_ % 2 == 0)
    edm::LogError("AlCaPi0RecHitsProducerError") << "Size of eta/phi for simple clustering should be odd numbers";
  
  seleXtalMinEnergy_ = ps.getParameter<double>("seleXtalMinEnergy");
  
  //for Pi0 barrel selection
  selePtGamma_ = ps.getParameter<double> ("selePtGamma");  
  selePtPi0_ = ps.getParameter<double> ("selePtPi0");  
  seleMinvMaxPi0_ = ps.getParameter<double> ("seleMinvMaxPi0");  
  seleMinvMinPi0_ = ps.getParameter<double> ("seleMinvMinPi0");  
  seleS4S9Gamma_ = ps.getParameter<double> ("seleS4S9Gamma");  
  selePi0Iso_ = ps.getParameter<double> ("selePi0Iso");  
  ptMinForIsolation_ = ps.getParameter<double> ("ptMinForIsolation");
  selePi0BeltDR_ = ps.getParameter<double> ("selePi0BeltDR");  
  selePi0BeltDeta_ = ps.getParameter<double> ("selePi0BeltDeta");  
	
  posCalculator_ = PositionCalc( ps.getParameter<edm::ParameterSet>("posCalcParameters") );
  
}


EcalFlowNtp::~EcalFlowNtp()
{
  
  // do anything here that needs to be done at destruction time
  // (e.g. close files, deallocate resources etc.)
  
}

// ------------ method called to analyze each event  ------------
void
EcalFlowNtp::analyze(const edm::Event& iEvent, const edm::EventSetup& iSetup)
{
  
  eventCounter_++;
  etHFtowerSumPlus_ = 0;
  etHFtowerSumMinus_ = 0;
  etHFtowerSumTotal_ = 0;
  tHighPurityTracks_ = 0;
  AllTracks_=0;
  currentAcceptedClusterNumber = 0;
	
  int thisJob = iEvent.id().run();
  int thisEvent = iEvent.id().event();
  eventNumberCluster[currentBufferEventIndexCluster] = thisEvent;  
	
  if(currentBufferEventIndexCluster >= bufferDepth) {
    cerr << "\n currentBufferEventIndexCluster " << currentBufferEventIndexCluster << " exceeds buffer depth " << bufferDepth;
    cerr << endl;
    return;
  } // safety check
	
  vector<TVector3> pVect_trg;  // these are for the reconstructed pi0
  vector<TVector3> pVect_ass;  // these are for the charged particle tracks

  vector<TVector3> pGenVect_trg;  // these are for the generated pi0
  vector<TVector3> pGenVect_ass;  // these are for the generated charged particles
  edm::ESHandle<CaloTopology> theCaloTopology;
  iSetup.get<CaloTopologyRecord>().get(theCaloTopology);
  
  edm::Handle<EcalRecHitCollection> rhEBpi0;
  edm::Handle<EcalRecHitCollection> rhEBeta;
  
  iEvent.getByLabel(productMonitoredEBpi0_, rhEBpi0); 
  iEvent.getByLabel(productMonitoredEBeta_, rhEBeta);
  
  // Initialize the Position Calc
  const CaloSubdetectorGeometry *geometry_p; 
  const CaloSubdetectorGeometry *geometryES_p;
  const CaloSubdetectorTopology *topology_p;
  
  runn = iEvent.id().run();
  eventn = iEvent.id().event();
  ls = iEvent.luminosityBlock();
  
  if (!centProvider) centProvider = new CentralityProvider(iSetup);
  centProvider->newEvent(iEvent,iSetup);

  // Determining occupancy variable by centrality for an event
  double occ = 0;
  if(occByCentrality_) occ = (double) centProvider->getBin();
	
  totalEventsThisJob++;
  totalEventsAllJobs++;
	
  if(centrality_bin < lowCentralityCut || centrality_bin >= highCentralityCut) {
    eventsOutsideCentralityWindow++;
    return;
  }
  eventsInsideCentralityWindow++;      
  
  edm::ESHandle<CaloGeometry> geoHandle;
  iSetup.get<CaloGeometryRecord>().get(geoHandle);     
  geometry_p = geoHandle->getSubdetectorGeometry(DetId::Ecal,EcalBarrel);
  geometryES_p = geoHandle->getSubdetectorGeometry(DetId::Ecal, EcalPreshower);
  topology_p = theCaloTopology->getSubdetectorTopology(DetId::Ecal,EcalBarrel);
	
  vector< vector<EcalRecHit> > RecHitsCluster;
  vector< vector<EcalRecHit> > RecHitsCluster5x5;
  vector<float> s4s9Clus;
  vector<float> s9s25Clus;
  nCry = 0;
  nClu = 0;
  nMesonSize = 0;
  nPhotonSize = 0;
  nChMesonSize = 0;
	
  if (rhEBpi0.isValid() && (rhEBpi0->size() > 0)){
    
    Handle<std::vector<reco::Vertex> > vertexCollectionSelected;
    iEvent.getByLabel(vertexSrc_,vertexCollectionSelected);
    
    Handle<reco::TrackCollection> tracks;
    iEvent.getByLabel("generalTracks", tracks);
    
    nHITracks = tracks->size();
    if(nHITracks > maxTracksPerJob) {  // should check what is the value of this maximum (June 24)
      maxTracksPerJob = nHITracks;
      eventMaxTracksPerJob = thisEvent;
      runMaxTracksPerJob = thisJob;
    }
		
    nTracksSize = nHITracks;
		
    if(nTracksSize < minimumHITracksCut_ || nTracksSize > maximumHITracksCut_)
      return;
		
    if(nTracksSize < 1)
      nTracksSize = 1;
		
    std::vector<reco::Vertex> vsorted = *vertexCollectionSelected;
    // sort the vertices by number of tracks in descending order
    // use chi2 as tiebreaker
    std::sort( vsorted.begin(), vsorted.end(), EcalFlowNtp::vtxSort );
		
    // skip events with no PV, this should not happen
    if( vsorted.size() == 0) return;
		
    // skip events failing vertex cut
    if( fabs(vsorted[0].z()) > vertexZMax_ ) return;
		
    tEvents_->Fill(0.5);
		
    zVertexEventSelected = vsorted[0].z();
    tVertexZ_->Fill(zVertexEventSelected);

    ////////////////// Selecting events for a leading track pT 

    int multiplicity =0;
    double leadingTrackPt = 0.0;

    reco::TrackCollection::const_iterator tcol;
    for( tcol = tracks->begin(); tcol != tracks->end() ; ++tcol )
      {
	if( TrackQualityCuts(*tcol, vsorted[0]) )
	  {
	    multiplicity++;
	    if( tcol->pt() > leadingTrackPt ) leadingTrackPt = tcol->pt();
	  }
      }
    EventsLeadTrack_->Fill(leadingTrackPt);
    if (cutByLeadingTrackPt_ )
      {
        if( leadingTrackPt < leadingTrackPtMin_ ) return;
	if( leadingTrackPt > leadingTrackPtMax_ ) return;
      }
    //////////////////////////////////////////////////////////
    
    for( const auto & vi :  vsorted )
      {
	//vi.tracksSize() would fetch the total track size
	tVertexX_->Fill(vi.x());
	tVertexY_->Fill(vi.y());
	//	tVertexZ_->Fill(vi.z());
      }
		
    // comparisons between first and additional primary vertices
    // for(unsigned int i =1; i<vsorted.size(); i++)
    // {
    //
    // These variables are not used?
    //
    // double dz = fabs( vsorted[i].z() - vsorted[0].z() );
    // double dx = fabs( vsorted[i].x() - vsorted[0].x() );
    // double dy = fabs( vsorted[i].y() - vsorted[0].y() );
    // double dxy  = sqrt ( dx*dx + dy*dy );
    // }
		
    // use vertex with most tracks as primary vertex
    // determine position and error
		
    math::XYZPoint vtxPoint(0.0,0.0,0.0);
    double vzErr =0.0, vxErr=0.0, vyErr=0.0;
    xPrimaryVertex = -999.0;
    yPrimaryVertex = -999.0;
    zPrimaryVertex = -999.0;
    if( vsorted.size() != 0 )
      {
	vtxPoint=vsorted.begin()->position();
	vzErr=vsorted.begin()->zError();
	vxErr=vsorted.begin()->xError();
	vyErr=vsorted.begin()->yError();
			
	xPrimaryVertex = (vsorted.begin()->position()).X();
	yPrimaryVertex = (vsorted.begin()->position()).Y();
	zPrimaryVertex = (vsorted.begin()->position()).Z();
      }
		
    rPrimaryVertex = sqrt(xPrimaryVertex*xPrimaryVertex + yPrimaryVertex*yPrimaryVertex);
		
    int countAllTracks = 0;
		
    for( const auto & track : *tracks ) //de-referencing the pointer "tracks" to track and auto will automatically know the type of tracks.
      //
      // This is a new way of looping over the tracks. It is guaranteed to run over all the tracks. 
      //
      {
	double dxy=0.0, dz=0.0, dxysigma=0.0, dzsigma=0.0;
	dxy = track.dxy(vtxPoint);
	dz = track.dz(vtxPoint);
	dxysigma = sqrt(track.d0Error()*track.d0Error()+vxErr*vyErr);
	dzsigma = sqrt(track.dzError()*track.dzError()+vzErr*vzErr);
			
	recoPurityTrack[countAllTracks] = 1;  // default that the track is high purity
	countAllTracks++;                                 // increment the tracks counter
	if( !TrackQualityCuts(track, vsorted[0]) ) {
	  recoPurityTrack[countAllTracks - 1] = 0; // above track was actually not high purity, must reset it
	  continue;
	}
			
	tHighPurityTracks_++;	
			
	tDz_->Fill(dz/dzsigma);
	tDxy_->Fill(dxy/dxysigma);
	tPtQA_->Fill(track.ptError()/track.pt());
			
	tHit_->Fill(track.numberOfValidHits());
			
      }
		
    tAllTracks_->Fill(nHITracks);  
		
    if( !(tHighPurityTracks_ >= cutMultMin_ && tHighPurityTracks_ < cutMultMax_)) return;
    tHPTracks_->Fill(tHighPurityTracks_);
    nHighPurityTracks = tHighPurityTracks_;
		
    int nPairTracks = 0;
    for( const auto & track : *tracks) {
      if( !TrackQualityCuts(track, vsorted[0])) continue;
      
      TVector3 pvector;
      pvector.SetPtEtaPhi(track.pt(),track.eta(),track.phi());
      
      if(track.eta()<=etaMax_ass_ && track.eta()>=etaMin_ass_
	 && track.pt()<=ptMax_ass_ && track.pt()>=ptMin_ass_) {
	pVect_ass.push_back(pvector); // store the three charged particle kinematic variables

	tPt_->Fill(track.pt());
	tEta_->Fill(track.eta());
	tPhi_->Fill(track.phi());

	if(pairCorrTracksStore_) {
	  pairTrack[nPairTracks] = nPairTracks;
	  recoPairPtTrack[nPairTracks] = track.pt();
	  recoPairEtaTrack[nPairTracks] = track.eta();
	  recoPairPhiTrack[nPairTracks] = track.phi();
	  nPairTracks++;
	} // storing partial reco track information for the pair correlations analysis

      } // check kinematics of the associated charged particles
      
    } // loop over tracks
    nPairTracksSize = nPairTracks;
    if(pairCorrTracksStore_) {
      cout << "\n nPairTracksSize = " << nPairTracksSize << endl;
    }
	
    bool recoPtTrackAboveMinimum = false;
    int kRecoTrackAbovePtMinimum = 0;
		
    unsigned int kTrack = 0;
    unsigned int countRecoTrackPtAboveMinimum = 0;
		
    for( const auto & track : *tracks ){ // de-referencing the pointer "tracks" to track and auto will automatically know the type of tracks.
			
      double track_eta = track.eta();
      double track_phi = track.phi();
      double track_pt  = track.pt();
      double dxy = track.dxy(vtxPoint);
      double dz = track.dz(vtxPoint);
      double dxysigma = sqrt(track.d0Error()*track.d0Error()+vxErr*vyErr);
      double dzsigma = sqrt(track.dzError()*track.dzError()+vzErr*vzErr);
			
      if(!recoPtTrackAboveMinimum && track_pt >= minimumTrackPtForMatch &&
	 (!matchOnlyHighPurity || (matchOnlyHighPurity && recoPurityTrack[kTrack]))) {
	recoPtTrackAboveMinimum = true;
	kRecoTrackAbovePtMinimum = kTrack; // the first track in the collection which has a pT >= minimumTrackPtForMatch
      }
      if(recoPtTrackAboveMinimum)
	countRecoTrackPtAboveMinimum++;
      int qCharge = track.charge();
      
      recoEcalTrack[kTrack] = -999;   // default value for no match
      recoNMatchTrack[kTrack] = 0;    // counts the number of good matches for this track
      recoChargeTrack[kTrack] = qCharge;
			
      if(qCharge < 0)
	recoPhiDTrack[kTrack] = track_phi + phiDeflectionPerInversePt/track_pt;
      else
	recoPhiDTrack[kTrack] = track_phi - phiDeflectionPerInversePt/track_pt;
			
      if(useTrackProjectionAzimuthalCorrection) {
	recoPhiDTrack[kTrack] += trackProjectionAzimuthalCorrectionFactor*dxy;  // projection correction factor derived from simulation studies
      }
			
      mTrack[kTrack] = kTrack;
      recoPtTrack[kTrack] = track_pt;
      recoEtaTrack[kTrack] = track_eta;
      float track_theta = 2.0*atan(exp(-track_eta));
      recoThetaTrack[kTrack] = track_theta;
			
      if(useTrackProjectionThetaCorrection) {
	recoThetaTrack[kTrack] += trackProjectionThetaCorrectionFactor*dz;  // projection correction factor derived from simulation studies
      }
			
      recoPhiTrack[kTrack] = track_phi;
      recoVxTrack[kTrack] = track.vx();
      recoVyTrack[kTrack] = track.vy();
      recoVzTrack[kTrack] = track.vz();
      recoDxyTrack[kTrack] = dxy;
      recoDzTrack[kTrack] = dz;
      recoSdxyTrack[kTrack] = dxysigma;
      recoSdzTrack[kTrack] = dzsigma;
      recoOxTrack[kTrack] = track.outerX();
      recoOyTrack[kTrack] = track.outerY();
      recoOzTrack[kTrack] = track.outerZ();
      recoOuterPtTrack[kTrack] = track.outerPt();
      kTrack++;
    } // loop over found tracks
		
		
    ////////////////// New addition for Et of HF ////////////
    edm::Handle<CaloTowerCollection> towers;
    iEvent.getByLabel(srcTowers_,towers);
		
    for( size_t i = 0; i<towers->size(); ++ i){
      const CaloTower & tower = (*towers)[i];
      double eta = tower.eta();
      bool isHF = tower.ietaAbs() > 29;
			
      if(isHF && eta > 0){
	etHFtowerSumPlus_ += tower.pt();
      }
      if(isHF && eta < 0){
	etHFtowerSumMinus_ += tower.pt();
      }
    }
		
    etHFtowerSumTotal_ = etHFtowerSumPlus_ + etHFtowerSumMinus_;
    tEtvsHiTracksPlus_->Fill(nHITracks, etHFtowerSumPlus_);
    tEtvsHiTracksMinus_->Fill(nHITracks, etHFtowerSumMinus_);
    tEtvsHPHiTracksPlus_->Fill(tHighPurityTracks_, etHFtowerSumPlus_);
    tEtvsHPHiTracksMinus_->Fill(tHighPurityTracks_, etHFtowerSumMinus_);
    /////////////////// End new addition for Et of HF ///////////////
    
		
    //Read collection
    
    std::vector<EcalRecHit> seeds;
    seeds.clear();
    
    vector<EBDetId> usedXtals;
    usedXtals.clear();
    
    detIdEBRecHits.clear(); // EBDetId
    EBRecHits.clear();  //EcalRecHit
		
    const EcalRecHitCollection *hitCollection_p = rhEBpi0.product();
    float etot =0;
    EcalRecHitCollection::const_iterator itb;
		
    for(itb=rhEBpi0->begin(); itb!=rhEBpi0->end(); ++itb){

      double energy = itb->energy();

      // double  swissCrx = EcalTools::swissCross  (itb->id(), *hitCollection_p, 0., avoidIeta85_);
      // SwissCrossCut->Fill(swissCrx);

      if( energy > seleXtalMinEnergy_) {
	TimingBefore->Fill(itb->time());
	if(energy < 5.0) {
	  TimingBeforeEvsT->Fill(itb->time(), energy);
	}
	if(abs(itb->time()) <= oneDimensionTimeCut_)
	  TimingAfter->Fill(itb->time());
      }

      /*
      //
      // One or two dimensional time cuts are done at the cluster level, below
      //
      if(doOneDimensionTimeCut_) {
      if(oneDimensionTimeCut_ < 0) {
      if(abs(itb->time()) < -oneDimensionTimeCut_) continue;
      } // reverse cut
      if(doOneDimensionTimeCut_ > 0) {
      if(abs(itb->time()) > oneDimensionTimeCut_) continue;
      } // normal cut
      }
      */

		
      EBDetId id(itb->id());
      if( energy < seleXtalMinEnergy_) continue; 
      
      EBDetId det = itb->id();
			
      detIdEBRecHits.push_back(det);
      EBRecHits.push_back(*itb);	  
      if ( energy > clusSeedThr_ ) seeds.push_back(*itb);
      
      //htimeEB_->Fill(itb->time());	  
      etot+= itb->energy();	 
      
    } // Eb rechits
    
    iso = 0;
		
    // Make own simple clusters (3x3, 5x5 or clusPhiSize_ x clusEtaSize_)
    sort(seeds.begin(), seeds.end(), ecalRecHitLess());
    
    for (std::vector<EcalRecHit>::iterator itseed=seeds.begin(); itseed!=seeds.end(); itseed++) {
      EBDetId seed_id = itseed->id();
      std::vector<EBDetId>::const_iterator usedIds;
      
      int nCryinclu(0);
      bool seedAlreadyUsed=false;
      for(usedIds=usedXtals.begin(); usedIds!=usedXtals.end(); usedIds++){
	if(*usedIds==seed_id){
	  seedAlreadyUsed=true;
	  //cout<< " Seed with energy "<<itseed->energy()<<" was used !"<<endl;
	  break; 
	}
      }
      if(nClu>=NCLUMAX) continue;
      if(nCry>=NCRYMAX) continue;

      double seedTime = itseed->time();
      double seedEnergy = itseed->energy();
      double weightedTime = 0.0;
			
      if(seedAlreadyUsed)continue;
      std::vector<DetId> clus_v = topology_p->getWindow(seed_id,clusEtaSize_,clusPhiSize_);       
      std::vector<std::pair<DetId,float> > clus_used;
			
      vector<EcalRecHit> RecHitsInWindow;
      vector<EcalRecHit> RecHitsInWindow5x5;
      
      double simple_energy = 0;
			
      for (std::vector<DetId >::iterator det=clus_v.begin(); det!=clus_v.end(); det++) {
	EBDetId EBdet = *det;
	//      cout<<" det "<< EBdet<<" ieta "<<EBdet.ieta()<<" iphi "<<EBdet.iphi()<<endl;
	bool  HitAlreadyUsed=false;
	for(usedIds=usedXtals.begin(); usedIds!=usedXtals.end(); usedIds++){
	  if(*usedIds==*det){
	    HitAlreadyUsed=true;
	    break;
	  }
	}
	if(HitAlreadyUsed)continue;
				
	std::vector<EBDetId>::iterator itdet = find( detIdEBRecHits.begin(),detIdEBRecHits.end(),EBdet);
	if(itdet == detIdEBRecHits.end()) continue; 
				
	int nn = int(itdet - detIdEBRecHits.begin());
	usedXtals.push_back(*det);
	RecHitsInWindow.push_back(EBRecHits[nn]);
	clus_used.push_back(std::make_pair(*det,1));
	simple_energy = simple_energy + EBRecHits[nn].energy();
				
      }
      
      if(simple_energy <= 0) continue;
			
      math::XYZPoint clus_pos = posCalculator_.Calculate_Location(clus_used,hitCollection_p,geometry_p,geometryES_p);
      
      float theta_s = 2. * atan(exp(-clus_pos.eta()));
			
      // eta correction according to Z
      double etaForZEqualsZero = clus_pos.eta();  // initial eta value of cluster without correcting for event Z-vertex;
      double zCorrectedEta = etaForZEqualsZero; // placeholder for correction result
      double zAtECal = 0.0;
      double thetaForZEqualsZero = -1000.0;
      if(etaForZEqualsZero != 0.0) {
	thetaForZEqualsZero = 2.0*atan(exp(-etaForZEqualsZero));
	zAtECal = rECal/tan(thetaForZEqualsZero);
      } // check for non-zero value of uncorrected eta
			
      //
      // Correction for zVertex using the zVertexEventSelected value
      //
      double zCorrected = zAtECal - 0.01*zVertexEventSelected;  // convert to meters
      double thetaCorrected = -1000.0;
      if(zCorrected != 0.0) {
				
	thetaCorrected = atan(rECal/zCorrected);
	if(thetaCorrected < 0.0)
	  thetaCorrected += TMath::Pi();  // convert to 0 to pi range for theta
				
	theta_s = thetaCorrected;  // corrected value of theta
				
	zCorrectedEta = -log(tan(thetaCorrected/2.0));
      }
      else {
	zCorrectedEta = 0.0;
      } // check for non-zero value of Z baseline
			
      if(iPrintEtaCorrection < nPrintEtaCorrection) {
	cout << "\n First pass: zVertexEventSelected = " << 0.01*zVertexEventSelected;  // convert to meters
	cout << ", zAtECal = " << zAtECal;
	cout << ", zCorrected = " << zCorrected;
	cout << ", thetaForZEqualsZero = " << thetaForZEqualsZero;
	cout << ", thetaCorrected = " << thetaCorrected;
	cout << ", zCorrectedEta = " << zCorrectedEta;
	cout << ", uncorrected Eta = " << etaForZEqualsZero;
				
	iPrintEtaCorrection++;
	if(iPrintEtaCorrection >= nPrintEtaCorrection)
	  cout << endl;
				
      }
			
      float et_s = simple_energy * sin(theta_s);
			
      float s4s9_tmp[4];
      for(int i=0;i<4;i++)s4s9_tmp[i]= 0;
      
      int seed_ieta = seed_id.ieta();
      int seed_iphi = seed_id.iphi();
			
      convxtalid( seed_iphi,seed_ieta);  // for ECAL barrel this method converts the iphi index range to 0 -> 359, and the ieta range to -85 -> -1 (negative eta) or 0 -> 84 (positive eta)
      
      //
      // Check on hot channel in this cluster (based on pPb 2013 data)
      //
      if((seed_ieta == -75 && seed_iphi == 199) ||
	 (seed_ieta ==  67 && seed_iphi == 74)) {
	hotChannelSeedsDiscarded++;
	continue;
      }
			
      float e3x3 = 0; 
      float e5x5 = 0;
			
      for(unsigned int j=0; j<9; j++) {
	//
	// This array gives the sequential crystal number (starting at 0) for each member of the 3x3 cluster
	//
	indexCryClu[nClu][j] = -1;  // this array was never initialized before (June 23, 2013)
      }
      
      float s9WidthXSum = 0.0;
      float s9WidthYSum = 0.0;
      float s25WidthXSum = 0.0;
      float s25WidthYSum = 0.0;

      float enSum3x3Sq = 0.0;
      float enSum5x5Sq = 0.0;

      for(unsigned int j=0; j<RecHitsInWindow.size();j++){
	EBDetId det = (EBDetId)RecHitsInWindow[j].id(); 
				
	int ieta = det.ieta();
	int iphi = det.iphi();
				
	convxtalid(iphi,ieta);
				
	//
	// Check on hot channel in this cluster (based on pPb 2013 data)
	//
	if((ieta == -75 && iphi == 199) ||
	   (ieta ==  67 && iphi == 74)) {
	  hotChannelSatellitesDiscarded++;
	  continue;
	}
				
	float en = RecHitsInWindow[j].energy(); 
				
	int dx = diff_neta_s(seed_ieta,ieta);
	int dy = diff_nphi_s(seed_iphi,iphi);//

	float xWidth = float(dx*dx)*en*en;
	float yWidth = float(dy*dy)*en*en;

	if(abs(dx)<=1 && abs(dy)<=1) {
	  s9WidthXSum += xWidth;
	  s9WidthYSum += yWidth;
	  enSum3x3Sq += en*en;
	} // check on 3x3
				
	if(abs(dx)<=1 && abs(dy)<=1) {
	  e3x3 += en; 
	  if(dx <= 0 && dy <=0) s4s9_tmp[0] += en; 
	  if(dx >= 0 && dy <=0) s4s9_tmp[1] += en; 
	  if(dx <= 0 && dy >=0) s4s9_tmp[2] += en; 
	  if(dx >= 0 && dy >=0) s4s9_tmp[3] += en; 
	  if(nCry>=NCRYMAX) continue;
	  kCry[nCry] = nCry;
	  eCry[nCry] = RecHitsInWindow[j].energy();
	  ptCry[nCry] =  RecHitsInWindow[j].energy() * sin(2. * atan(exp(-geometry_p->getGeometry(det)->getPosition().eta())));
	  timeCry[nCry] = RecHitsInWindow[j].time();
	  flagCry[nCry] = RecHitsInWindow[j].recoFlag();
	  ietaCry[nCry] = ieta;
	  iphiCry[nCry] = iphi;
	  weightedTime += eCry[nCry]*timeCry[nCry];
					
	  iCry[nCry] = det.ic();
	  iSM[nCry] = det.ism();
	  etaCry[nCry] = geometry_p->getGeometry(det)->getPosition().eta();
	  phiCry[nCry] = geometry_p->getGeometry(det)->getPosition().phi();
	  indexCryClu[nClu][nCryinclu] = nCry;
	  if(dx == 0 && dy == 0)  {
	    S1Clu[nClu] = RecHitsInWindow[j].energy();
	    timeClu[nClu] = RecHitsInWindow[j].time();
	  }
	  nCryinclu++;
	  indexCluCry[nCry] = nClu;
	  nCry++;      
	} // check that |dx| <= 1  and  |dy| <= 1
      }
			
      if(e3x3 <= clustEnrCut) continue;
      
      if(enSum3x3Sq > 0.0) {
	s9WidthX[nClu] = sqrt(s9WidthXSum/enSum3x3Sq);
	s9WidthY[nClu] = sqrt(s9WidthYSum/enSum3x3Sq);
      }
      else {
	s9WidthX[nClu] = -999.0;
	s9WidthY[nClu] = -999.0;
      }
 
      float s4s9_max = *max_element( s4s9_tmp,s4s9_tmp+4)/e3x3; 
      
      //calculate e5x5
      std::vector<DetId> clus_v5x5 = topology_p->getWindow(seed_id,5,5); 
      for( std::vector<DetId>::const_iterator idItr = clus_v5x5.begin(); idItr != clus_v5x5.end(); idItr++){
	EBDetId det = *idItr;
				
	//inside collections
	std::vector<EBDetId>::iterator itdet = find( detIdEBRecHits.begin(),detIdEBRecHits.end(),det);
	if(itdet == detIdEBRecHits.end()) continue; 
				
	int nn = int(itdet - detIdEBRecHits.begin());
				
	RecHitsInWindow5x5.push_back(EBRecHits[nn]);
	e5x5 += EBRecHits[nn].energy();
      }
			
      if(e5x5 <= 0) continue;
 
      for(unsigned int j=0; j<RecHitsInWindow5x5.size();j++){
	EBDetId det = (EBDetId)RecHitsInWindow5x5[j].id(); 
				
	int ieta = det.ieta();
	int iphi = det.iphi();
				
	convxtalid(iphi,ieta);
				
	//
	// Check on hot channel in this cluster (based on pPb 2013 data)
	//
	if((ieta == -75 && iphi == 199) ||
	   (ieta ==  67 && iphi == 74)) {
	  hotChannelSatellitesDiscarded++;
	  continue;
	}
				
	float en = RecHitsInWindow5x5[j].energy(); 
				
	int dx = diff_neta_s(seed_ieta,ieta);
	int dy = diff_nphi_s(seed_iphi,iphi);//

	float xWidth = float(dx*dx)*en*en;
	float yWidth = float(dy*dy)*en*en;

	if(abs(dx)<=2 && abs(dy)<=2) {
	  s25WidthXSum += xWidth;
	  s25WidthYSum += yWidth;
	  enSum5x5Sq += en*en;
	} // check on 5x5

      } // sum over j

      if(enSum5x5Sq > 0.0) {
	s25WidthX[nClu] = sqrt(s25WidthXSum/enSum5x5Sq);
	s25WidthY[nClu] = sqrt(s25WidthYSum/enSum5x5Sq);
      }
      else {
	s25WidthX[nClu] = -999.0;
	s25WidthY[nClu] = -999.0;
      }
  
      kClu[nClu] = nClu;
      S9Clu[nClu] = e3x3;
      ptClu[nClu] =  et_s;
      etaClu[nClu] = zCorrectedEta;
      phiClu[nClu] = clus_pos.phi();
      S4Clu[nClu] =  s4s9_max * simple_energy; // s4s9_max is a ratio with e3x3 as the denominator
      S25Clu[nClu] = e5x5;
      nCryClu[nClu] = nCryinclu;
      seedTimeClu[nClu] = seedTime;
      seedEnergyClu[nClu] = seedEnergy;
      recEnergySum[nClu] = e3x3;
      weightedTimeClu[nClu] = weightedTime/e3x3;
 
      if(doEnergyRecalibration_) {
	//
	// Energy re-calibration method derived from a study of HIJING pPb events (2013 production)
	// The energy discrepancy in MC was found to be a function of the number of crystals in the cluster
	// For crystal numbers 1 and 2, there was also a linear correction
	// After these first order corrections were made, a small second order constant fractional increase was done
	// These corrections were checked for the results of the pi0 and the eta(547.5 MeV) masses
	//
	if(nCryinclu < 1 || nCryinclu > 9) {
	  cerr << "\n\n Programming error with nCryinclu = " << nCryinclu << endl;
	  return;
	}
	float totalCorrection = crystalCorrectionFunction(nCryinclu - 1, e3x3);
				
	e3x3 *= totalCorrection;
	et_s *= totalCorrection;
				
	S9Clu[nClu] = e3x3;
	ptClu[nClu] =  et_s;
				
	S4Clu[nClu] *= totalCorrection;
				
	e5x5 *= totalCorrection;
	S25Clu[nClu] = e5x5;
				
      } // check for doing energy re-calibration
      
      if(useClusterCrystalLimit_ && !useClusterCrystalLimitLowPtOnly_  && (nCryinclu < lowCrystalLimit_ || nCryinclu > highCrystalLimit_)) {
	//
	// Cluster limits option was specified, there is no requirement for low pair pT, and this cluster is outside of the limits
	// Cluster will be rejected
	//
	continue; // do not use this cluster, crystal number not in range
      }

      //
      // Check the timing information
      //
      bool goodTimingCheck = true;

      if(doOneDimensionTimeCut_) {
	if(oneDimensionTimeCut_ < 0) {
	  if(fabs(seedTimeClu[nClu]) < -oneDimensionTimeCut_) {
	    goodTimingCheck = false;
	  }
	} // reverse cut
	if(doOneDimensionTimeCut_ > 0) {
	  if(fabs(seedTimeClu[nClu]) > oneDimensionTimeCut_) {
	    goodTimingCheck = false;
	  }
	} // normal cut
      } // check for doing one dimensional  timing cuts on the seed crystal of the cluster

      if(doTwoDimensionTimeCut_) {
	//
	// The default 2D cut has a base width of 20 ns and a minimum value of 8 ns
	// The rescaled (better) 2D cut has these dimensions reduced by the factor twoDimensionTimeCutFactor
	//
	float energyInverse = 1.0/S9Clu[nClu];
       
	float tCut = 4.0 - 10.8452*energyInverse + 14.9102*energyInverse*energyInverse -3.065*energyInverse*energyInverse*energyInverse;

	if(S9Clu[nClu] > 1.123)
	  tCut = 4.0;  // minimum value for the default time cut

	tCut *= twoDimensionTimeCutFactor_;  // rescale the size of the default 2D cut

	if(fabs(seedTimeClu[nClu]) > tCut) {
	  goodTimingCheck = false;
	}

	//
	// Check timing for clusters with 2 or more crystals
	//
	if(doWeightedTimeCut_ && nCryinclu > 1 && nCryinclu <= 9) {
	  if(fabs(weightedTimeClu[nClu] - seedTimeClu[nClu]) > tCut) {
	    goodTimingCheck = false;
	  }
	} // check weighted time for clusters with two or more crystals

      } // check for doing two dimensional timing cuts on the seed crystal of the cluster
	
      if(goodTimingCheck) {
	etaCluUncorrected[nClu] = etaForZEqualsZero;
	double thetaUncorrected = 2.0*atan(exp(-etaCluUncorrected[nClu]));
	zClu[nClu] = 100.0*rECal/tan(thetaUncorrected);  // Z value of cluster in cm
	nClu++;
      } // accept this cluster as having good timing
      
    } // loop over seeds
		
    //
    // Check for an angular match between a cluster and a reco track
    // Also initialize the Simtracks-Ecal correspondence
    //
    for(int iFound=0; iFound<nClu; iFound++) {

      bestNoConvertSimIndexEcal[iFound] = -1;
      countNoConvertSimMatchEcal[iFound] = 0;
      bestNoConvertSimAngleEcal[iFound] = -999.0;

      double eta1 = etaClu[iFound];
      double phi1 = phiClu[iFound];
      double theta1 = 2.0*atan(exp(-eta1));
			
      if(usezEcalCorrection) {
	float zCalValue = zClu[iFound];
				
	if(zCalValue >= zEcalCut)
	  theta1 += zEcalSaturationValue;
				
	if(zCalValue <= -zEcalCut)
	  theta1 -= zEcalSaturationValue;
				
	if(zCalValue > -zEcalCut && zCalValue < zEcalCut)
	  theta1 += zEcalCorrectionFactor*zCalValue;
				
      } // check for using zEcal correction for cluster theta value
      
      //
      // Check for best angular position match with reconstructed tracks
      //
      vector<unsigned int> indexGoodMatches;
      vector<double> valueGoodMatches;
      int nGoodMatches = 0;
      float minimumAngularSeparation = 999.0;
      int indexBestTrackMatch = -1;
			
      nGoodRecoMatches[iFound] = -1;
      valueBestAngleMatch[iFound] = -999.0;
      momentumBestTrackMatch[iFound] = -999.0;
      dxyVertexBestTrackMatch[iFound] = -999.0;
      dzVertexBestTrackMatch[iFound] = -999.0;
      sdxyVertexBestTrackMatch[iFound] = -999.0;
      sdzVertexBestTrackMatch[iFound] = -999.0;
      dPhiBestAngleMatch[iFound] = -999.0;
      dThetaBestAngleMatch[iFound] = -999.0;
      outerRadiusTrackMatch[iFound] = -999.0;
			
      if(recoPtTrackAboveMinimum) {  // check for at least one track above the minimum
	float cosPhotonTheta = cos(theta1);  // cluster cosine
	float sinPhotonTheta = sin(theta1);  // cluster sine
	indexBestTrackMatch = kRecoTrackAbovePtMinimum;  // first track with pT above the minimum
	float trkTheta =  recoThetaTrack[kRecoTrackAbovePtMinimum];
				
	double phiDelta = deltaPhi(phi1, recoPhiDTrack[kRecoTrackAbovePtMinimum]);
	minimumAngularSeparation = acos(cosPhotonTheta*cos(trkTheta) + sinPhotonTheta*sin(trkTheta)*cos(phiDelta));
	//
	// Check good matching criteria
	//
	if(minimumAngularSeparation < goodAngleMatch_ &&
	   fabs(phiDelta) < goodPhiMatch_ && fabs(theta1 - trkTheta) < goodThetaMatch_) {
	  indexGoodMatches.push_back(indexBestTrackMatch);
	  valueGoodMatches.push_back(minimumAngularSeparation);
	  nGoodMatches++;
	}
				
	if(eventn == specialEvent) {
	  cout << "\n For special event " << eventn;
	  cout << ",  kRecoTrackAbovePtMinimum = " << kRecoTrackAbovePtMinimum;
	  cout << ",  nTracksSize = " << nTracksSize;
	  cout << ",  phi1 = " << phi1;
	  cout << ",  eta1 = " << eta1;
	  cout << ",  recoEta = " << recoEtaTrack[kRecoTrackAbovePtMinimum];
	  cout << ",  recoPhi = " << recoPhiDTrack[kRecoTrackAbovePtMinimum];
	  cout << ",  First angular separation for this cluster = " << minimumAngularSeparation;
	}
				
	for(int jTrack=0; jTrack<nTracksSize; jTrack++) {
	  if(jTrack != kRecoTrackAbovePtMinimum &&
	     recoPtTrack[jTrack] >= minimumTrackPtForMatch &&
	     (!matchOnlyHighPurity || (matchOnlyHighPurity && recoPurityTrack[jTrack]))) {
	    trkTheta = recoThetaTrack[jTrack];
						
	    phiDelta = deltaPhi(phi1, recoPhiDTrack[jTrack]);
						
	    float testAngularSeparation = acos(cosPhotonTheta*cos(trkTheta) + sinPhotonTheta*sin(trkTheta)*cos(phiDelta));
	    if(testAngularSeparation < goodAngleMatch_ &&
	       fabs(phiDelta) < goodPhiMatch_ && fabs(theta1 - trkTheta) < goodThetaMatch_) {
	      indexGoodMatches.push_back(indexBestTrackMatch);
	      valueGoodMatches.push_back(testAngularSeparation);
	      nGoodMatches++;
	    }
	    if(testAngularSeparation < minimumAngularSeparation) {
	      minimumAngularSeparation = testAngularSeparation;
	      indexBestTrackMatch = jTrack;
	    } // check for new best angular match
						
            if(eventn == specialEvent) {
	      cout << "\n  jTrack = " << jTrack;
	      cout << ",   recoEta = " << recoEtaTrack[jTrack];
	      cout << ",   recoPhi = " << recoPhiDTrack[jTrack];
	      cout << ",   Current angular separation for this cluster = " << minimumAngularSeparation;
	    }
						
	  } // check for jTrack value and for minimum number of tracks
					
	} // loop over tracks
				
	//
	// Safety check
	//
	if(indexBestTrackMatch < 0) {
	  cerr << "\n\n Programming error, negative value for indexBestTrackMatch " << indexBestTrackMatch << endl;
	  cerr << "\n Event loop ending abnormally" << endl << endl;
	  return;
	}
				
	nGoodRecoMatches[iFound] = nGoodMatches;
	indexBestRecoMatch[iFound] = indexBestTrackMatch;
	valueBestAngleMatch[iFound] = minimumAngularSeparation;
	momentumBestTrackMatch[iFound] = recoPtTrack[indexBestTrackMatch]; 
	dxyVertexBestTrackMatch[iFound] = recoDxyTrack[indexBestTrackMatch];
	dzVertexBestTrackMatch[iFound] = recoDzTrack[indexBestTrackMatch];
	sdxyVertexBestTrackMatch[iFound] = recoSdxyTrack[indexBestTrackMatch];
	sdzVertexBestTrackMatch[iFound] = recoSdzTrack[indexBestTrackMatch];
				
	phiDelta = deltaPhi(phi1, recoPhiDTrack[indexBestTrackMatch]);
	dPhiBestAngleMatch[iFound] = phiDelta;
	double thetaDelta = theta1 - recoThetaTrack[indexBestTrackMatch]; 
	dThetaBestAngleMatch[iFound] = thetaDelta; 
	outerRadiusTrackMatch[iFound] = sqrt(recoOxTrack[indexBestTrackMatch]*recoOxTrack[indexBestTrackMatch] +
					     recoOyTrack[indexBestTrackMatch]*recoOyTrack[indexBestTrackMatch]);
				
	outerPtTrackMatch[iFound] = recoOuterPtTrack[indexBestTrackMatch];
				
	if( minimumAngularSeparation <= goodAngleMatch_ &&
	    fabs(phiDelta) < goodPhiMatch_ && fabs(thetaDelta) < goodThetaMatch_) {
	  recoNMatchTrack[indexBestTrackMatch]++;
	  if(recoEcalTrack[indexBestTrackMatch] == -999) {
	    //
	    // This reco track has not had a previous good match with an ECAL cluster
	    //
	    recoEcalTrack[indexBestTrackMatch] = iFound;  // map the matched ECAL cluster to the reco track information
	    if(eventn <= 60 && trackEcalMatchDebug) {
	      cout << "\n\n Initial Track-ECAL match for track index " << indexBestTrackMatch;
	      cout << "\n   Cluster index number is " << iFound;
	      cout << "\n   Angle matching value is " << valueBestAngleMatch[iFound];
	      cout << endl << endl;
	    }
	  }
	  else {
	    //
	    // This reco track has had a previous good cluster match
	    //
	    int oldValue = recoEcalTrack[indexBestTrackMatch];
	    if(oldValue < NCLUMAX) {
	      if(eventn <= 60 && trackEcalMatchDebug) {
		cout << "\n\n Double Track-ECAL match for track index " << indexBestTrackMatch;
		cout << "\n   Old cluster index number is " << oldValue;
		cout << "\n   New cluster index number is " << iFound;
		cout << "\n   Angle matching value is " << valueBestAngleMatch[iFound];
		cout << endl << endl;
	      }
	      recoEcalTrack[indexBestTrackMatch] = iFound*NCLUMAX + oldValue;  // one layer of multiplexing for a double match
	    }
	  }
					
	} // check on good value for the angular separation
				
      } // check for recoPtTrackAboveMinimum
			
    } // loop over found clusters
    
  } // rhEBpi0.valid() ends
	
  if(nClu > maxClustersPerJob) {
    maxClustersPerJob = nClu;
    eventMaxClustersPerJob = thisEvent;
    runMaxClustersPerJob = thisJob;
  }
	
  if(nCry > maxCryPerJob) {
    maxCryPerJob = nCry;
    eventMaxCryPerJob = thisEvent;
    runMaxCryPerJob = thisJob;
  }
	
  for(int kCluster=0; kCluster<nClu; kCluster++) {
    
    if(suppressTrackMatchedClusters_ && nGoodRecoMatches[kCluster] > 0)
      continue;
		
    float clustrEnr = S9Clu[kCluster];
    float clustrPt = ptClu[kCluster];
    float clustrS49 = S4Clu[kCluster]/clustrEnr;
    float clustrS1 = S1Clu[kCluster];
    float clustrEta = etaClu[kCluster];
    float clustrS25 = S25Clu[kCluster];
    
    // These cuts are used as the global cuts below for the pi0 mass histograms
		
    if(clustrEnr > clustEnrCut &&
       clustrS49 > clustS49Cut_ && clustrS1 > clustS1Cut &&
       fabs(clustrEta) < 1.49 && (fabs(1.0 - clustrS25/clustrEnr) < clustS25Cut)) { // can change to allow only |eta| < 1.30, was 1.49 originally
      
      if(currentAcceptedClusterNumber >= maximumNumberAcceptedCluster) {
	cerr << "\n currentAcceptedClusterNumber is too large " << currentAcceptedClusterNumber << endl;
	return;
      } // safety check on too many clusters
      
      acceptedClusterInformationArray[currentBufferEventIndexCluster][currentAcceptedClusterNumber].thisEvent = thisEvent;
      acceptedClusterInformationArray[currentBufferEventIndexCluster][currentAcceptedClusterNumber].kCluster = kCluster;
      acceptedClusterInformationArray[currentBufferEventIndexCluster][currentAcceptedClusterNumber].nCryClu = nCryClu[kCluster];
      acceptedClusterInformationArray[currentBufferEventIndexCluster][currentAcceptedClusterNumber].clustEta = clustrEta;
      acceptedClusterInformationArray[currentBufferEventIndexCluster][currentAcceptedClusterNumber].clustPhi = phiClu[kCluster];
      acceptedClusterInformationArray[currentBufferEventIndexCluster][currentAcceptedClusterNumber].clustPt = clustrPt;
      acceptedClusterInformationArray[currentBufferEventIndexCluster][currentAcceptedClusterNumber].clustEnr = clustrEnr;
      acceptedClusterInformationArray[currentBufferEventIndexCluster][currentAcceptedClusterNumber].clustS49 = clustrS49;
      acceptedClusterInformationArray[currentBufferEventIndexCluster][currentAcceptedClusterNumber].clustS25 = clustrS25;
      acceptedClusterInformationArray[currentBufferEventIndexCluster][currentAcceptedClusterNumber].hfAllAngle = HFAngle;
      
      currentAcceptedClusterNumber++;
      
      if(currentAcceptedClusterNumber > maximumClustersInSingleEvent)
	maximumClustersInSingleEvent = currentAcceptedClusterNumber;
      
    } // check for good cluster
    
  } // loop over good clusters=======================end loop filling array with current clusters=========================
	
  if(currentAcceptedClusterNumber >= minimumClustersPerEvent) {
    totalEventsWithClusters++;
    countAcceptedCluster[currentBufferEventIndexCluster] = currentAcceptedClusterNumber; // clusters accepted in the current event
    
    // Calculate same-event and mixed-event mass spectra

    if(printPairContributors) {
      cout << "\n At event " << acceptedClusterInformationArray[currentBufferEventIndexCluster][0].thisEvent  << " which has " <<  currentAcceptedClusterNumber << " accepted clusters";
      cout << ", nClu " << nClu;
      cout << " with nHITracks " << nHITracks << " and tHighPurityTracks " << tHighPurityTracks_ << "     [printContributors]";
    }    
    for(int jCluster1=0; jCluster1<currentAcceptedClusterNumber; jCluster1++) {//=====loop over clusters in current event====
      
      Long64_t currentEvent = acceptedClusterInformationArray[currentBufferEventIndexCluster][jCluster1].thisEvent;
      
      float ptCluster1 = acceptedClusterInformationArray[currentBufferEventIndexCluster][jCluster1].clustPt;
      float etaCluster1 = acceptedClusterInformationArray[currentBufferEventIndexCluster][jCluster1].clustEta;
      float phiCluster1 = acceptedClusterInformationArray[currentBufferEventIndexCluster][jCluster1].clustPhi;
      float enrCluster1 = acceptedClusterInformationArray[currentBufferEventIndexCluster][jCluster1].clustEnr;
      
      float p1x = ptCluster1*cos(phiCluster1);
      float p1y = ptCluster1*sin(phiCluster1);
      float p1z = enrCluster1*cos(2.0*atan(exp(-etaCluster1)));
      
      double clust1Theta = 2.0*atan(exp(-etaCluster1));
      
      float xCluster1 = rECal*cos(phiCluster1);
      float yCluster1 = rECal*sin(phiCluster1);
      float zCluster1 = rECal/tan(clust1Theta);

      int nCryClu1 = acceptedClusterInformationArray[currentBufferEventIndexCluster][jCluster1].nCryClu;

      for(int kBuffer=0; kBuffer<bufferDepth; kBuffer++) {//=======Loop over OTHER events====================
	bool sameEventCheck = false;
	if(currentEvent == eventNumberCluster[kBuffer]) {
	  sameEventCheck = true;
	}
				
	int previousAcceptedNumber = countAcceptedCluster[kBuffer];
	if(sameEventCheck && currentAcceptedClusterNumber != previousAcceptedNumber) {
	  cerr << "\n Programming error, same event cluster numbers are not the same";
	  cerr << ";  currentAcceptedClusterNumber " << currentAcceptedClusterNumber;
	  cerr << ",  previousAcceptedNumber " << previousAcceptedNumber;
	  cerr << ",  currentEvent = " << currentEvent;
	  cerr << endl;
	  return;
	}
				
	for(int jCluster2=0; jCluster2<previousAcceptedNumber; jCluster2++) {//=============loop over clusters in kbuffer==
					
	  Long64_t previousEvent = acceptedClusterInformationArray[kBuffer][jCluster2].thisEvent;
	  if(previousEvent == currentEvent && !sameEventCheck) {
	    cerr << "\n Programming error: trying to mix clusters with the same event number " << currentEvent;
	    cerr << ",  kBuffer = " << kBuffer << ", clusters in previous event " << previousAcceptedNumber;
	    for(int jBuffer=0; jBuffer<bufferDepth; jBuffer++) {
	      cout << "\n jBuffer " << jBuffer << ",  eventNumber " << eventNumberCluster[jBuffer];
	      cout << ", clusters in event " << countAcceptedCluster[jBuffer];
	    }
	    cerr << endl;
	    return;
	  }
					
	  if(sameEventCheck && jCluster2<=jCluster1)
	    continue;
					
	  if(sameEventCheck)
	    countSameEvents++;
					
	  countMixedClusterExamined++;
					
	  float ptCluster2 = acceptedClusterInformationArray[kBuffer][jCluster2].clustPt;
	  float etaCluster2 = acceptedClusterInformationArray[kBuffer][jCluster2].clustEta;
	  float enrCluster2 = acceptedClusterInformationArray[kBuffer][jCluster2].clustEnr;
	  float phiCluster2 = acceptedClusterInformationArray[kBuffer][jCluster2].clustPhi;
					
	  float p2x = ptCluster2*cos(phiCluster2);
	  float p2y = ptCluster2*sin(phiCluster2);
	  float p2z = enrCluster2*cos(2.0*atan(exp(-etaCluster2)));
	  double clust2Theta = 2.0*atan(exp(-etaCluster2));
					
	  float pxsum = p1x + p2x;
	  float pysum = p1y + p2y;
	  float pi0Pt = sqrt(pxsum*pxsum + pysum*pysum);

	  int nCryClu2 = acceptedClusterInformationArray[kBuffer][jCluster2].nCryClu;
	  //
	  // Check for cluster crystal limits
	  //
	  if(useClusterCrystalLimit_ && useClusterCrystalLimitLowPtOnly_  && pi0Pt < clusterCrystalLimitLowPtOnly_ && 
	     (nCryClu1 < lowCrystalLimit_ || nCryClu1 > highCrystalLimit_ ||
	      nCryClu2 < lowCrystalLimit_ || nCryClu2 > highCrystalLimit_))
	    continue; // reject this pair because of the cluster crystal limits check

	  float pi0Phi = atan2(pysum, pxsum); 
	  float pzsum = p1z + p2z;
	  float totalMomentum = sqrt(pi0Pt*pi0Pt + pzsum*pzsum);
	  float pi0Theta = acos(pzsum/totalMomentum);
	  float pi0Eta = -log(tan(pi0Theta/2.));
					
	  float xCluster2 = rECal*cos(phiCluster2);
	  float yCluster2 = rECal*sin(phiCluster2);
	  float zCluster2 = rECal/tan(clust2Theta);
					
	  float dSeparationSquared = (xCluster2 - xCluster1)*(xCluster2- xCluster1) +
	    (yCluster2 - yCluster1)*(yCluster2- yCluster1) +
	    (zCluster2 - zCluster1)*(zCluster2- zCluster1);
					
	  if(dSeparationSquared < minimumSeparationSquared) {
	    continue;
	  } // check for passing absolute minimum separation cut
					
	  if(usePtDependentSeparation && pi0Pt > 0.0 ) {
	    // Parameterization result is in cm, but need meters for checking
	    double predictedMinimumDistance = 0.01*rescaleSeparationFactor*(aSeparationCoefficient/pi0Pt + bSeparationCoefficient/(pi0Pt*pi0Pt));
	    if(dSeparationSquared < predictedMinimumDistance*predictedMinimumDistance) {
	      countSeparationPtCut++;
	      continue;
	    } // check for passing pT dependent separation cut
	  }
					
	  float pi0Energy = enrCluster1 + enrCluster2;
	  float combinedEventPi0Mass = sqrt(pi0Energy*pi0Energy - totalMomentum*totalMomentum);	  
					
	  if(useClusterEnergyAsymmetryCut && combinedEventPi0Mass < maximumPi0MassForHistogram) {  // asymmetry cut for pi0 mass only
	    float clusterEnergySum = enrCluster2 + enrCluster1;
						
	    if(clusterEnergySum <= 0.0) {
	      cerr << "\n Reconstruction error, cluster energy sum = " << clusterEnergySum;
	      cerr << "\n  Cluster1 energy = " <<  enrCluster1;
	      cerr << "\n  Cluster2 energy = " <<  enrCluster2;
	      cerr << endl;
	      return;
	    } // safety check on cluster energy sum
	    float clusterEnergyAsymmetry = fabs(enrCluster2 - enrCluster1)/clusterEnergySum;
	    if(clusterEnergyAsymmetry >  clusterEnergyAsymmetryCut) {
							
	      continue;  // skip this combination
	    }
						
	  } // check on using cluster energy asymmetry cut
					
	  double cosOpenAngle = cos(clust1Theta)*cos(clust2Theta) + sin(clust1Theta)*sin(clust2Theta)*cos(phiCluster2 - phiCluster1);
	  float openAngle = acos(cosOpenAngle);
					
	  if(combinedEventPi0Mass > 0.0 && combinedEventPi0Mass < maximumPi0MassForHistogram) {
						
	    // Checks for combinations in the pi0 mass range
						
	    bool failOpeningAngleCut = false;
	    if(useFixedOpeningAngleCut)
	      failOpeningAngleCut = true;
						
	    if(useFixedOpeningAngleCut) {
							
	      // opening angle cut according to pT-Dependent parameterization
							
	      float pTDependentOpenAngleCut = aOpenAngleCutParameter/pi0Pt + bOpenAngleCutParameter/(pi0Pt*pi0Pt);
	      if(openAngle > pTDependentOpenAngleCut)
		failOpeningAngleCut = false;
	    } // check on using pT-dependent opening angle parameterization
						
	    if(failOpeningAngleCut) {
	      continue; // skip this combination
	    } // check on passing opening angle cut, either same-event or mixed-event
						
	  }// check on being  inside pi0 mass histogram region 
					
	  if(pi0Pt < lowPtCut || pi0Pt > highPtCut)
	    continue;
	  if(pi0Eta <= lowEtaLimit || pi0Eta >= highEtaLimit)
	    continue;
					
	  if(combinedEventPi0Mass > 0.0 && combinedEventPi0Mass < maximumPi0MassForHistogram) {
	    if(sameEventCheck) {
	      pi0MassHistSameEvent->Fill(combinedEventPi0Mass);
	      pi0PhiTrueHist->Fill(pi0Phi);
	      pi0EtaTrueHist->Fill(pi0Eta);
							
	      char histogramName1[200];
	      char histogramName2[200];
	      for(int kPt=0; kPt<bins1; kPt++) {
		if(pi0Pt > NptBins_[kPt] && pi0Pt <= NptBins_[kPt+1])
		  {
		    sprintf(histogramName1, "pi0MassSameEventPtBin%d", kPt);
		    pi0MassHistSameEventvsPt[histogramName1]->Fill(combinedEventPi0Mass);
		    sprintf(histogramName2, "pi0pT%d", kPt);
		    pi0MeanPt[histogramName2]->Fill(pi0Pt);
		    if(printPairContributors && kPt == 0 && countPairContributors_ < 2000 && combinedEventPi0Mass < 0.30 && 
		       tHighPurityTracks_ >= 120 && tHighPurityTracks_ <150) {
		      countPairContributors_++;
		      cout << "\n " << countPairContributors_ << ") ";
		      cout << " Cluster1 = " << acceptedClusterInformationArray[kBuffer][jCluster1].kCluster;;
		      cout << ", with energy = " << enrCluster1;
		      cout << ";  Cluster2 = " << acceptedClusterInformationArray[kBuffer][jCluster2].kCluster;; ;
		      cout << ", with energy = " << enrCluster2;
		      cout << "; pair mass = " << combinedEventPi0Mass;
		      cout << ", with pT = " << pi0Pt;
		      cout << ", in event = " << currentEvent;
		      cout << "    [printContributors]";
		    } // check on printout
		    break;
		  } // check on pT bin
	      } // loop over pT bins
							
	      if(combinedEventPi0Mass >= lowInvMassCut_ && combinedEventPi0Mass < highInvMassCut_) {
		//Used to calculate the correlation function from the side-band
		_pi0Spectrum->Fill(pi0Eta, pi0Pt, occ);
		pi0PtTrueHist->Fill(pi0Pt);

		if(pi0HadronCorrelations_) {
		  TVector3 pvectorPi0;
		  pvectorPi0.SetPtEtaPhi(pi0Pt,pi0Eta,pi0Phi);
		  pVect_trg.push_back(pvectorPi0);
		}

		// For eta-hadron correlations 
		if(combinedEventPi0Mass >=0.4 && combinedEventPi0Mass < 0.6) {
		  if(etaHadronCorrelations_) {
		    TVector3 pvectorPi0;
		    pvectorPi0.SetPtEtaPhi(pi0Pt,pi0Eta,pi0Phi);
		    pVect_trg.push_back(pvectorPi0); }
		}
	      
	      } // check the invariant mass window
							
	    } // same event check
	    else {
							
	      pi0MassHistMixed->Fill(combinedEventPi0Mass);
							
	      char histogramName3[200];
	      for(int kPt=0; kPt<bins1; kPt++) {
		if(pi0Pt > NptBins_[kPt] && pi0Pt <= NptBins_[kPt+1])
		  {
		    sprintf(histogramName3, "pi0MassMixedEventPtBin%d", kPt);
		    pi0MassHistMixedEventvsPt[histogramName3]->Fill(combinedEventPi0Mass);
		  }
	      } // loop over pT bins
							
	    } // check for mixed event mode
	  } // check histogram mass window
					
	} // loop over previous event clusters
				
      } // loop over event buffer
			
    } // loop over current clusters
    if(printPairContributors) {
      cout << endl;
    }
		
    currentBufferEventIndexCluster++;
    if(currentBufferEventIndexCluster == bufferDepth)
      currentBufferEventIndexCluster = 0;  // roll back to the start of the buffer for filling with the next event
		
    if(currentBufferEventIndexCluster >= bufferDepth) {
      cerr << "\n Programming error: attempting to set an index beyond the event limit in the buffer";
      cerr << endl;
      return;
    }
		
  } //// check for minimum number of clusters in this event
	
  /////// Finally for pi0-hadron correlations //////////////////

  /////// Calculating the reco signal first, within the event loop ////////////////
	
  int nMult_trg = (int)pVect_trg.size();
  int nMult_ass = (int)pVect_ass.size();
	
  for(int ntrg=0; ntrg<nMult_trg; ++ntrg) // loop over the pi0
    {
      TVector3 pvector_trg = (pVect_trg)[ntrg];
      double eta_trg = pvector_trg.Eta();
      double phi_trg = pvector_trg.Phi();
      double pt_trg = pvector_trg.Pt(); //correction
	
      for(int nass=0; nass<nMult_ass; nass++) // loop over the charged particles
	{
	  TVector3 pvector_ass = (pVect_ass)[nass];
	  double eta_ass = pvector_ass.Eta();
	  double phi_ass = pvector_ass.Phi();

	  double deltaEta = eta_ass - eta_trg;
	  //
	  // How does this code different from the standard CMS function for Delta-Phi?
	  //
	  double deltaPhi = phi_ass - phi_trg;
	  if(deltaPhi > M_PI) deltaPhi = deltaPhi - 2*M_PI;
	  if(deltaPhi < -M_PI) deltaPhi = deltaPhi + 2*M_PI;
	  if(deltaPhi > -M_PI && deltaPhi < -M_PI/2.0) deltaPhi = deltaPhi + 2*M_PI;
			
	  // deltaPhi values > 4 are being computed ??

	  if(deltaEta == 0 && deltaPhi == 0) continue;

	  //
	  // Monika's hSignal histogram filling
	  //

	  if(pi0HadronCorrelations_ || etaHadronCorrelations_) {
	    char histogramName5[200];
	    for(int kPt=0; kPt<bins1; kPt++) {
	      if(pt_trg > NptBins_[kPt] && pt_trg <= NptBins_[kPt+1]) //correction
		{

		  sprintf(histogramName5, "hSignalPtBin%d", kPt);
		  hSignal[histogramName5]->Fill(fabs(deltaEta),fabs(deltaPhi),1.0/4.0/nMult_trg);
		  hSignal[histogramName5]->Fill(-fabs(deltaEta),fabs(deltaPhi),1.0/4.0/nMult_trg);
		  hSignal[histogramName5]->Fill(fabs(deltaEta),-fabs(deltaPhi),1.0/4.0/nMult_trg);
		  hSignal[histogramName5]->Fill(-fabs(deltaEta),-fabs(deltaPhi),1.0/4.0/nMult_trg);
		  hSignal[histogramName5]->Fill(fabs(deltaEta),2*M_PI-fabs(deltaPhi),1.0/4.0/nMult_trg);
		  hSignal[histogramName5]->Fill(-fabs(deltaEta),2*M_PI-fabs(deltaPhi),1.0/4.0/nMult_trg); 

		  break; // no need to check remaining pT bins

		} // check pt_trg

	    } // loop over pT bins

	  } // check pi0HadronCorrelations or etaHadronCorrelations

	  if(diHadronCorrelations_) {
	    hSignal1->Fill(fabs(deltaEta),fabs(deltaPhi),1.0/4.0/nMult_trg);
	    hSignal1->Fill(-fabs(deltaEta),fabs(deltaPhi),1.0/4.0/nMult_trg);
	    hSignal1->Fill(fabs(deltaEta),-fabs(deltaPhi),1.0/4.0/nMult_trg);
	    hSignal1->Fill(-fabs(deltaEta),-fabs(deltaPhi),1.0/4.0/nMult_trg);
	    hSignal1->Fill(fabs(deltaEta),2*M_PI-fabs(deltaPhi),1.0/4.0/nMult_trg);
	    hSignal1->Fill(-fabs(deltaEta),2*M_PI-fabs(deltaPhi),1.0/4.0/nMult_trg); 
	  } // check diHadronCorrelations

	} // Loop over nass		
			
    } // loop over ntrg
  pVectVect_trg.push_back(pVect_trg);
  pVectVect_ass.push_back(pVect_ass);
  zvtxVect.push_back(zVertexEventSelected); 

  /// mc truth
  bool isMC = !iEvent.isRealData();
	
  // get MC info from hiGenParticleCandidates, change to genParticles for pPb 2013 analysis 
  Handle<GenParticleCollection> genParticles;
  if(isMC) iEvent.getByLabel("genParticles", genParticles);

  if(isMC) {
   for(size_t i=0; i<genParticles->size(); i++) {
			
     const GenParticle & p = (*genParticles)[i];
     int thisPdgId = p.pdgId();
     float thisEta = p.eta();
     float thisPt = p.pt();
     float thisPhi = p.phi();

     bool allowedChargedParticle = false;
     if(thisPt >= ptMin_ass_ && thisPt <= ptMax_ass_ && fabs(thisEta) < 2.4) {
       allowedChargedParticle = thisPdgId==211 || thisPdgId==-211 || thisPdgId==321 || thisPdgId==-321 || thisPdgId==2212 || thisPdgId==-2212;
     }
     if(allowedChargedParticle) { // storing allowed charged particles
       //
       // Store kinematics of this generator charged particle
       //
       TVector3 pvectorCharge;
       pvectorCharge.SetPtEtaPhi(thisPt, thisEta, thisPhi);
       pGenVect_ass.push_back(pvectorCharge);
     } // check for allowed charged particles

     if(thisPdgId == 111 && fabs(thisEta)<1.49 && thisPt >= ptMin_trg_ && thisPt <= ptMax_trg_) { // check for pi0
       TVector3 pvectorPi0;
       pvectorPi0.SetPtEtaPhi(thisPt, thisEta, thisPhi);
       pGenVect_trg.push_back(pvectorPi0);
     } // check for pi0

   } // loop over generator particles
  } // check isMc

  // Now the generator signal
	
  nMult_trg = (int)pGenVect_trg.size();
  nMult_ass = (int)pGenVect_ass.size();
		
  for(int ntrg=0; ntrg<nMult_trg; ++ntrg) // loop over the pi0
    {
      TVector3 pvector_trg = (pGenVect_trg)[ntrg];
      double eta_trg = pvector_trg.Eta();
      double phi_trg = pvector_trg.Phi();
      double pt_trg = pvector_trg.Pt(); //correction
				
      for(int nass=0; nass<nMult_ass; nass++) // loop over the charged particles
	{
	  TVector3 pvector_ass = (pGenVect_ass)[nass];
	  double eta_ass = pvector_ass.Eta();
	  double phi_ass = pvector_ass.Phi();
		
	  double deltaEta = eta_ass - eta_trg;

	  //
	  // How does this code different from the standard CMS function for Delta-Phi?
	  //
	  double deltaPhi = phi_ass - phi_trg;
	  if(deltaPhi > M_PI) deltaPhi = deltaPhi - 2*M_PI;
	  if(deltaPhi < -M_PI) deltaPhi = deltaPhi + 2*M_PI;
	  if(deltaPhi > -M_PI && deltaPhi < -M_PI/2.0) deltaPhi = deltaPhi + 2*M_PI;

	  // deltaPhi values > 4 are being computed ??
	  // cout << "\n nass " << nass << " eta " << eta_ass << " phi " << phi_ass << " deltaEta " << deltaEta << " deltaPhi " << deltaPhi << endl;
			
	  if(deltaEta == 0 && deltaPhi == 0) continue;

	  //
	  // Monika's hSignal histogram filling
	  //

	  if(pi0HadronCorrelations_ || etaHadronCorrelations_) {
	    char histogramName5[200];
	    for(int kPt=0; kPt<bins1; kPt++) {
	      if(pt_trg > NptBins_[kPt] && pt_trg <= NptBins_[kPt+1]) //correction
		{

		  sprintf(histogramName5, "hGenSignalPtBin%d", kPt);

		  hGenSignal[histogramName5]->Fill(fabs(deltaEta),fabs(deltaPhi),1.0/4.0/nMult_trg);
		  hGenSignal[histogramName5]->Fill(-fabs(deltaEta),fabs(deltaPhi),1.0/4.0/nMult_trg);
		  hGenSignal[histogramName5]->Fill(fabs(deltaEta),-fabs(deltaPhi),1.0/4.0/nMult_trg);
		  hGenSignal[histogramName5]->Fill(-fabs(deltaEta),-fabs(deltaPhi),1.0/4.0/nMult_trg);
		  hGenSignal[histogramName5]->Fill(fabs(deltaEta),2*M_PI-fabs(deltaPhi),1.0/4.0/nMult_trg);
		  hGenSignal[histogramName5]->Fill(-fabs(deltaEta),2*M_PI-fabs(deltaPhi),1.0/4.0/nMult_trg); 

		  break;  // no need to check the remaining pT bins

		} // check pt_trg

	    } // loop over pT bins

	  } // check pi0HadronCorrelations or etaHadronCorrelations

	  if(diHadronCorrelations_) {
	    hGenSignal1->Fill(fabs(deltaEta),fabs(deltaPhi),1.0/4.0/nMult_trg);
	    hGenSignal1->Fill(-fabs(deltaEta),fabs(deltaPhi),1.0/4.0/nMult_trg);
	    hGenSignal1->Fill(fabs(deltaEta),-fabs(deltaPhi),1.0/4.0/nMult_trg);
	    hGenSignal1->Fill(-fabs(deltaEta),-fabs(deltaPhi),1.0/4.0/nMult_trg);
	    hGenSignal1->Fill(fabs(deltaEta),2*M_PI-fabs(deltaPhi),1.0/4.0/nMult_trg);
	    hGenSignal1->Fill(-fabs(deltaEta),2*M_PI-fabs(deltaPhi),1.0/4.0/nMult_trg); 
	  } // check diHadronCorrelations

	} // Loop over nass		
			
    } // loop over ntrg
  
  pGenVectVect_trg.push_back(pGenVect_trg);
  pGenVectVect_ass.push_back(pGenVect_ass);
	
  ///////////////////////////////////////////////////////////////////////////
	
	
  // get GEANT sim tracks and vertices (includes conversions)
  Handle<SimTrackContainer> simTracks_h;
  const SimTrackContainer* simTracks;
  if( isMC ) iEvent.getByLabel("g4SimHits", simTracks_h);
  simTracks = (simTracks_h.isValid()) ? simTracks_h.product() : 0;
	
  Handle<SimVertexContainer> simVert_h;
  const SimVertexContainer* simVertices;
  if( isMC ) iEvent.getByLabel("g4SimHits", simVert_h);
  simVertices = (simVert_h.isValid()) ? simVert_h.product() : 0;
  nSimTracks = 1;

  mergedTrackTruthSize = 1;
  kMerge[0] = -1;
  numberDecayVerticesMerge[0] = -1;
  pdgIdMerge[0] = -1;
	
  if( isMC ) 
    {
		
      size_t simTracksSize = -2;
      if(simTracks)
	simTracksSize =  simTracks_h->size();
		
      nSimTracks = simTracksSize;
		
      size_t simVerticesSize = -2;
      if(simVertices)
	simVerticesSize = simVert_h->size();
		
      genSize = genParticles->size();
		
      Handle<TrackingParticleCollection> mergedTrackTruth;
      int mergedTrackTruthSizeOriginal = 0;
      if(mergedTrackTruthStore_) {
	iEvent.getByLabel("mergedtruth", "MergedTrackTruth", mergedTrackTruth);
	mergedTrackTruthSizeOriginal = mergedTrackTruth->size();
      }
      mergedTrackTruthSize = mergedTrackTruthSizeOriginal;
		
      if(mergedTrackTruthSize > 0 && mergedTrackTruthStore_) {
	int countTrueTrack = 0;
			
	for (TrackingParticleCollection::const_iterator iTrack = mergedTrackTruth->begin(); iTrack!=mergedTrackTruth->end(); ++iTrack) {
				
	  int thisPdgId = iTrack->pdgId();
	  bool allowedParticle = false;
	  allowedParticle = thisPdgId==22 || thisPdgId==130 || thisPdgId==310 || thisPdgId==111 || thisPdgId==311;
	  if(!allowedParticle)
	    continue;
				
	  kMerge[countTrueTrack] = countTrueTrack;
	  numberDecayVerticesMerge[countTrueTrack] = (iTrack->decayVertices()).size();
	  pdgIdMerge[countTrueTrack] = thisPdgId;
	  numberEarlyDecayMerge[countTrueTrack] = 0;
				
	  xDecayVertexMerge[countTrueTrack] = 0.0;
	  yDecayVertexMerge[countTrueTrack] = 0.0;
	  rDecayVertexMerge[countTrueTrack] = 0.0;
	  zDecayVertexMerge[countTrueTrack] = 0.0;
		
	  if(numberDecayVerticesMerge[countTrueTrack] > 0) {
	    bool decayVertexLimit = false;
	    for (TrackingVertexContainer::const_iterator iTV = (iTrack->decayVertices()).begin(); iTV != (iTrack->decayVertices()).end(); ++iTV) {
						
	      // float rDecayVertex = ((**iTV).position()).R();  // This is sqrt(x*x + y*y + z*z)
	      float xDecayVertex = ((**iTV).position()).X();
	      float yDecayVertex = ((**iTV).position()).Y();
	      float rDecayVertex = sqrt(xDecayVertex*xDecayVertex + yDecayVertex*yDecayVertex);
	      float zDecayVertex = ((**iTV).position()).Z();

	      // cout << "\n    True track count " << countTrueTrack;
	      // cout << "\n    Number decay vertices " << numberDecayVerticesMerge[countTrueTrack];
	      // cout << "\n    Decay vertex R " << rDecayVertex << ", decay vertex Z " << zDecayVertex; 
						
	      if( rDecayVertex < 129. && fabs(zDecayVertex) < 304.) {
							
		numberEarlyDecayMerge[countTrueTrack] += 1;
							
		xDecayVertexMerge[countTrueTrack] = xDecayVertex;
		yDecayVertexMerge[countTrueTrack] = yDecayVertex;
		rDecayVertexMerge[countTrueTrack] = rDecayVertex;
		zDecayVertexMerge[countTrueTrack] = zDecayVertex;
							
		decayVertexLimit = true;
							
	      } // check on early decay vertex
						
	      if(decayVertexLimit)
		break;
						
	    } // loop over decay vertices
	  } // check for non-zero number of decay vertices
				
	  const TrackingVertexRef& trackVertex = iTrack->parentVertex(); // returns a TLorentz Vector object
	  double xParentVertex = (trackVertex->position()).X();
	  double yParentVertex = (trackVertex->position()).Y();
	  double rParentVertex = sqrt(xParentVertex*xParentVertex + yParentVertex*yParentVertex);
	  double zParentVertex = (trackVertex->position()).Z();
				
	  xParentVertexMerge[countTrueTrack] = xParentVertex;
	  yParentVertexMerge[countTrueTrack] = yParentVertex;
	  rParentVertexMerge[countTrueTrack] = rParentVertex;
	  zParentVertexMerge[countTrueTrack] = zParentVertex;
				
	  if(fabs(rParentVertexMerge[countTrueTrack] - rPrimaryVertex) < rPrimaryCut &&
	     fabs(zParentVertexMerge[countTrueTrack] - zPrimaryVertex) < zPrimaryCut) {
	    primaryTrackMerge[countTrueTrack] = 1;
	  }
	  else {
	    primaryTrackMerge[countTrueTrack] = 0;
	  }
				
	  double xMomentum = ((*iTrack).momentum()).X();
	  double yMomentum = ((*iTrack).momentum()).Y();
	  double zMomentum = ((*iTrack).momentum()).Z();
	  double phi = atan2(yMomentum, xMomentum);
	  double totalMomentum = iTrack->p();
				
	  double theta = acos(zMomentum/totalMomentum);
	  double eta = -log(tan(theta/2.));
	  double pt = totalMomentum*sin(theta);
				
	  if(primaryTrackMerge[countTrueTrack] == 1 && 
	     ((eta < -etaCutForMerge || eta > etaCutForMerge) ||
	      ((*iTrack).charge() !=0 && pt < ptCutForMerge))) {
	    continue;  // this skips the increment of the countTrueTrack variable for primary particles outside of the etaCutForMerge or ptCutForMerge windows;
	  }
				
	  bestEcalAngleMatch[countTrueTrack] = -999.0;
	  bestEcalSeedTimeMatch[countTrueTrack] = -999.0;
	  bestEcalPhiMatch[countTrueTrack] = 0.0;
	  bestEcalDPhiMatch[countTrueTrack] = 0.0;
	  bestEcalDEtaMatch[countTrueTrack] = 0.0;
	  bestEcalPtMatch[countTrueTrack] = 0.0;
				
	  ptMerge[countTrueTrack] = pt;
	  etaMerge[countTrueTrack] = eta;
	  phiMerge[countTrueTrack] = phi;
				
	  float bestAngleMatch = 999.0;
	  float bestPtMatch = 0.0;
	  float bestEtaMatch = 0.0;
	  float bestPhiMatch = 0.0;
	  int bestPdgIdMatch = -1;
	  int bestGenIndexMatch = -1;
				
	  if(primaryTrackMerge[countTrueTrack] == 1) {
					
	    //
	    // Search for genParticle match, according to momentum
	    //
	    for(size_t i=0; i<genParticles->size(); i++) {
						
	      const GenParticle & p = (*genParticles)[i];
						
	      float ptGen = p.pt();
	      float etaGen = p.eta();
	      float phiGen = p.phi();
	      if(fabs(pt - ptGen)/ptGen < ptPrimaryCut) {
		float testAngleMatch = sqrt((etaGen - eta)*(etaGen - eta) + (phiGen - phi)*(phiGen - phi));
		if(testAngleMatch < bestAngleMatch) {
		  bestAngleMatch = testAngleMatch;
		  bestEtaMatch = etaGen;
		  bestPhiMatch = phiGen;
		  bestPtMatch = ptGen;
		  bestPdgIdMatch = p.pdgId();
		  bestAngleMatch = testAngleMatch;
		  bestGenIndexMatch = i;
		} // check for better angle match
	      } // check for good momentum match
						
	    } // loop over generator particles
	    //
	    // Search for matches of unconverted primary photons to ECAL, using Delta-Phi and Delta-Eta
	    //
	    if(pdgIdMerge[countTrueTrack] == 22) { // check for photon, already have selected primary particles
	      double bestEAngleMatch = 999.0;
	      double bestEPhiMatch = 0.0;
	      double bestEDPhiMatch = 0.0;
	      double bestEDEtaMatch = 0.0;
	      double bestEPtMatch = 0.0;
	      double bestESeedTimeMatch = -999.0;
	      int bestEIndexMatch = -1;
	      //
	      // Check for best cluster match
	      //
	      for(int jClu=0; jClu<nClu; jClu++) {
		double phiDelta = deltaPhi(phiClu[jClu], phi);
		double etaDelta = etaClu[jClu] - eta;
		double testMatch = sqrt(phiDelta*phiDelta + etaDelta*etaDelta);
		if(testMatch < bestEAngleMatch) {
		  bestEAngleMatch = testMatch;
		  bestEPhiMatch = phiClu[jClu];
		  bestEDPhiMatch = phiDelta;
		  bestEDEtaMatch = etaDelta;
		  bestEPtMatch = ptClu[jClu];
		  bestESeedTimeMatch = seedTimeClu[jClu];
		  bestEIndexMatch = jClu;
		}
	      } // loop over reconstructed clusters
						
	      bestEcalAngleMatch[countTrueTrack] = bestEAngleMatch;
	      bestEcalPhiMatch[countTrueTrack] = bestEPhiMatch;
	      bestEcalDPhiMatch[countTrueTrack] = bestEDPhiMatch;
	      bestEcalDEtaMatch[countTrueTrack] = bestEDEtaMatch;
	      bestEcalPtMatch[countTrueTrack] = bestEPtMatch;
	      bestEcalIndexMatch[countTrueTrack] = bestEIndexMatch;
	      bestEcalSeedTimeMatch[countTrueTrack] = bestESeedTimeMatch;
						
	    } // select photons from mergeTrackTruth
	  }
	  else {
	    primaryTrackMerge[countTrueTrack] = 0;
	  }
				
	  bestAngleMatchMerge[countTrueTrack] = bestAngleMatch;
	  bestPtMatchMerge[countTrueTrack] = bestPtMatch;
	  bestEtaMatchMerge[countTrueTrack] = bestEtaMatch;
	  bestPhiMatchMerge[countTrueTrack] = bestPhiMatch;
	  bestPdgIdMatchMerge[countTrueTrack] = bestPdgIdMatch;
	  bestGenIndexMatchMerge[countTrueTrack] = bestGenIndexMatch;
				
	  countTrueTrack++;
	} // loop over mergedTrackTruth
			
	mergedTrackTruthSize = countTrueTrack;  // this will be less than the orignal mergedTrackTruthSize because of the etaCutForMerge
			
      } // check for mergedTrackTruthSize > 0
		
      if(mergedTrackTruthDebug && eventn < 30) {
	cout << "\n For Event " << eventn;
	cout << " the generator has " << genSize << " particles";
	cout << ", and the mergedTrackTruth size is " << mergedTrackTruthSize;
	cout << "\n The number of HI reconstructed tracks is " << nHITracks;
	cout << " and the number of high purity tracks size is " << tHighPurityTracks_;
	cout << "\n The size of simTracks is " << simTracksSize;
	cout << " and the size of simVertices is " << simVerticesSize;
	cout << endl;
      }

      // 
      // Code to fill the charged meson part of the tree
      //
      int kChMesonCount = 0;
      for(size_t i=0; i<genParticles->size(); i++) {
			
	const GenParticle & p = (*genParticles)[i];
	int thisPdgId = p.pdgId();
	float mesonEta = p.eta();
	float mesonPt = p.pt();
	bool allowedMeson = false;
	if(mesonPt >= ptMin_ass_ && mesonPt <=  ptMax_ass_ && fabs(mesonEta) < 2.4) {
	  allowedMeson = thisPdgId==211 || thisPdgId==-211 || thisPdgId==321 || thisPdgId==-321 || thisPdgId==2212 || thisPdgId==-2212;
	}
	if(allowedMeson) { // storing allowed charged mesons 
	  kChMeson[kChMesonCount] = kChMesonCount;
	  pdgIdChMeson[kChMesonCount] = thisPdgId;
	  statusChMeson[kChMesonCount] = p.status();
	  genPartIndexChMeson[kChMesonCount] = i;

	  const Candidate *mom = p.mother();
	  if(mom)
	    motherIdChMeson[kChMesonCount] = mom->pdgId();
	  else
	    motherIdChMeson[kChMesonCount] = -1;
	  ptChMeson[kChMesonCount] = p.pt();
	  etaChMeson[kChMesonCount] = mesonEta;  
	  phiChMeson[kChMesonCount] = p.phi();

	  kChMesonCount++;

	} // check on allowed meson

      } // loop over all generated particles, check for charged particles
      nChMesonSize = kChMesonCount; // number of accepted charged particles
      cout << "\n nChMesonSize = " << nChMesonSize << endl;

      //
      // Code to fill the neutral meson part of the tree
      //
      int kMesonCount = 0;
      int countAllowedMesons = 0;
      int countDisAllowedMesons = 0;
		
      for(size_t i=0; i<genParticles->size(); i++) {
			
	const GenParticle & p = (*genParticles)[i];
	int thisPdgId = p.pdgId();
	float mesonEta = p.eta();
	bool allowedMeson = false;
	if(fabs(mesonEta) < 1.49) {
	  allowedMeson = thisPdgId==130 || thisPdgId==310 || thisPdgId==311 || thisPdgId==111 || thisPdgId==221 || thisPdgId==213 || thisPdgId==-213 || thisPdgId==223 || thisPdgId==313 || thisPdgId==-313 || thisPdgId==331;
	}

	if(!allowedMeson)
	  countDisAllowedMesons++;
	if(allowedMeson) { // storing allowed mesons 
	  countAllowedMesons++;
	  kMeson[kMesonCount] = kMesonCount;
	  pdgIdMeson[kMesonCount] = thisPdgId;
	  statusMeson[kMesonCount] = p.status();
	  genPartIndexMeson[kMesonCount] = i;
	  const Candidate *mom = p.mother();
	  if(mom)
	    motherIdMeson[kMesonCount] = mom->pdgId();
	  else
	    motherIdMeson[kMesonCount] = -1;
	  ptMeson[kMesonCount] = p.pt();
	  etaMeson[kMesonCount] = mesonEta;  
	  phiMeson[kMesonCount] = p.phi();
				
	  int numberOfDaughters = 0;
	  float ptDaughter[3];
	  float etaDaughter[3];
	  float phiDaughter[3];
	  int   pdgIdDaughter[3];
	  const GenParticleRefVector& daughterRefs = p.daughterRefVector();
	  for(reco::GenParticleRefVector::const_iterator idr = daughterRefs.begin(); idr!= daughterRefs.end(); ++idr) {
					
	    // cout <<"    - Daughter "<<(*idr).key()<<" "<<(*idr)->pdgId()<<endl;
					
	    if(numberOfDaughters < 3) {
	      ptDaughter[numberOfDaughters] = (*idr)->pt();
	      etaDaughter[numberOfDaughters] = (*idr)->eta();
	      phiDaughter[numberOfDaughters] = (*idr)->phi();
	      pdgIdDaughter[numberOfDaughters] = (*idr)->pdgId();
	    }
	    numberOfDaughters++;
	  } // loop over genParticleRefVector
				
	  //
	  // A reconstructed meson entry will be made when
	  //   a) there are two daughter photons
	  //   b) each daughter photon is found as a primary
	  //   c) both primary daughter photons do not convert
	  //
	  massRecoMeson[kMesonCount] = 0.;
	  ptRecoMeson[kMesonCount] = 0.;
	  etaRecoMeson[kMesonCount] = 0.;
	  phiRecoMeson[kMesonCount] = 0.;
	  mergeDecay1Angle[kMesonCount] = -1.0;
	  mergeDecay2Angle[kMesonCount] = -1.0;
	  mergeDecay3Angle[kMesonCount] = -1.0;
				
	  daughtersFromMeson[kMesonCount] = numberOfDaughters;
	  ptDecay1Meson[kMesonCount] = 0;
	  ptDecay2Meson[kMesonCount] = 0;
	  ptDecay3Meson[kMesonCount] = 0;
	  etaDecay1Meson[kMesonCount] = 0;
	  etaDecay2Meson[kMesonCount] = 0;
	  etaDecay3Meson[kMesonCount] = 0;
	  phiDecay1Meson[kMesonCount] = 0;
	  phiDecay2Meson[kMesonCount] = 0;
	  phiDecay3Meson[kMesonCount] = 0;
	  pdgIdDecay1Meson[kMesonCount] = 0;
	  convertDecay1Meson[kMesonCount] = -1;
	  pdgIdDecay2Meson[kMesonCount] = 0;
	  convertDecay2Meson[kMesonCount] = -1;
	  pdgIdDecay3Meson[kMesonCount] = 0;
	  convertDecay3Meson[kMesonCount] = -1;
	  //
	  // Known anomalies: Event 329 has nMesonSize = 2 with a 0 for mergeDecay1Meson at kMesonCount = 0?
	  //                  Event 159 has nMesonSize = 12 with a 0 for mergeDecay2Meson at kMesonCount = 0?
	  // Are all of these mergeDecay photon matches primaries?
	  // Some (mostly low momentum) decay photons are showing up with no mergedTrackTruth primary photon
	  //
	  //
	  mergeDecay1Meson[kMesonCount] = -1;
	  mergeDecay2Meson[kMesonCount] = -1;
	  mergeDecay3Meson[kMesonCount] = -1;
	  if(numberOfDaughters > 0) {
	    ptDecay1Meson[kMesonCount] = ptDaughter[0];
	    etaDecay1Meson[kMesonCount] = etaDaughter[0];
	    phiDecay1Meson[kMesonCount] = phiDaughter[0];
	    pdgIdDecay1Meson[kMesonCount] = pdgIdDaughter[0];
	    float ptTest =  ptDaughter[0];
	    float ptError = 0.01*ptTest;
	    if(ptError < 0.002)
	      ptError = 0.002;
	    float etaTest =  etaDaughter[0];
	    float phiTest =  phiDaughter[0];
	    for(int jMerge=0; jMerge<mergedTrackTruthSize; jMerge++) {
	      if(pdgIdMerge[jMerge] == 22) {
		if(fabs(ptTest - ptMerge[jMerge]) < ptError &&
		   fabs(etaTest - etaMerge[jMerge]) < 0.01 &&
		   fabs(deltaPhi(phiTest, phiMerge[jMerge])) < 0.01) {
		  mergeDecay1Meson[kMesonCount] = jMerge;
		  convertDecay1Meson[kMesonCount] =  numberDecayVerticesMerge[jMerge];
		} // check for analog match
	      }  // check on photon ID
	    } // loop over merge array
	    //
	    // search for this photon in the merge array (should be a primary photon)
	    //
	    if(numberOfDaughters > 1) {
	      ptDecay2Meson[kMesonCount] = ptDaughter[1];
	      etaDecay2Meson[kMesonCount] = etaDaughter[1];
	      phiDecay2Meson[kMesonCount] = phiDaughter[1];
	      pdgIdDecay2Meson[kMesonCount] = pdgIdDaughter[1];
	      //
	      // search for this photon in the merge array (should be a primary photon)
	      //
	      float ptTest =  ptDaughter[1];
	      float ptError = 0.01*ptTest;
	      if(ptError < 0.002)
		ptError = 0.002;
	      float etaTest =  etaDaughter[1];
	      float phiTest =  phiDaughter[1];
	      for(int jMerge=0; jMerge<mergedTrackTruthSize; jMerge++) {
		if(pdgIdMerge[jMerge] == 22) {
		  if(fabs(ptTest - ptMerge[jMerge]) < ptError &&
		     fabs(etaTest - etaMerge[jMerge]) < 0.01 &&
		     fabs(deltaPhi(phiTest, phiMerge[jMerge])) < 0.01) {
		    mergeDecay2Meson[kMesonCount] = jMerge;
		    convertDecay2Meson[kMesonCount] =  numberDecayVerticesMerge[jMerge];
		  } // check for analog match
		}  // check on photon ID
	      } // loop over merge array
	      if(numberOfDaughters > 2) {
		ptDecay3Meson[kMesonCount] = ptDaughter[2];
		etaDecay3Meson[kMesonCount] = etaDaughter[2];
		phiDecay3Meson[kMesonCount] = phiDaughter[2];
		pdgIdDecay3Meson[kMesonCount] = pdgIdDaughter[2];
		//
		// search for this photon in the merge array (should be a primary photon)
		//
		float ptTest = ptDaughter[2];
		float ptError = 0.01*ptTest;
		if(ptError < 0.002)
		  ptError = 0.002;
		float etaTest =  etaDaughter[2];
		float phiTest =  phiDaughter[2];
		for(int jMerge=0; jMerge<mergedTrackTruthSize; jMerge++) {
		  if(pdgIdMerge[jMerge] == 22) {
		    if(fabs(ptTest - ptMerge[jMerge]) < ptError &&
		       fabs(etaTest - etaMerge[jMerge]) < 0.01 &&
		       fabs(deltaPhi(phiTest, phiMerge[jMerge])) < 0.01) {
		      mergeDecay3Meson[kMesonCount] = jMerge;
		      convertDecay3Meson[kMesonCount] =  numberDecayVerticesMerge[jMerge];
		      mergeDecay3Angle[kMesonCount] = bestEcalAngleMatch[jMerge];
		    } // check for analog match
		  }  // check on photon ID
		} // loop over merge array
	      } // check if 3 or more daughters
	      if(numberOfDaughters == 2 && mergeDecay1Meson[kMesonCount] >= 0 && convertDecay1Meson[kMesonCount] == 0 &&
		 mergeDecay2Meson[kMesonCount] >= 0 && convertDecay2Meson[kMesonCount] == 0) {
		int jMerge1 = mergeDecay1Meson[kMesonCount];
		int jMerge2 = mergeDecay2Meson[kMesonCount];
		//
		// Check for a reco match to the merge photon
		//
		mergeDecay1Angle[kMesonCount] = bestEcalAngleMatch[jMerge1];
		mergeDecay2Angle[kMesonCount] = bestEcalAngleMatch[jMerge2];
		mergeDecay1Time[kMesonCount] = bestEcalSeedTimeMatch[jMerge1];
		mergeDecay2Time[kMesonCount] = bestEcalSeedTimeMatch[jMerge2];
		//
		// Some non-conversion matches (non-primary??) have poor bestEcalAngleMatch values ??
		//
		if(bestEcalAngleMatch[jMerge1] < 0.03 && bestEcalAngleMatch[jMerge2] < 0.03) {
								
		  float ecalEta1 = bestEcalDEtaMatch[jMerge1] + etaMerge[jMerge1];
		  float theta1 =  2.0*atan(exp(-ecalEta1));
		  float sinTheta1 = sin(theta1);
		  float cosTheta1 = cos(theta1);
		  float phi1 =  bestEcalPhiMatch[jMerge1];
		  float cosPhi1 = cos(phi1);
		  float sinPhi1 = sin(phi1);
		  float pt1 =  bestEcalPtMatch[jMerge1];
		  float energy1 = pt1/sinTheta1;
								
		  float ecalEta2 = bestEcalDEtaMatch[jMerge2] + etaMerge[jMerge2];
		  float theta2 =  2.0*atan(exp(-ecalEta2));
		  float sinTheta2 = sin(theta2);
		  float cosTheta2 = cos(theta2);
		  float phi2 =  bestEcalPhiMatch[jMerge2];
		  float cosPhi2 = cos(phi2);
		  float sinPhi2 = sin(phi2);
		  float pt2 = bestEcalPtMatch[jMerge2];
		  float energy2 = pt2/sinTheta2;
								
		  float cosOpenAngle = cosTheta1*cosTheta2 + sinTheta1*sinTheta2*cos(phi1 - phi2);
		  float recoMassTest = 2.0*energy1*energy2*(1.0 - cosOpenAngle);
		  if(recoMassTest > 0.0) {
									
		    massRecoMeson[kMesonCount] = sqrt(recoMassTest);
									
		    float px1 = pt1*cosPhi1;
		    float py1 = pt1*sinPhi1;
		    float pz1 = energy1*cosTheta1;
									
		    float px2 = pt2*cosPhi2;
		    float py2 = pt2*sinPhi2;
		    float pz2 = energy2*cosTheta2;
									
		    float pxMeson = px1 + px2;
		    float pyMeson = py1 + py2;
		    float pzMeson = pz1 + pz2;
									
		    float ptMeson = sqrt(pxMeson*pxMeson + pyMeson*pyMeson);
		    float momentumMeson = sqrt(ptMeson*ptMeson + pzMeson*pzMeson);
		    float thetaMeson = acos(pzMeson/momentumMeson);
									
		    float etaMeson = -log(tan(thetaMeson/2));
		    float phiMeson = atan2(pxMeson, pyMeson);
									
		    ptRecoMeson[kMesonCount] = ptMeson;
		    etaRecoMeson[kMesonCount] = etaMeson;
		    phiRecoMeson[kMesonCount] = phiMeson;
									
		  }
								
		} // check all reco-merge matches											     
							
	      } // check for only 2 daughters, a merge match, and no conversions
	    } // check for second daughter
	  } // check for first daughter
				
	  kMesonCount++;
	  if(kMesonCount >= MESONMAXSIZE)
	    break;  // safety check
				
	} // check for storing this particle in the meson tree
			
      } // loop over the generator particles to store pi0 and eta-meson
		
      nMesonSize = kMesonCount;
    
		
      if(nMesonSize < 1)
	nMesonSize = 1;
		
      //
      // Code to fill the photon part of the tree
      //
      int kPhotonCount = 0;
      for(size_t i=0; i<genParticles->size(); i++) {
			
	int genIndex = int(i);
	const GenParticle & p = (*genParticles)[i];
	if(p.pdgId() == 22) {
				
	  float photonEta = p.eta();
	  if(fabs(photonEta) < 1.5) {
					
	    float thisPt = p.pt();
	    float thisEta = p.eta();
	    float thisPhi = p.phi();
	    kPhotonGen[kPhotonCount] = kPhotonCount;
	    ptPhotonGen[kPhotonCount] = thisPt;
	    etaPhotonGen[kPhotonCount] = thisEta;
	    phiPhotonGen[kPhotonCount] = thisPhi;
					
	    //
	    // Check for the mother of this photon
	    //
	    if (p.numberOfMothers() > 0) {
	      const Candidate *mom = p.mother();
	      motherPdgIdPhotonGen[kPhotonCount] = mom->pdgId();
	      ptMotherPhotonGen[kPhotonCount] = mom->pt();
	    }
	    else {
	      motherPdgIdPhotonGen[kPhotonCount] = 0;
	      ptMotherPhotonGen[kPhotonCount] = 0.0;
	    }
	    //
	    // Look for this photon in the mergedTrackTruthCollection
	    //
	    mergeIndexPhotonGen[kPhotonCount] = -1;
	    clusterIndexPhotonGen[kPhotonCount] = -1;
	    convertPhotonGen[kPhotonCount] = -1;
	    ptRecoPhotonGen[kPhotonCount] = 0.;
	    etaRecoPhotonGen[kPhotonCount] = 0.;
	    phiRecoPhotonGen[kPhotonCount] = 0.;
	    angleRecoPhotonGen[kPhotonCount] = 0.;
	    for(int jMerge=0; jMerge<mergedTrackTruthSize; jMerge++) {
	      if(genIndex == bestGenIndexMatchMerge[jMerge]) {
		mergeIndexPhotonGen[kPhotonCount] = jMerge;
		int jClu =  bestEcalIndexMatch[jMerge];
		clusterIndexPhotonGen[kPhotonCount] = jClu;
		convertPhotonGen[kPhotonCount] = numberDecayVerticesMerge[jMerge];
		angleRecoPhotonGen[kPhotonCount] = bestEcalAngleMatch[jMerge];
		if(jClu >=0 && jClu < nClu) {
		  ptRecoPhotonGen[kPhotonCount] = ptClu[jClu];
		  etaRecoPhotonGen[kPhotonCount] = etaClu[jClu];
		  phiRecoPhotonGen[kPhotonCount] = phiClu[jClu];
		}
		break;
	      }
	    } // loop over merged track truth array
					
	    kPhotonCount++;
					
	  } // check eta of photon
				
	} // check for photon
			
      } // loop over generator particles
		
      nPhotonSize = kPhotonCount;
		
      nMC = nSim = 0;                // nSim is never incremented for simulations? (June 24)
      njSim = 0;
      for(int j=0; j<nMaxMC; j++) {
	kMC[j] = -999;   // default to make sure that all the kMC are actually filled
      }
      int current_particle = -1;
      set<int> mothers;
      map<const GenParticle*, int> mapMC;
      map<const GenParticle*, int>::iterator mapMC_it;
      //int where_isM_PI0_mother(0);  //debug
      int p_count(0);
      int motherIDMC_temp = -1;
      int genPartPDGArray[10000];
    
      //cout << endl << "event" << endl;
      for (GenParticleCollection::const_iterator p = genParticles->begin(); p != genParticles->end(); ++p, ++p_count) 
	{
			
	  if(p_count < 10000)
	    genPartPDGArray[p_count] =  p->pdgId();
			
	  if ( nMC >= (nMaxMC-1) ) continue;
			
	  // looking for mother particle of the current generator particle
	  motherIDMC_temp = -1;   // default to no mother
	  if (p->numberOfMothers() > 0) 
	    {
	      const Candidate * mom = p->mother();
	      for (size_t j = 0; j != genParticles->size(); ++j) 
		{
		  const Candidate * ref = &((*genParticles)[j]);
		  if (mom==ref)
		    {
		      motherIDMC_temp = j; 
		    }
		}
	    }  // check on this generator particle having non-zero number of mothers 
			
	  if ( p->status()==1  && p->pt()>0.100 ) // look at stable particles with pT higher than 100 MeV/c
	    {
	      kMC[nMC] = nMC;               // Previous coding problem in that all the kMC did not get reset from the default value of -999?
	      pdgIdMC[nMC] = p->pdgId();
	      statusMC[nMC] = p->status();  // status is initially 1 for all particles, but changed to 2 below if the particle decays in generator (like the pi0 or eta or omega)
	      ptMC[nMC] = p->pt();
	      eMC[nMC] = p->energy();
	      etaMC[nMC] = p->eta(); 
	      phiMC[nMC] = p->phi(); 
	      mapMC[&(*p)] = nMC;
	      convertedMC[nMC] = false;    // the code to change this value has been previously commented out  (June 24)
	      motherIDMC[nMC] = -1;        // The value can change from -1 in the code below
	      motherIndexMC[nMC] = -1;     // The value can change from -1 in the code below (must have motherIDMC and motherIndexMC both equal to -1, or both not equal to -1)
	      current_particle = nMC;      // This variable is used in the code below
	      ++nMC; 
				
	      // if stable photon/electron, find parent
	      //
	      // Conversions occur outside of the generator, so these electrons/positrons are from Dalitz decays inside genertor?
	      //
	      if (p->status() == 1 && motherIDMC_temp != -1 && (p->pdgId() == kPhoton || fabs(p->pdgId()) == kElectron ) ) // condition that status = 1 is redundant inside this branch 
		{
		  const GenParticle *mom = (const GenParticle*)p->mother();
					
		  // saving the mother pdgId 
		  motherIDMC[current_particle] = mom->pdgId();
					
		  if ( mom->status() == 2 &&  (mom->pdgId()<81 || mom->pdgId()>100)) // avoid to store partons and MC internal
		    {
		      // check if the mother particle is found for the first time
		      if(mothers.find(motherIDMC_temp) == mothers.end())
			{
			  mothers.insert(motherIDMC_temp);
			  if (nMC>=nMaxMC) continue;
			  pdgIdMC[nMC] = mom->pdgId();
			  statusMC[nMC] = mom->status();
			  ptMC[nMC] = mom->pt();
			  eMC[nMC] = mom->energy();
			  etaMC[nMC] = mom->eta();
			  phiMC[nMC] = mom->phi(); 
			  mapMC[mom] = nMC;
			  motherIDMC[nMC] = -2;        // These new motherIDMC and motherIndexMC were left unassigned previously?
			  motherIndexMC[nMC] = -2;     // These new motherIDMC and motherIndexMC were left unassigned previously?
			  kMC[nMC] = nMC;     
			  ++nMC;
			}
		    }
					
		  mapMC_it =  mapMC.find(mom);
		  if(mapMC_it != mapMC.end())
		    motherIndexMC[current_particle] = mapMC_it->second;
					
		  //cout << "   myM_PI0::" << motherIndexMC[current_particle] << endl;
					
		} // photon or electron/positron has parents 
	    } // particle selection (photon or electron/positron which has an identified partent
			
	} // loop over particles in genParticle collection
		
		
      //----- Figure out the particle decays in tracker volume  ------
		
      // Vertices only return trackID of their parent SimTrack
      // Figure out the mapping from trackID to SimTrack
      map<unsigned int, const SimTrack*> trackMap;
		
      bool simTrackPrint = false;
      if(simTrackDebug && eventn < 30) {
	simTrackPrint = true;
	cout << "\n\n For Event " << eventn << " debug information for simTracks with size " <<  simTracksSize;
	cout << "; nSimTracks = " << nSimTracks << " with zVertex " << zPrimaryVertex;
	cout << "; generator p_count = " << p_count;
	cout << endl;
      }
		
      //
      // Code for daughter array initializations
      //
      for (int mSim=0; mSim<nMaxSim; mSim++) {
	nDaughtersSim[mSim] = 0;      // initialization for the number of daughters for each particle
	kDaughtersSim[mSim][0] = -1;  // initialization for kSim index of the first daughter
	kDaughtersSim[mSim][1] = -2;  // initialization for kSim index of the second daughter
	kDaughtersSim[mSim][2] = -3;  // initialization for kSim index of the third daughter
	kSim[mSim] = -1;
	bestNoConvertEcalIndexSim[mSim] = -1;
      }

      highestMatchedGenSimTrack = -1;
      lowestDaughterSimTrack = 100000000;
      int jSim = 0;
      int iiSim = 0;
      for (SimTrackContainer::const_iterator iSim = simTracks->begin(); iSim != simTracks->end(); ++iSim) {
		
	//
	// Store sim tracks only within the eta range enclosing the ECAL barrel
	//
	double xMomentum = (iSim->momentum()).X();
	double yMomentum = (iSim->momentum()).Y();
	double zMomentum = (iSim->momentum()).Z();
	double totalMomentum = sqrt(xMomentum*xMomentum + yMomentum*yMomentum + zMomentum*zMomentum);

	double etaParticle = -999.0;

	if(totalMomentum > 0.0) {
	  double thetaParticle = acos(zMomentum/totalMomentum);
	  etaParticle = -log(tan(thetaParticle/2.0));
	}

	int simPdgId = iSim->type();

	if(etaParticle < -1.55 || etaParticle > 1.55) {
	  storeThisSimTrack[iiSim] = false;
	}
	else {
	  storeThisSimTrack[iiSim] = true;
	}

	if(jSim >= nMaxSim)
	  continue;

	kSim[jSim] = jSim;
	double eMomentum =  (iSim->momentum()).E();

	etaSim[jSim] = etaParticle;
	phiSim[jSim] = atan2(yMomentum, xMomentum);
	ptSim[jSim] = sqrt(xMomentum*xMomentum + yMomentum*yMomentum);
	eSim[jSim] = eMomentum;

	noVertexSim[jSim] = 1;
	pdgIdSim[jSim] = simPdgId;
	trackIdSim[jSim] = iSim->trackId();

	//
	// Set defaults for the absence of parents or grandparents
	//
	parentKSim[jSim] = -2;      // New variable to contain the kSim index number of the parent particle
	parentIdSim[jSim] = -2000002;     // Maguire change from previous 0 value for variable named noParentID, now will be the particle PDG ID
	parentTrackSim[jSim] = -2;  // New variable to contain the simulation track number of the parent particle
	gParentKSim[jSim] = -2;      // New variable to contain the kSim index number of the grandparent particle
	gParentIdSim[jSim] = -2000002;     // New variable for the grandparent PDG ID
	gParentTrackSim[jSim] = -2;  // New variable to contain the simulation track number of the grandparent particle

	rSim[jSim] = -999.0;
	zSim[jSim] = -999.0;
			
	if(iSim->noGenpart()) {
	  genPartIndexSim[jSim] = -2;
	  genPartPdgIdSim[jSim] = -3;
	} // no Genpart value for this particle
	else {
	  int genPartIndex = iSim->genpartIndex();
	  genPartIndexSim[jSim] = genPartIndex;
	  if(genPartIndex >=0 && genPartIndex < int(genSize) && genPartIndex < 10000 ) {

	    genPartPdgIdSim[jSim] = genPartPDGArray[genPartIndex]; // this value is not correct ?? 
	    //genPartPdgIdSim[jSim]= (&(*genParticles)[iSim->genpartIndex()-1])->pdgId(); // this is OK for the first few values, and then it fails ??

	  }
	  else {
	    genPartPdgIdSim[jSim] = -4;
	  }
	}
			
	if (!iSim->noVertex()) {
	  assert(trackMap.find(iSim->trackId())==trackMap.end());  // check that iSim->trackId()) is not already in trackMap (unique track ID)
				
	  noVertexSim[jSim] = 0;
	  trackMap[iSim->trackId()] = &(*iSim);
				
	  if(simTrackPrint) {
	    cout << "\n For jSim = " << jSim << " there is a vertex for trackId " << iSim->trackId() << " and trackMap size " << trackMap.size();
	    if(iSim->noGenpart()) {
	      cout << "; there is no genPart";
	    }
	    else {
	      cout << ", genPart has index " << iSim->genpartIndex();
	      if(iSim->genpartIndex() < int(genSize)) {
		const GenParticle* iGen = &(*genParticles)[iSim->genpartIndex()-1];
		cout << ", genParticle pdgID = " << iGen->pdgId() << " and gen pT " << iGen->pt();
	      }
	      else {
		cout << " (index exceeds genSize)";
	      }
	      cout << ", simTracks pdgID = " << iSim->type();
	    }
	  }
	}
	else {
	  if(simTrackPrint)
	    cout << "\n For jSim = " << jSim << " there is no vertex for trackId " << iSim->trackId() << " and trackMap size " << trackMap.size();
	}
	
	if(storeThisSimTrack[iiSim]) {
	  jSim++;
	}
	else {
	  kSim[jSim] = -2;
	}
	iiSim++;
			
      } // end first loop over SimTrackContainer
      int njSimCheck = jSim;

      if(simTrackPrint) {
	cout << "\n Completed initial loop over SimTrackContainer with final trackMap size at " << trackMap.size() << endl;
	cout << "\n Starting second loop over SimTrackContainer for inter-generation mappings";
      }
		
      // Find all SimTracks that come from decays before the ECAL
      // and find their parent SimTracks
      map<const SimTrack*, const SimTrack*> promptParent; // daughter->mother
      map<const SimTrack*, set<const SimTrack*> > promptDecays; // m->ds
      map<const SimTrack*, const SimVertex*> promptVertex; // daughter->vertex
		
      jSim = 0;
      iiSim = 0;
      for (SimTrackContainer::const_iterator iSim = simTracks->begin(); iSim != simTracks->end(); ++iSim) {

	if (!iSim->noVertex()) {
				
	  // Find the parent vertex and see if it classifies as an early decay
	  // Exclude the primary vertex (noParent)
	  SimVertex const& vtx = (*simVertices)[iSim->vertIndex()];
				
	  if(simTrackPrint)
	    cout << "\n jSim = " << jSim << " has a vertex for trackId " << iSim->trackId();
				
	  rSim[jSim] = vtx.position().Rho();
	  zSim[jSim] =  vtx.position().z();
				
	  if(vtx.noParent()) {
					
	    parentKSim[jSim] = -1;      // New variable to contain the kSim index number of the parent particle
	    parentIdSim[jSim] = -2000001;     // Maguire change from previous 0 value for variable named noParentID,now will be the particle PDG ID
	    parentTrackSim[jSim] = -1;  // New variable to contain the simulation track number of the parent particle
	    gParentKSim[jSim] = -1;      // New variable to contain the kSim index number of the grandparent particle
	    gParentIdSim[jSim] = -2000001;     // New variable to contain the grandparent particle PDG ID
	    gParentTrackSim[jSim] = -1;  // New variable to contain the simulation track number of the grandparent particle
					
	    if(simTrackPrint)
	      cout << "; no parent vertex for current vertex (R, Z) = (" << vtx.position().Rho() << ", " << vtx.position().z() << ")";  
	  }
				
	  if (!vtx.noParent() && vtx.position().Rho() < 129 && fabs(vtx.position().z()) < 304) {
	    // Find parent SimParticle that produced this vertex
	    // vtx->parentIndex is NOT a vector index :( so use trackMap
	    assert(trackMap.find(vtx.parentIndex())!=trackMap.end());
	    const SimTrack* p = trackMap[vtx.parentIndex()]; // simTracks iterator for the parent of this track
	    promptParent[&(*iSim)] = p;        // first element is the current simTracks iterator value; second element is the parent iterator
	    promptDecays[p].insert(&(*iSim));  // first element is the parent of the current simTracks; second element is the current simTracks iterator
	    promptVertex[&(*iSim)] = &vtx;     // first element is the current simTracks iterator value; second element is the current vertex
	
	    if(trackIdSim[jSim] < lowestDaughterSimTrack)
	      lowestDaughterSimTrack = trackIdSim[jSim];

	    parentIdSim[jSim] = p->type(); // Maguire change to make this variable function more useful carrying the actual parent ID
	    int parentSimulationTrackNumber = p->trackId();
	    parentTrackSim[jSim] = parentSimulationTrackNumber;


	    //
	    // Look for previous Sim entry with this simulation track number
	    // Loop backward since it is more likely that the previous Sim entry is recent
	    //
	    parentKSim[jSim] = -3;
	    gParentKSim[jSim] = -3;
	    gParentTrackSim[jSim] = -2000003;
	    gParentIdSim[jSim] = -2000003; 
	    if(jSim > 0) {
	      int jjSimMax = jSim - 1;
	      for(int jjSim=jjSimMax; jjSim>0; jjSim--) {
		if(trackIdSim[jjSim] == parentSimulationTrackNumber) {
		  parentKSim[jSim] = jjSim;
		  //
		  // Obtain the grandparent
		  //
		  gParentKSim[jSim] = parentKSim[jjSim];
                  if(parentKSim[jjSim] >= 0) {
		    gParentTrackSim[jSim] = parentTrackSim[jjSim];
		    gParentIdSim[jSim] = parentIdSim[jjSim];
		  }
		  else {
		    gParentTrackSim[jSim] = -5;
		    gParentIdSim[jSim] = -2000005;
		  }
		  //
		  // Store the daughters information in the parent particle
		  //
		  if(nDaughtersSim[jjSim] < 0) {
		    cerr << "\n Number of daughters < 0 ?? with jjSim = " << jjSim << endl;
		    return;
		  }
		  if(nDaughtersSim[jjSim] < 3) {
		    int currentNumberOfDaughters = nDaughtersSim[jjSim];
		    kDaughtersSim[jjSim][currentNumberOfDaughters] = jSim;
		    nDaughtersSim[jjSim]++;
		  }
		  else {
		    nDaughtersSim[jjSim]++;
		  }
		  break;
		} // check for simulation track number equality
	      } // loop over previously stored simulation track numbers
	    }

	    if(simTrackPrint) {
	      cout << ", parent exists for early vertex position (R, Z) = (" << vtx.position().Rho() << ", " << vtx.position().z() << ")";
	      cout << "; parent ID " << p->type() << " and current ID " << iSim->type();
	    }
					
	  } // early decay
				
	  if (!vtx.noParent() && (vtx.position().Rho() >= 129 || fabs(vtx.position().z()) >= 304)) {
	    if(simTrackPrint)
	      cout << "; parent exists for late vertex for position (R, Z) = (" << vtx.position().Rho() << ", " << vtx.position().z() << ")";
	  }
				
	}  // check for simTrack having a vertex
	else {
	  if(simTrackPrint)
	    cout << "\n For jSim = " << jSim << "there is no vertex for trackId " << iSim->trackId();
	}
	
	if(storeThisSimTrack[iiSim]) {
	  jSim++;
	}
	iiSim++;
			
      } // end second loop over simContainer
      njSim = jSim;

      cout << "\n\n The meson tree size is " << nMesonSize << ", genSize " << genSize;
      cout << ", countDisAllowedMesons " << countDisAllowedMesons;
      cout << ", countAllowedMesons " << countAllowedMesons;
      cout << "\n The njSim size is " << njSim << " with simTracksSize " << simTracksSize;
      cout << endl << endl;

      if(njSim != njSimCheck) {
	cerr << "\n\n jSim check fail: njSimCheck = " << njSimCheck << ",  njSim = " << nSim  << endl << endl;
	return;
      } // safety check

      //
      // Make new correspondence betweem genParticle and simTrack (Maguire, August 2013)
      //
      for(int jSim=0; jSim<njSim; jSim++) {

	//
	// Particles with a parent should not find a matched, but the loop is made anyway to confirm this effect
	//

	int simPdgId = pdgIdSim[jSim];

	float simPt = ptSim[jSim];
	float simEta = etaSim[jSim];
	float simPhi = phiSim[jSim];
	int simTrackTest = trackIdSim[jSim];
	float rSimTest = rSim[jSim];
	float zSimTest = zSim[jSim];
	float kSimTest = kSim[jSim];

	bool canTestThisSimTrack = false;
	if(rSimTest < 1.0 && fabs(zSimTest) < 30.0 && kSimTest >= 0)
	  canTestThisSimTrack = true;

	int bestGenIndexMatch = -1;
	float bestAngleMatch = 100.0;
	float bestPtMatch = -1.0;
	float bestEtaMatch = -100.0;
	float bestPhiMatch = -100.0;
	motherGenIdSim[jSim] = -2;
	motherGenIndexSim[jSim] = -2;
	gMotherGenIdSim[jSim] = -2;

	float acceptedDeltaPt = ptPrimaryCut*simPt;
	if(acceptedDeltaPt < 0.01)
	  acceptedDeltaPt = 0.01;

	for(size_t i=0; i<genParticles->size(); i++) {
						
	  const GenParticle & p = (*genParticles)[i];

	  if(p.pdgId() != simPdgId)
	    continue;

	  float ptGen = p.pt();
	  if(fabs(ptGen - simPt) > acceptedDeltaPt)
	    continue;

	  float etaGen = p.eta();
	  float phiGen = p.phi();

	  float phiDelta = deltaPhi(phiGen, simPhi);
	  float testAngleMatch = sqrt((etaGen - simEta)*(etaGen - simEta) + phiDelta*phiDelta);
	  if(testAngleMatch < bestAngleMatch) {
	    bestAngleMatch = testAngleMatch;
	    bestPtMatch = ptGen;
	    bestEtaMatch = etaGen;
	    bestPhiMatch = phiGen;
	    bestGenIndexMatch = i;
	    if(canTestThisSimTrack && bestAngleMatch < 0.01 && simTrackTest > highestMatchedGenSimTrack)
	      highestMatchedGenSimTrack = simTrackTest;
	  }
	} // loop over GenParticle collection

	genPartPdgIdSim[jSim] = simPdgId; // forced 
	genPartIndexSim[jSim] = bestGenIndexMatch;
	bestAngleMatchGenSim[jSim] = bestAngleMatch;
	bestPtMatchGenSim[jSim] = bestPtMatch;
	bestEtaMatchGenSim[jSim] = bestEtaMatch;
	bestPhiMatchGenSim[jSim] = bestPhiMatch;
	if(bestGenIndexMatch > -1) {
	  //
	  // Get mother ID for this generator particle
	  //
	  const GenParticle & p = (*genParticles)[bestGenIndexMatch];
	  const Candidate *mom = p.mother();
	  if(mom) {
	    motherGenIdSim[jSim] = mom->pdgId();
	    int momIdTest =  motherGenIdSim[jSim];
	    float momPtTest = mom->pt();
	    float momEtaTest = mom->eta();
	    float momPhiTest = mom->phi();
	    bool momFound = false;
	    //
	    // Search for grandmother
	    //
	    for(size_t i=0; i<genParticles->size(); i++) {
	      const GenParticle & pp = (*genParticles)[i];
	      if(pp.pdgId() != momIdTest)
		continue;
	      if(pp.pt() != momPtTest)
		continue;
	      if(pp.eta() != momEtaTest)
		continue;
	      if(pp.phi() != momPhiTest)
		continue;

	      momFound = true;
	      motherGenIndexSim[jSim] = i;
	      const Candidate *gmom = pp.mother();
	      if(gmom) {
		gMotherGenIdSim[jSim] = gmom->pdgId();
	      }
	      else {
		gMotherGenIdSim[jSim] = -3;
	      }

	      break; // found grandmother

	    } // loop over genParticle collection
	    if(!momFound) {
	      motherGenIndexSim[jSim] = -1;
	      gMotherGenIdSim[jSim] = -1;
	    }
	  } // check for valid mother pointer
	  else {
	    motherGenIdSim[jSim] = -1;
	  } // no valid mother pointer found
	} // check for good matching genParticle index

      } // loop over simTrack collection to do correspondence with genParticle

      //
      // Make correspondence betweem ECAL reco and simTrack (Maguire, August 2013)
      //
      for(int jSim=0; jSim<njSim; jSim++) {
	bestNoConvertEcalIndexSim[jSim] = -2;
	bestNoConvertEcalAngleSim[jSim] = -999.0;
	bestNoConvertEcalPtSim[jSim] = -999.0;

	if(pdgIdSim[jSim] != 22)
	  continue;  // check only photons

	if(nDaughtersSim[jSim] != 0)
	  continue; // check only unconverted photons

	if(trackIdSim[jSim] > highestMatchedGenSimTrack)
	  continue;  // check only primary particles

	float simEta = etaSim[jSim];
	float simPhi = phiSim[jSim];

	float bestEAngleMatch = 999.0;
	float bestEPtMatch = -999.0;
	int bestIndexMatch = -1;
	for(int jClu=0; jClu<nClu; jClu++) {

	  float phiDelta = deltaPhi(phiClu[jClu], simPhi);
	  float etaDelta = etaClu[jClu] - simEta;
	  float testMatch = sqrt(phiDelta*phiDelta + etaDelta*etaDelta);

	  if(testMatch < bestEAngleMatch) {
	    bestEAngleMatch = testMatch;
	    bestIndexMatch = jClu;
	    bestEPtMatch = ptClu[jClu];
	  }
	} // loop over clusters

	bestNoConvertEcalIndexSim[jSim] = bestIndexMatch;
	bestNoConvertEcalAngleSim[jSim] = bestEAngleMatch; 
	bestNoConvertEcalPtSim[jSim] = bestEPtMatch; 

	if(countNoConvertSimMatchEcal[bestIndexMatch] == 0) {
	  //
	  // First time that this jClu has been matched with a jSim track
	  //
	  bestNoConvertSimIndexEcal[bestIndexMatch] = jSim;
	  bestNoConvertSimAngleEcal[bestIndexMatch] = bestEAngleMatch;
	  countNoConvertSimMatchEcal[bestIndexMatch] = 1;
	} // check for first time use of this jClu
	else {
	  //
	  // Check if previous match had a worse angle match
	  //
	  if(bestNoConvertSimAngleEcal[bestIndexMatch] > bestEAngleMatch) {
	    bestNoConvertSimIndexEcal[bestIndexMatch] = jSim;
	    bestNoConvertSimAngleEcal[bestIndexMatch] = bestEAngleMatch;
	  } // new match is better

	  countNoConvertSimMatchEcal[bestIndexMatch]++;
	} // check quality of previous best angle match

      } // loop over simTrack collection to do correspondence with ECAL reco
	
      if(simTrackPrint) {
	cout << endl;
      }
		
      // Find grandparent SimTracks all the way up the chain
      map<const SimTrack*, const SimTrack*> chainParents;      // granddaughter->grandmother
      map<const SimTrack*, set<const SimTrack*> > chainDecays; // grandmother->granddaughters
		
      for (map<const SimTrack*, const SimTrack*>::const_iterator iSim = promptParent.begin(); iSim != promptParent.end(); ++iSim) 
	{
	  // Check that the SimTrack has no daughters itself (=grandchild)
	  if (promptDecays.find(iSim->first)==promptDecays.end())
	    {
	      // Find the first SimTrack in the parentage chain (=grandparent)
	      const SimTrack *p = iSim->second;
	      while (promptParent.find(p) != promptParent.end())
		p = promptParent[p];
	      chainParents[iSim->first] = p;
	      chainDecays[p].insert(iSim->first);
	    } // is grandchild
	} // for promptParent
		
      // Associate grandParents to genParticles
      map<const GenParticle*, const SimTrack*> decayedSims;
      map<const SimTrack*, const GenParticle*> decayedGens;
		
      /*
      //
      // Loop code fails in the assertion test
      //
      for (map<const SimTrack*, set<const SimTrack*> >::const_iterator iSim = chainDecays.begin(); iSim != chainDecays.end(); ++iSim) 
      {
      if (iSim->first->noGenpart()) 
      continue;
		 
      // Make sure the decay chain wasn't already pruned out
      if (promptDecays.find(iSim->first)!=promptDecays.end() && promptDecays[iSim->first].size()!=0) 
      {
      // NB: genpartIndex offset by 1
      const GenParticle* iGen =
      &(*genParticles)[iSim->first->genpartIndex()-1];
		 
      if(iGen->pdgId() != (iSim->first)->type()) {
      cerr << "\n\n Pre-assertion failure";
      cerr << "\n iGen->pdgId() = " << iGen->pdgId();
      cerr << "\n  (iSim->first)->type() = " <<  (iSim->first)->type();
      cerr << endl;
      }
		 
      assert(iGen->pdgId()==iSim->first->type());
      decayedSims[iGen] = iSim->first;
      decayedGens[iSim->first] = iGen;
      }
      } // for chainParents 
      */
		
      /*
		 
      ///// Save conversions 
      for (map<const GenParticle*, const SimTrack*>::const_iterator iGen = decayedSims.begin(); iGen != decayedSims.end(); ++iGen) 
      {
      const GenParticle *p = iGen->first;
		 
      if the photon comes from pi0 or eta
      if (p->pdgId()==22 && p->mother()->status()==2 && p->mother()->pdgId()==111) 
      if (p->pdgId()==22 && (p->mother()->pdgId()==111 ||  // pi0 
      p->mother()->pdgId()==221)) // eta
      {
      find the mother gen-particle index in the gen-particle vector
      mapMC_it =  mapMC.find(p);
      int mother_gen_index = -1;
      if(mapMC_it != mapMC.end())mother_gen_index = mapMC_it->second;
      if(mother_gen_index > 0) convertedMC[mother_gen_index] = true;
		 
      //save the decay chain
      bool saved = printChildren(decayedSims[p], promptDecays,  promptVertex, 0, true, mother_gen_index);
		 
      if (saved && mapMC.find(p)!=mapMC.end()) {
      statusMC[mapMC[p]] *= -1;
      }
      } // is primary photon
      } // for iGen
      ///// End of commented conversions code 
      */
		
    } // if isMC 
  else
    {
      //
      // Not simulation
      //
		
      //
      // Setting null values for these "global event" parameters in the output tree
      //
      genSize = 1;
      nSimTracks = 1;
      mergedTrackTruthSize = 1;
      nMesonSize = 1;
      nPhotonSize = 1;
		
      nMC = 1;
      pdgIdMC[0] = -99999;   // these MC arrays are actually obsolete (July 2013)
      statusMC[0] = -99999;
      motherIndexMC[0] = -99999;
      motherIDMC[0] = -99999;
      ptMC[0] = -99999;
      eMC[0] = -99999;
      etaMC[0] = -99999;
      phiMC[0] = -99999;
      convertedMC[0] = 0;
		
      nSim = 1;
      njSim = 1;

      ptSim[0] = -99999;
      eSim[0] = -99999;
      etaSim[0] = -99999;
      phiSim[0] = -99999;
      rSim[0] = -99999;
      zSim[0] = -99999;

      pdgIdSim[0] = -99999; 
      // statusSim[0] = -99999;
      motherGenIndexSim[0] = -99999;
  
    }
	
  //
  // The generation and content of an ouptut tree is controlled by the python parameters
  // 
  if(m_tree) {
    m_tree->Fill();
  }
	
	
} // end of analyze method


// ------------ method called once each job just before starting event loop  ------------
void EcalFlowNtp::beginJob()
{
	
  // content
  // xtal
  // e, pt, time, eta, phi, flag, 
  // 
  // clus
  // e, time, eta, phi, eta_cms, phi_cms, isolation, s1, s4, s9, indici 9 cristalli
  // 
  // pi0
  // inv mass, e, pt, eta, phi, eta_cms, phi_cms, indice 2 clus
	
  // GENERAL block branches
	
  maxTracksPerJob = -1;
  maxClustersPerJob = -1;
  maxCryPerJob = -1;
  maxPi0PerJob = -1;
	
  eventMaxTracksPerJob = -1;
  eventMaxClustersPerJob = -1;
  eventMaxCryPerJob = -1;
  eventMaxPi0PerJob = -1;
	
  runMaxTracksPerJob = -1;
  runMaxClustersPerJob = -1;
  runMaxCryPerJob = -1;
  runMaxPi0PerJob = -1;
	
  totalEventsThisJob = 0;
  hotChannelSeedsDiscarded = 0;
  hotChannelSatellitesDiscarded = 0;
	
  lowCentralityCut = 0;
  highCentralityCut = 32;
  eventsInsideCentralityWindow = 0;
  eventsOutsideCentralityWindow = 0;
	
} // end of beginJob method

// ------------ method called once each job just after ending the event loop  ------------
void EcalFlowNtp::endJob() {
	
  ////////////////// Calculating background for reconstructed pi0-hadron correlations //////////
  int nevttotal_trg = (int)pVectVect_trg.size();  // the trg are the pi0
  int nevttotal_ass = (int)pVectVect_ass.size();  // the ass are the charged particles
	
  cout << "\n\n EcalFlowNTP::endJob() <I>  nevttotal_trg = " << nevttotal_trg;
  cout << ",  nevttotal_ass = " << nevttotal_ass;
  cout << ", totalEventsThisJob " <<  totalEventsThisJob;
  cout << endl;
	
  unsigned int nBackgroundFill = 0;
  int totalTakeAssociated = 0;
  int minimumTakeAssociated = 1000;
  if(nevttotal_ass > 1 && nevttotal_trg > 1 && totalEventsThisJob > 1) {
		
    cout << "\n Will check the Z-vertex differences";
    cout << endl;

    unsigned int countAcceptedTriggerEvents = 0;
    bool *acceptedTriggerEvents = new bool [nevttotal_trg];
    //
    // Look at Z-Vertex differences
    //
    for(int nevt_trg=0; nevt_trg<nevttotal_trg; nevt_trg++) {
      acceptedTriggerEvents[nevt_trg] = false;
      for(int nevt_ass=0; nevt_ass<nevttotal_ass; nevt_ass++) {
				
	if(nevt_trg == nevt_ass)
	  continue;  // don't use the same event
				
	if(fabs((zvtxVect)[nevt_trg] - (zvtxVect)[nevt_ass])<=2.0) {
	  acceptedTriggerEvents[nevt_trg] = true;
	  countAcceptedTriggerEvents++;
	  break; // found at least one partner event with a close enough Z vertex
	}
				
      } // loop over associated events
    } // loop over trigger events
    cout << "\n Number of trigger events with at least one partner event = " << countAcceptedTriggerEvents;
    cout << endl;
		
    for(int nevt_trg=0; nevt_trg<nevttotal_trg; nevt_trg++) {
			
      if(!acceptedTriggerEvents[nevt_trg])
	continue;  // skip this trigger event which has no partner event close enough in Z
	      
      nBackgroundFill++;

      int countGoodAssociated = 0;
	
      for(int nevt_ass=0; nevt_ass<nevttotal_ass; nevt_ass++) {
				
	if(nevt_trg == nevt_ass) { // check if the random trigger event matches this assocated event
	  continue;    // go to the next associated track
	}
				
	if(fabs((zvtxVect)[nevt_trg] - (zvtxVect)[nevt_ass])>2.0){  // check if the Z vertex of the trigger and associated are separated by more than 2 cm
	  continue;    // go to the next associated event
	}

	countGoodAssociated++;

      }

      if(countGoodAssociated < 1) {
	cout << "\n For nevt_trg " << nevt_trg << " the number of good associated events = " << countGoodAssociated << endl;
	continue;
      }

      int takeRandomInterval = 1;
      if(countGoodAssociated > 10)
	takeRandomInterval = countGoodAssociated/10 + 1 ;

      int takeAssociated = 0;
      for(int nevt_ass=0; nevt_ass<nevttotal_ass; nevt_ass += takeRandomInterval) {

        if(nevt_trg == nevt_ass) { // check if the random trigger event matches this assocated event   
          continue;    // go to the next associated track         
        }

	if(fabs((zvtxVect)[nevt_trg] - (zvtxVect)[nevt_ass])>2.0){  // check if the Z vertex of the trigger and associated are separated by more than 2 cm
	  continue;    // go to the next associated event                                                                             
        }
       
	takeAssociated++;
	if(takeAssociated > 10)
	  break;
			
	_DeltazVertex->Fill((zvtxVect)[nevt_trg] - (zvtxVect)[nevt_ass]);
				
	vector<TVector3> pVectTmp_trg = (pVectVect_trg)[nevt_trg];
	vector<TVector3> pVectTmp_ass = (pVectVect_ass)[nevt_ass];
	int nMult_trg1 = pVectTmp_trg.size();
	int nMult_ass1 = pVectTmp_ass.size();
				
	for(int ntrg=0; ntrg<nMult_trg1; ++ntrg) {
	  TVector3 pvectorTmp_trg = pVectTmp_trg[ntrg];
	  double eta_trg = pvectorTmp_trg.Eta();
	  double phi_trg = pvectorTmp_trg.Phi();
	  double pt_trg = pvectorTmp_trg.Pt();
				
	  for(int nass=0; nass<nMult_ass1; ++nass) {
						
	    TVector3 pvectorTmp_ass = pVectTmp_ass[nass];
	    double eta_ass = pvectorTmp_ass.Eta();
	    double phi_ass = pvectorTmp_ass.Phi();
						
	    double deltaEta = eta_ass - eta_trg;
	    //
	    // How does this code different from the standard CMS function for Delta-Phi?
	    //
	    double deltaPhi = phi_ass - phi_trg;
	    if(deltaPhi > M_PI) deltaPhi = deltaPhi - 2*M_PI;
	    if(deltaPhi < -M_PI) deltaPhi = deltaPhi + 2*M_PI;
	    if(deltaPhi > -M_PI && deltaPhi < -M_PI/2.0) deltaPhi = deltaPhi + 2*M_PI;
						
	    if(deltaEta == 0 && deltaPhi == 0) continue;
							    
	    if(pi0HadronCorrelations_ || etaHadronCorrelations_) {

	      char histogramName6[200];
	      for(int kPt=0; kPt<bins1; kPt++) {
		if(pt_trg > NptBins_[kPt] && pt_trg <= NptBins_[kPt+1]) {
    
		  sprintf(histogramName6, "hBackgroundPtBin%d", kPt);

		  hBackground[histogramName6]->Fill(fabs(deltaEta),fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
		  hBackground[histogramName6]->Fill(-fabs(deltaEta),fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
		  hBackground[histogramName6]->Fill(fabs(deltaEta),-fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
		  hBackground[histogramName6]->Fill(-fabs(deltaEta),-fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
		  hBackground[histogramName6]->Fill(fabs(deltaEta),2*M_PI  - fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
		  hBackground[histogramName6]->Fill(-fabs(deltaEta),2*M_PI - fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);

		  break; // no need to check the remaining pT bins

		}  // check on pt_trg

	      } // loop over kPt

	    } // check on pi0HadronCorrelations_

	    // Uncomment the above two line for analyzing pPb data
		
	    if(diHadronCorrelations_) {
	      hBackground1->Fill(fabs(deltaEta),fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
	      hBackground1->Fill(-fabs(deltaEta),fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
	      hBackground1->Fill(fabs(deltaEta),-fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
	      hBackground1->Fill(-fabs(deltaEta),-fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
	      hBackground1->Fill(fabs(deltaEta),2*M_PI- fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
	      hBackground1->Fill(-fabs(deltaEta),2*M_PI- fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
	    } // diHadronCorrelations_ check
		
	  } // loop over nass

	} // loop over ntrg

      } // loop over nevt_ass

     if(takeAssociated < minimumTakeAssociated)
	minimumTakeAssociated = takeAssociated;

      totalTakeAssociated += takeAssociated;
			
    } // loop over nevt_trg
		
    delete [] acceptedTriggerEvents;
		
  } // check for more than one trigger event, more than one associated event, and more than one event

  unsigned int nGenBackgroundFill = 0;
  int totalGenTakeAssociated = 0;
  int minimumGenTakeAssociated = 1000;
	
  //
  // Background for generated particles
  //

  int nGenHistBackgroundFill[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

  nevttotal_trg = (int)pGenVectVect_trg.size();  // the trg are the pi0
  nevttotal_ass = (int)pGenVectVect_ass.size();  // the ass are the charged particles
	
  cout << "\n\n EcalFlowNTP::endJob() <I>  Generator: nevttotal_trg = " << nevttotal_trg;
  cout << ",  nevttotal_ass = " << nevttotal_ass;
  cout << endl;
	
  if(nevttotal_ass > 1 && nevttotal_trg > 1 && totalEventsThisJob > 1) {
		
    for(int nevt_trg=0; nevt_trg<nevttotal_trg; nevt_trg++) {
				      
      nGenBackgroundFill++;

      int countGoodAssociated = 0;
	
      for(int nevt_ass=0; nevt_ass<nevttotal_ass; nevt_ass++) {
				
	if(nevt_trg == nevt_ass) { // check if the random trigger event matches this assocated event
	  continue;    // go to the next associated track
	}
				
	countGoodAssociated++;

      }

      if(countGoodAssociated < 1) {
	cout << "\n For nevt_trg " << nevt_trg << " the number of good associated events = " << countGoodAssociated << endl;
	continue;
      }

      int takeRandomInterval = 1;
      if(countGoodAssociated > 10)
	takeRandomInterval = countGoodAssociated/10 + 1 ;

      int takeAssociated = 0;
      for(int nevt_ass=0; nevt_ass<nevttotal_ass; nevt_ass += takeRandomInterval) {

        if(nevt_trg == nevt_ass) { // check if the random trigger event matches this assocated event   
          continue;    // go to the next associated track         
        }
       
	takeAssociated++;
	if(takeAssociated > 10)
	  break;
							
	vector<TVector3> pVectTmp_trg = (pGenVectVect_trg)[nevt_trg];
	vector<TVector3> pVectTmp_ass = (pGenVectVect_ass)[nevt_ass];
	int nMult_trg1 = pVectTmp_trg.size();
	int nMult_ass1 = pVectTmp_ass.size();
				
	for(int ntrg=0; ntrg<nMult_trg1; ++ntrg) {
	  TVector3 pvectorTmp_trg = pVectTmp_trg[ntrg];
	  double eta_trg = pvectorTmp_trg.Eta();
	  double phi_trg = pvectorTmp_trg.Phi();
	  double pt_trg = pvectorTmp_trg.Pt();
				
	  for(int nass=0; nass<nMult_ass1; ++nass) {
						
	    TVector3 pvectorTmp_ass = pVectTmp_ass[nass];
	    double eta_ass = pvectorTmp_ass.Eta();
	    double phi_ass = pvectorTmp_ass.Phi();
						
	    double deltaEta = eta_ass - eta_trg;
	    //
	    // How does this code different from the standard CMS function for Delta-Phi?
	    //
	    double deltaPhi = phi_ass - phi_trg;
	    if(deltaPhi > M_PI) deltaPhi = deltaPhi - 2*M_PI;
	    if(deltaPhi < -M_PI) deltaPhi = deltaPhi + 2*M_PI;
	    if(deltaPhi > -M_PI && deltaPhi < -M_PI/2.0) deltaPhi = deltaPhi + 2*M_PI;
						
	    if(deltaEta == 0 && deltaPhi == 0) continue;				
	    
	    if(pi0HadronCorrelations_ || etaHadronCorrelations_) {

	      char histogramName6[200];
	      for(int kPt=0; kPt<bins1; kPt++) {
		if(pt_trg > NptBins_[kPt] && pt_trg <= NptBins_[kPt+1]) {
		  
		  if(kPt < 10) {
		    nGenHistBackgroundFill[kPt]++;
		  }
    
		  sprintf(histogramName6, "hGenBackgroundPtBin%d", kPt);

		  hGenBackground[histogramName6]->Fill(fabs(deltaEta),fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
		  hGenBackground[histogramName6]->Fill(-fabs(deltaEta),fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
		  hGenBackground[histogramName6]->Fill(fabs(deltaEta),-fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
		  hGenBackground[histogramName6]->Fill(-fabs(deltaEta),-fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
		  hGenBackground[histogramName6]->Fill(fabs(deltaEta),2*M_PI  - fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
		  hGenBackground[histogramName6]->Fill(-fabs(deltaEta),2*M_PI - fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
		}  // check on pt_trg

	      } // loop over kPt

	    } // check on pi0HadronCorrelations_

	    // Uncomment the above two line for analyzing pPb data
		
	    if(diHadronCorrelations_) {
	      hGenBackground1->Fill(fabs(deltaEta),fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
	      hGenBackground1->Fill(-fabs(deltaEta),fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
	      hGenBackground1->Fill(fabs(deltaEta),-fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
	      hGenBackground1->Fill(-fabs(deltaEta),-fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
	      hGenBackground1->Fill(fabs(deltaEta),2*M_PI- fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
	      hGenBackground1->Fill(-fabs(deltaEta),2*M_PI- fabs(deltaPhi),1.0/nMult_trg1/nMult_ass1);
	    } // diHadronCorrelations_ check
		
	  } // loop over nass

	} // loop over ntrg

      } // loop over nevt_ass

     if(takeAssociated < minimumGenTakeAssociated)
	minimumGenTakeAssociated = takeAssociated;

      totalGenTakeAssociated += takeAssociated;
			
    } // loop over nevt_trg
				
  } // check for more than one trigger event, more than one associated event, and more than one event
	

  cout << endl << "--- RESULTS ---" << endl;
	
  cout << "\n  Currently with pi0 mixed event entries = " << pi0MassHistMixed->GetEntries();
  cout << ",  mixed clusters examined " << countMixedClusterExamined;
  cout << ",  events containing at least one cluster " << totalEventsWithClusters++;
	
  cout << "\n Number of hot channel seed crystals that were discarded " << hotChannelSeedsDiscarded;
  cout << "\n Number of hot channel satellite crystals that were discarded " << hotChannelSatellitesDiscarded;
	
  cout << "\n Maximum number of HI tracks for run " << runMaxTracksPerJob << " is " << maxTracksPerJob << " at event " << eventMaxTracksPerJob;
  cout << "\n Maximum number clusters found for run " << runMaxClustersPerJob << " is "  << maxClustersPerJob  << " at event " << eventMaxClustersPerJob;
  cout << "\n Maximum number crystals found for run " << runMaxCryPerJob << " is " << maxCryPerJob << " at event " << eventMaxCryPerJob;
  cout << "\n Total events this run = " << totalEventsThisJob << " with accumulated events for all runs = " << totalEventsAllJobs;
  cout << "\n Number of events with trigger particle (nevttotal_trg) = " << nevttotal_trg;
  cout << "\n Number of events with associated particle (nevttotal_ass) = " << nevttotal_ass;
  cout << "\n Number of background fills = " << nBackgroundFill; 
  cout << "\n Total of takeAssociated events = " << totalTakeAssociated;
  cout << "\n Minimum number of associated events for any trigger event = " << minimumTakeAssociated;
  cout << "\n Number of generator background fills = " << nGenBackgroundFill; 
  cout << "\n Total of generator takeAssociated events = " << totalGenTakeAssociated;
  cout << "\n Minimum number of generator associated events for any trigger event = " << minimumGenTakeAssociated;
  for(int kPt=0; kPt<bins1; kPt++) {
    cout << "\n Number of fills for background histogram " << kPt << " = " << nGenHistBackgroundFill[kPt];
  }
	
  cout << endl;
	
} // end of endJob method

void EcalFlowNtp::initHistos(const edm::Service<TFileService> & fs)
{
	
  TH1D::SetDefaultSumw2();
	
	
  TFileDirectory chTrkQA = fs->mkdir( "ChargedParticles" );
	
  tEvents_ = chTrkQA.make<TH1F>("tEvents_","",1,0,1);
	
  tVertexX_ = chTrkQA.make<TH1F>("tVerteX_", "", 100, -1, 1);
  tVertexY_ = chTrkQA.make<TH1F>("tVerteY_", "", 100, -1, 1);
  tVertexZ_ = chTrkQA.make<TH1F>("tVerteZ_", "", 100, -30, 30);
	
  tHit_ = chTrkQA.make<TH1I>("tHit_", "Tracks by number of valid hits", 31, 0, 30);
  tHit_->GetXaxis()->SetTitle("Number of valid hits");
	
  tPt_ = chTrkQA.make<TH1F>("tPt_", "p_{T} spectrum", 100, 0, 20);
  tPt_->GetXaxis()->SetTitle("p_{T} (GeV/c)");

  EventsLeadTrack_ =  chTrkQA.make<TH1F>("EventsLeadTrack_", "Number of events by leading track pt", 100, 0, 100);
  EventsLeadTrack_->GetXaxis()->SetTitle("p_{T} (GeV/c)");
	
  tEta_ = chTrkQA.make<TH1F>("tEta_", "Pseudorapidity distribution", 50, -2.5, 2.5);
  tEta_->GetXaxis()->SetTitle("#eta distribution of the tracks");
	
  tPhi_ = chTrkQA.make<TH1F>("tPhi_", "Azimuthal distribution",100, -3.15, 3.15);
  tPhi_->GetXaxis()->SetTitle("#phi distribution of the tracks");
	
  tDz_ = chTrkQA.make<TH1F>("tDz_", "Track quality variable",100, -3.0, 3.0);
  tDz_->GetXaxis()->SetTitle("d_{z}/#sigma(d_{z})");
  tDxy_ = chTrkQA.make<TH1F>("tDxy_", "Track quality variable",100, -3.0, 3.0);
  tDxy_->GetXaxis()->SetTitle("d_{xy}/#sigma(d_{xy})");
	
  tPtQA_ = chTrkQA.make<TH1F>("tPtQA_", "Track quality variable",100, -0.1, 0.1);
  tPtQA_->GetXaxis()->SetTitle("sigma(p_{T}/p_{T})");
	
  tHPTracks_ = chTrkQA.make<TH1F>("tHPTracks_","",750, 0, 750);
  tAllTracks_ = chTrkQA.make<TH1F>("tAllTracks_","",750, 0, 750);
	
  tEtvsHiTracksPlus_ = chTrkQA.make<TH2F>("tEtvsHiTracksPlus_", "E_{T}+ in HF vs HI tracks",400, 0.0, 400.0, 300, 0.0, 300.0);
  tEtvsHiTracksPlus_->GetXaxis()->SetTitle("Number of pPb tracks");
  tEtvsHiTracksPlus_->GetYaxis()->SetTitle("E_{T}+ in HF [GeV]");
	
  tEtvsHiTracksMinus_ = chTrkQA.make<TH2F>("tEtvsHiTracksMinus_", "E_{T}- in HF vs HI tracks",400, 0.0, 400.0, 300, 0.0, 300.0);
  tEtvsHiTracksMinus_->GetXaxis()->SetTitle("Number of pPb tracks");
  tEtvsHiTracksMinus_->GetYaxis()->SetTitle("E_{T}- in HF [GeV]");
	
  tEtvsHPHiTracksPlus_ = chTrkQA.make<TH2F>("tEtvsHPHiTracksPlus_", "E_{T}+ in HF vs HP HI tracks",400, 0.0, 400.0, 300, 0.0, 300.0);
  tEtvsHPHiTracksPlus_->GetXaxis()->SetTitle("Number of pPb HP tracks");
  tEtvsHPHiTracksPlus_->GetYaxis()->SetTitle("E_{T}+ in HF [GeV]");
	
  tEtvsHPHiTracksMinus_ = chTrkQA.make<TH2F>("tEtvsHPHiTracksMinus_", "E_{T}- in HF vs HP HI tracks",400, 0.0, 400.0, 300, 0.0, 300.0);
  tEtvsHPHiTracksMinus_->GetXaxis()->SetTitle("Number of HP pPb tracks");
  tEtvsHPHiTracksMinus_->GetYaxis()->SetTitle("E_{T}- in HF [GeV]");
	
  TFileDirectory pi0Related = fs->mkdir( "NeutralPions" );
	
  if(makeOutputTree_) {
    cout << "\n\n  Attempt to create m_tree object " << endl;
    m_tree = pi0Related.make<TTree>("hTree", "Pi0Eta Diagnostic Tree");
    cout << "\n\n Return from m_tree creation attempt, with m_tree value " << m_tree <<  endl;
		
    if(m_tree) { // parts of the global event information are not meaningful for data files
      //
      // Global event information
      //
      m_tree->Branch("Run",&runn,"Run/I");
      m_tree->Branch("Event",&eventn,"Event/I");
      m_tree->Branch("LumiSection",&ls,"LumiSection/I");
      m_tree->Branch("xPrimaryVtx", &xPrimaryVertex, "xPrimaryVtx/F");
      m_tree->Branch("yPrimaryVtx", &yPrimaryVertex, "yPrimaryVtx/F");
      m_tree->Branch("rPrimaryVtx", &rPrimaryVertex, "rPrimaryVtx/F");
      m_tree->Branch("zPrimaryVtx", &zPrimaryVertex, "zPrimaryVtx/F");
      m_tree->Branch("nCry",&nCry,"nCry/I");
      m_tree->Branch("nClu",&nClu,"nClu/I");
      m_tree->Branch("nHITracks",&nHITracks,"nHITracks/I");
      m_tree->Branch("nHighPurityTracks",&nHighPurityTracks,"nHighPurityTracks/I");
      m_tree->Branch("nPairTracksSize", &nPairTracksSize, "nPairTracksSize/I");
      //
      // These parts of the global event component are not be meaningful for data files
      //
      m_tree->Branch("nMC",&nMC,"nMC/I");
      m_tree->Branch("genSize",&genSize,"genSize/I");
      m_tree->Branch("njSim",&njSim,"njSim/I");
      m_tree->Branch("nSimTracks",&nSimTracks,"nSimTracks/I");
      m_tree->Branch("lowestDaughterSimTrack", &lowestDaughterSimTrack, "lowestDaughterSimTrack/I");
      m_tree->Branch("highestMatchedGenSimTrack", &highestMatchedGenSimTrack, "highestMatchedGenSimTrack/I");
      m_tree->Branch("mergedTrackTruthSize",&mergedTrackTruthSize,"mergedTrackTruthSize/I");
      m_tree->Branch("nMesonSize",&nMesonSize,"nMesonSize/I");
      m_tree->Branch("nPhotonSize",&nPhotonSize,"nPhotonSize/I");
      m_tree->Branch("nChMesonSize",&nChMesonSize,"nChMesonSize/I");
						
      // crystal variables
      if(crystalStore_) {  // all of these parts of the tree work for data files
	m_tree->Branch("kCry",&kCry,"kClu[nCry]/I");
	m_tree->Branch("eCry",&eCry,"eCry[nCry]/F");
	m_tree->Branch("ptCry",&ptCry,"ptCry[nCry]/F");
	m_tree->Branch("timeCry",&timeCry,"timeCry[nCry]/F");
	m_tree->Branch("flagCry",&flagCry,"flagCry[nCry]/I");
	m_tree->Branch("ietaCry",&ietaCry,"ietaCry[nCry]/I");
	m_tree->Branch("iphiCry",&iphiCry,"iphiCry[nCry]/I");
	m_tree->Branch("iCry",&iCry,"iCry[nCry]/I");
	m_tree->Branch("iSM",&iSM,"iSM[nCry]/I");
	m_tree->Branch("indexCluCry",&indexCluCry,"indexCluCry[nCry]/I");
				
	cout << "\n The crystal information is being stored in the hTree for this job";
				
      }
      else {
	cout << "\n No crystal information is being stored in the hTree for this job";
      }
			
			
      // basic cluster variables
      if(clusterStore_) { // all of these parts work for data files
	m_tree->Branch("kClu",&kClu,"kClu[nClu]/I");
	m_tree->Branch("ptClu",&ptClu,"ptClu[nClu]/F");
	m_tree->Branch("etaClu",&etaClu,"etaClu[nClu]/F");
	m_tree->Branch("phiClu",&phiClu,"phiClu[nClu]/F");
	m_tree->Branch("nGoodRecoMatches",&nGoodRecoMatches, "nGoodRecoMatches[nClu]/I");
	m_tree->Branch("S4Clu",&S4Clu,"S4Clu[nClu]/F");
	m_tree->Branch("S9Clu",&S9Clu,"S9Clu[nClu]/F");
	m_tree->Branch("S25Clu",&S25Clu,"S25Clu[nClu]/F");
	m_tree->Branch("zClu",&zClu,"zClu[nClu]/F");
	m_tree->Branch("S1Clu",&S1Clu,"S1Clu[nClu]/F");
	m_tree->Branch("timeClu",&timeClu,"timeClu[nClu]/F");
	m_tree->Branch("nCryClu",&nCryClu,"nCryClu[nClu]/I");
	m_tree->Branch("indexCryClu",&indexCryClu,"indexCryClu[nClu][9]/I");
	//
	// Note these correspondence variables are only valid when the simTracks collection is used
	//
	m_tree->Branch("bestNoConvertSimIndexEcal",&bestNoConvertSimIndexEcal, "bestNoConvertSimIndexEcal[nClu]/I");
	m_tree->Branch("countNoConvertSimMatchEcal",&countNoConvertSimMatchEcal, "countNoConvertSimMatchEcal[nClu]/I");
	m_tree->Branch("bestNoConvertSimAngleEcal",&bestNoConvertSimAngleEcal, "bestNoConvertSimAngleEcal[nClu]/F");

	m_tree->Branch("seedTimeClu",&seedTimeClu,"seedTimeClu[nClu]/F");
	m_tree->Branch("seedEnergyClu",&seedEnergyClu,"seedEnergyClu[nClu]/F");
	m_tree->Branch("recEnergySum",&recEnergySum,"recEnergySum[nClu]/F");
	m_tree->Branch("weightedTimeClu",&weightedTimeClu,"weightedTimeClu[nClu]/F");
	m_tree->Branch("s9WidthX",&s9WidthX,"s9WidthX[nClu]/F");
	m_tree->Branch("s9WidthY",&s9WidthY,"s9WidthY[nClu]/F");
	m_tree->Branch("s25WidthX",&s25WidthX,"s25WidthX[nClu]/F");
	m_tree->Branch("s25WidthY",&s25WidthY,"s25WidthY[nClu]/F");
		
	cout << "\n The basic cluster information is being stored in the hTree for this job";
      }
      else {
	cout << "\n No basic cluster information is being stored in the hTree for this job";
      }			
			
      if(clusterRecoTrackStore_) { // all of these parts work for data files
	m_tree->Branch("indexBestRecoMatch",&indexBestRecoMatch, "indexBestRecoMatch[nClu]/I");
	m_tree->Branch("valueBestAngleMatch",&valueBestAngleMatch, "valueBestAngleMatch[nClu]/F");
	m_tree->Branch("momentumBestTrackMatch",&momentumBestTrackMatch, "momentumBestTrackMatch[nClu]/F");
	m_tree->Branch("dxyVertexBestTrackMatch",&dxyVertexBestTrackMatch, "dxyVertexBestTrackMatch[nClu]/F");
	m_tree->Branch("dzVertexBestTrackMatch",&dzVertexBestTrackMatch, "dzVertexBestTrackMatch[nClu]/F");
	m_tree->Branch("sdxyVertexBestTrackMatch",&sdxyVertexBestTrackMatch, "sdxyVertexBestTrackMatch[nClu]/F");
	m_tree->Branch("sdzVertexBestTrackMatch",&sdzVertexBestTrackMatch, "sdzVertexBestTrackMatch[nClu]/F");
	m_tree->Branch("dPhiBestAngleMatch",&dPhiBestAngleMatch, "dPhiBestAngleMatch[nClu]/F");
	m_tree->Branch("dThetaBestAngleMatch",&dThetaBestAngleMatch, "dThetaBestAngleMatch[nClu]/F");
	m_tree->Branch("outerRadiusTrackMatch",&outerRadiusTrackMatch, "outerRadiusTrackMatch[nClu]/F");
	m_tree->Branch("outerPtTrackMatch",&outerPtTrackMatch, "outerPtTrackMatch[nClu]/F");
			
	cout << "\n The reco track-cluster information is being stored in the hTree for this job";
      }
      else {
	cout << "\n No reco track-cluster information is being stored in the hTree for this job";
      }

      // reconstructed tracks with only information for pairs correlations		
      if(pairCorrTracksStore_) { // all of these parts work for data files
	m_tree->Branch("pairTrack",&pairTrack,"pairTrack[nPairTracksSize]/I");
	m_tree->Branch("recoPairPtTrack",&recoPairPtTrack,"recoPairPtTrack[nPairTracksSize]/F");
	m_tree->Branch("recoPairEtaTrack",&recoPairEtaTrack,"recoPairEtaTrack[nPairTracksSize]/F");
	m_tree->Branch("recoPairPhiTrack",&recoPairPhiTrack,"recoPairTrack[nPairTracksSize]/F");

	cout << "\n Only the reco tracks information for pairs correlations is being stored in the hTree for this job";
      }
      else {
	cout << "\n No reco tracks information only for pairs correlations is being stored in the hTree for this job";
      }
			
      // reconstructed tracks with all the information
      if(recoTrackStore_) { // all of these parts work for data files
	m_tree->Branch("mTrack",&mTrack,"mTrack[nHITracks]/I");
	m_tree->Branch("recoPurityTrack",&recoPurityTrack,"recoPurityTrack[nHITracks]/I");
	m_tree->Branch("recoPhiDTrack",&recoPhiDTrack,"recoPhiDTrack[nHITracks]/F");
	m_tree->Branch("recoPtTrack",&recoPtTrack,"recoPtTrack[nHITracks]/F");
	m_tree->Branch("recoEtaTrack",&recoEtaTrack,"recoEtaTrack[nHITracks]/F");
	m_tree->Branch("recoPhiTrack",&recoPhiTrack,"recoPhiTrack[nHITracks]/F");
	m_tree->Branch("recoThetaTrack",&recoThetaTrack,"recoThetaTrack[nHITracks]/F");
	m_tree->Branch("recoVxTrack",&recoVxTrack,"recoVxTrack[nHITracks]/F");
	m_tree->Branch("recoVyTrack",&recoVyTrack,"recoVyTrack[nHITracks]/F");
	m_tree->Branch("recoVzTrack",&recoVzTrack,"recoVzTrack[nHITracks]/F");
	m_tree->Branch("recoDxyTrack",&recoDxyTrack,"recoDxyTrack[nHITracks]/F");
	m_tree->Branch("recoDzTrack",&recoDzTrack,"recoDzTrack[nHITracks]/F");
	m_tree->Branch("recoSdxyTrack",&recoSdxyTrack,"recoSdxyTrack[nHITracks]/F");
	m_tree->Branch("recoSdzTrack",&recoSdzTrack,"recoSdzTrack[nHITracks]/F");
	m_tree->Branch("recoOxTrack",&recoOxTrack,"recoOxTrack[nHITracks]/F");
	m_tree->Branch("recoOyTrack",&recoOyTrack,"recoOyTrack[nHITracks]/F");
	m_tree->Branch("recoOzTrack",&recoOzTrack,"recoOzTrack[nHITracks]/F");
	m_tree->Branch("recoChargeTrack",&recoChargeTrack,"recoChargeTrack[nHITracks]/I");
	m_tree->Branch("recoEcalTrack",&recoEcalTrack,"recoEcalTrack[nHITracks]/I");
	m_tree->Branch("recoNMatchTrack",&recoNMatchTrack,"recoNMatchTrack[nHITracks]/I");
       				
	cout << "\n All the reco tracks information is being stored in the hTree for this job";				
      }
      else {
	cout << "\n No reco tracks complete information is being stored in the hTree for this job";
      }
			
      // mc truth
      if(mcParticleStore_) { // none of these parts works for data files, and this 2010 MC collection is really obsolete in 2013
	m_tree->Branch( "kMC",           kMC,           "kMC[nMC]/I");
	m_tree->Branch( "pdgIdMC",       pdgIdMC,       "pdgIdMC[nMC]/I");
	m_tree->Branch( "motherIDMC",    motherIDMC,    "motherIDMC[nMC]/I");
	m_tree->Branch( "motherIndexMC", motherIndexMC, "motherIndexMC[nMC]/I");
	m_tree->Branch( "statusMC",      statusMC,      "statusMC[nMC]/I");
	m_tree->Branch( "ptMC",          ptMC,          "ptMC[nMC]/F");
	m_tree->Branch( "eMC",           eMC,           "eMC[nMC]/F");
	m_tree->Branch( "etaMC",         etaMC,         "etaMC[nMC]/F");
	m_tree->Branch( "phiMC",         phiMC,         "phiMC[nMC]/F");
				
	cout << "\n The mcParticle information is being stored in the hTree for this job";
				
      }
      else {
	cout << "\n No mcParticle information is being stored in the hTree for this job";
      }
					
      // simTrack information
      if(simTrackStore_) { // none of these parts works for data files
	m_tree->Branch("kSim",&kSim,"kSim[nSimTracks]/I");
	m_tree->Branch("gMotherGenIdSim",&gMotherGenIdSim,"gMotherGenIdSim[nSimTracks]/I");
	m_tree->Branch("motherGenIndexSim",&motherGenIndexSim,"motherGenIndexSim[nSimTracks]/I");
	m_tree->Branch("motherGenIdSim",&motherGenIdSim,"motherGenIdSim[nSimTracks]/I");
	m_tree->Branch("pdgIdSim",&pdgIdSim,"pdgIdSim[nSimTracks]/I");
	if(!simSlimTrackStore_) {  // extended output for the simTrack branch
	  m_tree->Branch("noVertexSim",&noVertexSim,"noVertexSim[nSimTracks]/I");
	  m_tree->Branch("ptSim",&ptSim,"ptSim[nSimTracks]/F");
	  m_tree->Branch("eSim",&eSim,"eSim[nSimTracks]/F");
	  m_tree->Branch("etaSim",&etaSim,"etaSim[nSimTracks]/F");
	  m_tree->Branch("phiSim",&phiSim,"phiSim[nSimTracks]/F");
	  m_tree->Branch("trackIdSim",&trackIdSim,"trackIdSim[nSimTracks]/I");
	  m_tree->Branch("parentKSim",&parentKSim,"parentKSim[nSimTracks]/I");
	  m_tree->Branch("parentIdSim",&parentIdSim,"parentIdSim[nSimTracks]/I");
	  m_tree->Branch("parentTrackSim",&parentTrackSim,"parentTrackSim[nSimTracks]/I");
	  m_tree->Branch("gParentKSim",&gParentKSim,"gParentKSim[nSimTracks]/I");
	  m_tree->Branch("gParentIdSim",&gParentIdSim,"gParentIdSim[nSimTracks]/I");
	  m_tree->Branch("gParentTrackSim",&gParentTrackSim,"gParentTrackSim[nSimTracks]/I");
	  m_tree->Branch("nDaughtersSim",&nDaughtersSim,"nDaughtersSim[nSimTracks]/I");
	  m_tree->Branch("kDaughtersSim",&kDaughtersSim,"kDaughtersSim[nSimTracks][3]/I");
	  m_tree->Branch("rSim",&rSim,"rSim[nSimTracks]/F");
	  m_tree->Branch("zSim",&zSim,"zSim[nSimTracks]/F");
	  m_tree->Branch("genPartIndexSim",&genPartIndexSim,"genPartIndexSim[nSimTracks]/I");
	  //
	  // The genPartPdgIdSim matching algorithm has been changed (Maguire, August 2013)
	  //
	  m_tree->Branch("genPartPdgIdSim",&genPartPdgIdSim,"genPartPdgIdSim[nSimTracks]/I");
	  m_tree->Branch("bestAngleMatchGenSim",&bestAngleMatchGenSim,"bestAngleMatchGenSim[nSimTracks]/F");
	  m_tree->Branch("bestPtMatchGenSim",&bestPtMatchGenSim,"bestPtMatchGenSim[nSimTracks]/F");
	  m_tree->Branch("bestEtaMatchGenSim",&bestEtaMatchGenSim,"bestEtaMatchGenSim[nSimTracks]/F");
	  m_tree->Branch("bestPhiMatchGenSim",&bestPhiMatchGenSim,"bestPhiMatchGenSim[nSimTracks]/F");
	  m_tree->Branch("motherGenIndexSim",&motherGenIndexSim,"motherGenIndexSim[nSimTracks]/I");
	  m_tree->Branch("motherGenIdSim",&motherGenIdSim,"motherGenIdSim[nSimTracks]/I");

	  m_tree->Branch("bestNoConvertEcalIndexSim",&bestNoConvertEcalIndexSim,"bestNoConvertEcalIndexSimSim[nSimTracks]/I");
	  m_tree->Branch("bestNoConvertEcalAngleSim",&bestNoConvertEcalAngleSim,"bestNoConvertEcalAngleSim[nSimTracks]/F");
	  m_tree->Branch("bestNoConvertEcalPtSim",&bestNoConvertEcalPtSim,"bestNoConvertEcalPtSim[nSimTracks]/F");
	} // check on !slimTrackStore+

	if(simTrackStore_)
	  cout << "\n The full simTrack information is being stored in the hTree for this job";
	if(simSlimTrackStore_)
	  cout << "\n The slimmed simTrack information only is being stored in the hTree for this job";
				
      }
      else {
	cout << "\n No simTrack information is being stored in the hTree for this job";
      }
			
      // merged truth information
      if(mergedTrackTruthStore_) { // none of these parts works for data files, and this is a new component in 2013
	m_tree->Branch("kMerge",&kMerge,"kMerge[mergedTrackTruthSize]/I");
	m_tree->Branch("numberDecayVerticesMerge",&numberDecayVerticesMerge,"numberDecayVerticesMerge[mergedTrackTruthSize]/I");
	m_tree->Branch("numberEarlyDecayMerge",&numberEarlyDecayMerge,"numberEarlyDecayMerge[mergedTrackTruthSize]/I");
	m_tree->Branch("pdgIdMerge",&pdgIdMerge,"pdgIdMerge[mergedTrackTruthSize]/I");
	m_tree->Branch("primaryTrackMerge",&primaryTrackMerge,"primaryTrackMerge[mergedTrackTruthSize]/I");
	m_tree->Branch("xParentVertexMerge",&xParentVertexMerge,"xParentVertexMerge[mergedTrackTruthSize]/F");
	m_tree->Branch("yParentVertexMerge",&yParentVertexMerge,"yParentVertexMerge[mergedTrackTruthSize]/F");
	m_tree->Branch("rParentVertexMerge",&rParentVertexMerge,"rParentVertexMerge[mergedTrackTruthSize]/F");
	m_tree->Branch("zParentVertexMerge",&zParentVertexMerge,"zParentVertexMerge[mergedTrackTruthSize]/F");
	m_tree->Branch("ptMerge",&ptMerge,"ptMerge[mergedTrackTruthSize]/F");
	m_tree->Branch("etaMerge",&etaMerge,"etaMerge[mergedTrackTruthSize]/F");
	m_tree->Branch("phiMerge",&phiMerge,"phiMerge[mergedTrackTruthSize]/F");
	m_tree->Branch("xDecayVertexMerge",&xDecayVertexMerge,"xDecayVertexMerge[mergedTrackTruthSize]/F");
	m_tree->Branch("yDecayVertexMerge",&yDecayVertexMerge,"yDecayVertexMerge[mergedTrackTruthSize]/F");
	m_tree->Branch("rDecayVertexMerge",&rDecayVertexMerge,"rDecayVertexMerge[mergedTrackTruthSize]/F");
	m_tree->Branch("zDecayVertexMerge",&zDecayVertexMerge,"zDecayVertexMerge[mergedTrackTruthSize]/F");
	m_tree->Branch("bestAngleMatchMerge",&bestAngleMatchMerge,"bestAngleMatchMerge[mergedTrackTruthSize]/F");
	m_tree->Branch("bestPtMatchMerge",&bestPtMatchMerge,"bestPtMatchMerge[mergedTrackTruthSize]/F");
	m_tree->Branch("bestEtaMatchMerge",&bestEtaMatchMerge,"bestEtaMatchMerge[mergedTrackTruthSize]/F");
	m_tree->Branch("bestPhiMatchMerge",&bestPhiMatchMerge,"bestPhiMatchMerge[mergedTrackTruthSize]/F");
	m_tree->Branch("bestPdgIdMatchMerge",&bestPdgIdMatchMerge,"bestPdgIdMatchMerge[mergedTrackTruthSize]/I");
	m_tree->Branch("bestGenIndexMatchMerge",&bestGenIndexMatchMerge,"bestGenIndexMatchMerge[mergedTrackTruthSize]/I");
	m_tree->Branch("bestEcalIndexMatch",&bestEcalIndexMatch,"bestEcalIndexMatch[mergedTrackTruthSize]/I");
	m_tree->Branch("bestEcalAngleMatch",&bestEcalAngleMatch,"bestEcalAngleMatch[mergedTrackTruthSize]/F");
	m_tree->Branch("bestEcalSeedTimeMatch",&bestEcalSeedTimeMatch,"bestEcalSeedTimeMatch[mergedTrackTruthSize]/F");
	m_tree->Branch("bestEcalPhiMatch",&bestEcalPhiMatch,"bestEcalPhiMatch[mergedTrackTruthSize]/F");
	m_tree->Branch("bestEcalDPhiMatch",&bestEcalDPhiMatch,"bestEcalDPhiMatch[mergedTrackTruthSize]/F");
	m_tree->Branch("bestEcalDEtaMatch",&bestEcalDEtaMatch,"bestEcalDEtaMatch[mergedTrackTruthSize]/F");
	m_tree->Branch("bestEcalPtMatch",&bestEcalPtMatch,"bestEcalPtMatch[mergedTrackTruthSize]/F");
				
	cout << "\n The mergedTrackTruth information is being stored in the hTree for this job";
				
      }
      else {
	cout << "\n No mergedTrackTruth information is being stored in the hTree for this job";
      }
			
			
      // generator particle information
      if(genParticleStore_) { // none of these parts would work for data files, and this is a 2010 component that is obsolete in 2013
	cout << "\n There is no genParticle information to store in the hTree";
      }
      else {
	cout << "\n No genParticle information is being stored in the hTree for this job";
      }
      if(chmesonStore_) { // none of these parts works for data files, and this is a new component in 2014
											
	m_tree->Branch("kChMeson",&kChMeson,"kChMeson[nChMesonSize]/I");
	m_tree->Branch("pdgIdChMeson",&pdgIdChMeson,"pdgIdChMeson[nChMesonSize]/I");
	m_tree->Branch("statusChMeson",&statusChMeson,"statusChMeson[nChMesonSize]/I");
 	m_tree->Branch("genPartIndexChMeson",&genPartIndexChMeson,"genPartIndexChMeson[nChMesonSize]/I");
	m_tree->Branch("motherIdChMeson",&motherIdChMeson,"motherIdChMeson[nChMesonSize]/I"); 
	m_tree->Branch("ptChMeson",&ptChMeson,"ptChMeson[nChMesonSize]/F");       
	m_tree->Branch("etaChMeson",&etaChMeson,"etaChMeson[nChMesonSize]/F");         
	m_tree->Branch("phiChMeson",&phiChMeson,"phiChMeson[nChMesonSize]/F");    	

	cout << "\n The charged particle truth information is being stored in the hTree for this job";

      } // charged meson information
      else {
	cout << "\n No charged meson information is being stored in the hTree for this job";
      }
			
      // neutral meson generator and truth information
      if(mesonStore_) { // none of these parts works for data files, and this is a new component in 2013
				
	m_tree->Branch("kMeson",&kMeson,"kMeson[nMesonSize]/I");
	m_tree->Branch("pdgIdMeson",&pdgIdMeson,"pdgIdMeson[nMesonSize]/I");
	m_tree->Branch("statusMeson",&statusMeson,"statusMeson[nMesonSize]/I");
 	m_tree->Branch("genPartIndexMeson",&genPartIndexMeson,"genPartIndexMeson[nMesonSize]/I");
	m_tree->Branch("motherIdMeson",&motherIdMeson,"motherIdMeson[nMesonSize]/I"); 
	m_tree->Branch("ptMeson",&ptMeson,"ptMeson[nMesonSize]/F");       
	m_tree->Branch("etaMeson",&etaMeson,"etaMeson[nMesonSize]/F");         
	m_tree->Branch("phiMeson",&phiMeson,"phiMeson[nMesonSize]/F");    
	m_tree->Branch("daughtersFromMeson",&daughtersFromMeson,"daughtersFromMeson[nMesonSize]/I");    
	m_tree->Branch("pdgIdDecay1Meson",&pdgIdDecay1Meson,"pdgIdDecay1Meson[nMesonSize]/I"); 
	m_tree->Branch("ptDecay1Meson",&ptDecay1Meson,"ptDecay1Meson[nMesonSize]/F"); 
	m_tree->Branch("etaDecay1Meson",&etaDecay1Meson,"etaDecay1Meson[nMesonSize]/F"); 
	m_tree->Branch("phiDecay1Meson",&phiDecay1Meson,"phiDecay1Meson[nMesonSize]/F"); 
	m_tree->Branch("mergeDecay1Meson",&mergeDecay1Meson,"mergeDecay1Meson[nMesonSize]/I");
	m_tree->Branch("convertDecay1Meson",&convertDecay1Meson,"convertDecay1Meson[nMesonSize]/I"); 
	m_tree->Branch("mergeDecay1Angle",&mergeDecay1Angle,"mergeDecay1Angle[nMesonSize]/F");
	m_tree->Branch("mergeDecay1Time",&mergeDecay1Time,"mergeDecay1Time[nMesonSize]/F");
	m_tree->Branch("pdgIdDecay2Meson",&pdgIdDecay2Meson,"pdgIdDecay2Meson[nMesonSize]/I"); 
	m_tree->Branch("ptDecay2Meson",&ptDecay2Meson,"ptDecay2Meson[nMesonSize]/F"); 
	m_tree->Branch("etaDecay2Meson",&etaDecay2Meson,"etaDecay2Meson[nMesonSize]/F"); 
	m_tree->Branch("phiDecay2Meson",&phiDecay2Meson,"phiDecay2Meson[nMesonSize]/F");
	m_tree->Branch("mergeDecay2Meson",&mergeDecay2Meson,"mergeDecay2Meson[nMesonSize]/I");
	m_tree->Branch("convertDecay2Meson",&convertDecay2Meson,"convertDecay2Meson[nMesonSize]/I");
	m_tree->Branch("mergeDecay2Angle",&mergeDecay2Angle,"mergeDecay2Angle[nMesonSize]/F");
	m_tree->Branch("mergeDecay2Time",&mergeDecay2Time,"mergeDecay2Time[nMesonSize]/F");
	m_tree->Branch("pdgIdDecay3Meson",&pdgIdDecay3Meson,"pdgIdDecay3Meson[nMesonSize]/I"); 
	m_tree->Branch("ptDecay3Meson",&ptDecay3Meson,"ptDecay3Meson[nMesonSize]/F"); 
	m_tree->Branch("etaDecay3Meson",&etaDecay3Meson,"etaDecay3Meson[nMesonSize]/F"); 
	m_tree->Branch("phiDecay3Meson",&phiDecay3Meson,"phiDecay3Meson[nMesonSize]/F");
	m_tree->Branch("mergeDecay3Meson",&mergeDecay3Meson,"mergeDecay3Meson[nMesonSize]/I");
	m_tree->Branch("convertDecay3Meson",&convertDecay3Meson,"convertDecay3Meson[nMesonSize]/I");
	m_tree->Branch("mergeDecay3Angle",&mergeDecay3Angle,"mergeDecay3Angle[nMesonSize]/F");
	m_tree->Branch("massRecoMeson",&massRecoMeson,"massRecoMeson[nMesonSize]/F");
	m_tree->Branch("ptRecoMeson",&ptRecoMeson,"ptRecoMeson[nMesonSize]/F");
	m_tree->Branch("etaRecoMeson",&etaRecoMeson,"etaRecoMeson[nMesonSize]/F");
	m_tree->Branch("phiRecoMeson",&phiRecoMeson,"phiRecoMeson[nMesonSize]/F");
				
	cout << "\n The generator meson and reco truth information is being stored in the hTree for this job";
      }
      else {
				
	cout << "\n No generator meson and reco truth information is being stored in the hTree for this job";
      }
			
			
      // photon generator and truth information
      if(photonStore_) { // none of these parts works for data files, and this is a new component in 2013
				
	m_tree->Branch("kPhotonGen",&kPhotonGen,"kPhotonGen[nPhotonSize]/I");
	m_tree->Branch("motherPdgIdPhotonGen",&motherPdgIdPhotonGen,"motherPdgIdPhotonGen[nPhotonSize]/I");
	m_tree->Branch("ptMotherPhotonGen",&ptMotherPhotonGen,"ptMotherPhotonGen[nPhotonSize]/F");
	m_tree->Branch("ptPhotonGen",&ptPhotonGen,"ptPhotonGen[nPhotonSize]/F");
	m_tree->Branch("etaPhotonGen",&etaPhotonGen,"etaPhotonGen[nPhotonSize]/F");
	m_tree->Branch("phiPhotonGen",&phiPhotonGen,"phiPhotonGen[nPhotonSize]/F");
	m_tree->Branch("mergeIndexPhotonGen",&mergeIndexPhotonGen,"mergeIndexPhotonGen[nPhotonSize]/I");
	m_tree->Branch("clusterIndexPhotonGen",&clusterIndexPhotonGen,"clusterIndexPhotonGen[nPhotonSize]/I");
	m_tree->Branch("convertPhotonGen",&convertPhotonGen,"convertPhotonGen[nPhotonSize]/I");
	m_tree->Branch("angleRecoPhotonGen",&angleRecoPhotonGen,"angleRecoPhotonGen[nPhotonSize]/F");
	m_tree->Branch("ptRecoPhotonGen",&ptRecoPhotonGen,"ptRecoPhotonGen[nPhotonSize]/F");
	m_tree->Branch("etaRecoPhotonGen",&etaRecoPhotonGen,"etaRecoPhotonGen[nPhotonSize]/F");
	m_tree->Branch("phiRecoPhotonGen",&phiRecoPhotonGen,"phiRecoPhotonGen[nPhotonSize]/F");
				
	cout << "\n The generator photon and reco truth information is being stored in the hTree for this job";
      }
      else {
				
	cout << "\n No generator photon and reco truth information is being stored in the hTree for this job";
      }
			
      cout << "\n\n Completed set up for the hTree contents (photon component is the last check)" << endl << endl;
			
    }
    else {
      cerr  << "\n\n Unable to create m_tree object in initHistos method" << endl;
    }
		
  } // check on making an output tree

  char histogramName[200];
  char histogramTitle[200];

  char histogramName1[200];
  char histogramTitle1[200];

  char histogramName2[200];
  char histogramTitle2[200];

  for(int kPt=0; kPt<bins1; kPt++) {
    sprintf(histogramName1, "pi0pT%d", kPt);
    sprintf(histogramTitle1, "Mean #pi^{0} p_{T} for %5.2f < p_{T} < %5.2f ", NptBins_[kPt], NptBins_[kPt+1]);
    pi0MeanPt[histogramName1] = pi0Related.make<TH1D>(histogramName1, histogramTitle1, nMassBins, NptBins_[kPt], NptBins_[kPt+1]);
  }
	
  pi0MassHistSameEvent = pi0Related.make<TH1D>("pi0MassHistSameEvent", "Photon-Pair Mass Peak in Same Events", nMassBins, 0.0, maximumPi0MassForHistogram);
  pi0MassHistSameEvent->SetXTitle("#gamma#gamma Invariant mass (GeV/c^{2})");
  pi0MassHistSameEvent->SetYTitle(countsPerBin);
	
  for(int kPt=0; kPt<bins1; kPt++) {
    sprintf(histogramName, "pi0MassSameEventPtBin%d", kPt);
    sprintf(histogramTitle, "Photon-Pair Mass Peak in Same Events for %5.2f < p_{T} < %5.2f ", NptBins_[kPt], NptBins_[kPt+1]);
    pi0MassHistSameEventvsPt[histogramName] = pi0Related.make<TH1D>(histogramName, histogramTitle, nMassBins, 0.0, maximumPi0MassForHistogram); // change bins to nMassBins
		
    sprintf(histogramName2, "pi0MassMixedEventPtBin%d", kPt);
    sprintf(histogramTitle2, "Photon-Pair Mass Peak in Mixed Events for %5.2f < p_{T} < %5.2f ", NptBins_[kPt], NptBins_[kPt+1]);
    pi0MassHistMixedEventvsPt[histogramName2] = pi0Related.make<TH1D>(histogramName2, histogramTitle2, nMassBins, 0.0, maximumPi0MassForHistogram); // change bins to nMassBins
		
  }
	
  pi0MassHistMixed = pi0Related.make<TH1D>("pi0MassHistMixed", "#pi^{0} Peak in pPb Mixed Events", nMassBins, 0.0, maximumPi0MassForHistogram);
  pi0MassHistMixed->SetXTitle("#gamma#gamma Invariant mass (GeV/c^{2})");
  pi0MassHistMixed->SetYTitle(countsPerBin);
	
  pi0EtaTrueHist = pi0Related.make<TH1D>("pi0EtaTrueHist", "True #pi^{0} #eta distribution", nBinsOneD, -1.5, +1.5);
  pi0EtaTrueHist->SetXTitle("#eta");
	
  pi0PhiTrueHist = pi0Related.make<TH1D>("pi0PhiTrueHist", "True #pi^{0} azimuthal distribution", nBinsOneD, -3.3, +3.3);
  pi0PhiTrueHist->SetXTitle("Azimuthal angle #phi (radians)");
	
  pi0PtTrueHist = pi0Related.make<TH1D>("pi0PtTrueHist", "True #pi^{0} p_{T}", ptBins_.size()-1, &ptBins_[0]);
  pi0PtTrueHist->SetXTitle("Transverse momentum p_T (GeV/c)");
	
  TimingBefore = pi0Related.make<TH1D>("TimingBefore", "RecHit timing [ns] for all cells", 240, -60., 60.);
  TimingBefore->SetXTitle("RecHit timing [ns]");

  TimingBeforeEvsT = pi0Related.make<TH2D>("TimingBeforeEvsT", "Energy vs RecHit timing [ns] for all cells", 240, -60., 60., 100, 0., 5.0);
  TimingBeforeEvsT->SetXTitle("RecHit timing [ns]");
  TimingBeforeEvsT->SetYTitle("Energy [GeV]");

  TimingAfter = pi0Related.make<TH1D>("TimingAfter", "RecHit timing [ns] for cells in time cut", 240, -60., 60.);
  TimingAfter->SetXTitle("RecHit timing [ns]");

  //
  // Histogram definitions from Monika's code for EcalFlowNtp
  //
  _pi0Spectrum = pi0Related.make<TH3F>("_pi0Spectrum", ";#eta;p_{T};occ var",
				       etaBins_.size()-1, &etaBins_[0],
				       NptBins_.size()-1, &NptBins_[0],
				       occBins_.size()-1, &occBins_[0]);

  _DeltazVertex = pi0Related.make<TH1D>("_DeltazVertex","", 100, -2.5, 2.5);
  _DeltazVertex->SetXTitle("#Delta z");
  _DeltazVertex->SetYTitle("Number of events");

  
  ////// pi-Had 2D correlation function
  TFileDirectory pi0HadCorrFunc = fs->mkdir( "pi0HadCorrFunc" );

  char histogramName3[200];
  char histogramTitle3[200];

  char histogramName4[200];
  char histogramTitle4[200];

  for(int kPt=0; kPt<bins1; kPt++) {
    sprintf(histogramName3, "hSignalPtBin%d", kPt);
    sprintf(histogramTitle3, "Same-event #pi^{0}-h 2D correlation function for %5.2f < p_{T} < %5.2f ", NptBins_[kPt], NptBins_[kPt+1]);
    hSignal[histogramName3] = pi0HadCorrFunc.make<TH2D>(histogramName3, histogramTitle3, 32+1,-5.0-0.15,5.0+0.15,32-1,-M_PI/2+M_PI/32,3*M_PI/2-M_PI/32);

    sprintf(histogramName4, "hBackgroundPtBin%d", kPt);
    sprintf(histogramTitle4, "Mixed-event #pi^{0}-h 2D Correlation runction for %5.2f < p_{T} < %5.2f ", NptBins_[kPt], NptBins_[kPt+1]);
    hBackground[histogramName4] = pi0HadCorrFunc.make<TH2D>(histogramName4, histogramTitle4, 32+1,-5.0-0.15,5.0+0.15,32-1,-M_PI/2+M_PI/32,3*M_PI/2-M_PI/32);
  }

  hSignal1 = pi0HadCorrFunc.make<TH2D>("hSignal",";#Delta#eta;#Delta#phi",32+1,-5.0-0.15,5.0+0.15,32-1,-M_PI/2+M_PI/32,3*M_PI/2-M_PI/32);
  hBackground1 = pi0HadCorrFunc.make<TH2D>("hBackground",";#Delta#eta;#Delta#phi",32+1,-5.0-0.15,5.0+0.15,32-1,-M_PI/2+M_PI/32,3*M_PI/2-M_PI/32);

  for(int kPt=0; kPt<bins1; kPt++) {
    sprintf(histogramName3, "hGenSignalPtBin%d", kPt);
    sprintf(histogramTitle3, "GEN: Same-event #pi^{0}-h 2D correlation function for %5.2f < p_{T} < %5.2f ", NptBins_[kPt], NptBins_[kPt+1]);
    hGenSignal[histogramName3] = pi0HadCorrFunc.make<TH2D>(histogramName3, histogramTitle3, 32+1,-5.0-0.15,5.0+0.15,32-1,-M_PI/2+M_PI/32,3*M_PI/2-M_PI/32);

    sprintf(histogramName4, "hGenBackgroundPtBin%d", kPt);
    sprintf(histogramTitle4, "GEN: Mixed-event #pi^{0}-h 2D Correlation runction for %5.2f < p_{T} < %5.2f ", NptBins_[kPt], NptBins_[kPt+1]);
    hGenBackground[histogramName4] = pi0HadCorrFunc.make<TH2D>(histogramName4, histogramTitle4, 32+1,-5.0-0.15,5.0+0.15,32-1,-M_PI/2+M_PI/32,3*M_PI/2-M_PI/32);
  }

  hGenSignal1 = pi0HadCorrFunc.make<TH2D>("hGenSignal","GEN;#Delta#eta;#Delta#phi",32+1,-5.0-0.15,5.0+0.15,32-1,-M_PI/2+M_PI/32,3*M_PI/2-M_PI/32);
  hGenBackground1 = pi0HadCorrFunc.make<TH2D>("hGenBackground","GEN;#Delta#eta;#Delta#phi",32+1,-5.0-0.15,5.0+0.15,32-1,-M_PI/2+M_PI/32,3*M_PI/2-M_PI/32);

} // end of Histograms definitions

// Track quality cuts
bool EcalFlowNtp::TrackQualityCuts(const reco::Track & track, const reco::Vertex & vertexCollectionSelected)
{
	
  math::XYZPoint vtxPoint(0.0,0.0,0.0);
  double vzErr =0.0, vxErr=0.0, vyErr=0.0;
  vtxPoint=vertexCollectionSelected.position();
  vzErr=vertexCollectionSelected.zError();
  vxErr=vertexCollectionSelected.xError();
  vyErr=vertexCollectionSelected.yError();
	
  double dxy=0.0, dz=0.0, dxysigma=0.0, dzsigma=0.0;
  dxy = track.dxy(vtxPoint);
  dz = track.dz(vtxPoint);
  dxysigma = sqrt(track.d0Error()*track.d0Error()+vxErr*vyErr);
  dzsigma = sqrt(track.dzError()*track.dzError()+vzErr*vzErr);
	
  if(track.quality(reco::TrackBase::qualityByName(srcTracks_)) != 1)
    return false;
  if(fabs(dxy/dxysigma) > cutDxyErrMax_) return false;
  if(fabs(dz/dzsigma) > cutDzErrMax_) return false;
  if(track.ptError() / track.pt() > cutPtErrMax_) return false;
	
  return true;
	
} // end of track quality cuts

bool EcalFlowNtp::vtxSort( const reco::Vertex &  a, const reco::Vertex & b )
{
  if( a.tracksSize() != b.tracksSize() )
    return  a.tracksSize() > b.tracksSize() ? true : false ;
  else
    return  a.chi2() < b.chi2() ? true : false ;  
} // Vertex sorting


void EcalFlowNtp::convxtalid(Int_t &nphi,Int_t &neta)
{
  // Barrel only
  // Output nphi 0...359; neta 0...84; nside=+1 (for eta>0), or 0 (for eta<0).
  // neta will be [-85,-1] , or [0,84], the minus sign indicates the z<0 side.
  
  if(neta > 0) neta -= 1;
  if(nphi > 359) nphi=nphi-360;
  
} //end of convxtalid

int EcalFlowNtp::diff_neta_s(Int_t neta1, Int_t neta2){
  Int_t mdiff;
  mdiff=(neta1-neta2);
  return mdiff;
}

// Calculate the distance in xtals taking into account the periodicity of the Barrel
int EcalFlowNtp::diff_nphi_s(Int_t nphi1,Int_t nphi2) {
  Int_t mdiff;
  if(abs(nphi1-nphi2) < (360-abs(nphi1-nphi2))) {
    mdiff=nphi1-nphi2;
  }
  else {
    mdiff=360-abs(nphi1-nphi2);
    if(nphi1>nphi2) mdiff=-mdiff;
  }
  return mdiff;
}


// Method for iterative printing of decay chains
bool EcalFlowNtp::printChildren(const SimTrack* p, 
				map<const SimTrack*, set<const SimTrack*> > const& ptokids,
				map<const SimTrack*, const SimVertex*> const& ptovtx,
				int level, bool save, int motherGenIndex) {
	
  // Print parent
  bool hasvtx = (ptovtx.find(p) != ptovtx.end());
  
  bool hasKids = (ptokids.find(p) != ptokids.end());
	
  // Save only Sim tracks not already in genParticle list
  bool saved = false;
  if (save && level > 0 && nSim < nMaxSim) {
    pdgIdSim[nSim] = p->type();
    // statusSim[nSim] = (hasKids ? 2 : 1);
    ptSim[nSim] = p->momentum().pt();
    eSim[nSim] = p->momentum().energy();
    etaSim[nSim] = p->momentum().eta();
    phiSim[nSim] = p->momentum().phi();
    motherGenIndexSim[nSim] = motherGenIndex;
    if (hasvtx) {
      rSim[nSim] = ptovtx.find(p)->second->position().Rho();
      zSim[nSim] = ptovtx.find(p)->second->position().z();
    }
    else {
      rSim[nSim] = zSim[nSim] = 0.;
      //assert(hasvtx);
    }
    
    ++nSim;
    saved = true;
  }
	
  // Print children, if any
  if (hasKids) {
		
    set<const SimTrack*> const& kids = ptokids.find(p)->second;
    for (set<const SimTrack*>::const_iterator iKid = kids.begin();
	 iKid != kids.end(); ++iKid)
      saved |= printChildren(*iKid, ptokids, ptovtx, level+1, save, motherGenIndex);
  } // if kids
	
  return saved;
} // printChildren

float EcalFlowNtp::crystalCorrectionFunction(int indexCrystal, float ecalEnergy) {
  //
  // Energy correction factors according to number of crystals in the cluster
  // Clusters with crystal number 1 or 2 have a linear recalibration, i.e. first two numbers in crystalEnergyCorrection array are ignored
  // Clusters with crystal number from 3 to 9 have a constant recalibration factor given by the crystalEnergyCorredtion array value
  //
  //  The recalibration numbers below are based on proccessing 200K MC events on August 1, 2013
  //
  const float crystalEnergyCorrection[9] = {0.283, 0.154, 0.0728, 0.0549, 0.0677, 0.0626, 0.0533, 0.0413, 0.0214};
	
  const float singleCrystalIntercept = 0.3415;
  const float singleCrystalSlope = -0.0927;
	
  const float doubleCrystalIntercept = 0.15573;
  const float doubleCrystalSlope = 0.015088;
	
  const float secondOrderEnergyCorrection = 1.007;
	
  if(indexCrystal == 0)
    return secondOrderEnergyCorrection*(1.0 + singleCrystalIntercept + singleCrystalSlope*ecalEnergy);
	
  if(indexCrystal == 1)
    return secondOrderEnergyCorrection*(1.0 + doubleCrystalIntercept + doubleCrystalSlope*ecalEnergy);
	
  if(indexCrystal > 1 && indexCrystal < 9)
    return  secondOrderEnergyCorrection*(1.0 + crystalEnergyCorrection[indexCrystal]);
	
  return 0.0; // default error value 
}

// Go down in chain and remove unwanted decays
bool EcalFlowNtp::pruneKids(const SimTrack* p,
			    map<const SimTrack*, set<const SimTrack*> > & decays,
			    map<const SimTrack*, const SimTrack*> & parent,
			    map<const SimTrack*, const SimVertex*> & vertex,
			    int level) {
	
  // No children, go one level back
  if (decays.find(p)==decays.end()) return false;
  
  // Prune kids and see if there are any grandchildren left after pruning
  set<const SimTrack*> const& kids = decays.find(p)->second;
  bool hasGrandKids = false;
  bool hasSameType = false;
  unsigned int nPhotons = 0;
  unsigned int nElectrons = 0;
  for (set<const SimTrack*>::const_iterator iKid = kids.begin();
       iKid != kids.end(); ++iKid) {
		
    bool hasKids = pruneKids(*iKid, decays, parent, vertex, level+1);
    hasGrandKids = hasGrandKids || hasKids;
    hasSameType = hasSameType || (*iKid)->type()==p->type(); 
    if ((*iKid)->type()==22) ++nPhotons;
    if (abs((*iKid)->type())==11) ++nElectrons;
  }
  // if there are grandkids, don't prune kids as we need the whole chain
  if (hasGrandKids) return true;
	
  // See if we have some reason to prune the kids
  double pt  = p->momentum().pt();
  bool prune = (hasSameType && nPhotons==kids.size()-1) // bremsstrahlung
    || (nElectrons==kids.size() && level!=0) // non-primary photon conversion
    || (abs(p->type())==11 && nPhotons==kids.size()) // weird brem (no e)
    || (abs(p->type())==11 && nPhotons==kids.size()-nElectrons) // ionization
    || (p->type()==111 && pt<0.9 && nPhotons==kids.size()) // low pT pi0      <---important_selection
    || (p->type()==22 && pt<0.9 && nElectrons==kids.size()); // low pT conv
  // || (kids.size()==1); // not a real decay?
  // (NB: electron brems can produce more than one photon)
  // (NG: electrons can turn into a photon with much less pT?)
  // (NB: photon conversions can produce only one electron)
  // (NB: pizeros can produce only one photon with most of pT)
  // (NB: pi+ decays seem to only produce a muon, no neutrinos) 
	
  // Prune, i.e. remove the parent decay and all the kids from maps
  if (prune) {
		
    for (set<const SimTrack*>::const_iterator iKid = kids.begin();
	 iKid != kids.end(); ++iKid) {
      parent.erase(*iKid);
      vertex.erase(*iKid);
    } // for kids
    decays.erase(p);
		
    return false;
  } // if prune
  else // no pruning done
    return true; 
	
} // pruneKids

//define this as a plug-in
DEFINE_FWK_MODULE(EcalFlowNtp);
