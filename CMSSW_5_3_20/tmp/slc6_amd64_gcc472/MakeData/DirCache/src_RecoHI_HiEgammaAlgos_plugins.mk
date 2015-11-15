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
