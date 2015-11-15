frontier_client             := frontier_client
ALL_TOOLS      += frontier_client
frontier_client_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/frontier_client/2.8.5/include
frontier_client_EX_INCLUDE  := $(frontier_client_LOC_INCLUDE)
frontier_client_LOC_LIB := frontier_client
frontier_client_EX_LIB  := $(frontier_client_LOC_LIB)
frontier_client_LOC_USE := zlib openssl expat
frontier_client_EX_USE  := $(frontier_client_LOC_USE)
frontier_client_INIT_FUNC := $$(eval $$(call ProductCommonVars,frontier_client,,,frontier_client))

