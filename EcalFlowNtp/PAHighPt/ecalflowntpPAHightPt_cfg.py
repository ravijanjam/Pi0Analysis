
import FWCore.ParameterSet.Config as cms

process = cms.Process("ecalReconstructedPi0")

process.load('Configuration.StandardSequences.Services_cff')
process.load('Configuration.StandardSequences.MagneticField_38T_cff')
process.load('Configuration.StandardSequences.FrontierConditions_GlobalTag_cff')
process.load('HeavyIonsAnalysis.Configuration.collisionEventSelection_cff')
process.load('Configuration.StandardSequences.GeometryDB_cff')
process.load('Geometry.CaloEventSetup.CaloTopology_cfi')
process.load('Configuration.StandardSequences.ReconstructionHeavyIons_cff')
process.load('CondCore.DBCommon.CondDBCommon_cfi');
process.load('FWCore.MessageService.MessageLogger_cfi')
process.load('Pi0Analysis.ecalReconstructedPi0.ecalflowntp_cfi')
process.load('Configuration.StandardSequences.GeometryRecoDB_cff')

process.maxEvents = cms.untracked.PSet(input = cms.untracked.int32(-1))

process.TFileService = cms.Service("TFileService",
                                   fileName = cms.string("pPb_PAHighPt_SideBand22_28_NoTimingCuts_YesEnergyCorr.root")
                                   )

process.MessageLogger.cerr.FwkReport.reportEvery = 1000
process.GlobalTag.globaltag = 'GR_P_V42_AN3::All'

from HeavyIonsAnalysis.Configuration.CommonFunctions_cff import *
overrideCentrality(process)

process.HeavyIonGlobalParameters = cms.PSet(
        centralityVariable = cms.string("HFtowersPlusTrunc"),
        nonDefaultGlauberModel = cms.string(""),
        centralitySrc = cms.InputTag("pACentrality"),
        pPbRunFlip = cms.untracked.uint32(99999999)
        )

process.load('RecoHI.HiCentralityAlgos.HiCentrality_cfi')
process.load('HeavyIonsAnalysis.Configuration.collisionEventSelection_cff')
#process.load('msharma.RpPbAnalysis.PAPileUpVertexFilter_cff')
process.load('RecoHI.HiCentralityAlgos.HiCentrality_cfi')
process.load("HLTrigger.HLTfilters.hltHighLevel_cfi")
process.hltSingleTrigger = process.hltHighLevel.clone()
process.hltSingleTrigger.HLTPaths = ["HLT_PAZeroBiasPixel_SingleTrack_v1"]

process.hltMult100 = process.hltHighLevel.clone()
process.hltMult100.HLTPaths = ["HLT_PAPixelTracks_Multiplicity100_v1",
                               "HLT_PAPixelTracks_Multiplicity100_v2"]

process.hltMult130 = process.hltHighLevel.clone()
process.hltMult130.HLTPaths = ["HLT_PAPixelTracks_Multiplicity130_v1",
                               "HLT_PAPixelTracks_Multiplicity130_v2"]

process.hltMult160 = process.hltHighLevel.clone()
process.hltMult160.HLTPaths = ["HLT_PAPixelTracks_Multiplicity160_v1",
                               "HLT_PAPixelTracks_Multiplicity160_v2"]

process.hltMult190 = process.hltHighLevel.clone()
process.hltMult190.HLTPaths = ["HLT_PAPixelTracks_Multiplicity190_v1",
                               "HLT_PAPixelTracks_Multiplicity190_v2"]

process.hltMult100.andOr = cms.bool(True)
process.hltMult100.throw = cms.bool(False)

process.hltMult130.andOr = cms.bool(True)
process.hltMult130.throw = cms.bool(False)

process.hltMult160.andOr = cms.bool(True)
process.hltMult160.throw = cms.bool(False)

process.hltMult190.andOr = cms.bool(True)
process.hltMult190.throw = cms.bool(False)

process.ecalReconstructedPi0.AlCaStreamEBpi0Tag = cms.untracked.InputTag("ecalRecHit","EcalRecHitsEB")
process.ecalReconstructedPi0.pfCandidatesTag = cms.InputTag("particleFlow")
process.ecalReconstructedPi0.srcTowers = cms.InputTag("towerMaker")
process.ecalReconstructedPi0.verbose = cms.untracked.bool(True)
process.ecalReconstructedPi0.qualityString_ = cms.untracked.string("highPurity")
process.ecalReconstructedPi0.cutDzErrMax_ = cms.untracked.double(3.0)
process.ecalReconstructedPi0.cutDxyErrMax_ = cms.untracked.double(3.0)
process.ecalReconstructedPi0.cutPtErrMax_ = cms.untracked.double(0.1)
process.ecalReconstructedPi0.vertexZMax = cms.double(15.0)
process.ecalReconstructedPi0.cutMultMin = cms.double(0.0)
process.ecalReconstructedPi0.cutMultMax = cms.double(1000.0)
process.ecalReconstructedPi0.cutMinTrack = cms.double(0.4)
process.ecalReconstructedPi0.lowpi0PtCut = cms.double(0.7)
process.ecalReconstructedPi0.highpi0PtCut = cms.double(12.0)
process.ecalReconstructedPi0.ptBins = cms.vdouble(1.6, 1.8, 2.0, 2.2, 2.4, 2.6, 3.0, 3.5, 4.0, 4.5, 5.0,
                                         5.5, 6.0, 7.0, 8.0, 10.0, 12.0
                                        )
