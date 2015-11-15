ifeq ($(strip $(PyPi0AnalysisEcalFlowNtp)),)
PyPi0AnalysisEcalFlowNtp := self/src/Pi0Analysis/EcalFlowNtp/python
PyPi0AnalysisEcalFlowNtp_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/Pi0Analysis/EcalFlowNtp/python)
ALL_PRODS += PyPi0AnalysisEcalFlowNtp
PyPi0AnalysisEcalFlowNtp_INIT_FUNC        += $$(eval $$(call PythonProduct,PyPi0AnalysisEcalFlowNtp,src/Pi0Analysis/EcalFlowNtp/python,src_Pi0Analysis_EcalFlowNtp_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyPi0AnalysisEcalFlowNtp,src/Pi0Analysis/EcalFlowNtp/python))
endif
ALL_COMMONRULES += src_Pi0Analysis_EcalFlowNtp_python
src_Pi0Analysis_EcalFlowNtp_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Pi0Analysis_EcalFlowNtp_python,src/Pi0Analysis/EcalFlowNtp/python,PYTHON))
