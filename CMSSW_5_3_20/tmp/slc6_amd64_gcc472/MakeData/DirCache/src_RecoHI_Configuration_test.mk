ALL_COMMONRULES += src_RecoHI_Configuration_test
src_RecoHI_Configuration_test_parent := RecoHI/Configuration
src_RecoHI_Configuration_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_Configuration_test,src/RecoHI/Configuration/test,TEST))
