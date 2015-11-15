fastjet             := fastjet
ALL_TOOLS      += fastjet
fastjet_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/fastjet/3.0.1-cms2/include
fastjet_EX_INCLUDE  := $(fastjet_LOC_INCLUDE)
fastjet_LOC_LIB := fastjetplugins fastjettools siscone siscone_spherical fastjet
fastjet_EX_LIB  := $(fastjet_LOC_LIB)
fastjet_INIT_FUNC := $$(eval $$(call ProductCommonVars,fastjet,,,fastjet))

