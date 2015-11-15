import FWCore.ParameterSet.Config as cms

process = cms.Process('JetAna')

process.options = cms.untracked.PSet(
    wantSummary = cms.untracked.bool(True)
)

# Input source
process.source = cms.Source("PoolSource",
                            fileNames = cms.untracked.vstring(
    'file:/d101/frankma/data/HIAllPhysics/ZS-v2/A2AD1439-F242-E011-A425-003048F00412.root'
    ))

process.maxEvents = cms.untracked.PSet(
            input = cms.untracked.int32(10))

#load some general stuff
process.load('Configuration.StandardSequences.FrontierConditions_GlobalTag_cff')
process.load('Configuration.StandardSequences.Services_cff')
process.load('Configuration.StandardSequences.GeometryExtended_cff')
process.load('Configuration.StandardSequences.MagneticField_38T_cff')
process.load('FWCore.MessageService.MessageLogger_cfi')
#process.MessageLogger.cerr.FwkReport.reportEvery = 100
process.GlobalTag.globaltag = 'GR_R_39X_V6B::All'

# load centrality
from CmsHi.Analysis2010.CommonFunctions_cff import *
overrideCentrality(process)
process.HeavyIonGlobalParameters = cms.PSet(
	centralityVariable = cms.string("HFhits"),
	nonDefaultGlauberModel = cms.string(""),
	centralitySrc = cms.InputTag("hiCentrality")
	)

# tree output
process.TFileService = cms.Service("TFileService",
                                  fileName=cms.string("JetAnaTrees.root"))

# PF Reco
#  --- Track and muon reconstruction ---
# pixel triplet tracking (HI Tracking)
process.load("RecoLocalTracker.Configuration.RecoLocalTracker_cff")
process.load("RecoHI.Configuration.Reconstruction_HI_cff")
process.load("RecoLocalCalo.Configuration.hcalLocalReco_cff") # Needed to produce "HcalSeverityLevelComputerRcd" used by CaloTowersCreator/towerMakerPF
process.rechits = cms.Sequence(process.siPixelRecHits * process.siStripMatchedRecHits)
process.hiTrackReco = cms.Sequence(process.rechits * process.heavyIonTracking)

process.load("RecoHI.Configuration.Reconstruction_hiPF_cff")
process.load("RecoHI.HiJetAlgos.ParticleTowerProducer_cff")
process.trackerDrivenElectronSeeds.TkColList = cms.VInputTag("hiGoodTightTracks")
process.PFTowers = process.particleTowerProducer.clone() # PF using a grid of pseudo-towers to emulate Russian-style subtraction
process.HiParticleFlowRecoNoJets = cms.Sequence(
    process.particleFlowCluster *
		process.trackerDrivenElectronSeeds *
    process.particleFlowReco *
		process.PFTowers 
    )

#good track selection
process.load("edwenger.HiTrkEffAnalyzer.TrackSelections_cff")
process.hiextraTrackReco = cms.Sequence( process.hiPostGlobalPrimTracks * process.hiGoodTightTracksSelection )

# Define Jet Algo parameters
process.load('RecoHI.HiJetAlgos.HiRecoJets_cff')
process.load('RecoHI.HiJetAlgos.HiRecoPFJets_cff')

process.iterativeConePu5CaloJets.doPVCorrection = cms.bool(True)
process.iterativeConePu5CaloJets.srcPVs = 'hiSelectedVertex'
process.iterativeConePu5CaloJets.puPtMin = cms.double(10.0)

process.ak3PFJets = process.ak5PFJets.clone()
process.ak3PFJets.rParam	= cms.double(0.3)
process.ak3PFJets.puPtMin = cms.double(15.0)
process.akPu3PFJets = process.ak3PFJets.clone()
process.akPu3PFJets.src = 'PFTowers'
process.akPu3PFJets.jetType = 'BasicJet'
process.akPu3PFJets.doPUOffsetCorr = cms.bool(True)
process.akPu3PFJets.sumRecHits = cms.bool(False)

