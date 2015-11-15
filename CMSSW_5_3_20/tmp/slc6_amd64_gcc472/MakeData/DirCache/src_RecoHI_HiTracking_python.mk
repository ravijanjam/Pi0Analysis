ifeq ($(strip $(PyRecoHIHiTracking)),)
PyRecoHIHiTracking := self/src/RecoHI/HiTracking/python
src_RecoHI_HiTracking_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoHI/HiTracking/python)
PyRecoHIHiTracking_files := $(patsubst src/RecoHI/HiTracking/python/%,%,$(wildcard $(foreach dir,src/RecoHI/HiTracking/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyRecoHIHiTracking_LOC_USE := self  
PyRecoHIHiTracking_PACKAGE := self/src/RecoHI/HiTracking/python
ALL_PRODS += PyRecoHIHiTracking
PyRecoHIHiTracking_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoHIHiTracking,src/RecoHI/HiTracking/python,src_RecoHI_HiTracking_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoHIHiTracking,src/RecoHI/HiTracking/python))
endif
ALL_COMMONRULES += src_RecoHI_HiTracking_python
src_RecoHI_HiTracking_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiTracking_python,src/RecoHI/HiTracking/python,PYTHON))
