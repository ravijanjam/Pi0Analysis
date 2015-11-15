mcdb             := mcdb
ALL_TOOLS      += mcdb
mcdb_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/mcdb/1.0.2/interface
mcdb_EX_INCLUDE  := $(mcdb_LOC_INCLUDE)
mcdb_LOC_LIB := mcdb
mcdb_EX_LIB  := $(mcdb_LOC_LIB)
mcdb_LOC_USE := xerces-c
mcdb_EX_USE  := $(mcdb_LOC_USE)
mcdb_INIT_FUNC := $$(eval $$(call ProductCommonVars,mcdb,,,mcdb))

