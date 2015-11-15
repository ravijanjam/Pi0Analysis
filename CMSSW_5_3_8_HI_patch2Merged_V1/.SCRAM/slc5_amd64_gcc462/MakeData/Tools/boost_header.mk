boost_header             := boost_header
ALL_TOOLS      += boost_header
boost_header_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/boost/1.47.0/include
boost_header_EX_INCLUDE  := $(boost_header_LOC_INCLUDE)
boost_header_INIT_FUNC := $$(eval $$(call ProductCommonVars,boost_header,,,boost_header))

