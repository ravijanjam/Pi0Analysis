libjpg             := libjpg
ALL_TOOLS      += libjpg
libjpg_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/libjpg/8b/include
libjpg_EX_INCLUDE  := $(libjpg_LOC_INCLUDE)
libjpg_LOC_LIB := jpeg
libjpg_EX_LIB  := $(libjpg_LOC_LIB)
libjpg_INIT_FUNC := $$(eval $$(call ProductCommonVars,libjpg,,,libjpg))

