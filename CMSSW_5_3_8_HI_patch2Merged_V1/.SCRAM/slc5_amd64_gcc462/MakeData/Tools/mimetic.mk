mimetic             := mimetic
ALL_TOOLS      += mimetic
mimetic_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/mimetic/0.9.6/include
mimetic_EX_INCLUDE  := $(mimetic_LOC_INCLUDE)
mimetic_LOC_LIB := mimetic
mimetic_EX_LIB  := $(mimetic_LOC_LIB)
mimetic_INIT_FUNC := $$(eval $$(call ProductCommonVars,mimetic,,,mimetic))

