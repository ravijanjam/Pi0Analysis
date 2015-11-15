import FWCore.ParameterSet.Config as cms

process = cms.Process("EcalFlowNtp")

process.load("Configuration.StandardSequences.MagneticField_38T_cff")
process.load('Configuration.StandardSequences.FrontierConditions_GlobalTag_cff')
process.load("Geometry.CaloEventSetup.CaloTopology_cfi")
process.load("SimGeneral.MixingModule.mixNoPU_cfi")
process.load("SimGeneral.TrackingAnalysis.trackingParticles_cfi")
process.load("SimTracker.TrackAssociation.TrackAssociatorByHits_cfi")
process.load("Configuration.StandardSequences.ReconstructionHeavyIons_cff")
process.load("RecoHI.HiCentralityAlgos.CentralityBin_cfi")
process.load("CondCore.DBCommon.CondDBCommon_cfi");
process.load("FWCore.MessageService.MessageLogger_cfi")
process.MessageLogger.cerr.FwkReport.reportEvery = 100
process.load("Pi0Analysis.EcalFlowNtp.ecalflowntp_cfi")
process.GlobalTag.globaltag = 'GR_E_V31::All'


import FWCore.ParameterSet.VarParsing as VarParsing

ivars = VarParsing.VarParsing('python')

ivars.inputFiles =('file:/scratch/appelte1/PAPilot/hiPAMinBias-202792ExpressSelection_1.root',
                   'file:/scratch/appelte1/PAPilot/hiPAMinBias-202792ExpressSelection_2.root',
                   'file:/scratch/appelte1/PAPilot/hiPAMinBias-202792ExpressSelection_3.root',
                   'file:/scratch/appelte1/PAPilot/hiPAMinBias-202792ExpressSelection_4.root',
                   'file:/scratch/appelte1/PAPilot/hiPAMinBias-202792ExpressSelection_5.root',
                   'file:/scratch/appelte1/PAPilot/hiPAMinBias-202792ExpressSelection_6.root',
                   'file:/scratch/appelte1/PAPilot/hiPAMinBias-202792ExpressSelection_7.root',
                   'file:/scratch/appelte1/PAPilot/hiPAMinBias-202792ExpressSelection_8.root',
                   'file:/scratch/appelte1/PAPilot/hiPAMinBias-202792ExpressSelection_9.root',
                   'file:/scratch/appelte1/PAPilot/hiPAMinBias-202792ExpressSelection_10.root',
                   'file:/scratch/appelte1/PAPilot/hiPAMinBias-202792ExpressSelection_11.root',
                   'file:/scratch/appelte1/PAPilot/hiPAMinBias-202792ExpressSelection_12.root',
                   'file:/scratch/appelte1/PAPilot/hiPAMinBias-202792ExpressSelection_13.root',
                   'file:/scratch/appelte1/PAPilot/hiPAMinBias-202792ExpressSelection_14.root',
                   'file:/scratch/appelte1/PAPilot/hiPAMinBias-202792ExpressSelection_15.root',
                   'file:/scratch/appelte1/PAPilot/hiPAMinBias-202792ExpressSelection_16.root',
                   'file:/scratch/appelte1/PAPilot/hiPAMinBias-202792ExpressSelection_17.root',
                   'file:/scratch/appelte1/PAPilot/hiPAMinBias-202792ExpressSelection_18.root',
                   'file:/scratch/appelte1/PAPilot/hiPAMinBias-202792ExpressSelection_19.root')

ivars.outputFile = 'pizero_pPbPilotoutput.root'

ivars.parseArguments()
process.load("Configuration.StandardSequences.ReconstructionHeavyIons_cff")
process.load("Configuration.StandardSequences.GeometryDB_cff")
process.load("Configuration.StandardSequences.MagneticField_38T_cff")
# Common offline event selection
process.path = cms.Path(process.EcalFlowNtp)

process.EcalFlowNtp.OutputFile = cms.untracked.string(ivars.outputFile)
process.EcalFlowNtp.AlCaStreamEBpi0Tag = cms.untracked.InputTag("ecalRecHit","EcalRecHitsEB")

process.maxEvents = cms.untracked.PSet(input = cms.untracked.int32(-1))

process.source = cms.Source("PoolSource",
    fileNames = cms.untracked.vstring(
 
ivars.inputFiles

)
)
