ifeq ($(strip $(PyRecoHIHiMuonAlgos)),)
PyRecoHIHiMuonAlgos := self/src/RecoHI/HiMuonAlgos/python
src_RecoHI_HiMuonAlgos_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoHI/HiMuonAlgos/python)
PyRecoHIHiMuonAlgos_files := $(patsubst src/RecoHI/HiMuonAlgos/python/%,%,$(wildcard $(foreach dir,src/RecoHI/HiMuonAlgos/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyRecoHIHiMuonAlgos_LOC_USE := self  
PyRecoHIHiMuonAlgos_PACKAGE := self/src/RecoHI/HiMuonAlgos/python
ALL_PRODS += PyRecoHIHiMuonAlgos
PyRecoHIHiMuonAlgos_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoHIHiMuonAlgos,src/RecoHI/HiMuonAlgos/python,src_RecoHI_HiMuonAlgos_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoHIHiMuonAlgos,src/RecoHI/HiMuonAlgos/python))
endif
ALL_COMMONRULES += src_RecoHI_HiMuonAlgos_python
src_RecoHI_HiMuonAlgos_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiMuonAlgos_python,src/RecoHI/HiMuonAlgos/python,PYTHON))
