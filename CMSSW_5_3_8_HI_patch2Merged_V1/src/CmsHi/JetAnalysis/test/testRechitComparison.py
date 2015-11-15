
import FWCore.ParameterSet.Config as cms

process = cms.Process("PAT")

## MessageLogger
process.load("FWCore.MessageLogger.MessageLogger_cfi")
#process.Timing = cms.Service("Timing")

## Options and Output Report
process.options   = cms.untracked.PSet( wantSummary = cms.untracked.bool(True) )

## Source
process.source = cms.Source("PoolSource",
                            fileNames = cms.untracked.vstring(
    'file:nutrino_mixed_in_hi_RECO.root'
    ),
                            duplicateCheckMode = cms.untracked.string('noDuplicateCheck')
                            )

## Maximal Number of Events
process.maxEvents = cms.untracked.PSet( input = cms.untracked.int32(-1) )

## Geometry and Detector Conditions (needed for a few patTuple production steps)
process.load("Configuration.StandardSequences.Geometry_cff")
process.load("Configuration.StandardSequences.FrontierConditions_GlobalTag_cff")
process.load('Configuration.StandardSequences.Reconstruction_cff')


# Centrality
process.load("RecoHI.HiCentralityAlgos.HiCentrality_cfi")
process.HeavyIonGlobalParameters = cms.PSet(
    centralitySrc = cms.InputTag("hiCentrality"),
    centralityVariable = cms.string("HFhits"),
    nonDefaultGlauberModel = cms.string("")
    )

process.GlobalTag.globaltag = 'START39_V9::All' # 'GR_R_39X_V3::All'
from CmsHi.Analysis2010.CommonFunctions_cff import *
overrideCentrality(process)

process.load("Configuration.StandardSequences.MagneticField_cff")


process.MessageLogger.cerr.FwkReport.reportEvery = cms.untracked.int32(100)


process.TFileService = cms.Service("TFileService",
                                   fileName = cms.string('isoRecHitCounter.root'),
                                   closeFileFast = cms.untracked.bool(True)
                                   )

#process.load("RecoHI.HiEgammaAlgos.hiEcalSpikeFilter_cfi")

process.ana = cms.EDAnalyzer("RecHitComparison",
                             hcalHFRecHitSrc2 =  cms.untracked.InputTag("hfreco","","RECOBKG"),
                             hcalHFRecHitSrc1 =  cms.untracked.InputTag("hfreco","","TEST"),
                             EBRecHitSrc2     =  cms.untracked.InputTag("ecalRecHit","EcalRecHitsEB","RECOBKG"),
                             EBRecHitSrc1     =  cms.untracked.InputTag("ecalRecHit","EcalRecHitsEB","TEST"),
                             hcalHBHERecHitSrc2= cms.untracked.InputTag("hbhereco","","RECOBKG"),
                             hcalHBHERecHitSrc1= cms.untracked.InputTag("hbhereco","","TEST"),
                             EERecHitSrc2     = cms.untracked.InputTag("ecalRecHit","EcalRecHitsEE","RECOBKG"),
                             EERecHitSrc1     = cms.untracked.InputTag("ecalRecHit","EcalRecHitsEE","TEST"),
                             BasicClusterSrc2 = cms.untracked.InputTag("ecalRecHit","EcalRecHitsEB","RECOBKG"),
                             BasicClusterSrc1 = cms.untracked.InputTag("ecalRecHit","EcalRecHitsEB","TEST")
                             )



process.p = cms.Path(
    #   process.goodPhotons *
    #    process.photonFilter*
    # process.hiEcalSpikeFilter    
    process.ana
    )


#process.e = cms.EndPath(process.out)    

    
