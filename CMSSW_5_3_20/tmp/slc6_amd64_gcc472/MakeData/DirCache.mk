ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/DataFormats)
subdirs_src_DataFormats = src_DataFormats_HeavyIonEvent
ALL_PACKAGES += $(patsubst src/%,%,src/DataFormats/HeavyIonEvent)
subdirs_src_DataFormats_HeavyIonEvent := src_DataFormats_HeavyIonEvent_doc src_DataFormats_HeavyIonEvent_interface src_DataFormats_HeavyIonEvent_src
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/HeavyIonsAnalysis)
subdirs_src_HeavyIonsAnalysis = src_HeavyIonsAnalysis_Configuration
ALL_PACKAGES += $(patsubst src/%,%,src/HeavyIonsAnalysis/Configuration)
subdirs_src_HeavyIonsAnalysis_Configuration := src_HeavyIonsAnalysis_Configuration_data src_HeavyIonsAnalysis_Configuration_doc src_HeavyIonsAnalysis_Configuration_python src_HeavyIonsAnalysis_Configuration_test
ifeq ($(strip $(PyHeavyIonsAnalysisConfiguration)),)
PyHeavyIonsAnalysisConfiguration := self/src/HeavyIonsAnalysis/Configuration/python
src_HeavyIonsAnalysis_Configuration_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/HeavyIonsAnalysis/Configuration/python)
PyHeavyIonsAnalysisConfiguration_files := $(patsubst src/HeavyIonsAnalysis/Configuration/python/%,%,$(wildcard $(foreach dir,src/HeavyIonsAnalysis/Configuration/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyHeavyIonsAnalysisConfiguration_LOC_USE := self  
PyHeavyIonsAnalysisConfiguration_PACKAGE := self/src/HeavyIonsAnalysis/Configuration/python
ALL_PRODS += PyHeavyIonsAnalysisConfiguration
PyHeavyIonsAnalysisConfiguration_INIT_FUNC        += $$(eval $$(call PythonProduct,PyHeavyIonsAnalysisConfiguration,src/HeavyIonsAnalysis/Configuration/python,src_HeavyIonsAnalysis_Configuration_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyHeavyIonsAnalysisConfiguration,src/HeavyIonsAnalysis/Configuration/python))
endif
ALL_COMMONRULES += src_HeavyIonsAnalysis_Configuration_python
src_HeavyIonsAnalysis_Configuration_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_Configuration_python,src/HeavyIonsAnalysis/Configuration/python,PYTHON))
ALL_COMMONRULES += src_HeavyIonsAnalysis_Configuration_test
src_HeavyIonsAnalysis_Configuration_test_parent := HeavyIonsAnalysis/Configuration
src_HeavyIonsAnalysis_Configuration_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_Configuration_test,src/HeavyIonsAnalysis/Configuration/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/HiAnalysisPi0)
subdirs_src_HiAnalysisPi0 = src_HiAnalysisPi0_Pi0Analysis_
ALL_PACKAGES += $(patsubst src/%,%,src/HiAnalysisPi0/Pi0Analysis_)
subdirs_src_HiAnalysisPi0_Pi0Analysis_ := src_HiAnalysisPi0_Pi0Analysis__src src_HiAnalysisPi0_Pi0Analysis__test src_HiAnalysisPi0_Pi0Analysis__python
ifeq ($(strip $(PyHiAnalysisPi0Pi0Analysis_)),)
PyHiAnalysisPi0Pi0Analysis_ := self/src/HiAnalysisPi0/Pi0Analysis_/python
src_HiAnalysisPi0_Pi0Analysis__python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/HiAnalysisPi0/Pi0Analysis_/python)
PyHiAnalysisPi0Pi0Analysis__files := $(patsubst src/HiAnalysisPi0/Pi0Analysis_/python/%,%,$(wildcard $(foreach dir,src/HiAnalysisPi0/Pi0Analysis_/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyHiAnalysisPi0Pi0Analysis__LOC_USE := self  
PyHiAnalysisPi0Pi0Analysis__PACKAGE := self/src/HiAnalysisPi0/Pi0Analysis_/python
ALL_PRODS += PyHiAnalysisPi0Pi0Analysis_
PyHiAnalysisPi0Pi0Analysis__INIT_FUNC        += $$(eval $$(call PythonProduct,PyHiAnalysisPi0Pi0Analysis_,src/HiAnalysisPi0/Pi0Analysis_/python,src_HiAnalysisPi0_Pi0Analysis__python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyHiAnalysisPi0Pi0Analysis_,src/HiAnalysisPi0/Pi0Analysis_/python))
endif
ALL_COMMONRULES += src_HiAnalysisPi0_Pi0Analysis__python
src_HiAnalysisPi0_Pi0Analysis__python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HiAnalysisPi0_Pi0Analysis__python,src/HiAnalysisPi0/Pi0Analysis_/python,PYTHON))
ifeq ($(strip $(HiAnalysisPi0/Pi0Analysis_)),)
ALL_COMMONRULES += src_HiAnalysisPi0_Pi0Analysis__src
src_HiAnalysisPi0_Pi0Analysis__src_parent := HiAnalysisPi0/Pi0Analysis_
src_HiAnalysisPi0_Pi0Analysis__src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_HiAnalysisPi0_Pi0Analysis__src,src/HiAnalysisPi0/Pi0Analysis_/src,LIBRARY))
HiAnalysisPi0Pi0Analysis_ := self/HiAnalysisPi0/Pi0Analysis_
HiAnalysisPi0/Pi0Analysis_ := HiAnalysisPi0Pi0Analysis_
HiAnalysisPi0Pi0Analysis__files := $(patsubst src/HiAnalysisPi0/Pi0Analysis_/src/%,%,$(wildcard $(foreach dir,src/HiAnalysisPi0/Pi0Analysis_/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
HiAnalysisPi0Pi0Analysis__BuildFile    := $(WORKINGDIR)/cache/bf/src/HiAnalysisPi0/Pi0Analysis_/BuildFile
HiAnalysisPi0Pi0Analysis__LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet classlib root boost DataFormats/L1GlobalTrigger L1Trigger/GlobalTriggerAnalyzer CondFormats/L1TObjects CondFormats/DataRecord Geometry/Records Geometry/CaloGeometry DataFormats/Common DataFormats/DetId DataFormats/EcalDetId DataFormats/EcalRecHit DataFormats/EgammaReco DataFormats/EgammaCandidates DataFormats/HLTReco DataFormats/JetReco DataFormats/HcalIsolatedTrack DataFormats/RecoCandidate DataFormats/Candidate DataFormats/TrackReco DataFormats/FEDRawData FWCore/MessageLogger Geometry/CaloTopology HLTrigger/HLTcore RecoEcal/EgammaCoreTools RecoEcal/EgammaClusterAlgos CondFormats/EcalObjects Geometry/EcalAlgo Utilities/Timing rootphysics SimDataFormats/Track DataFormats/GeometryVector DataFormats/Math DataFormats/VertexReco RecoCaloTools/MetaCollections RecoCaloTools/Selectors TrackingTools/MaterialEffects TrackingTools/TrajectoryState DataFormats/GeometrySurface Geometry/TrackerGeometryBuilder MagneticField/Engine MagneticField/Records JetMETCorrections/Objects DataFormats/HcalRecHit DataFormats/HeavyIonEvent CondFormats/HIObjects CondCore/DBCommon CondCore/DBOutputService
HiAnalysisPi0Pi0Analysis__PRE_INIT_FUNC += $$(eval $$(call edmPlugin,HiAnalysisPi0Pi0Analysis_,HiAnalysisPi0Pi0Analysis_,$(SCRAMSTORENAME_LIB),src/HiAnalysisPi0/Pi0Analysis_/src))
HiAnalysisPi0Pi0Analysis__PACKAGE := self/src/HiAnalysisPi0/Pi0Analysis_/src
ALL_PRODS += HiAnalysisPi0Pi0Analysis_
HiAnalysisPi0Pi0Analysis__INIT_FUNC        += $$(eval $$(call Library,HiAnalysisPi0Pi0Analysis_,src/HiAnalysisPi0/Pi0Analysis_/src,src_HiAnalysisPi0_Pi0Analysis__src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_HiAnalysisPi0_Pi0Analysis__test
src_HiAnalysisPi0_Pi0Analysis__test_parent := HiAnalysisPi0/Pi0Analysis_
src_HiAnalysisPi0_Pi0Analysis__test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HiAnalysisPi0_Pi0Analysis__test,src/HiAnalysisPi0/Pi0Analysis_/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/Pi0Analysis)
subdirs_src_Pi0Analysis = src_Pi0Analysis_EcalFlowNtp src_Pi0Analysis_davidlw
ALL_PACKAGES += $(patsubst src/%,%,src/Pi0Analysis/EcalFlowNtp)
subdirs_src_Pi0Analysis_EcalFlowNtp := src_Pi0Analysis_EcalFlowNtp_python src_Pi0Analysis_EcalFlowNtp_src src_Pi0Analysis_EcalFlowNtp_test
ifeq ($(strip $(PyPi0AnalysisEcalFlowNtp)),)
PyPi0AnalysisEcalFlowNtp := self/src/Pi0Analysis/EcalFlowNtp/python
src_Pi0Analysis_EcalFlowNtp_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/Pi0Analysis/EcalFlowNtp/python)
PyPi0AnalysisEcalFlowNtp_files := $(patsubst src/Pi0Analysis/EcalFlowNtp/python/%,%,$(wildcard $(foreach dir,src/Pi0Analysis/EcalFlowNtp/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyPi0AnalysisEcalFlowNtp_LOC_USE := self  
PyPi0AnalysisEcalFlowNtp_PACKAGE := self/src/Pi0Analysis/EcalFlowNtp/python
ALL_PRODS += PyPi0AnalysisEcalFlowNtp
PyPi0AnalysisEcalFlowNtp_INIT_FUNC        += $$(eval $$(call PythonProduct,PyPi0AnalysisEcalFlowNtp,src/Pi0Analysis/EcalFlowNtp/python,src_Pi0Analysis_EcalFlowNtp_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyPi0AnalysisEcalFlowNtp,src/Pi0Analysis/EcalFlowNtp/python))
endif
ALL_COMMONRULES += src_Pi0Analysis_EcalFlowNtp_python
src_Pi0Analysis_EcalFlowNtp_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Pi0Analysis_EcalFlowNtp_python,src/Pi0Analysis/EcalFlowNtp/python,PYTHON))
ifeq ($(strip $(Pi0Analysis/EcalFlowNtp)),)
ALL_COMMONRULES += src_Pi0Analysis_EcalFlowNtp_src
src_Pi0Analysis_EcalFlowNtp_src_parent := Pi0Analysis/EcalFlowNtp
src_Pi0Analysis_EcalFlowNtp_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_Pi0Analysis_EcalFlowNtp_src,src/Pi0Analysis/EcalFlowNtp/src,LIBRARY))
Pi0AnalysisEcalFlowNtp := self/Pi0Analysis/EcalFlowNtp
Pi0Analysis/EcalFlowNtp := Pi0AnalysisEcalFlowNtp
Pi0AnalysisEcalFlowNtp_files := $(patsubst src/Pi0Analysis/EcalFlowNtp/src/%,%,$(wildcard $(foreach dir,src/Pi0Analysis/EcalFlowNtp/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
Pi0AnalysisEcalFlowNtp_BuildFile    := $(WORKINGDIR)/cache/bf/src/Pi0Analysis/EcalFlowNtp/BuildFile
Pi0AnalysisEcalFlowNtp_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet classlib root boost DataFormats/L1GlobalTrigger L1Trigger/GlobalTriggerAnalyzer CondFormats/L1TObjects CondFormats/DataRecord Geometry/Records Geometry/CaloGeometry DataFormats/Common DataFormats/DetId DataFormats/EcalDetId DataFormats/EcalRecHit DataFormats/EgammaReco DataFormats/EgammaCandidates DataFormats/HLTReco DataFormats/JetReco DataFormats/HcalIsolatedTrack DataFormats/RecoCandidate DataFormats/Candidate DataFormats/TrackReco DataFormats/FEDRawData FWCore/MessageLogger Geometry/CaloTopology HLTrigger/HLTcore RecoEcal/EgammaCoreTools RecoEcal/EgammaClusterAlgos CondFormats/EcalObjects Geometry/EcalAlgo Utilities/Timing rootphysics SimDataFormats/Track DataFormats/GeometryVector DataFormats/Math DataFormats/VertexReco RecoCaloTools/MetaCollections RecoCaloTools/Selectors TrackingTools/MaterialEffects TrackingTools/TrajectoryState DataFormats/GeometrySurface Geometry/TrackerGeometryBuilder MagneticField/Engine MagneticField/Records JetMETCorrections/Objects DataFormats/HcalRecHit DataFormats/HeavyIonEvent CondFormats/HIObjects CondCore/DBCommon CondCore/DBOutputService
Pi0AnalysisEcalFlowNtp_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,Pi0AnalysisEcalFlowNtp,Pi0AnalysisEcalFlowNtp,$(SCRAMSTORENAME_LIB),src/Pi0Analysis/EcalFlowNtp/src))
Pi0AnalysisEcalFlowNtp_PACKAGE := self/src/Pi0Analysis/EcalFlowNtp/src
ALL_PRODS += Pi0AnalysisEcalFlowNtp
Pi0AnalysisEcalFlowNtp_INIT_FUNC        += $$(eval $$(call Library,Pi0AnalysisEcalFlowNtp,src/Pi0Analysis/EcalFlowNtp/src,src_Pi0Analysis_EcalFlowNtp_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_Pi0Analysis_EcalFlowNtp_test
src_Pi0Analysis_EcalFlowNtp_test_parent := Pi0Analysis/EcalFlowNtp
src_Pi0Analysis_EcalFlowNtp_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Pi0Analysis_EcalFlowNtp_test,src/Pi0Analysis/EcalFlowNtp/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/Pi0Analysis/davidlw)
subdirs_src_Pi0Analysis_davidlw := src_Pi0Analysis_davidlw_CorrAnaExample
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/RecoHI)
subdirs_src_RecoHI = src_RecoHI_HiCentralityAlgos src_RecoHI_Configuration src_RecoHI_HiEgammaAlgos src_RecoHI_HiEvtPlaneAlgos src_RecoHI_HiMuonAlgos src_RecoHI_HiTracking
ALL_PACKAGES += $(patsubst src/%,%,src/RecoHI/Configuration)
subdirs_src_RecoHI_Configuration := src_RecoHI_Configuration_python src_RecoHI_Configuration_test
ifeq ($(strip $(PyRecoHIConfiguration)),)
PyRecoHIConfiguration := self/src/RecoHI/Configuration/python
src_RecoHI_Configuration_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoHI/Configuration/python)
PyRecoHIConfiguration_files := $(patsubst src/RecoHI/Configuration/python/%,%,$(wildcard $(foreach dir,src/RecoHI/Configuration/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyRecoHIConfiguration_LOC_USE := self  
PyRecoHIConfiguration_PACKAGE := self/src/RecoHI/Configuration/python
ALL_PRODS += PyRecoHIConfiguration
PyRecoHIConfiguration_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoHIConfiguration,src/RecoHI/Configuration/python,src_RecoHI_Configuration_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoHIConfiguration,src/RecoHI/Configuration/python))
endif
ALL_COMMONRULES += src_RecoHI_Configuration_python
src_RecoHI_Configuration_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_Configuration_python,src/RecoHI/Configuration/python,PYTHON))
ALL_COMMONRULES += src_RecoHI_Configuration_test
src_RecoHI_Configuration_test_parent := RecoHI/Configuration
src_RecoHI_Configuration_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_Configuration_test,src/RecoHI/Configuration/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/RecoHI/HiCentralityAlgos)
subdirs_src_RecoHI_HiCentralityAlgos := src_RecoHI_HiCentralityAlgos_data src_RecoHI_HiCentralityAlgos_plugins src_RecoHI_HiCentralityAlgos_python src_RecoHI_HiCentralityAlgos_src src_RecoHI_HiCentralityAlgos_test
ifeq ($(strip $(HiCentralityPlugins)),)
HiCentralityPlugins_files := $(patsubst src/RecoHI/HiCentralityAlgos/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/RecoHI/HiCentralityAlgos/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoHI/HiCentralityAlgos/plugins/$(file). Please fix src/RecoHI/HiCentralityAlgos/plugins/BuildFile.))))
HiCentralityPlugins := self/src/RecoHI/HiCentralityAlgos/plugins
HiCentralityPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoHI/HiCentralityAlgos/plugins/BuildFile
HiCentralityPlugins_LOC_USE := self  RecoHI/HiCentralityAlgos
HiCentralityPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,HiCentralityPlugins,HiCentralityPlugins,$(SCRAMSTORENAME_LIB),src/RecoHI/HiCentralityAlgos/plugins))
HiCentralityPlugins_PACKAGE := self/src/RecoHI/HiCentralityAlgos/plugins
ALL_PRODS += HiCentralityPlugins
HiCentralityPlugins_INIT_FUNC        += $$(eval $$(call Library,HiCentralityPlugins,src/RecoHI/HiCentralityAlgos/plugins,src_RecoHI_HiCentralityAlgos_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,HiCentralityPlugins,src/RecoHI/HiCentralityAlgos/plugins))
endif
ALL_COMMONRULES += src_RecoHI_HiCentralityAlgos_plugins
src_RecoHI_HiCentralityAlgos_plugins_parent := RecoHI/HiCentralityAlgos
src_RecoHI_HiCentralityAlgos_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiCentralityAlgos_plugins,src/RecoHI/HiCentralityAlgos/plugins,PLUGINS))
ifeq ($(strip $(PyRecoHIHiCentralityAlgos)),)
PyRecoHIHiCentralityAlgos := self/src/RecoHI/HiCentralityAlgos/python
src_RecoHI_HiCentralityAlgos_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoHI/HiCentralityAlgos/python)
PyRecoHIHiCentralityAlgos_files := $(patsubst src/RecoHI/HiCentralityAlgos/python/%,%,$(wildcard $(foreach dir,src/RecoHI/HiCentralityAlgos/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyRecoHIHiCentralityAlgos_LOC_USE := self  
PyRecoHIHiCentralityAlgos_PACKAGE := self/src/RecoHI/HiCentralityAlgos/python
ALL_PRODS += PyRecoHIHiCentralityAlgos
PyRecoHIHiCentralityAlgos_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoHIHiCentralityAlgos,src/RecoHI/HiCentralityAlgos/python,src_RecoHI_HiCentralityAlgos_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoHIHiCentralityAlgos,src/RecoHI/HiCentralityAlgos/python))
endif
ALL_COMMONRULES += src_RecoHI_HiCentralityAlgos_python
src_RecoHI_HiCentralityAlgos_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiCentralityAlgos_python,src/RecoHI/HiCentralityAlgos/python,PYTHON))
ALL_COMMONRULES += src_RecoHI_HiCentralityAlgos_test
src_RecoHI_HiCentralityAlgos_test_parent := RecoHI/HiCentralityAlgos
src_RecoHI_HiCentralityAlgos_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiCentralityAlgos_test,src/RecoHI/HiCentralityAlgos/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/RecoHI/HiEgammaAlgos)
subdirs_src_RecoHI_HiEgammaAlgos := src_RecoHI_HiEgammaAlgos_doc src_RecoHI_HiEgammaAlgos_plugins src_RecoHI_HiEgammaAlgos_python src_RecoHI_HiEgammaAlgos_src src_RecoHI_HiEgammaAlgos_test
ifeq ($(strip $(RecoHIHiEgammaAlgosPlugins)),)
RecoHIHiEgammaAlgosPlugins_files := $(patsubst src/RecoHI/HiEgammaAlgos/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/RecoHI/HiEgammaAlgos/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoHI/HiEgammaAlgos/plugins/$(file). Please fix src/RecoHI/HiEgammaAlgos/plugins/BuildFile.))))
RecoHIHiEgammaAlgosPlugins := self/src/RecoHI/HiEgammaAlgos/plugins
RecoHIHiEgammaAlgosPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoHI/HiEgammaAlgos/plugins/BuildFile
RecoHIHiEgammaAlgosPlugins_LOC_USE := self  FWCore/Framework FWCore/ParameterSet FWCore/Utilities FWCore/ServiceRegistry DataFormats/Common DataFormats/BTauReco DataFormats/EgammaCandidates RecoHI/HiEgammaAlgos RecoLocalCalo/EcalRecAlgos RecoEcal/EgammaCoreTools CondFormats/DataRecord CondFormats/EcalObjects FWCore/MessageLogger  root
RecoHIHiEgammaAlgosPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoHIHiEgammaAlgosPlugins,RecoHIHiEgammaAlgosPlugins,$(SCRAMSTORENAME_LIB),src/RecoHI/HiEgammaAlgos/plugins))
RecoHIHiEgammaAlgosPlugins_PACKAGE := self/src/RecoHI/HiEgammaAlgos/plugins
ALL_PRODS += RecoHIHiEgammaAlgosPlugins
RecoHIHiEgammaAlgosPlugins_INIT_FUNC        += $$(eval $$(call Library,RecoHIHiEgammaAlgosPlugins,src/RecoHI/HiEgammaAlgos/plugins,src_RecoHI_HiEgammaAlgos_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,RecoHIHiEgammaAlgosPlugins,src/RecoHI/HiEgammaAlgos/plugins))
endif
ALL_COMMONRULES += src_RecoHI_HiEgammaAlgos_plugins
src_RecoHI_HiEgammaAlgos_plugins_parent := RecoHI/HiEgammaAlgos
src_RecoHI_HiEgammaAlgos_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiEgammaAlgos_plugins,src/RecoHI/HiEgammaAlgos/plugins,PLUGINS))
ifeq ($(strip $(PyRecoHIHiEgammaAlgos)),)
PyRecoHIHiEgammaAlgos := self/src/RecoHI/HiEgammaAlgos/python
src_RecoHI_HiEgammaAlgos_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoHI/HiEgammaAlgos/python)
PyRecoHIHiEgammaAlgos_files := $(patsubst src/RecoHI/HiEgammaAlgos/python/%,%,$(wildcard $(foreach dir,src/RecoHI/HiEgammaAlgos/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyRecoHIHiEgammaAlgos_LOC_USE := self  
PyRecoHIHiEgammaAlgos_PACKAGE := self/src/RecoHI/HiEgammaAlgos/python
ALL_PRODS += PyRecoHIHiEgammaAlgos
PyRecoHIHiEgammaAlgos_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoHIHiEgammaAlgos,src/RecoHI/HiEgammaAlgos/python,src_RecoHI_HiEgammaAlgos_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoHIHiEgammaAlgos,src/RecoHI/HiEgammaAlgos/python))
endif
ALL_COMMONRULES += src_RecoHI_HiEgammaAlgos_python
src_RecoHI_HiEgammaAlgos_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiEgammaAlgos_python,src/RecoHI/HiEgammaAlgos/python,PYTHON))
ifeq ($(strip $(RecoHIHiEgammaAlgos_testAnalyzers)),)
RecoHIHiEgammaAlgos_testAnalyzers_files := $(patsubst src/RecoHI/HiEgammaAlgos/test/%,%,$(foreach file,patTest/*.cc,$(eval xfile:=$(wildcard src/RecoHI/HiEgammaAlgos/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoHI/HiEgammaAlgos/test/$(file). Please fix src/RecoHI/HiEgammaAlgos/test/BuildFile.))))
RecoHIHiEgammaAlgos_testAnalyzers := self/src/RecoHI/HiEgammaAlgos/test
RecoHIHiEgammaAlgos_testAnalyzers_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoHI/HiEgammaAlgos/test/BuildFile
RecoHIHiEgammaAlgos_testAnalyzers_LOC_USE := self  FWCore/Framework FWCore/ParameterSet DataFormats/BTauReco PhysicsTools/PatUtils CommonTools/UtilAlgos DataFormats/PatCandidates root
RecoHIHiEgammaAlgos_testAnalyzers_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoHIHiEgammaAlgos_testAnalyzers,RecoHIHiEgammaAlgos_testAnalyzers,$(SCRAMSTORENAME_LIB),src/RecoHI/HiEgammaAlgos/test))
RecoHIHiEgammaAlgos_testAnalyzers_PACKAGE := self/src/RecoHI/HiEgammaAlgos/test
ALL_PRODS += RecoHIHiEgammaAlgos_testAnalyzers
RecoHIHiEgammaAlgos_testAnalyzers_INIT_FUNC        += $$(eval $$(call Library,RecoHIHiEgammaAlgos_testAnalyzers,src/RecoHI/HiEgammaAlgos/test,src_RecoHI_HiEgammaAlgos_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,RecoHIHiEgammaAlgos_testAnalyzers,src/RecoHI/HiEgammaAlgos/test))
endif
ALL_COMMONRULES += src_RecoHI_HiEgammaAlgos_test
src_RecoHI_HiEgammaAlgos_test_parent := RecoHI/HiEgammaAlgos
src_RecoHI_HiEgammaAlgos_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiEgammaAlgos_test,src/RecoHI/HiEgammaAlgos/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/RecoHI/HiEvtPlaneAlgos)
subdirs_src_RecoHI_HiEvtPlaneAlgos := src_RecoHI_HiEvtPlaneAlgos_python src_RecoHI_HiEvtPlaneAlgos_src src_RecoHI_HiEvtPlaneAlgos_test
ifeq ($(strip $(PyRecoHIHiEvtPlaneAlgos)),)
PyRecoHIHiEvtPlaneAlgos := self/src/RecoHI/HiEvtPlaneAlgos/python
src_RecoHI_HiEvtPlaneAlgos_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoHI/HiEvtPlaneAlgos/python)
PyRecoHIHiEvtPlaneAlgos_files := $(patsubst src/RecoHI/HiEvtPlaneAlgos/python/%,%,$(wildcard $(foreach dir,src/RecoHI/HiEvtPlaneAlgos/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyRecoHIHiEvtPlaneAlgos_LOC_USE := self  
PyRecoHIHiEvtPlaneAlgos_PACKAGE := self/src/RecoHI/HiEvtPlaneAlgos/python
ALL_PRODS += PyRecoHIHiEvtPlaneAlgos
PyRecoHIHiEvtPlaneAlgos_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoHIHiEvtPlaneAlgos,src/RecoHI/HiEvtPlaneAlgos/python,src_RecoHI_HiEvtPlaneAlgos_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoHIHiEvtPlaneAlgos,src/RecoHI/HiEvtPlaneAlgos/python))
endif
ALL_COMMONRULES += src_RecoHI_HiEvtPlaneAlgos_python
src_RecoHI_HiEvtPlaneAlgos_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiEvtPlaneAlgos_python,src/RecoHI/HiEvtPlaneAlgos/python,PYTHON))
ifeq ($(strip $(RecoHI/HiEvtPlaneAlgos)),)
ALL_COMMONRULES += src_RecoHI_HiEvtPlaneAlgos_src
src_RecoHI_HiEvtPlaneAlgos_src_parent := RecoHI/HiEvtPlaneAlgos
src_RecoHI_HiEvtPlaneAlgos_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_RecoHI_HiEvtPlaneAlgos_src,src/RecoHI/HiEvtPlaneAlgos/src,LIBRARY))
RecoHIHiEvtPlaneAlgos := self/RecoHI/HiEvtPlaneAlgos
RecoHI/HiEvtPlaneAlgos := RecoHIHiEvtPlaneAlgos
RecoHIHiEvtPlaneAlgos_files := $(patsubst src/RecoHI/HiEvtPlaneAlgos/src/%,%,$(wildcard $(foreach dir,src/RecoHI/HiEvtPlaneAlgos/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
RecoHIHiEvtPlaneAlgos_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoHI/HiEvtPlaneAlgos/BuildFile
RecoHIHiEvtPlaneAlgos_LOC_USE := self  root rootrflx FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/Utilities PhysicsTools/UtilAlgos DataFormats/Candidate DataFormats/HcalRecHit DataFormats/WrappedStdDictionaries Geometry/Records DataFormats/HepMCCandidate DataFormats/TrackReco DataFormats/VertexReco DataFormats/Common DataFormats/HeavyIonEvent DataFormats/CaloTowers DataFormats/Provenance CondCore/DBCommon CondCore/DBOutputService CondFormats/DataRecord RecoHI/HiCentralityAlgos clhep
RecoHIHiEvtPlaneAlgos_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoHIHiEvtPlaneAlgos,RecoHIHiEvtPlaneAlgos,$(SCRAMSTORENAME_LIB),src/RecoHI/HiEvtPlaneAlgos/src))
RecoHIHiEvtPlaneAlgos_PACKAGE := self/src/RecoHI/HiEvtPlaneAlgos/src
ALL_PRODS += RecoHIHiEvtPlaneAlgos
RecoHIHiEvtPlaneAlgos_INIT_FUNC        += $$(eval $$(call Library,RecoHIHiEvtPlaneAlgos,src/RecoHI/HiEvtPlaneAlgos/src,src_RecoHI_HiEvtPlaneAlgos_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_RecoHI_HiEvtPlaneAlgos_test
src_RecoHI_HiEvtPlaneAlgos_test_parent := RecoHI/HiEvtPlaneAlgos
src_RecoHI_HiEvtPlaneAlgos_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiEvtPlaneAlgos_test,src/RecoHI/HiEvtPlaneAlgos/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/RecoHI/HiMuonAlgos)
subdirs_src_RecoHI_HiMuonAlgos := src_RecoHI_HiMuonAlgos_plugins src_RecoHI_HiMuonAlgos_python src_RecoHI_HiMuonAlgos_src src_RecoHI_HiMuonAlgos_test
ifeq ($(strip $(RecoHIHiMuonAlgosPlugins)),)
RecoHIHiMuonAlgosPlugins_files := $(patsubst src/RecoHI/HiMuonAlgos/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/RecoHI/HiMuonAlgos/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoHI/HiMuonAlgos/plugins/$(file). Please fix src/RecoHI/HiMuonAlgos/plugins/BuildFile.))))
RecoHIHiMuonAlgosPlugins := self/src/RecoHI/HiMuonAlgos/plugins
RecoHIHiMuonAlgosPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoHI/HiMuonAlgos/plugins/BuildFile
RecoHIHiMuonAlgosPlugins_LOC_USE := self  boost rootrflx FWCore/Framework FWCore/PluginManager FWCore/ParameterSet Geometry/Records Geometry/TrackerGeometryBuilder RecoTracker/Record MagneticField/Records MagneticField/Engine DataFormats/VertexReco DataFormats/Common TrackingTools/TrajectoryState TrackingTools/GeomPropagators TrackingTools/DetLayers DataFormats/TrajectorySeed TrackingTools/MeasurementDet RecoTracker/MeasurementDet RecoTracker/TkNavigation TrackingTools/TrajectoryFiltering TrackingTools/TrajectoryCleaning TrackingTools/MaterialEffects TrackingTools/TrackFitters RecoVertex/KalmanVertexFit RecoVertex/VertexPrimitives TrackingTools/TransientTrack HLTrigger/HLTcore RecoMuon/GlobalTrackingTools RecoMuon/TrackingTools hepmc RecoHI/HiMuonAlgos
RecoHIHiMuonAlgosPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoHIHiMuonAlgosPlugins,RecoHIHiMuonAlgosPlugins,$(SCRAMSTORENAME_LIB),src/RecoHI/HiMuonAlgos/plugins))
RecoHIHiMuonAlgosPlugins_PACKAGE := self/src/RecoHI/HiMuonAlgos/plugins
ALL_PRODS += RecoHIHiMuonAlgosPlugins
RecoHIHiMuonAlgosPlugins_INIT_FUNC        += $$(eval $$(call Library,RecoHIHiMuonAlgosPlugins,src/RecoHI/HiMuonAlgos/plugins,src_RecoHI_HiMuonAlgos_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,RecoHIHiMuonAlgosPlugins,src/RecoHI/HiMuonAlgos/plugins))
endif
ALL_COMMONRULES += src_RecoHI_HiMuonAlgos_plugins
src_RecoHI_HiMuonAlgos_plugins_parent := RecoHI/HiMuonAlgos
src_RecoHI_HiMuonAlgos_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiMuonAlgos_plugins,src/RecoHI/HiMuonAlgos/plugins,PLUGINS))
ifeq ($(strip $(PyRecoHIHiMuonAlgos)),)
PyRecoHIHiMuonAlgos := self/src/RecoHI/HiMuonAlgos/python
src_RecoHI_HiMuonAlgos_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoHI/HiMuonAlgos/python)
PyRecoHIHiMuonAlgos_files := $(patsubst src/RecoHI/HiMuonAlgos/python/%,%,$(wildcard $(foreach dir,src/RecoHI/HiMuonAlgos/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyRecoHIHiMuonAlgos_LOC_USE := self  
PyRecoHIHiMuonAlgos_PACKAGE := self/src/RecoHI/HiMuonAlgos/python
ALL_PRODS += PyRecoHIHiMuonAlgos
PyRecoHIHiMuonAlgos_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoHIHiMuonAlgos,src/RecoHI/HiMuonAlgos/python,src_RecoHI_HiMuonAlgos_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoHIHiMuonAlgos,src/RecoHI/HiMuonAlgos/python))
endif
ALL_COMMONRULES += src_RecoHI_HiMuonAlgos_python
src_RecoHI_HiMuonAlgos_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiMuonAlgos_python,src/RecoHI/HiMuonAlgos/python,PYTHON))
ALL_COMMONRULES += src_RecoHI_HiMuonAlgos_test
src_RecoHI_HiMuonAlgos_test_parent := RecoHI/HiMuonAlgos
src_RecoHI_HiMuonAlgos_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiMuonAlgos_test,src/RecoHI/HiMuonAlgos/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/RecoHI/HiTracking)
subdirs_src_RecoHI_HiTracking := src_RecoHI_HiTracking_interface src_RecoHI_HiTracking_plugins src_RecoHI_HiTracking_python src_RecoHI_HiTracking_src src_RecoHI_HiTracking_test
ifeq ($(strip $(RecoHIHiTrackingPlugins)),)
RecoHIHiTrackingPlugins_files := $(patsubst src/RecoHI/HiTracking/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/RecoHI/HiTracking/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoHI/HiTracking/plugins/$(file). Please fix src/RecoHI/HiTracking/plugins/BuildFile.))))
RecoHIHiTrackingPlugins := self/src/RecoHI/HiTracking/plugins
RecoHIHiTrackingPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoHI/HiTracking/plugins/BuildFile
RecoHIHiTrackingPlugins_LOC_USE := self  RecoHI/HiTracking RecoPixelVertexing/PixelLowPtUtilities
RecoHIHiTrackingPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoHIHiTrackingPlugins,RecoHIHiTrackingPlugins,$(SCRAMSTORENAME_LIB),src/RecoHI/HiTracking/plugins))
RecoHIHiTrackingPlugins_PACKAGE := self/src/RecoHI/HiTracking/plugins
ALL_PRODS += RecoHIHiTrackingPlugins
RecoHIHiTrackingPlugins_INIT_FUNC        += $$(eval $$(call Library,RecoHIHiTrackingPlugins,src/RecoHI/HiTracking/plugins,src_RecoHI_HiTracking_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,RecoHIHiTrackingPlugins,src/RecoHI/HiTracking/plugins))
endif
ALL_COMMONRULES += src_RecoHI_HiTracking_plugins
src_RecoHI_HiTracking_plugins_parent := RecoHI/HiTracking
src_RecoHI_HiTracking_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiTracking_plugins,src/RecoHI/HiTracking/plugins,PLUGINS))
ifeq ($(strip $(PyRecoHIHiTracking)),)
PyRecoHIHiTracking := self/src/RecoHI/HiTracking/python
src_RecoHI_HiTracking_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoHI/HiTracking/python)
PyRecoHIHiTracking_files := $(patsubst src/RecoHI/HiTracking/python/%,%,$(wildcard $(foreach dir,src/RecoHI/HiTracking/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyRecoHIHiTracking_LOC_USE := self  
PyRecoHIHiTracking_PACKAGE := self/src/RecoHI/HiTracking/python
ALL_PRODS += PyRecoHIHiTracking
PyRecoHIHiTracking_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoHIHiTracking,src/RecoHI/HiTracking/python,src_RecoHI_HiTracking_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoHIHiTracking,src/RecoHI/HiTracking/python))
endif
ALL_COMMONRULES += src_RecoHI_HiTracking_python
src_RecoHI_HiTracking_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiTracking_python,src/RecoHI/HiTracking/python,PYTHON))
ifeq ($(strip $(RecoHIHiTrackingTest)),)
RecoHIHiTrackingTest_files := $(patsubst src/RecoHI/HiTracking/test/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/RecoHI/HiTracking/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoHI/HiTracking/test/$(file). Please fix src/RecoHI/HiTracking/test/BuildFile.))))
RecoHIHiTrackingTest := self/src/RecoHI/HiTracking/test
RecoHIHiTrackingTest_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoHI/HiTracking/test/BuildFile
RecoHIHiTrackingTest_LOC_USE := self  root RecoHI/HiTracking RecoPixelVertexing/PixelLowPtUtilities CommonTools/UtilAlgos
RecoHIHiTrackingTest_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoHIHiTrackingTest,RecoHIHiTrackingTest,$(SCRAMSTORENAME_LIB),src/RecoHI/HiTracking/test))
RecoHIHiTrackingTest_PACKAGE := self/src/RecoHI/HiTracking/test
ALL_PRODS += RecoHIHiTrackingTest
RecoHIHiTrackingTest_INIT_FUNC        += $$(eval $$(call Library,RecoHIHiTrackingTest,src/RecoHI/HiTracking/test,src_RecoHI_HiTracking_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,RecoHIHiTrackingTest,src/RecoHI/HiTracking/test))
endif
ALL_COMMONRULES += src_RecoHI_HiTracking_test
src_RecoHI_HiTracking_test_parent := RecoHI/HiTracking
src_RecoHI_HiTracking_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiTracking_test,src/RecoHI/HiTracking/test,TEST))
