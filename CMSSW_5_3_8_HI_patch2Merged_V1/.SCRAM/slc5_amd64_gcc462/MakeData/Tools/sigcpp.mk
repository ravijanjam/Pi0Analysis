sigcpp             := sigcpp
ALL_TOOLS      += sigcpp
sigcpp_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/sigcpp/2.2.10/include/sigc++-2.0
sigcpp_EX_INCLUDE  := $(sigcpp_LOC_INCLUDE)
sigcpp_LOC_LIB := sigc-2.0
sigcpp_EX_LIB  := $(sigcpp_LOC_LIB)
sigcpp_INIT_FUNC := $$(eval $$(call ProductCommonVars,sigcpp,,,sigcpp))

