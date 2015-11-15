
import FWCore.ParameterSet.Config as cms

process = cms.Process("EcalFlowNtp")

process.load('Configuration.StandardSequences.Services_cff')
process.load('Configuration.StandardSequences.MagneticField_38T_cff')
process.load('Configuration.StandardSequences.FrontierConditions_GlobalTag_cff')
process.load('HeavyIonsAnalysis.Configuration.collisionEventSelection_cff')
process.load('Configuration.StandardSequences.GeometryDB_cff')
process.load('Geometry.CaloEventSetup.CaloTopology_cfi')
process.load('Configuration.StandardSequences.ReconstructionHeavyIons_cff')
process.load('CondCore.DBCommon.CondDBCommon_cfi');
process.load('FWCore.MessageService.MessageLogger_cfi')
process.load('Pi0Analysis.EcalFlowNtp.ecalflowntp_cfi')
process.load('Configuration.StandardSequences.GeometryRecoDB_cff')

process.maxEvents = cms.untracked.PSet(input = cms.untracked.int32(-1))

process.TFileService = cms.Service("TFileService",
                                   fileName = cms.string("pPb_PAHighPt_PeakRegion90_180_YesEnrCorr_S4S9_074_YeseffCorr_NoClusterLimit.root")
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

process.EcalFlowNtp.AlCaStreamEBpi0Tag = cms.untracked.InputTag("ecalRecHit","EcalRecHitsEB")
process.EcalFlowNtp.pfCandidatesTag = cms.InputTag("particleFlow")
process.EcalFlowNtp.srcTowers = cms.InputTag("towerMaker")
process.EcalFlowNtp.verbose = cms.untracked.bool(True)
process.EcalFlowNtp.qualityString_ = cms.untracked.string("highPurity")
process.EcalFlowNtp.cutDzErrMax_ = cms.untracked.double(3.0)
process.EcalFlowNtp.cutDxyErrMax_ = cms.untracked.double(3.0)
process.EcalFlowNtp.cutPtErrMax_ = cms.untracked.double(0.1)
process.EcalFlowNtp.vertexZMax = cms.double(15.0)
process.EcalFlowNtp.cutMultMin = cms.double(0.0)
process.EcalFlowNtp.cutMultMax = cms.double(1000.0)
process.EcalFlowNtp.cutMinTrack = cms.double(0.4)
process.EcalFlowNtp.lowpi0PtCut = cms.double(0.7)
process.EcalFlowNtp.highpi0PtCut = cms.double(12.0)
process.EcalFlowNtp.ptBins = cms.vdouble(1.6, 1.8, 2.0, 2.2, 2.4, 2.6, 3.0, 3.5, 4.0, 4.5, 5.0,
                                         5.5, 6.0, 7.0, 8.0, 10.0, 12.0
                                        )
process.EcalFlowNtp.NptBins = cms.vdouble(0.7, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 5.0, 6.0, 8.0)
#process.EcalFlowNtp.NptBins = cms.vdouble(0.7, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 5.0, 6.0, 8.0)
process.EcalFlowNtp.doEnergyRecalibration = cms.bool(True);
process.EcalFlowNtp.doEffCorrections = cms.bool(True);
process.EcalFlowNtp.clustS49Cut = cms.double(0.74);
process.EcalFlowNtp.useClusterCrystalLimit = cms.bool(False);
process.EcalFlowNtp.lowCrystalLimit = cms.int32(1);
process.EcalFlowNtp.highCrystalLimit = cms.int32(1);
process.EcalFlowNtp.useClusterCrystalLimitLowPtOnly = cms.bool(False);
process.EcalFlowNtp.clusterCrystalLowPtOnly = cms.double(1.5)
process.EcalFlowNtp.occBins = cms.vdouble(
            0., 20., 40., 60., 80., 100., 120., 140., 160.,
                        180., 200., 250., 300., 500.
                        )
process.EcalFlowNtp.etaBins = cms.vdouble(
            -1.46, -1.36, -1.26, -1.16, -1.06, -0.96, -0.86, -0.76, -0.66, -0.56,
                    -0.46, -0.36, -0.26, -0.16, -0.06, 0.04, 0.14, 0.24, 0.34, 0.44, 0.54,
                    0.64, 0.74, 0.94, 0.94, 1.04, 1.14, 1.24, 1.34, 1.44)
process.EcalFlowNtp.occByCentrality = cms.bool(True)
process.EcalFlowNtp.diHadronCorrelations = cms.bool(False)
process.EcalFlowNtp.pi0HadronCorrelations = cms.bool(True)
process.EcalFlowNtp.etaHadronCorrelations = cms.bool(False)
process.EcalFlowNtp.rotatedBackground = cms.bool(False)
process.EcalFlowNtp.cutByLeadingTrackPt = cms.bool(False)
process.EcalFlowNtp.leadingTrackPtMin = cms.double(0.0)
process.EcalFlowNtp.leadingTrackPtMax = cms.double(999.0)
process.EcalFlowNtp.cutByLeadingPhotonPt = cms.bool(False)
process.EcalFlowNtp.leadingPhotonPtMin = cms.double(0.0)
process.EcalFlowNtp.leadingPhotonPtMax = cms.double(999.0)
process.EcalFlowNtp.swissThreshold = cms.double(0.85)
process.EcalFlowNtp.timeThreshold = cms.double(10.0)
process.EcalFlowNtp.avoidIeta85 = cms.double(False)
process.EcalFlowNtp.doOneDimensionTimeCut = cms.bool(False)
process.EcalFlowNtp.oneDimensionTimeCut = cms.double(10.0)
process.EcalFlowNtp.doTwoDimensionTimeCut = cms.bool(False)
process.EcalFlowNtp.twoDimensionTimeCutFactor = cms.double(0.35)
process.EcalFlowNtp.doWeightedTimeCut = cms.bool(False)

process.EcalFlowNtpMult100 = process.EcalFlowNtp.clone(
    cutMultMin = cms.double(120),
    cutMultMax = cms.double(150)
    )

process.EcalFlowNtpMult130 = process.EcalFlowNtp.clone(
    cutMultMin = cms.double(150),
    cutMultMax = cms.double(185)
    )

process.EcalFlowNtpMult160 = process.EcalFlowNtp.clone(
    cutMultMin = cms.double(185),
    cutMultMax = cms.double(220)
    )

process.EcalFlowNtpMult190 = process.EcalFlowNtp.clone(
    cutMultMin = cms.double(220),
    cutMultMax = cms.double(260)
    )

process.Mult100 = cms.Path(process.hltMult100 *
                        process.PAcollisionEventSelection *
                        process.siPixelRecHits *
                        #process.pileupVertexFilterCutGplus *
                        process.pACentrality *
                        process.EcalFlowNtpMult100 
                        )

process.Mult130 = cms.Path(process.hltMult130 *
                        process.PAcollisionEventSelection *
                        process.siPixelRecHits *
                        #process.pileupVertexFilterCutGplus *
                        process.pACentrality *
                        process.EcalFlowNtpMult130 
                        )

process.Mult160 = cms.Path(process.hltMult160 *
                        process.PAcollisionEventSelection *
                        process.siPixelRecHits *
                        #process.pileupVertexFilterCutGplus *
                        process.pACentrality *
                        process.EcalFlowNtpMult160 
                        )

process.Mult190 = cms.Path(process.hltMult190 *
                        process.PAcollisionEventSelection *
                        process.siPixelRecHits *
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


