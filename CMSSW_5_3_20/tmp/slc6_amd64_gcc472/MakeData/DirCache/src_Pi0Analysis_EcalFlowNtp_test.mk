ALL_COMMONRULES += src_Pi0Analysis_EcalFlowNtp_test
src_Pi0Analysis_EcalFlowNtp_test_parent := Pi0Analysis/EcalFlowNtp
src_Pi0Analysis_EcalFlowNtp_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Pi0Analysis_EcalFlowNtp_test,src/Pi0Analysis/EcalFlowNtp/test,TEST))
