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
