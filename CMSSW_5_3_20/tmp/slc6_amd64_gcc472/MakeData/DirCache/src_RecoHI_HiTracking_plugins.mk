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
