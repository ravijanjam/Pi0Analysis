ifeq ($(strip $(PyHiAnalysisPi0Pi0Analysis_)),)
PyHiAnalysisPi0Pi0Analysis_ := self/src/HiAnalysisPi0/Pi0Analysis_/python
src_HiAnalysisPi0_Pi0Analysis__python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/HiAnalysisPi0/Pi0Analysis_/python)
PyHiAnalysisPi0Pi0Analysis__files := $(patsubst src/HiAnalysisPi0/Pi0Analysis_/python/%,%,$(wildcard $(foreach dir,src/HiAnalysisPi0/Pi0Analysis_/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyHiAnalysisPi0Pi0Analysis__LOC_USE := self  
PyHiAnalysisPi0Pi0Analysis__PACKAGE := self/src/HiAnalysisPi0/Pi0Analysis_/python
ALL_PRODS += PyHiAnalysisPi0Pi0Analysis_
PyHiAnalysisPi0Pi0Analysis__INIT_FUNC        += $$(eval $$(call PythonProduct,PyHiAnalysisPi0Pi0Analysis_,src/HiAnalysisPi0/Pi0Analysis_/python,src_HiAnalysisPi0_Pi0Analysis__python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyHiAnalysisPi0Pi0Analysis_,src/HiAnalysisPi0/Pi0Analysis_/python))
endif
ALL_COMMONRULES += src_HiAnalysisPi0_Pi0Analysis__python
src_HiAnalysisPi0_Pi0Analysis__python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HiAnalysisPi0_Pi0Analysis__python,src/HiAnalysisPi0/Pi0Analysis_/python,PYTHON))
