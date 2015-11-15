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