# Define Jet energy correction
process.jec = cms.ESSource("PoolDBESSource",
	DBParameters = cms.PSet(messageLevel = cms.untracked.int32(0)),
	timetype = cms.string('runnumber'),
	toGet = cms.VPSet(
		cms.PSet(record = cms.string("JetCorrectionsRecord"),
		tag = cms.string("JetCorrectorParametersCollection_HI_hiGoodTightTracks_D6T_399_IC5Calo"),
		label = cms.untracked.string("IC5Calo")),
		cms.PSet(record = cms.string("JetCorrectionsRecord"),
		tag = cms.string("JetCorrectorParametersCollection_HI_PFTowers_hiGoodTightTracks_D6T_399_AK3PF"),
		label = cms.untracked.string("AK3PF")),
		cms.PSet(record = cms.string("JetCorrectionsRecord"),
		tag = cms.string("JetCorrectorParametersCollection_HI_PFTowers_hiGoodTightTracks_D6T_399_AK4PF"),
		label = cms.untracked.string("AK4PF")),
		cms.PSet(record = cms.string("JetCorrectionsRecord"),
		tag = cms.string("JetCorrectorParametersCollection_HI_PFTowers_hiGoodTightTracks_D6T_399_AK5PF"),
		label = cms.untracked.string("AK5PF")
		),
	),
	connect = cms.string("sqlite_file:JEC_HI_PFTowers_hiGoodTightTracks_D6T_399.db"),
)
process.es_prefer_jec = cms.ESPrefer('PoolDBESSource','jec')

# Define Pat
process.load('PhysicsTools.PatAlgos.patHeavyIonSequences_cff')
process.patJets.jetSource  = cms.InputTag("iterativeConePu5CaloJets")
process.patJets.addBTagInfo         = False
process.patJets.addTagInfos         = False
process.patJets.addDiscriminators   = False
process.patJets.addAssociatedTracks = False
process.patJets.addJetCharge        = False
process.patJets.addJetID            = False
process.patJets.getJetMCFlavour     = False
process.patJets.addGenPartonMatch   = False
process.patJets.addGenJetMatch      = False
process.patJets.embedGenJetMatch    = False
process.patJets.embedGenPartonMatch   = False

process.icPu5corr = process.patJetCorrFactors.clone(
	src = cms.InputTag("iterativeConePu5CaloJets"),
	levels = cms.vstring('L2Relative','L3Absolute'),
	payload = cms.string('IC5Calo')
	)
process.icPu5patJets = process.patJets.clone(
	jetSource  = cms.InputTag("iterativeConePu5CaloJets"),
	jetCorrFactorsSource = cms.VInputTag(cms.InputTag("icPu5corr")))

process.icPu5patSequence = cms.Sequence(process.iterativeConePu5CaloJets*process.icPu5corr*process.icPu5patJets)

process.akPu3PFcorr = process.patJetCorrFactors.clone(
	src = cms.InputTag("akPu3PFJets"),
	levels = cms.vstring('L2Relative','L3Absolute'),
	payload = cms.string('AK3PF')
)
process.akPu3PFpatJets = process.patJets.clone(
	jetSource  = cms.InputTag("akPu3PFJets"),
	jetCorrFactorsSource = cms.VInputTag(cms.InputTag("akPu3PFcorr")))
process.akPu3PFpatSequence = cms.Sequence(process.akPu3PFJets*process.akPu3PFcorr*process.akPu3PFpatJets)

# Define the analyzer modules
process.load("HLTrigger.HLTanalyzers.HI_HLTAnalyser_cff")
process.hltanalysis.RunParameters.Debug = False
process.hltanalysis.RunParameters.UseTFileService = True
process.hltanalysis.RunParameters.Monte = (False)
process.hltanalysis.RunParameters.DoMC = (False)
process.hltanalysis.RunParameters.DoJets = True
process.hltanalysis.RunParameters.DoPhotons = True
process.hltanalysis.RunParameters.DoSuperClusters = True
process.hltanalysis.recjets  = "iterativeConePu5CaloJets"
process.hltanalysis.BarrelPhoton = "correctedIslandBarrelSuperClusters"
process.hltanalysis.EndcapPhoton = "correctedIslandEndcapSuperClusters"
process.hltanalysis.l1GtReadoutRecord = cms.InputTag("gtDigis")

process.load("MNguyen.InclusiveJetAnalyzer.inclusiveJetAnalyzer_cff")
process.inclusiveJetAnalyzer.isMC = cms.untracked.bool(False)
process.icPu5JetAnalyzer = process.inclusiveJetAnalyzer.clone()

# =============== Final Paths =====================
process.reco_extra = cms.Path( process.hiTrackReco * process.hiextraTrackReco * process.HiParticleFlowRecoNoJets
	* process.icPu5patSequence * process.akPu3PFpatSequence )
process.ana_step = cms.Path( process.centralityBin * process.hltanalysis * process.icPu5JetAnalyzer)
process.schedule = cms.Schedule(process.reco_extra,process.ana_step)