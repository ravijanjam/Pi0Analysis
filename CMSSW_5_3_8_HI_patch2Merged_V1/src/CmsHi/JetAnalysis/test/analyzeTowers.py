
import FWCore.ParameterSet.VarParsing as VarParsing
ivars = VarParsing.VarParsing('standard')
'''
ivars.files = [
    'file:/net/hisrv0001/home/yetkin/hibat0007/analysis/jets/SignalUnquenchedDijet80to120_runs101to150.root',
    'file:/net/hisrv0001/home/yetkin/hibat0007/analysis/jets/SignalUnquenchedDijet80to120_runs151to200.root',
    'file:/net/hisrv0001/home/yetkin/hibat0007/analysis/jets/SignalUnquenchedDijet80to120_runs1to50.root',
    'file:/net/hisrv0001/home/yetkin/hibat0007/analysis/jets/SignalUnquenchedDijet80to120_runs51to100.root'
    ]
'''
'''
ivars.files = [
    'file:/net/hisrv0001/home/yetkin/pstore02/reco/NoZSP/local2/Hydjet_MinBias_2760GeV_d20100713/Hydjet_MinBias_2760GeV_runs11to20.root',
    'file:/net/hisrv0001/home/yetkin/pstore02/reco/NoZSP/local2/Hydjet_MinBias_2760GeV_d20100713/Hydjet_MinBias_2760GeV_runs21to40.root',
    'file:/net/hisrv0001/home/yetkin/pstore02/reco/NoZSP/local2/Hydjet_MinBias_2760GeV_d20100713/Hydjet_MinBias_2760GeV_runs61to80.root'
    ]
'''

ivars.files = [
'dcache:/pnfs/cmsaf.mit.edu/t2bat/cms/store/user/yetkin/reco/CMSSW_3_8_1_patch1/MC_38Y_V8/Hydjet_MinBias_2760GeV_d20100812/Hydjet_Quenched_MinBias_2760GeV_cfi_py_GEN_SIM_DIGI_L1_DIGI2RAW_HLT_1.root',
'dcache:/pnfs/cmsaf.mit.edu/t2bat/cms/store/user/yetkin/reco/CMSSW_3_8_1_patch1/MC_38Y_V8/Hydjet_MinBias_2760GeV_d20100812/Hydjet_Quenched_MinBias_2760GeV_cfi_py_GEN_SIM_DIGI_L1_DIGI2RAW_HLT_10.root',
'dcache:/pnfs/cmsaf.mit.edu/t2bat/cms/store/user/yetkin/reco/CMSSW_3_8_1_patch1/MC_38Y_V8/Hydjet_MinBias_2760GeV_d20100812/Hydjet_Quenched_MinBias_2760GeV_cfi_py_GEN_SIM_DIGI_L1_DIGI2RAW_HLT_100.root'
]

'''
ivars.files = [
'file:/net/hisrv0001/home/yetkin/hibat0007/aod/JulyExercise/MinBias0709/MinBias0709_runs11to20.root',
'file:/net/hisrv0001/home/yetkin/hibat0007/aod/JulyExercise/MinBias0709/MinBias0709_runs1to10.root',
'file:/net/hisrv0001/home/yetkin/hibat0007/aod/JulyExercise/MinBias0709/MinBias0709_runs1to5.root',
'file:/net/hisrv0001/home/yetkin/hibat0007/aod/JulyExercise/MinBias0709/MinBias0709_runs21to30.root',
'file:/net/hisrv0001/home/yetkin/hibat0007/aod/JulyExercise/MinBias0709/MinBias0709_runs31to40.root',
'file:/net/hisrv0001/home/yetkin/hibat0007/aod/JulyExercise/MinBias0709/MinBias0709_runs41to50.root',
'file:/net/hisrv0001/home/yetkin/hibat0007/aod/JulyExercise/MinBias0709/MinBias0709_runs51to100.root'
    ]
'''

'''
ivars.files = [
    'file:/net/hisrv0001/home/yetkin/pstore02/reco/NoZSP/local2/Hydjet_MinBias_2760GeV_d20100628/Hydjet_MinBias_2760GeV_runs101to200.root',
    'file:/net/hisrv0001/home/yetkin/pstore02/reco/NoZSP/local2/Hydjet_MinBias_2760GeV_d20100628/Hydjet_MinBias_2760GeV_runs1to100.root',
    'file:/net/hisrv0001/home/yetkin/pstore02/reco/NoZSP/local2/Hydjet_MinBias_2760GeV_d20100628/Hydjet_MinBias_2760GeV_runs201to300.root',
    'file:/net/hisrv0001/home/yetkin/pstore02/reco/NoZSP/local2/Hydjet_MinBias_2760GeV_d20100628/Hydjet_MinBias_2760GeV_runs301to400.root'
    ]
'''

ivars.output = 'Hydjet_Quenched_2760GeV.root'

ivars.maxEvents = -1

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

process.RandomNumberGeneratorService.bkg4Jets = cms.PSet(initialSeed = cms.untracked.uint32(ivars.randomNumber),
                                                         engineName = cms.untracked.string('HepJamesRandom') )
process.RandomNumberGeneratorService.bkg5Jets = process.RandomNumberGeneratorService.bkg4Jets.clone()
process.RandomNumberGeneratorService.bkg6Jets = process.RandomNumberGeneratorService.bkg4Jets.clone()
process.RandomNumberGeneratorService.bkg7Jets = process.RandomNumberGeneratorService.bkg4Jets.clone()
process.RandomNumberGeneratorService.bkgXJets = process.RandomNumberGeneratorService.bkg4Jets.clone()

from RecoJets.JetProducers.CaloJetParameters_cfi import *
from RecoJets.JetProducers.AnomalousCellParameters_cfi import *

