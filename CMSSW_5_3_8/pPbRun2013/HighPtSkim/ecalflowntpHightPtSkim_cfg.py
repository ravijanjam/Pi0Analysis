
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
                                   fileName = cms.string("pPb_HighPtSkim.root")
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
process.load('msharma.RpPbAnalysis.PAPileUpVertexFilter_cff')
process.load('RecoHI.HiCentralityAlgos.HiCentrality_cfi')
process.load("HLTrigger.HLTfilters.hltHighLevel_cfi")
process.hltSingleTrigger = process.hltHighLevel.clone()
process.hltSingleTrigger.HLTPaths = ["HLT_PAZeroBiasPixel_SingleTrack_v1"]

process.hltMult100 = process.hltHighLevel.clone()
process.hltMult100.HLTPaths = ["HLT_PAPixelTrackMultiplicity100_FullTrack12_*"]

process.hltMult130 = process.hltHighLevel.clone()
process.hltMult130.HLTPaths = ["HLT_PAPixelTrackMultiplicity130_FullTrack12_*"]

process.hltMult160 = process.hltHighLevel.clone()
process.hltMult160.HLTPaths = ["HLT_PAPixelTrackMultiplicity160_FullTrack12_*"]

process.hltMult190 = process.hltHighLevel.clone()
process.hltMult190.HLTPaths = ["HLT_PAPixelTracks_Multiplicity190_*"]

process.EcalFlowNtp.AlCaStreamEBpi0Tag = cms.untracked.InputTag("ecalRecHit","EcalRecHitsEB")
#process.EcalFlowNtp.PFCandidates = cms.InputTag("particleFlow")
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
process.EcalFlowNtp.ptBins = cms.vdouble(1.6, 1.8, 2.0, 2.2, 2.4, 2.6, 3.0, 3.5, 4.0, 4.5, 5.0,
                                         5.5, 6.0, 7.0, 8.0, 10.0, 12.0
                                        )
process.EcalFlowNtp.NptBins = cms.vdouble(1.6, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0)
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
                        process.pileupVertexFilterCutGplus *
                        process.pACentrality *
                        process.EcalFlowNtpMult100 
                        )

process.Mult130 = cms.Path(process.hltMult130 *
                        process.PAcollisionEventSelection *
                        process.siPixelRecHits *
                        process.pileupVertexFilterCutGplus *
                        process.pACentrality *
                        process.EcalFlowNtpMult130 
                        )

process.Mult160 = cms.Path(process.hltMult160 *
                        process.PAcollisionEventSelection *
                        process.siPixelRecHits *
                        process.pileupVertexFilterCutGplus *
                        process.pACentrality *
                        process.EcalFlowNtpMult160 
                        )

process.Mult190 = cms.Path(process.hltMult190 *
                        process.PAcollisionEventSelection *
                        process.siPixelRecHits *
                        process.pileupVertexFilterCutGplus *
                        process.pACentrality *
                        process.EcalFlowNtpMult190 
                        )

process.schedule = cms.Schedule(process.Mult100,process.Mult130,process.Mult160,process.Mult190)

process.source = cms.Source("PoolSource",
                            fileNames = cms.untracked.vstring(
                                        '/store/hidata/HIRun2013/PAHighPt/RECO/FlowCorrPA-PromptSkim-v2/00005/F0A4F448-A477-E211-A550-003048F316C8.root'
                                                              )
                            )


