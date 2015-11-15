gsl             := gsl
ALL_TOOLS      += gsl
gsl_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/gsl/1.10/include
gsl_EX_INCLUDE  := $(gsl_LOC_INCLUDE)
gsl_LOC_LIB := gsl gslcblas
gsl_EX_LIB  := $(gsl_LOC_LIB)
gsl_INIT_FUNC := $$(eval $$(call ProductCommonVars,gsl,,,gsl))