#process.ecalReconstructedPi0.NptBins = cms.vdouble(0.7, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 5.0, 6.0, 8.0)
process.ecalReconstructedPi0.NptBins = cms.vdouble(0.7, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 5.0, 6.0, 8.0)
process.ecalReconstructedPi0.doEnergyRecalibration = cms.bool(True);
process.ecalReconstructedPi0.useClusterCrystalLimit = cms.bool(False);
process.ecalReconstructedPi0.lowCrystalLimit = cms.int32(1);
process.ecalReconstructedPi0.highCrystalLimit = cms.int32(9);
process.ecalReconstructedPi0.occBins = cms.vdouble(
            0., 20., 40., 60., 80., 100., 120., 140., 160.,
                        180., 200., 250., 300., 500.
                        )
process.ecalReconstructedPi0.etaBins = cms.vdouble(
            -1.46, -1.36, -1.26, -1.16, -1.06, -0.96, -0.86, -0.76, -0.66, -0.56,
                    -0.46, -0.36, -0.26, -0.16, -0.06, 0.04, 0.14, 0.24, 0.34, 0.44, 0.54,
                    0.64, 0.74, 0.94, 0.94, 1.04, 1.14, 1.24, 1.34, 1.44)
process.ecalReconstructedPi0.occByCentrality = cms.bool(True)
process.ecalReconstructedPi0.diHadronCorrelations = cms.bool(False)
process.ecalReconstructedPi0.pi0HadronCorrelations = cms.bool(True)
process.ecalReconstructedPi0.etaHadronCorrelations = cms.bool(False)
process.ecalReconstructedPi0.rotatedBackground = cms.bool(False)
process.ecalReconstructedPi0.cutByLeadingTrackPt = cms.bool(False)
process.ecalReconstructedPi0.leadingTrackPtMin = cms.double(0.0)
process.ecalReconstructedPi0.leadingTrackPtMax = cms.double(999.0)
process.ecalReconstructedPi0.cutByLeadingPhotonPt = cms.bool(False)
process.ecalReconstructedPi0.leadingPhotonPtMin = cms.double(0.0)
process.ecalReconstructedPi0.leadingPhotonPtMax = cms.double(999.0)
process.ecalReconstructedPi0.swissThreshold = cms.double(0.85)
process.ecalReconstructedPi0.timeThreshold = cms.double(10.0)
process.ecalReconstructedPi0.avoidIeta85 = cms.double(False)


process.EcalFlowNtpMult100 = process.ecalReconstructedPi0.clone(
    cutMultMin = cms.double(120),
    cutMultMax = cms.double(150)
    )

process.EcalFlowNtpMult130 = process.ecalReconstructedPi0.clone(
    cutMultMin = cms.double(150),
    cutMultMax = cms.double(185)
    )

process.EcalFlowNtpMult160 = process.ecalReconstructedPi0.clone(
    cutMultMin = cms.double(185),
    cutMultMax = cms.double(220)
    )

process.EcalFlowNtpMult190 = process.ecalReconstructedPi0.clone(
    cutMultMin = cms.double(220),
    cutMultMax = cms.double(260)
    )

process.Mult100 = cms.Path(process.hltMult100 *
                        process.PAcollisionEventSelection *
                        #process.siPixelRecHits *
                        #process.pileupVertexFilterCutGplus *
                        process.pACentrality *
                        process.EcalFlowNtpMult100 
                        )

process.Mult130 = cms.Path(process.hltMult130 *
                        process.PAcollisionEventSelection *
                        #process.siPixelRecHits *
                        #process.pileupVertexFilterCutGplus *
                        process.pACentrality *
                        process.EcalFlowNtpMult130 
                        )

process.Mult160 = cms.Path(process.hltMult160 *
                        process.PAcollisionEventSelection *
                        #process.siPixelRecHits *
                        #process.pileupVertexFilterCutGplus *
                        process.pACentrality *
                        process.EcalFlowNtpMult160 
                        )

process.Mult190 = cms.Path(process.hltMult190 *
                        process.PAcollisionEventSelection *
                        #process.siPixelRecHits *
                        #process.pileupVertexFilterCutGplus *
                        process.pACentrality *
                        process.EcalFlowNtpMult190 
                        )

process.schedule = cms.Schedule(process.Mult100,process.Mult130,process.Mult160,process.Mult190)

process.source = cms.Source("PoolSource",
                            fileNames = cms.untracked.vstring(
                                        '/store/hidata/HIRun2013/PAHighPt/RECO/PromptReco-v1/000/211/631/00000/FEDE0B60-3F75-E211-8FE3-003048D2BC5C.root'
                                                              )
                            )


