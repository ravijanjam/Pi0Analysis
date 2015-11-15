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
            input = cms.untracked.int32(-1))

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

# Define Analysis sequencues
process.load('CmsHi.JetAnalysis.EventSelection_cff')
#process.load('CmsHi.JetAnalysis.ExtraGenReco_cff')
process.load('CmsHi.JetAnalysis.ExtraTrackReco_cff')
process.load('CmsHi.JetAnalysis.ExtraPfReco_cff')
process.load('CmsHi.JetAnalysis.ExtraJetReco_cff')
process.load('CmsHi.JetAnalysis.ExtraEGammaReco_cff')
process.load('CmsHi.JetAnalysis.PatAna_cff')
process.load('CmsHi.JetAnalysis.JetAnalyzers_cff')
process.load('CmsHi.JetAnalysis.EGammaAnalyzers_cff')
process.load("MitHig.PixelTrackletAnalyzer.trackAnalyzer_cff")
process.anaTrack.trackPtMin = 4

# Filtering
process.hltJetHI.HLTPaths = ['HLT_HIJet35U','HLT_HIPhoton20']
print "Add cleaning to analysis"
process.event_filter_seq = cms.Sequence(
  process.hltJetHI *
  process.collisionEventSelection *
  process.hbheReflagNewTimeEnv *
  process.hcalTimingFilter *
  process.HBHENoiseFilter *
  process.hiEcalRecHitSpikeFilter
  )

process.hiPixelAdaptiveVertex.useBeamConstraint = False

process.load("RecoHI.HiMuonAlgos.HiRecoMuon_cff")
process.muons.JetExtractorPSet.JetCollectionLabel = cms.InputTag("iterativeConePu5CaloJets")

process.hiGoodTightTracks.src = cms.InputTag("hiGlobalPrimTracks")
process.hiGoodTightTracksDirect = process.hiGoodTightTracks.clone(keepAllTracks = True)

process.globalMuons.TrackerCollectionLabel = cms.InputTag("hiGoodTightTracksDirect")
process.muons.TrackExtractorPSet.inputTrackCollection = cms.InputTag("hiGoodTightTracksDirect")
process.muons.inputCollectionLabels = cms.VInputTag("hiGoodTightTracksDirect", "globalMuons", "standAloneMuons:UpdatedAtVtx")

process.trackerDrivenElectronSeeds.TkColList = cms.VInputTag("hiGoodTightTracksDirect")
process.trackerDrivenElectronSeeds.UseQuality = cms.bool(True)
process.trackerDrivenElectronSeeds.TrackQuality = cms.string('highPurity')

process.reco_extra        = cms.Path( process.hiTrackReReco * process.hiextraTrackReco * 
                                      process.hiGoodTightTracksDirect *  process.muonRecoPbPb * process.HiParticleFlowRecoNoJets)
process.reco_extra_jet    = cms.Path( process.iterativeConePu5CaloJets * process.akPu3PFJets	* process.photon_extra_reco)
process.pat_step          = cms.Path( process.icPu5patSequence_data * process.akPu3PFpatSequence_data * process.makeHeavyIonPhotons)
process.ana_step          = cms.Path( process.icPu5JetAnalyzer + process.akPu3PFJetAnalyzer + process.multiPhotonAnalyzer + process.anaTrack)

process.phltJetHI = cms.Path( process.hltJetHI )
process.pcollisionEventSelection = cms.Path(process.collisionEventSelection)
process.phbheReflagNewTimeEnv = cms.Path( process.hbheReflagNewTimeEnv )
process.phcalTimingFilter = cms.Path( process.hcalTimingFilter )
process.pHBHENoiseFilter = cms.Path( process.HBHENoiseFilter )
process.phiEcalRecHitSpikeFilter = cms.Path(process.hiEcalRecHitSpikeFilter )

# Customization
from CmsHi.JetAnalysis.customise_cfi import *
enableDataPat(process)
setPhotonObject(process,"cleanPhotons")
enableDataAnalyzers(process)
enableOpenHlt(process,process.ana_step)
process.hltanalysis.DoAlCa = cms.untracked.bool(False)
process.hltanalysis.RunParameters.DoAlCa = cms.untracked.bool(False)
process.hltanalysis.RunParameters.DoJets = cms.untracked.bool(False)
process.hltanalysis.RunParameters.DoVertex = cms.untracked.bool(True)
process.hltanalysis.PrimaryVertices = cms.InputTag("hiSelectedVertex")
process.hltanalysis.OfflinePrimaryVertices0 = cms.InputTag("hiSelectedVertex")

process.skimanalysis = process.hltanalysis.clone(
    HLTProcessName                  = cms.string("JetAna"),
    hltresults                      = cms.InputTag("TriggerResults::JetAna")
    )
process.pAna = cms.EndPath(process.skimanalysis)

########### random number seed
process.RandomNumberGeneratorService = cms.Service("RandomNumberGeneratorService",
  multiPhotonAnalyzer = cms.PSet(
    engineName = cms.untracked.string("TRandom3"),
    initialSeed = cms.untracked.uint32(98236)
    )
  )


