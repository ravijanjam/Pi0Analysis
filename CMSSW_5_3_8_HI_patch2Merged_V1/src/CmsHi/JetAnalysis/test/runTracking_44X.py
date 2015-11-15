import FWCore.ParameterSet.VarParsing as VarParsing

ivars = VarParsing.VarParsing('python')

ivars.register ('randomNumber',
                1,
                ivars.multiplicity.singleton,
                ivars.varType.int,
                "Random Seed")

ivars.randomNumber = 1
#ivars.inputFiles = "file:/net/hisrv0001/home/icali/hadoop/Pythia/Z2/ppDijet50/reco_v0/set2_random70000_HydjetDrum_362.root"
ivars.inputFiles = "file:/mnt/hadoop/cms/store/user/yetkin/MC_Production/Pythia80_HydjetDrum_mix01/RECO/set1_random30000_HydjetDrum_12.root"

ivars.outputFile = './reco_test16.root'

ivars.parseArguments()


import FWCore.ParameterSet.Config as cms

process = cms.Process('TRACKING')

process.options = cms.untracked.PSet(
   # wantSummary = cms.untracked.bool(True)
)

#####################################################################################
# Input source
#####################################################################################

process.source = cms.Source("PoolSource",
 duplicateCheckMode = cms.untracked.string("noDuplicateCheck"),
    fileNames = cms.untracked.vstring(ivars.inputFiles))

# Number of events we want to process, -1 = all events
process.maxEvents = cms.untracked.PSet(
            input = cms.untracked.int32(-1))


#####################################################################################
# Load some general stuff
#####################################################################################

process.load('Configuration.StandardSequences.FrontierConditions_GlobalTag_cff')
process.load('Configuration.StandardSequences.Services_cff')
process.load('Configuration.StandardSequences.GeometryExtended_cff')
process.load('Configuration.StandardSequences.MagneticField_38T_cff')
process.load('SimGeneral.MixingModule.mixNoPU_cfi')
process.load('Configuration.StandardSequences.Digi_cff')
process.load('Configuration.StandardSequences.SimL1Emulator_cff')
process.load('Configuration.StandardSequences.DigiToRaw_cff')
process.load('Configuration.StandardSequences.RawToDigi_cff')
process.load('Configuration.StandardSequences.ReconstructionHeavyIons_cff')
process.load('FWCore.MessageService.MessageLogger_cfi')
process.load('RecoLocalTracker.SiPixelRecHits.PixelCPEESProducers_cff')
#process.load('MitHig.PixelTrackletAnalyzer.pixelHitAnalyzer_cfi')

# Data Global Tag 44x 
#process.GlobalTag.globaltag = 'GR_P_V27::All'

# MC Global Tag 44x 
process.GlobalTag.globaltag = 'STARTHI44_V7::All'

# Pixel Tracks
process.load('Appeltel.PixelTracksRun2010.HiLowPtPixelTracksFromReco_cff')
process.load('Appeltel.PixelTracksRun2010.HiMultipleMergedTracks_cff')

# load the iterative tacks
process.load("RecoHI.HiTracking.hiIterTracking_cff")

process.heavyIonTracking *= process.conformalPixelTrackReco
process.heavyIonTracking *= process.hiIterTracking


#####################################################################################
# Define tree output
#####################################################################################

#process.TFileService = cms.Service("TFileService",
#                                  fileName=cms.string(ivars.outputFile))

#####################################################################################
# Additional Reconstruction and Analysis
#####################################################################################

###########################################
# Here it is after including b-tagging -Matt

process.rechits = cms.Sequence(process.siPixelRecHits * process.siStripMatchedRecHits)
process.hiTrackReco = cms.Sequence(process.rechits *
                                   process.heavyIonTracking)

# seed the muons with iterative tracks
process.globalMuons.TrackerCollectionLabel = "hiGeneralTracks"
process.muons.TrackExtractorPSet.inputTrackCollection = "hiGeneralTracks"
process.muons.inputCollectionLabels = ["hiGeneralTracks", "globalMuons", "standAloneMuons:UpdatedAtVtx", "tevMuons:firstHit", "tevMuons:picky", "tevMuons:dyt"]



