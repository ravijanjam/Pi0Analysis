
import FWCore.ParameterSet.VarParsing as VarParsing
ivars = VarParsing.VarParsing('standard')

ivars.files = [
# ZS Data:
#    'rfio:/castor/cern.ch/cms/store/data/Run2010B/MinimumBias/RECO/PromptReco-v2/000/146/510/82BB6441-6EC7-DF11-BED4-001617C3B66C.root',
#NZS Data:
    'rfio:/castor/cern.ch/cms/store/data/Run2010B/HeavyIonTest/RECO/PromptReco-v2/000/146/421/FE8B65B2-ABC6-DF11-8534-0030487CD7E0.root',
    ]


ivars.output = 'Data.root'

ivars.maxEvents = 10

ivars.register ('randomNumber',
                mult=ivars.multiplicity.singleton,
                info="for testing")
ivars.randomNumber=5
ivars.parseArguments()

import FWCore.ParameterSet.Config as cms

process = cms.Process('ANALYSIS')

process.maxEvents = cms.untracked.PSet(
    input = cms.untracked.int32(ivars.maxEvents)   
    )

# Input source
process.source = cms.Source("PoolSource",
                            fileNames = cms.untracked.vstring(ivars.files)
                            )

process.TFileService = cms.Service('TFileService',
                                   fileName = cms.string('plots_' + ivars.output)
                                   )


process.output = cms.OutputModule("PoolOutputModule",
                                  outputCommands = cms.untracked.vstring("keep *_*_*_*"),
                                  fileName = cms.untracked.string(ivars.output)
                                  )


process.load('Configuration/StandardSequences/GeometryExtended_cff')
process.load('Configuration/StandardSequences/Services_cff')
process.load('Configuration/StandardSequences/ReconstructionHeavyIons_cff')

process.load('PhysicsTools.PatAlgos.patHeavyIonSequences_cff')
from PhysicsTools.PatAlgos.tools.heavyIonTools import *
configureHeavyIons(process)

process.patJets.addJetCorrFactors = True
process.patJets.addGenPartonMatch  = False
process.patJets.addJetID = False
process.patJets.addGenJetMatch = False
process.patJets.embedGenJetMatch = False

process.icPu5corr = process.patJetCorrFactors.clone()
process.icPu5corr.jetSource = cms.InputTag("iterativeCone5CaloJets","")
process.icPu5corr.corrLevels.L2Relative = cms.string('L2Relative_IC5Calo')
process.icPu5corr.corrLevels.L3Absolute = cms.string('L3Absolute_IC5Calo')

process.icPu5patJets = process.patJets.clone()
process.icPu5patJets.jetSource = cms.InputTag("iterativeCone5CaloJets","")
process.icPu5patJets.jetCorrFactorsSource = cms.VInputTag(cms.InputTag("icPu5corr") )

process.ana = cms.EDAnalyzer('MinBiasTowerAnalyzer',
                             nBins = cms.untracked.int32(1),
                             patJetSrc = cms.untracked.InputTag("icPu5patJets","","ANALYSIS"),
                             towersSrc =  cms.untracked.InputTag("towerMaker","","RECO"),
                             doRandomCone = cms.untracked.bool(False),
                             doEvtPlane = cms.untracked.bool(False),
                             excludeJets = cms.untracked.bool(False),
                             isSignal = cms.untracked.bool(True),
                             doMC = cms.untracked.bool(False),
                             doTowers = cms.untracked.bool(True),
                             doRecHits = cms.untracked.bool(True),
                             ecalEBRecHitSrc = cms.untracked.InputTag("ecalRecHit","EcalRecHitsEB","RECO"),
                             ecalEERecHitSrc = cms.untracked.InputTag("ecalRecHit","EcalRecHitsEE","RECO")
                             )

process.pana = cms.Path(
    process.icPu5corr +
    process.icPu5patJets +
    process.ana
    )
