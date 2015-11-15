meschach             := meschach
ALL_TOOLS      += meschach
meschach_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/meschach/1.2.pCMS1/include
meschach_EX_INCLUDE  := $(meschach_LOC_INCLUDE)
meschach_LOC_LIB := meschach
meschach_EX_LIB  := $(meschach_LOC_LIB)
meschach_INIT_FUNC := $$(eval $$(call ProductCommonVars,meschach,,,meschach))