process.load('PhysicsTools.PatAlgos.patHeavyIonSequences_cff')
from PhysicsTools.PatAlgos.tools.heavyIonTools import *
configureHeavyIons(process)

process.patJets.addJetCorrFactors = True
process.patJets.addGenPartonMatch  = False
process.patJets.addJetID = False
process.patJets.addGenJetMatch = False
process.patJets.embedGenJetMatch = False

process.icPu5corr = process.patJetCorrFactors.clone()
process.icPu5corr.jetSource = cms.InputTag("iterativeConePu5CaloJets","")
process.icPu5corr.corrLevels.L2Relative = cms.string('L2Relative_IC5Calo')
process.icPu5corr.corrLevels.L3Absolute = cms.string('L3Absolute_IC5Calo')

process.icPu5patJets = process.patJets.clone()
process.icPu5patJets.jetSource = cms.InputTag("iterativeConePu5CaloJets","")
#process.icPu5patJets.genJetMatch = cms.InputTag("icPu5match")
process.icPu5patJets.jetCorrFactorsSource = cms.VInputTag(cms.InputTag("icPu5corr") )


process.bkg4Jets = cms.EDProducer(
    "BackgroundJetProducer",
    CaloJetParameters,
    AnomalousCellParameters,
    jetAlgorithm = cms.string("IterativeCone"),
    rParam       = cms.double(0.4),
    avoidNegative = cms.bool(True),
    subtractorName = cms.string("MultipleAlgoIterator")
    #    subtractorName = cms.string("ParametrizedSubtractor")
    )

process.bkgXJets = cms.EDProducer(
    "JetAlgorithmAnalyzer",
    CaloJetParameters,
    AnomalousCellParameters,
    jetAlgorithm = cms.string("IterativeCone"),
    rParam       = cms.double(0.5),
    avoidNegative = cms.bool(True),
    #subtractorName = cms.string("ParametrizedSubtractor"),
    subtractorName = cms.string("MultipleAlgoIterator"),
    centralityTag =cms.InputTag("hiCentrality"),
    evtPlaneTag = cms.InputTag("hiEvtPlane"),
    doRecoEvtPlane = cms.untracked.bool(False),
    interpolate = cms.untracked.bool(False),
    centrality = cms.untracked.int32(-1),
    sumRecHits = cms.bool(False)
    )

process.bkgXJets.doPUOffsetCorr = True
process.bkgXJets.doPVCorrection = False
process.bkgXJets.jetPtMin = 10
process.bkgXJets.inputEtMin = -10.
process.bkgXJets.radiusPU = 0.5
process.bkgXJets.nSigmaPU = 1.

process.bkg4Jets.doPUOffsetCorr = True
process.bkg4Jets.doPVCorrection = False
process.bkg4Jets.jetPtMin = 10
process.bkg4Jets.inputEtMin = -10.
process.bkg4Jets.radiusPU = 0.4
process.bkg4Jets.nSigmaPU = 1.

process.bkg5Jets = process.bkg4Jets.clone()
process.bkg5Jets.rParam = 0.5
process.bkg5Jets.radiusPU = 0.5

process.bkg6Jets = process.bkg4Jets.clone()
process.bkg6Jets.rParam = 0.6
process.bkg6Jets.radiusPU = 0.6

process.bkg7Jets = process.bkg4Jets.clone()
process.bkg7Jets.rParam = 0.7
process.bkg7Jets.radiusPU = 0.7

process.bkgJets = cms.Sequence(process.bkg5Jets)


process.ana = cms.EDAnalyzer('MinBiasTowerAnalyzer',
                             jetTowersMean = cms.untracked.vdouble(21,21.4,21.4,22,22.5,21.3,17.4,16.1,11.5,0),
                             jetTowersRMS = cms.untracked.vdouble(5.4,5.2,5.2,5.4,5.8,5.8,4.9,4.1,3.2,0),
                             fakeJetSrc = cms.untracked.InputTag("bkg5Jets"),
                             patJetSrc = cms.untracked.InputTag("icPu5patJets","","ANALYSIS"),   
                             towersSrc =  cms.untracked.InputTag("towerMaker","","RECO"),
                             nBins = cms.untracked.double(10),
                             doRandomCone = cms.untracked.bool(True),
                             doEvtPlane = cms.untracked.bool(True),
                             centralitySrc = cms.untracked.InputTag("hiCentrality","","RECO"),
                             excludeJets = cms.untracked.bool(False),
                             doRecHits = cms.untracked.bool(True),
                             ecalEBRecHitSrc = cms.untracked.InputTag("ecalRecHit","EcalRecHitsEB","RECO"),
                             ecalEERecHitSrc = cms.untracked.InputTag("ecalRecHit","EcalRecHitsEE","RECO")
                             )

process.load("CondCore.DBCommon.CondDBCommon_cfi")
process.CondDBCommon.connect = "sqlite_file:/net/hisrv0001/home/nart/scratch/july/CMSSW_3_7_0_patch4/src/RecoHI/HiCentralityAlgos/data/CentralityTables.db"
process.PoolDBESSource = cms.ESSource("PoolDBESSource",
                                      process.CondDBCommon,
                                      toGet = cms.VPSet(cms.PSet(record = cms.string('HeavyIonRcd'),
                                                                 tag = cms.string('HFhits10_MC_Hydjet2760GeV_MC_3XY_V24_NoZS_v0')
                                                                 )
                                                        )
                                      )

process.p = cms.Path(
    process.bkgXJets +
    process.hiEvtPlane +
    process.ak5CaloJets +
    process.kt4CaloJets +
    process.bkgJets +
    process.icPu5corr +
    process.icPu5patJets +
    process.ana
    )
#process.out_step = cms.EndPath(process.output)

