dpm             := dpm
ALL_TOOLS      += dpm
dpm_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/dpm/1.8.0.1/include
dpm_EX_INCLUDE  := $(dpm_LOC_INCLUDE)
dpm_LOC_LIB := dpm
dpm_EX_LIB  := $(dpm_LOC_LIB)
dpm_LOC_LIBDIR := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/dpm/1.8.0.1/lib
dpm_EX_LIBDIR  := $(dpm_LOC_LIBDIR)
dpm_INIT_FUNC := $$(eval $$(call ProductCommonVars,dpm,,,dpm))

