clhep             := clhep
ALL_TOOLS      += clhep
clhep_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/clhep/2.0.4.6/include
clhep_EX_INCLUDE  := $(clhep_LOC_INCLUDE)
clhep_LOC_LIB := CLHEP
clhep_EX_LIB  := $(clhep_LOC_LIB)
clhep_INIT_FUNC := $$(eval $$(call ProductCommonVars,clhep,,,clhep))

