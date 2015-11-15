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
