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
