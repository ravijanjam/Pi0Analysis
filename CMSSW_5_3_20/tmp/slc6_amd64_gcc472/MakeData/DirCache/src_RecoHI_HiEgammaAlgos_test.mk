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
