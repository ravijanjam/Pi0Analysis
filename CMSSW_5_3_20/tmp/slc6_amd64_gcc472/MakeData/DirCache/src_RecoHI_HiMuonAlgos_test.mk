ALL_COMMONRULES += src_RecoHI_HiMuonAlgos_test
src_RecoHI_HiMuonAlgos_test_parent := RecoHI/HiMuonAlgos
src_RecoHI_HiMuonAlgos_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiMuonAlgos_test,src/RecoHI/HiMuonAlgos/test,TEST))
