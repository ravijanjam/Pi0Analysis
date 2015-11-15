ifeq ($(strip $(CmsHi/JetAnalysis)),)
ALL_COMMONRULES += src_CmsHi_JetAnalysis_src
src_CmsHi_JetAnalysis_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_CmsHi_JetAnalysis_src,src/CmsHi/JetAnalysis/src,LIBRARY))
CmsHiJetAnalysis := self/CmsHi/JetAnalysis
CmsHi/JetAnalysis := CmsHiJetAnalysis
CmsHiJetAnalysis_files := $(patsubst src/CmsHi/JetAnalysis/src/%,%,$(wildcard $(foreach dir,src/CmsHi/JetAnalysis/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
CmsHiJetAnalysis_BuildFile    := $(WORKINGDIR)/cache/bf/src/CmsHi/JetAnalysis/BuildFile
CmsHiJetAnalysis_LOC_USE   := self root hepmc boost fastjet FWCore/PluginManager FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Framework PhysicsTools/UtilAlgos CommonTools/UtilAlgos Geometry/CaloGeometry Geometry/Records SimGeneral/HepPDTRecord SimDataFormats/GeneratorProducts SimDataFormats/HiGenData SimTracker/TrackAssociation SimTracker/Records DataFormats/HepMCCandidate DataFormats/EcalRecHit DataFormats/HcalRecHit DataFormats/HcalDigi DataFormats/HcalDetId DataFormats/DetId DataFormats/GeometryVector DataFormats/JetReco DataFormats/METReco DataFormats/PatCandidates RecoJets/JetProducers DataFormats/HeavyIonEvent CondFormats/JetMETObjects CalibFormats/HcalObjects RecoLocalCalo/HcalRecAlgos
CmsHiJetAnalysis_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,CmsHiJetAnalysis,CmsHiJetAnalysis,$(SCRAMSTORENAME_LIB)))
CmsHiJetAnalysis_PACKAGE := self/src/CmsHi/JetAnalysis/src
ALL_PRODS += CmsHiJetAnalysis
CmsHiJetAnalysis_INIT_FUNC        += $$(eval $$(call Library,CmsHiJetAnalysis,src/CmsHi/JetAnalysis/src,src_CmsHi_JetAnalysis_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(CmsHiJetAnalysis_files_exts),$(CmsHiJetAnalysis_files_exts),$(SRC_FILES_SUFFIXES))))
endif
ifeq ($(strip $(CondFormats/HIObjects)),)
ALL_COMMONRULES += src_CondFormats_HIObjects_src
src_CondFormats_HIObjects_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_CondFormats_HIObjects_src,src/CondFormats/HIObjects/src,LIBRARY))
CondFormatsHIObjects := self/CondFormats/HIObjects
CondFormats/HIObjects := CondFormatsHIObjects
CondFormatsHIObjects_files := $(patsubst src/CondFormats/HIObjects/src/%,%,$(wildcard $(foreach dir,src/CondFormats/HIObjects/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
CondFormatsHIObjects_BuildFile    := $(WORKINGDIR)/cache/bf/src/CondFormats/HIObjects/BuildFile
CondFormatsHIObjects_LOC_USE   := self CondFormats/Common FWCore/Framework rootrflx
CondFormatsHIObjects_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,CondFormatsHIObjectsCapabilities,CondFormatsHIObjects,$(SCRAMSTORENAME_LIB)))
CondFormatsHIObjects_PRE_INIT_FUNC += $$(eval $$(call LCGDict,CondFormatsHIObjects,0,classes,$(LOCALTOP)/src/CondFormats/HIObjects/src/classes.h,$(LOCALTOP)/src/CondFormats/HIObjects/src/classes_def.xml,$(SCRAMSTORENAME_LIB), --fail_on_warnings,Capabilities))
CondFormatsHIObjects_EX_LIB   := CondFormatsHIObjects
CondFormatsHIObjects_EX_USE   := $(foreach d,$(CondFormatsHIObjects_LOC_USE),$(if $($(d)_LOC_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsHIObjects_PACKAGE := self/src/CondFormats/HIObjects/src
ALL_PRODS += CondFormatsHIObjects
CondFormatsHIObjects_INIT_FUNC        += $$(eval $$(call Library,CondFormatsHIObjects,src/CondFormats/HIObjects/src,src_CondFormats_HIObjects_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(CondFormatsHIObjects_files_exts),$(CondFormatsHIObjects_files_exts),$(SRC_FILES_SUFFIXES))))
endif
ifeq ($(strip $(DataFormats/HeavyIonEvent)),)
ALL_COMMONRULES += src_DataFormats_HeavyIonEvent_src
src_DataFormats_HeavyIonEvent_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_DataFormats_HeavyIonEvent_src,src/DataFormats/HeavyIonEvent/src,LIBRARY))
DataFormatsHeavyIonEvent := self/DataFormats/HeavyIonEvent
DataFormats/HeavyIonEvent := DataFormatsHeavyIonEvent
DataFormatsHeavyIonEvent_files := $(patsubst src/DataFormats/HeavyIonEvent/src/%,%,$(wildcard $(foreach dir,src/DataFormats/HeavyIonEvent/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
DataFormatsHeavyIonEvent_BuildFile    := $(WORKINGDIR)/cache/bf/src/DataFormats/HeavyIonEvent/BuildFile
DataFormatsHeavyIonEvent_LOC_USE   := self root rootrflx DataFormats/Common CondFormats/HIObjects CondFormats/DataRecord
DataFormatsHeavyIonEvent_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,DataFormatsHeavyIonEventCapabilities,DataFormatsHeavyIonEvent,$(SCRAMSTORENAME_LIB)))
DataFormatsHeavyIonEvent_PRE_INIT_FUNC += $$(eval $$(call LCGDict,DataFormatsHeavyIonEvent,0,classes,$(LOCALTOP)/src/DataFormats/HeavyIonEvent/src/classes.h,$(LOCALTOP)/src/DataFormats/HeavyIonEvent/src/classes_def.xml,$(SCRAMSTORENAME_LIB),$(GENREFLEX_ARGS) --fail_on_warnings,Capabilities))
DataFormatsHeavyIonEvent_PRE_INIT_FUNC += $$(eval $$(call RootDict,DataFormatsHeavyIonEvent,src/DataFormats/HeavyIonEvent/src, LinkDef.h))
DataFormatsHeavyIonEvent_EX_LIB   := DataFormatsHeavyIonEvent
DataFormatsHeavyIonEvent_EX_USE   := $(foreach d,$(DataFormatsHeavyIonEvent_LOC_USE),$(if $($(d)_LOC_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsHeavyIonEvent_PACKAGE := self/src/DataFormats/HeavyIonEvent/src
ALL_PRODS += DataFormatsHeavyIonEvent
DataFormatsHeavyIonEvent_INIT_FUNC        += $$(eval $$(call Library,DataFormatsHeavyIonEvent,src/DataFormats/HeavyIonEvent/src,src_DataFormats_HeavyIonEvent_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(DataFormatsHeavyIonEvent_files_exts),$(DataFormatsHeavyIonEvent_files_exts),$(SRC_FILES_SUFFIXES))))
endif
ifeq ($(strip $(Pi0Analysis/EcalFlowNtp)),)
ALL_COMMONRULES += src_Pi0Analysis_EcalFlowNtp_src
src_Pi0Analysis_EcalFlowNtp_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_Pi0Analysis_EcalFlowNtp_src,src/Pi0Analysis/EcalFlowNtp/src,LIBRARY))
Pi0AnalysisEcalFlowNtp := self/Pi0Analysis/EcalFlowNtp
Pi0Analysis/EcalFlowNtp := Pi0AnalysisEcalFlowNtp
Pi0AnalysisEcalFlowNtp_files := $(patsubst src/Pi0Analysis/EcalFlowNtp/src/%,%,$(wildcard $(foreach dir,src/Pi0Analysis/EcalFlowNtp/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
Pi0AnalysisEcalFlowNtp_BuildFile    := $(WORKINGDIR)/cache/bf/src/Pi0Analysis/EcalFlowNtp/BuildFile
Pi0AnalysisEcalFlowNtp_LOC_USE   := self FWCore/Framework FWCore/PluginManager FWCore/ParameterSet classlib root boost DataFormats/L1GlobalTrigger L1Trigger/GlobalTriggerAnalyzer CondFormats/L1TObjects CondFormats/DataRecord Geometry/Records Geometry/CaloGeometry DataFormats/Common DataFormats/DetId DataFormats/EcalDetId DataFormats/EcalRecHit DataFormats/EgammaReco DataFormats/EgammaCandidates DataFormats/HLTReco DataFormats/JetReco DataFormats/HcalIsolatedTrack DataFormats/RecoCandidate DataFormats/Candidate DataFormats/TrackReco DataFormats/FEDRawData FWCore/MessageLogger Geometry/CaloTopology HLTrigger/HLTcore RecoEcal/EgammaCoreTools RecoEcal/EgammaClusterAlgos CondFormats/EcalObjects Geometry/EcalAlgo Utilities/Timing rootphysics SimDataFormats/Track DataFormats/GeometryVector DataFormats/Math DataFormats/VertexReco RecoCaloTools/MetaCollections RecoCaloTools/Selectors TrackingTools/MaterialEffects TrackingTools/TrajectoryState DataFormats/GeometrySurface Geometry/TrackerGeometryBuilder MagneticField/Engine MagneticField/Records JetMETCorrections/Objects DataFormats/HcalRecHit DataFormats/HeavyIonEvent CondFormats/HIObjects CondCore/DBCommon CondCore/DBOutputService
Pi0AnalysisEcalFlowNtp_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,Pi0AnalysisEcalFlowNtp,Pi0AnalysisEcalFlowNtp,$(SCRAMSTORENAME_LIB)))
Pi0AnalysisEcalFlowNtp_PACKAGE := self/src/Pi0Analysis/EcalFlowNtp/src
ALL_PRODS += Pi0AnalysisEcalFlowNtp
Pi0AnalysisEcalFlowNtp_INIT_FUNC        += $$(eval $$(call Library,Pi0AnalysisEcalFlowNtp,src/Pi0Analysis/EcalFlowNtp/src,src_Pi0Analysis_EcalFlowNtp_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(Pi0AnalysisEcalFlowNtp_files_exts),$(Pi0AnalysisEcalFlowNtp_files_exts),$(SRC_FILES_SUFFIXES))))
endif
ifeq ($(strip $(RecoHI/HiCentralityAlgos)),)
ALL_COMMONRULES += src_RecoHI_HiCentralityAlgos_src
src_RecoHI_HiCentralityAlgos_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_RecoHI_HiCentralityAlgos_src,src/RecoHI/HiCentralityAlgos/src,LIBRARY))
RecoHIHiCentralityAlgos := self/RecoHI/HiCentralityAlgos
RecoHI/HiCentralityAlgos := RecoHIHiCentralityAlgos
RecoHIHiCentralityAlgos_files := $(patsubst src/RecoHI/HiCentralityAlgos/src/%,%,$(wildcard $(foreach dir,src/RecoHI/HiCentralityAlgos/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
RecoHIHiCentralityAlgos_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoHI/HiCentralityAlgos/BuildFile
RecoHIHiCentralityAlgos_LOC_USE   := self root rootrflx FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/Utilities CommonTools/UtilAlgos DataFormats/Candidate DataFormats/HcalRecHit DataFormats/Common DataFormats/HeavyIonEvent DataFormats/TrackingRecHit DataFormats/TrackerRecHit2D DataFormats/TrackReco DataFormats/VertexReco CondFormats/HIObjects CondFormats/DataRecord CondCore/DBCommon CondCore/DBOutputService CondCore/PopCon Geometry/CaloGeometry Geometry/TrackerGeometryBuilder
RecoHIHiCentralityAlgos_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoHIHiCentralityAlgos,RecoHIHiCentralityAlgos,$(SCRAMSTORENAME_LIB)))
RecoHIHiCentralityAlgos_PACKAGE := self/src/RecoHI/HiCentralityAlgos/src
ALL_PRODS += RecoHIHiCentralityAlgos
RecoHIHiCentralityAlgos_INIT_FUNC        += $$(eval $$(call Library,RecoHIHiCentralityAlgos,src/RecoHI/HiCentralityAlgos/src,src_RecoHI_HiCentralityAlgos_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(RecoHIHiCentralityAlgos_files_exts),$(RecoHIHiCentralityAlgos_files_exts),$(SRC_FILES_SUFFIXES))))
endif
ifeq ($(strip $(cmaguire/RpPbAnalysis)),)
ALL_COMMONRULES += src_cmaguire_RpPbAnalysis_src
src_cmaguire_RpPbAnalysis_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_cmaguire_RpPbAnalysis_src,src/cmaguire/RpPbAnalysis/src,LIBRARY))
cmaguireRpPbAnalysis := self/cmaguire/RpPbAnalysis
cmaguire/RpPbAnalysis := cmaguireRpPbAnalysis
cmaguireRpPbAnalysis_files := $(patsubst src/cmaguire/RpPbAnalysis/src/%,%,$(wildcard $(foreach dir,src/cmaguire/RpPbAnalysis/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
cmaguireRpPbAnalysis_BuildFile    := $(WORKINGDIR)/cache/bf/src/cmaguire/RpPbAnalysis/BuildFile
cmaguireRpPbAnalysis_LOC_USE   := self hepmc FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/MessageLogger FWCore/Utilities DataFormats/Common DataFormats/FEDRawData DataFormats/SiStripDetId DataFormats/TrackerRecHit2D DataFormats/SiPixelDetId DataFormats/DetId CondFormats/DataRecord CondFormats/SiStripObjects CalibFormats/SiStripObjects CalibTracker/Records FWCore/ServiceRegistry CommonTools/UtilAlgos DataFormats/SiStripCluster DataFormats/SiPixelCluster DataFormats/HeavyIonEvent DataFormats/TrackReco DataFormats/VertexReco DataFormats/HepMCCandidate DataFormats/Math DataFormats/Scalers
cmaguireRpPbAnalysis_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,cmaguireRpPbAnalysis,cmaguireRpPbAnalysis,$(SCRAMSTORENAME_LIB)))
cmaguireRpPbAnalysis_PACKAGE := self/src/cmaguire/RpPbAnalysis/src
ALL_PRODS += cmaguireRpPbAnalysis
cmaguireRpPbAnalysis_INIT_FUNC        += $$(eval $$(call Library,cmaguireRpPbAnalysis,src/cmaguire/RpPbAnalysis/src,src_cmaguire_RpPbAnalysis_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(cmaguireRpPbAnalysis_files_exts),$(cmaguireRpPbAnalysis_files_exts),$(SRC_FILES_SUFFIXES))))
endif
ifeq ($(strip $(Demo/DemoAnalyzer)),)
ALL_COMMONRULES += src_Demo_DemoAnalyzer_src
src_Demo_DemoAnalyzer_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_Demo_DemoAnalyzer_src,src/Demo/DemoAnalyzer/src,LIBRARY))
DemoDemoAnalyzer := self/Demo/DemoAnalyzer
Demo/DemoAnalyzer := DemoDemoAnalyzer
DemoDemoAnalyzer_files := $(patsubst src/Demo/DemoAnalyzer/src/%,%,$(wildcard $(foreach dir,src/Demo/DemoAnalyzer/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
DemoDemoAnalyzer_BuildFile    := $(WORKINGDIR)/cache/bf/src/Demo/DemoAnalyzer/BuildFile
DemoDemoAnalyzer_LOC_USE   := self FWCore/Framework FWCore/PluginManager FWCore/ParameterSet
DemoDemoAnalyzer_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,DemoDemoAnalyzer,DemoDemoAnalyzer,$(SCRAMSTORENAME_LIB)))
DemoDemoAnalyzer_PACKAGE := self/src/Demo/DemoAnalyzer/src
ALL_PRODS += DemoDemoAnalyzer
DemoDemoAnalyzer_INIT_FUNC        += $$(eval $$(call Library,DemoDemoAnalyzer,src/Demo/DemoAnalyzer/src,src_Demo_DemoAnalyzer_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(DemoDemoAnalyzer_files_exts),$(DemoDemoAnalyzer_files_exts),$(SRC_FILES_SUFFIXES))))
endif
