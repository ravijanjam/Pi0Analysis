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
#process.load("RecoHI.HiCentralityAlgos.CentralityBin_cfi")
#process.load("SimGeneral.MixingModule.mixNoPU_cfi")
#process.load("SimGeneral.TrackingAnalysis.trackingParticles_cfi")
#process.load("SimTracker.TrackAssociation.TrackAssociatorByHits_cfi")
#process.load("FastSimulation.Configuration.EventContent_cff")

process.maxEvents = cms.untracked.PSet(input = cms.untracked.int32(-1))

process.TFileService = cms.Service("TFileService",
                                   fileName = cms.string("rpflatcheck.root")
                                   )

process.MessageLogger.cerr.FwkReport.reportEvery = 100
process.GlobalTag.globaltag = 'GR_P_V42_AN3::All'

from HeavyIonsAnalysis.Configuration.CommonFunctions_cff import *
overrideCentrality(process)

process.HeavyIonGlobalParameters = cms.PSet(
        centralityVariable = cms.string("HFtowersPlusTrunc"),
        nonDefaultGlauberModel = cms.string(""),
        centralitySrc = cms.InputTag("pACentrality")
        )
process.load('RecoHI.HiCentralityAlgos.HiCentrality_cfi')


process.load("HLTrigger.HLTfilters.hltHighLevel_cfi")
process.hltSingleTrigger = process.hltHighLevel.clone()
process.hltSingleTrigger.HLTPaths = ["HLT_PAZeroBiasPixel_SingleTrack_v1"]



process.path = cms.Path(process.hltSingleTrigger *
                        process.PAcollisionEventSelection *
                        process.pACentrality *
                        process.EcalFlowNtp 
                        )

process.EcalFlowNtp.OutputFile = cms.untracked.string('pPb_pilottuple.root')
process.EcalFlowNtp.AlCaStreamEBpi0Tag = cms.untracked.InputTag("ecalRecHit","EcalRecHitsEB")
#process.EcalFlowNtp.PFCandidates = cms.InputTag("particleFlow")
process.EcalFlowNtp.srcTowers = cms.InputTag("towerMaker")
process.EcalFlowNtp.verbose = cms.untracked.bool(True)
process.EcalFlowNtp.qualityString_ = cms.untracked.string("highPurity")
process.EcalFlowNtp.cutDzErrMax_ = cms.untracked.double(3.0)
process.EcalFlowNtp.cutDxyErrMax_ = cms.untracked.double(3.0)
process.EcalFlowNtp.cutPtErrMax_ = cms.untracked.double(0.1)

process.source = cms.Source("PoolSource",
                            fileNames = cms.untracked.vstring(
                                        '/store/express/HIRun2013/ExpressPhysics/FEVT/Express-v1/000/210/498/00000/B65577A4-0E63-E211-B52C-BCAEC5329727.root'
                                                              )
                            )


