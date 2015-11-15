ALL_COMMONRULES += src_RecoHI_HiCentralityAlgos_test
src_RecoHI_HiCentralityAlgos_test_parent := RecoHI/HiCentralityAlgos
src_RecoHI_HiCentralityAlgos_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiCentralityAlgos_test,src/RecoHI/HiCentralityAlgos/test,TEST))
