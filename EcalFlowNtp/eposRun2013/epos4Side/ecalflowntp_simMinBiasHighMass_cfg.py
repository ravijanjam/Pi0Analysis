
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
                                   fileName = cms.string("pPb_EPOS_4May2014_SideV4.root")
                                   )

process.MessageLogger.cerr.FwkReport.reportEvery = 100
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
process.load('cmaguire.RpPbAnalysis.PAPileUpVertexFilter_cff')
process.load('RecoHI.HiCentralityAlgos.HiCentrality_cfi')
process.load("HLTrigger.HLTfilters.hltHighLevel_cfi")
process.hltSingleTrigger = process.hltHighLevel.clone()
process.hltSingleTrigger.HLTPaths = ["HLT_PAZeroBiasPixel_SingleTrack_v1"]

process.EcalFlowNtp.AlCaStreamEBpi0Tag = cms.untracked.InputTag("ecalRecHit","EcalRecHitsEB")
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

process.EcalFlowNtp.clustS49Cut = cms.double(0.74)
process.EcalFlowNtp.goodThetaMatch = cms.double(0.029)
process.EcalFlowNtp.goodPhiMatch = cms.double(0.029)
process.EcalFlowNtp.goodAngleMatch = cms.double(0.029)

process.EcalFlowNtp.makeOutputTree = cms.bool(True)
process.EcalFlowNtp.doEnergyRecalibration = cms.bool(True);
process.EcalFlowNtp.useClusterCrystalLimit = cms.bool(False);
process.EcalFlowNtp.lowCrystalLimit = cms.int32(1);
process.EcalFlowNtp.highCrystalLimit = cms.int32(9);
process.EcalFlowNtp.suppressTrackMatchedClusters = cms.bool(True);
process.EcalFlowNtp.clusterStore = cms.bool(True)
process.EcalFlowNtp.recoTrackStore = cms.bool(False)
process.EcalFlowNtp.simTrackStore = cms.bool(False)
process.EcalFlowNtp.mergedTrackTruthStore = cms.bool(True)
process.EcalFlowNtp.mergedTrackTruthPhotonOnly = cms.bool(False)
process.EcalFlowNtp.mesonStore = cms.bool(True)
process.EcalFlowNtp.photonStore = cms.bool(False)
process.EcalFlowNtp.chmesonStore = cms.bool(True)

process.EcalFlowNtp.minimumHITracksCut = cms.int32(120)
process.EcalFlowNtp.maximumHITracksCut = cms.int32(260)

process.EcalFlowNtp.doSwissThreshold = cms.bool(False)
process.EcalFlowNtp.swissThreshold = cms.double(0.95)

process.EcalFlowNtp.doOneDimensionTimeCut = cms.bool(False)
process.EcalFlowNtp.oneDimensionTimeCut = cms.double(10.0)

process.EcalFlowNtp.doTwoDimensionTimeCut = cms.bool(False)
process.EcalFlowNtp.twoDimensionTimeCutFactor = cms.double(0.35)
 
process.EcalFlowNtp.doWeightedTimeCut = cms.bool(False)

process.EcalFlowNtp.lowInvMassCut = cms.double(0.230)
process.EcalFlowNtp.highInvMassCut = cms.double(0.290)

process.EcalFlowNtp.ptBins = cms.vdouble(1.6, 1.8, 2.0, 2.2, 2.4, 2.6, 3.0, 3.5, 4.0, 4.5, 5.0,
                                         5.5, 6.0, 7.0, 8.0, 10.0, 12.0
                                        )
process.EcalFlowNtp.NptBins = cms.vdouble(0.7, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 5.0, 6.0, 8.0)
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

process.path = cms.Path(process.hltSingleTrigger *
                        process.PAcollisionEventSelection *
                        process.siPixelRecHits *
                        process.pileupVertexFilterCutGplus *
                        process.pACentrality *
                        process.EcalFlowNtp 
                        )

process.source = cms.Source("PoolSource",
                            fileNames = cms.untracked.vstring(
                                        'file:/gpfs21/scratch/maguire/pPb2013_MC/MinBias/hijing_reco_fix_92_2_8hw.root'
                                                              )
                            )
