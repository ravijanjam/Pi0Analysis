curl             := curl
ALL_TOOLS      += curl
curl_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/curl/7.21.6/include
curl_EX_INCLUDE  := $(curl_LOC_INCLUDE)
curl_LOC_LIB := curl
curl_EX_LIB  := $(curl_LOC_LIB)
curl_INIT_FUNC := $$(eval $$(call ProductCommonVars,curl,,,curl))

