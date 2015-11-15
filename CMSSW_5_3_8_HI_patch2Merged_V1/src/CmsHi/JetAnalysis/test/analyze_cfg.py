import FWCore.ParameterSet.Config as cms

process = cms.Process("ANA")

process.source = cms.Source('PoolSource',
#                            fileNames = cms.untracked.vstring('dcache:/pnfs/cmsaf.mit.edu/t2bat/cms/store/mc/Winter09/Hydjet_MinBias_4TeV/GEN-SIM/IDEAL_V12_GaussianVtx_OldPhysicsList_ver2/0000/7A35C13E-D027-DE11-950B-001C23C0B763.root')
fileNames = cms.untracked.vstring('dcache:/pnfs/cmsaf.mit.edu/t2bat/cms/store/user/yilmaz/Hydjet_MinBias_4TeV/Pyquen_DiJetPt80to120_Hydjet_MinBias_4TeV_d20090513_run02/3099b88e16d415d120e44e3284c19379/pythia_dijet_pt80to120_hydjet_mb_4TeV_d20090513___RUNNUM__.root'),
duplicateCheckMode = cms.untracked.string("noDuplicateCheck")

                            )

process.maxEvents = cms.untracked.PSet(
    input = cms.untracked.int32(-1)
)

process.SimpleMemoryCheck = cms.Service('SimpleMemoryCheck',
                                        ignoreTotal=cms.untracked.int32(0),
                                        oncePerEventMode = cms.untracked.bool(False)
                                        )

process.load("CmsHi.JetAnalysis.HiJetAnalysisModules_cff")
#process.recoevent.hepmcSrc = cms.untracked.string("source")
#process.genevent.hepmcSrc = cms.untracked.string("source")
#process.signalevent.hepmcSrc = cms.untracked.string("source")
#process.corrected.hepmcSrc = cms.untracked.string("source")

#process.MessageLogger = cms.Service("MessageLogger",
#                                    cout = cms.untracked.PSet(threshold = cms.untracked.string('DEBUG')
#                                                              ),
#                                    destinations = cms.untracked.vstring('cout'),
#                                    debugModules = cms.untracked.vstring('*')
#                                    )

process.TFileService = cms.Service('TFileService',
                                   fileName = cms.string('treefile__RUNNUM__.root')
                                   )

process.genjets = cms.Path(process.subEventJets+process.signalJets)
process.corrections = cms.Path(process.L2L3CorJetIC5Calo)
process.ana = cms.Path(process.jetAnalysis)





