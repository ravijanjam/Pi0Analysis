clhepheader             := clhepheader
ALL_TOOLS      += clhepheader
clhepheader_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/clhep/2.0.4.6/include
clhepheader_EX_INCLUDE  := $(clhepheader_LOC_INCLUDE)
clhepheader_INIT_FUNC := $$(eval $$(call ProductCommonVars,clhepheader,,,clhepheader))

