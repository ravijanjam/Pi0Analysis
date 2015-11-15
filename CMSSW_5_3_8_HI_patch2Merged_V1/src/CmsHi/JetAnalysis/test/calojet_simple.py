import FWCore.ParameterSet.Config as cms

process = cms.Process('JetAna')

process.options = cms.untracked.PSet(
    wantSummary = cms.untracked.bool(True)
)

# Input source
process.source = cms.Source("PoolSource",
                            fileNames = cms.untracked.vstring(
    '/store/relval/CMSSW_3_9_9/RelValHydjetQ_MinBias_2760GeV/GEN-SIM-RECO/START39_V7HI-v1/0000/40B4255D-5A3D-E011-9D80-001BFCDBD100.root'
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


# Define Jet Algo parameters
process.load('RecoHI.HiJetAlgos.HiRecoJets_cff')
#process.load('RecoHI.HiJetAlgos.HiRecoPFJets_cff')

process.iterativeConePu5CaloJets.doPVCorrection = cms.bool(True)
process.iterativeConePu5CaloJets.srcPVs = 'hiSelectedVertex'
process.iterativeConePu5CaloJets.puPtMin = cms.double(10.0)


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
process.reco_extra = cms.Path( process.icPu5patSequence )
process.ana_step = cms.Path( process.centralityBin * process.hltanalysis * process.icPu5JetAnalyzer)
process.schedule = cms.Schedule(process.reco_extra,process.ana_step)
