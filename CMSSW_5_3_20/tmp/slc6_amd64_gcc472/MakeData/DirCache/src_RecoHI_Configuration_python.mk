ifeq ($(strip $(PyRecoHIConfiguration)),)
PyRecoHIConfiguration := self/src/RecoHI/Configuration/python
src_RecoHI_Configuration_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoHI/Configuration/python)
PyRecoHIConfiguration_files := $(patsubst src/RecoHI/Configuration/python/%,%,$(wildcard $(foreach dir,src/RecoHI/Configuration/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyRecoHIConfiguration_LOC_USE := self  
PyRecoHIConfiguration_PACKAGE := self/src/RecoHI/Configuration/python
ALL_PRODS += PyRecoHIConfiguration
PyRecoHIConfiguration_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoHIConfiguration,src/RecoHI/Configuration/python,src_RecoHI_Configuration_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoHIConfiguration,src/RecoHI/Configuration/python))
endif
ALL_COMMONRULES += src_RecoHI_Configuration_python
src_RecoHI_Configuration_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_Configuration_python,src/RecoHI/Configuration/python,PYTHON))
