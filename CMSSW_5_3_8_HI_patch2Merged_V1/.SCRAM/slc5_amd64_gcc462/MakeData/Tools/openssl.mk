openssl             := openssl
ALL_TOOLS      += openssl
openssl_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/openssl/0.9.8e/include
openssl_EX_INCLUDE  := $(openssl_LOC_INCLUDE)
openssl_LOC_LIB := ssl crypto
openssl_EX_LIB  := $(openssl_LOC_LIB)
openssl_INIT_FUNC := $$(eval $$(call ProductCommonVars,openssl,,,openssl))