#####################################################################################
# PF
#####################################################################################

process.load('CmsHi.JetAnalysis.ExtraPfReco_cff')
process.particleFlowTmp.postMuonCleaning = False
process.particleFlowClusterPS.thresh_Pt_Seed_Endcap = cms.double(99999.)
process.pfTrack.UseQuality = True

process.pfTrack.TkColList = cms.VInputTag("hiGeneralTracks")
process.pfTrack.TrackQuality = cms.string('loose')

process.pfTrack.GsfTracksInEvents = cms.bool(False)
process.HiParticleFlowReco.remove(process.electronsWithPresel)
process.HiParticleFlowReco.remove(process.electronsCiCLoose)
process.particleFlowTmp.usePFElectrons = cms.bool(False)
process.particleFlowTmp.useEGammaElectrons = cms.bool(False)
process.particleFlowBlock.RecMuons = 'muons'

#####################################################################################
# Calo matching
#####################################################################################

process.load("RecoHI.HiTracking.HICaloCompatibleTracks_cff")
process.hiGeneralCaloMatchedTracks = process.hiCaloCompatibleTracks.clone(srcTracks = 'hiGeneralTracks')

#####################################################################################
# Path and Edm Output
#####################################################################################

process.reco_tracks =  cms.Path(
    process.hiTrackReco
    *process.HiParticleFlowLocalReco
    *process.HiParticleFlowReco
    *process.hiGeneralCaloMatchedTracks
    *process.muonRecoPbPb
    )


process.out = cms.OutputModule("PoolOutputModule",
                               fileName = cms.untracked.string(ivars.outputFile)
                               )

process.save = cms.EndPath(process.out)

