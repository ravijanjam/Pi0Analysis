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
