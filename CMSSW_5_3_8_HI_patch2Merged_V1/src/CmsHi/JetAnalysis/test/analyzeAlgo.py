import FWCore.ParameterSet.VarParsing as VarParsing

ivars = VarParsing.VarParsing('standard')

ivars.files = 'rfio:/castor/cern.ch/user/y/yilmaz/pat/CMSSW_3_6_0/UnquenchedDijet80to120_runs1to500.root'
ivars.output = 'algo_80to120_4.root'
ivars.maxEvents = 200

ivars.parseArguments()

import FWCore.ParameterSet.Config as cms

process = cms.Process('ALGO')

process.source = cms.Source("PoolSource",
                            fileNames = cms.untracked.vstring(ivars.files),
                            skipEvents = cms.untracked.uint32(200)
                            )

process.maxEvents = cms.untracked.PSet(
            input = cms.untracked.int32(ivars.maxEvents)
                    )

'''
process.load("FWCore.MessageLogger.MessageLogger_cfi")
process.MessageLogger.cout.placeholder = cms.untracked.bool(False)
process.MessageLogger.cout.threshold = cms.untracked.string('DEBUG')
process.MessageLogger.debugModules = cms.untracked.vstring('PileUpSubtractor','JetAlgorithmAnalyzer')
'''

process.load('Configuration.StandardSequences.Services_cff')
process.load('Configuration.StandardSequences.Geometry_cff')
process.load('RecoJets.Configuration.GenJetParticles_cff')
process.load('RecoHI.HiJetAlgos.HiGenJets_cff')
process.load('RecoHI.HiJetAlgos.HiRecoJets_cff')
process.load('PhysicsTools.PatAlgos.patHeavyIonSequences_cff')
from PhysicsTools.PatAlgos.tools.heavyIonTools import *
configureHeavyIons(process)

process.RandomNumberGeneratorService.icPu5CaloJets = process.RandomNumberGeneratorService.generator.clone()
process.RandomNumberGeneratorService.icPu5CaloJets0 = process.RandomNumberGeneratorService.generator.clone()
process.RandomNumberGeneratorService.icPu5CaloJets1 = process.RandomNumberGeneratorService.generator.clone()
process.RandomNumberGeneratorService.icPu5CaloJets2 = process.RandomNumberGeneratorService.generator.clone()

process.TFileService = cms.Service('TFileService',
                                   fileName = cms.string('treefile_' + ivars.output)
                                   )

from RecoJets.JetProducers.CaloJetParameters_cfi import *
from RecoJets.JetProducers.AnomalousCellParameters_cfi import *

process.icPu5CaloJets = cms.EDProducer('JetAlgorithmAnalyzer',
                                       CaloJetParameters,
                                       AnomalousCellParameters,
                                       jetAlgorithm = cms.string("IterativeCone"),
                                       rParam       = cms.double(0.5),
                                       avoidNegative = cms.bool(False)
                                       )


process.icPu5CaloJets.doPUOffsetCorr = True
process.icPu5CaloJets.doPVCorrection = False
process.icPu5CaloJets.inputEtMin = 0
process.icPu5CaloJets.jetPtMin = 10
process.icPu5CaloJets.centrality = cms.untracked.int32(0)

#process.icPu5CaloJets.reRunAlgo = cms.untracked.bool(True)

process.icPu5CaloJets0 = process.icPu5CaloJets.clone()
process.icPu5CaloJets1 = process.icPu5CaloJets.clone(centrality = cms.untracked.int32(15))
process.icPu5CaloJets2 = process.icPu5CaloJets.clone(centrality = cms.untracked.int32(30))

process.algoAna = cms.Sequence(process.icPu5CaloJets0) # + process.icPu5CaloJets1 + process.icPu5CaloJets2)

process.icPu5corr = process.patJetCorrFactors.clone(jetSource = cms.InputTag("icPu5CaloJets"),
                                                    corrLevels = cms.PSet(L2Relative = cms.string("L2Relative_IC5Calo"),
                                                                          L3Absolute = cms.string("L3Absolute_IC5Calo")))
process.icPu5clean = process.heavyIonCleanedGenJets.clone(src = cms.untracked.InputTag('iterativeCone5HiGenJets'))
process.icPu5match = process.patJetGenJetMatch.clone(src = cms.InputTag("icPu5CaloJets"),
                                                     matched = cms.InputTag("heavyIonCleanedGenJets"))
process.icPu5parton = process.patJetPartonMatch.clone(src = cms.InputTag("icPu5CaloJets"))
process.icPu5patJets = process.patJets.clone(jetSource  = cms.InputTag("icPu5CaloJets"),
                                             genJetMatch = cms.InputTag("icPu5match"),
                                             genPartonMatch= cms.InputTag("icPu5parton"),
                                             jetCorrFactorsSource = cms.VInputTag(cms.InputTag("icPu5corr")))
process.icPu5patSequence = cms.Sequence(process.icPu5corr*process.icPu5match*process.icPu5parton*process.icPu5patJets)

process.load("HeavyIonsAnalysis.Configuration.analysisEventContent_cff")

process.output = cms.OutputModule("PoolOutputModule",
                                  process.jetTrkSkimContent,
                                  fileName = cms.untracked.string(ivars.output)
                                  )

process.output.outputCommands.append("keep *_*_*_ALGO")


process.load("CondCore.DBCommon.CondDBCommon_cfi")
process.CondDBCommon.connect = "sqlite_file:/home/yilmaz/cms361v2/src/RecoHI/HiCentralityAlgos/data/CentralityTables.db"

process.PoolDBESSource = cms.ESSource("PoolDBESSource",
                                      process.CondDBCommon,
                                      toGet = cms.VPSet(cms.PSet(record = cms.string('HeavyIonRcd'),
                                                                 tag = cms.string('HFhits40_MC_Hydjet2760GeV_MC_3XY_V24_v0')
                                                                 )
                                                        )
                                      )


process.runAllJets = cms.Path(process.hiGenParticlesForJets *
                              process.hiRecoGenJets +
                              process.iterativeConePu5CaloJets *
                              process.makeHeavyIonJets +
                              process.algoAna # *
#                              process.icPu5patSequence
                              )

process.out_step = cms.EndPath(process.output)

