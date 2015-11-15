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
