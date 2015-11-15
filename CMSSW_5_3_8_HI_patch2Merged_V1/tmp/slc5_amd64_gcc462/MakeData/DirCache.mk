ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/CmsHi)
subdirs_src_CmsHi = src_CmsHi_Analysis2010 src_CmsHi_JetAnalysis
ALL_PACKAGES += $(patsubst src/%,%,src/CmsHi/Analysis2010)
subdirs_src_CmsHi_Analysis2010 := src_CmsHi_Analysis2010_data src_CmsHi_Analysis2010_macros src_CmsHi_Analysis2010_python src_CmsHi_Analysis2010_scripts src_CmsHi_Analysis2010_test
ifeq ($(strip $(PyCmsHiAnalysis2010)),)
PyCmsHiAnalysis2010 := self/src/CmsHi/Analysis2010/python
PyCmsHiAnalysis2010_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/CmsHi/Analysis2010/python)
ALL_PRODS += PyCmsHiAnalysis2010
PyCmsHiAnalysis2010_INIT_FUNC        += $$(eval $$(call PythonProduct,PyCmsHiAnalysis2010,src/CmsHi/Analysis2010/python,src_CmsHi_Analysis2010_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyCmsHiAnalysis2010,src/CmsHi/Analysis2010/python))
endif
ALL_COMMONRULES += src_CmsHi_Analysis2010_python
src_CmsHi_Analysis2010_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_CmsHi_Analysis2010_python,src/CmsHi/Analysis2010/python,PYTHON))
src_CmsHi_Analysis2010_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/CmsHi/Analysis2010/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_CmsHi_Analysis2010_scripts,src/CmsHi/Analysis2010/scripts,$(SCRAMSTORENAME_BIN),*))
ALL_COMMONRULES += src_CmsHi_Analysis2010_test
src_CmsHi_Analysis2010_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_CmsHi_Analysis2010_test,src/CmsHi/Analysis2010/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/CmsHi/JetAnalysis)
subdirs_src_CmsHi_JetAnalysis := src_CmsHi_JetAnalysis_bin src_CmsHi_JetAnalysis_data src_CmsHi_JetAnalysis_extras src_CmsHi_JetAnalysis_interface src_CmsHi_JetAnalysis_macros src_CmsHi_JetAnalysis_modifiedFiles src_CmsHi_JetAnalysis_python src_CmsHi_JetAnalysis_scripts src_CmsHi_JetAnalysis_src src_CmsHi_JetAnalysis_test
ALL_COMMONRULES += src_CmsHi_JetAnalysis_bin
src_CmsHi_JetAnalysis_bin_INIT_FUNC += $$(eval $$(call CommonProductRules,src_CmsHi_JetAnalysis_bin,src/CmsHi/JetAnalysis/bin,BINARY))
ifeq ($(strip $(PyCmsHiJetAnalysis)),)
PyCmsHiJetAnalysis := self/src/CmsHi/JetAnalysis/python
PyCmsHiJetAnalysis_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/CmsHi/JetAnalysis/python)
ALL_PRODS += PyCmsHiJetAnalysis
PyCmsHiJetAnalysis_INIT_FUNC        += $$(eval $$(call PythonProduct,PyCmsHiJetAnalysis,src/CmsHi/JetAnalysis/python,src_CmsHi_JetAnalysis_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyCmsHiJetAnalysis,src/CmsHi/JetAnalysis/python))
endif
ALL_COMMONRULES += src_CmsHi_JetAnalysis_python
src_CmsHi_JetAnalysis_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_CmsHi_JetAnalysis_python,src/CmsHi/JetAnalysis/python,PYTHON))
src_CmsHi_JetAnalysis_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/CmsHi/JetAnalysis/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_CmsHi_JetAnalysis_scripts,src/CmsHi/JetAnalysis/scripts,$(SCRAMSTORENAME_BIN),*))
ALL_COMMONRULES += src_CmsHi_JetAnalysis_test
src_CmsHi_JetAnalysis_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_CmsHi_JetAnalysis_test,src/CmsHi/JetAnalysis/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/CondFormats)
subdirs_src_CondFormats = src_CondFormats_HIObjects
ALL_PACKAGES += $(patsubst src/%,%,src/CondFormats/HIObjects)
subdirs_src_CondFormats_HIObjects := src_CondFormats_HIObjects_src src_CondFormats_HIObjects_test
ALL_COMMONRULES += src_CondFormats_HIObjects_test
src_CondFormats_HIObjects_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_CondFormats_HIObjects_test,src/CondFormats/HIObjects/test,TEST))
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
PyHeavyIonsAnalysisConfiguration_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/HeavyIonsAnalysis/Configuration/python)
ALL_PRODS += PyHeavyIonsAnalysisConfiguration
PyHeavyIonsAnalysisConfiguration_INIT_FUNC        += $$(eval $$(call PythonProduct,PyHeavyIonsAnalysisConfiguration,src/HeavyIonsAnalysis/Configuration/python,src_HeavyIonsAnalysis_Configuration_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyHeavyIonsAnalysisConfiguration,src/HeavyIonsAnalysis/Configuration/python))
endif
ALL_COMMONRULES += src_HeavyIonsAnalysis_Configuration_python
src_HeavyIonsAnalysis_Configuration_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_Configuration_python,src/HeavyIonsAnalysis/Configuration/python,PYTHON))
ALL_COMMONRULES += src_HeavyIonsAnalysis_Configuration_test
src_HeavyIonsAnalysis_Configuration_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_Configuration_test,src/HeavyIonsAnalysis/Configuration/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/Pi0Analysis)
subdirs_src_Pi0Analysis = src_Pi0Analysis_pPbRun2013 src_Pi0Analysis_EcalFlowNtp
ALL_PACKAGES += $(patsubst src/%,%,src/Pi0Analysis/EcalFlowNtp)
subdirs_src_Pi0Analysis_EcalFlowNtp := src_Pi0Analysis_EcalFlowNtp_python src_Pi0Analysis_EcalFlowNtp_src
ALL_PACKAGES += $(patsubst src/%,%,src/Pi0Analysis/pPbRun2013)
subdirs_src_Pi0Analysis_pPbRun2013 := 
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/RecoHI)
subdirs_src_RecoHI = src_RecoHI_HiCentralityAlgos
ALL_PACKAGES += $(patsubst src/%,%,src/RecoHI/HiCentralityAlgos)
subdirs_src_RecoHI_HiCentralityAlgos := src_RecoHI_HiCentralityAlgos_data src_RecoHI_HiCentralityAlgos_python src_RecoHI_HiCentralityAlgos_src src_RecoHI_HiCentralityAlgos_test
ifeq ($(strip $(PyRecoHIHiCentralityAlgos)),)
PyRecoHIHiCentralityAlgos := self/src/RecoHI/HiCentralityAlgos/python
PyRecoHIHiCentralityAlgos_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoHI/HiCentralityAlgos/python)
ALL_PRODS += PyRecoHIHiCentralityAlgos
PyRecoHIHiCentralityAlgos_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoHIHiCentralityAlgos,src/RecoHI/HiCentralityAlgos/python,src_RecoHI_HiCentralityAlgos_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoHIHiCentralityAlgos,src/RecoHI/HiCentralityAlgos/python))
endif
ALL_COMMONRULES += src_RecoHI_HiCentralityAlgos_python
src_RecoHI_HiCentralityAlgos_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiCentralityAlgos_python,src/RecoHI/HiCentralityAlgos/python,PYTHON))
ifeq ($(strip $(AnalyzerWithCentrality)),)
AnalyzerWithCentrality_files := $(patsubst src/RecoHI/HiCentralityAlgos/test/%,%,$(foreach file,AnalyzerWithCentrality.cc,$(eval xfile:=$(wildcard src/RecoHI/HiCentralityAlgos/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoHI/HiCentralityAlgos/test/$(file). Please fix src/RecoHI/HiCentralityAlgos/test/BuildFile.))))
AnalyzerWithCentrality_files_exts := $(sort $(patsubst .%,%,$(suffix $(AnalyzerWithCentrality_files))))
AnalyzerWithCentrality := self/src/RecoHI/HiCentralityAlgos/test
AnalyzerWithCentrality_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoHI/HiCentralityAlgos/test/BuildFile
AnalyzerWithCentrality_LOC_USE   := self root rootrflx FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/Utilities CommonTools/UtilAlgos DataFormats/Candidate DataFormats/HcalRecHit DataFormats/Common DataFormats/HeavyIonEvent CondFormats/HIObjects CondFormats/DataRecord CondCore/DBCommon CondCore/DBOutputService
AnalyzerWithCentrality_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,AnalyzerWithCentrality,AnalyzerWithCentrality,$(SCRAMSTORENAME_LIB)))
AnalyzerWithCentrality_PACKAGE := self/src/RecoHI/HiCentralityAlgos/test
ALL_PRODS += AnalyzerWithCentrality
AnalyzerWithCentrality_INIT_FUNC        += $$(eval $$(call Library,AnalyzerWithCentrality,src/RecoHI/HiCentralityAlgos/test,src_RecoHI_HiCentralityAlgos_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(AnalyzerWithCentrality_files_exts),$(AnalyzerWithCentrality_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,AnalyzerWithCentrality,src/RecoHI/HiCentralityAlgos/test))
endif
ALL_COMMONRULES += src_RecoHI_HiCentralityAlgos_test
src_RecoHI_HiCentralityAlgos_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiCentralityAlgos_test,src/RecoHI/HiCentralityAlgos/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/cmaguire)
subdirs_src_cmaguire = src_cmaguire_RpPbAnalysis
ALL_PACKAGES += $(patsubst src/%,%,src/cmaguire/RpPbAnalysis)
subdirs_src_cmaguire_RpPbAnalysis := src_cmaguire_RpPbAnalysis_python src_cmaguire_RpPbAnalysis_src
ifeq ($(strip $(PycmaguireRpPbAnalysis)),)
PycmaguireRpPbAnalysis := self/src/cmaguire/RpPbAnalysis/python
PycmaguireRpPbAnalysis_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/cmaguire/RpPbAnalysis/python)
ALL_PRODS += PycmaguireRpPbAnalysis
PycmaguireRpPbAnalysis_INIT_FUNC        += $$(eval $$(call PythonProduct,PycmaguireRpPbAnalysis,src/cmaguire/RpPbAnalysis/python,src_cmaguire_RpPbAnalysis_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PycmaguireRpPbAnalysis,src/cmaguire/RpPbAnalysis/python))
endif
ALL_COMMONRULES += src_cmaguire_RpPbAnalysis_python
src_cmaguire_RpPbAnalysis_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_cmaguire_RpPbAnalysis_python,src/cmaguire/RpPbAnalysis/python,PYTHON))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/Demo)
subdirs_src_Demo = src_Demo_DemoAnalyzer
ALL_PACKAGES += $(patsubst src/%,%,src/Demo/DemoAnalyzer)
subdirs_src_Demo_DemoAnalyzer := src_Demo_DemoAnalyzer_python src_Demo_DemoAnalyzer_test src_Demo_DemoAnalyzer_src
ifeq ($(strip $(PyDemoDemoAnalyzer)),)
PyDemoDemoAnalyzer := self/src/Demo/DemoAnalyzer/python
PyDemoDemoAnalyzer_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/Demo/DemoAnalyzer/python)
ALL_PRODS += PyDemoDemoAnalyzer
PyDemoDemoAnalyzer_INIT_FUNC        += $$(eval $$(call PythonProduct,PyDemoDemoAnalyzer,src/Demo/DemoAnalyzer/python,src_Demo_DemoAnalyzer_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyDemoDemoAnalyzer,src/Demo/DemoAnalyzer/python))
endif
ALL_COMMONRULES += src_Demo_DemoAnalyzer_python
src_Demo_DemoAnalyzer_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Demo_DemoAnalyzer_python,src/Demo/DemoAnalyzer/python,PYTHON))
ALL_COMMONRULES += src_Demo_DemoAnalyzer_test
src_Demo_DemoAnalyzer_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Demo_DemoAnalyzer_test,src/Demo/DemoAnalyzer/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/Sheldon)
subdirs_src_Sheldon = 
ifeq ($(strip $(PyPi0AnalysisEcalFlowNtp)),)
PyPi0AnalysisEcalFlowNtp := self/src/Pi0Analysis/EcalFlowNtp/python
PyPi0AnalysisEcalFlowNtp_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/Pi0Analysis/EcalFlowNtp/python)
ALL_PRODS += PyPi0AnalysisEcalFlowNtp
PyPi0AnalysisEcalFlowNtp_INIT_FUNC        += $$(eval $$(call PythonProduct,PyPi0AnalysisEcalFlowNtp,src/Pi0Analysis/EcalFlowNtp/python,src_Pi0Analysis_EcalFlowNtp_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyPi0AnalysisEcalFlowNtp,src/Pi0Analysis/EcalFlowNtp/python))
endif
ALL_COMMONRULES += src_Pi0Analysis_EcalFlowNtp_python
src_Pi0Analysis_EcalFlowNtp_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Pi0Analysis_EcalFlowNtp_python,src/Pi0Analysis/EcalFlowNtp/python,PYTHON))
