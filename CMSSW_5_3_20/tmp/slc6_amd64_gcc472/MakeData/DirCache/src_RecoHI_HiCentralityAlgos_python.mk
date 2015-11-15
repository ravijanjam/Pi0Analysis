ifeq ($(strip $(PyRecoHIHiCentralityAlgos)),)
PyRecoHIHiCentralityAlgos := self/src/RecoHI/HiCentralityAlgos/python
src_RecoHI_HiCentralityAlgos_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoHI/HiCentralityAlgos/python)
PyRecoHIHiCentralityAlgos_files := $(patsubst src/RecoHI/HiCentralityAlgos/python/%,%,$(wildcard $(foreach dir,src/RecoHI/HiCentralityAlgos/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyRecoHIHiCentralityAlgos_LOC_USE := self  
PyRecoHIHiCentralityAlgos_PACKAGE := self/src/RecoHI/HiCentralityAlgos/python
ALL_PRODS += PyRecoHIHiCentralityAlgos
PyRecoHIHiCentralityAlgos_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoHIHiCentralityAlgos,src/RecoHI/HiCentralityAlgos/python,src_RecoHI_HiCentralityAlgos_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoHIHiCentralityAlgos,src/RecoHI/HiCentralityAlgos/python))
endif
ALL_COMMONRULES += src_RecoHI_HiCentralityAlgos_python
src_RecoHI_HiCentralityAlgos_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiCentralityAlgos_python,src/RecoHI/HiCentralityAlgos/python,PYTHON))
