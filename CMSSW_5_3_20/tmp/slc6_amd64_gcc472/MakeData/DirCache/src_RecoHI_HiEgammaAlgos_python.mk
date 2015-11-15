ifeq ($(strip $(PyRecoHIHiEgammaAlgos)),)
PyRecoHIHiEgammaAlgos := self/src/RecoHI/HiEgammaAlgos/python
src_RecoHI_HiEgammaAlgos_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoHI/HiEgammaAlgos/python)
PyRecoHIHiEgammaAlgos_files := $(patsubst src/RecoHI/HiEgammaAlgos/python/%,%,$(wildcard $(foreach dir,src/RecoHI/HiEgammaAlgos/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyRecoHIHiEgammaAlgos_LOC_USE := self  
PyRecoHIHiEgammaAlgos_PACKAGE := self/src/RecoHI/HiEgammaAlgos/python
ALL_PRODS += PyRecoHIHiEgammaAlgos
PyRecoHIHiEgammaAlgos_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoHIHiEgammaAlgos,src/RecoHI/HiEgammaAlgos/python,src_RecoHI_HiEgammaAlgos_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoHIHiEgammaAlgos,src/RecoHI/HiEgammaAlgos/python))
endif
ALL_COMMONRULES += src_RecoHI_HiEgammaAlgos_python
src_RecoHI_HiEgammaAlgos_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiEgammaAlgos_python,src/RecoHI/HiEgammaAlgos/python,PYTHON))