process.out.outputCommands = cms.untracked.vstring("keep *",

                                                   "drop *_g4SimHits_*_*",                                                   
#                                                   "drop StripDigiSimLinkedmDetSetVector_simSiStripDigis__HISIGNAL",
#                                                   "drop PixelDigiSimLinkedmDetSetVector_simSiPixelDigis__HISIGNAL",

#                                                   "drop SiPixelClusteredmNewDetSetVector_siPixelClusters__RECO",
#                                                   "drop SiStripClusteredmNewDetSetVector_siStripClusters__RECO",
                                                   
                                                   "drop recoPFRecHits_particleFlowRecHitECAL__TRACKING",
                                                   "drop SiStripRecHit2DedmNewDetSetVector_siStripMatchedRecHits_rphiRecHit_TRACKING",
                                                   "drop recoPFRecHits_particleFlowRecHitPS__TRACKING",
                                                   "drop SiStripMatchedRecHit2DedmNewDetSetVector_siStripMatchedRecHits_matchedRecHit_TRACKING",
                                                   "drop SiStripRecHit2DedmNewDetSetVector_siStripMatchedRecHits_rphiRecHitUnmatched_TRACKING",
                                                   "drop recoPFClusters_particleFlowClusterHFEM__TRACKING",
                                                   "drop CaloTowersSorted_towerMakerPF__TRACKING",
                                                   "drop recoPFClusters_particleFlowClusterECAL__TRACKING",
                                                   "drop recoPFRecTracks_pfTrack__TRACKING",
                                                   "drop recoPFClusters_particleFlowClusterHCAL__TRACKING",
                                                   "drop TrackCandidates_hiPrimTrackCandidates__TRACKING",
                                                   "drop SiStripRecHit2DedmNewDetSetVector_siStripMatchedRecHits_stereoRecHit_TRACKING",
#                                                   "drop recoTrackExtras_hiGeneralTracks__TRACKING",
                                                   "drop recoTrackExtras_hiSelectedTracks__RECO",
                                                   "drop recoPFCandidates_particleFlowTmp__RECO",
#                                                   "drop recoTrackExtras_hiGlobalPrimTracks__TRACKING",
#                                                   "drop recoTrackExtras_hiSelectedTracks__TRACKING",
                                                   "drop recoPFCandidates_particleFlowTmp__TRACKING",
                                                   "drop TrajectorySeeds_hiPixelPairSeeds__TRACKING",
                                                   "drop TrajectorySeeds_hiPixelTrackSeeds__TRACKING",
#                                                   "drop TrackingRecHitsOwned_hiGeneralTracks__TRACKING",
                                                   "drop recoPFRecHits_particleFlowRecHitHCAL_HFHAD_TRACKING",
                                                   "drop recoPFRecHits_particleFlowRecHitHCAL_HFEM_TRACKING",
                                                   "drop recoCandidatesOwned_caloTowers__RECO",
#                                                   "drop TrackingRecHitsOwned_hiGlobalPrimTracks__TRACKING",
#                                                   "drop TrackingRecHitsOwned_hiSelectedTracks__TRACKING",
                                                   "drop TrackingRecHitsOwned_hiSelectedTracks__RECO",
                                                   "drop recoTracks_hiSelectedTracks__RECO",
#                                                   "drop recoTracks_hiGeneralTracks__TRACKING",
#                                                   "drop recoTracks_hiSelectedTracks__TRACKING",
#                                                   "drop recoTracks_hiGlobalPrimTracks__TRACKING",
                                                   "drop recoPFBlocks_particleFlowBlock__TRACKING",
                                                   "drop recoTracks_hiPixel3PrimTracks__TRACKING",
                                                   "drop recoTracks_hiFirstStepFilter__TRACKING",
                                                   "drop recoGsfPFRecTracks_pfTrackElec__TRACKING",
                                                   "drop TrackCandidates_hiPixelPairTrackCandidates__TRACKING",
                                                   "drop recoTracks_hiPixel3ProtoTracks__TRACKING",
                                                   "drop SiStripRecHit2DedmNewDetSetVector_siStripMatchedRecHits_stereoRecHitUnmatched_TRACKING",
                                                   "drop recoTrackExtras_hiPixelPairGlobalPrimTracks__TRACKING",
                                                   "drop recoGsfPFRecTracks_pfTrackElec_Secondary_TRACKING",
                                                   "drop TrackingRecHitsOwned_hiPixelPairGlobalPrimTracks__TRACKING",
                                                   "drop TrackCandidates_hiSecondPixelTripletTrackCandidates__TRACKING",
                                                   "drop recoTracks_hiPixelPairGlobalPrimTracks__TRACKING",
                                                   "drop *_hiSecondPixelTripletClusters__TRACKING",
                                                   "drop *_hiPixelPairClusters__TRACKING",
                                                   "drop TrackingRecHitsOwned_hiPixel3PrimTracks__TRACKING",
                                                   "drop recoTracks_hiSelectedProtoTracks__TRACKING",
                                                   "drop TrajectorySeeds_hiSecondPixelTripletSeeds__TRACKING",
                                                   "drop recoTrackExtras_hiSecondPixelTripletGlobalPrimTracks__TRACKING",
                                                   "drop recoTracks_hiSecondPixelTripletGlobalPrimTracks__TRACKING",
                                                   "drop recoPFCandidates_particleFlowTmp_CleanedPunchThroughMuons_TRACKING",
                                                   "drop recoPFCandidates_particleFlowTmp_AddedMuonsAndHadrons_TRACKING",
                                                   "drop TrackingRecHitsOwned_hiSecondPixelTripletGlobalPrimTracks__TRACKING",
                                                   "drop recoPFCandidates_particleFlowTmp_CleanedCosmicsMuons_TRACKING",
                                                   "drop recoPFCandidates_particleFlowTmp_CleanedFakeMuons_TRACKING",
                                                   "drop recoTrackExtras_hiPixel3ProtoTracks__TRACKING",
                                                   "drop recoPFCandidates_particleFlowTmp_CleanedHF_TRACKING",
                                                   "drop recoTracks_hiSecondQual__TRACKING"                                                   
                                                   )


