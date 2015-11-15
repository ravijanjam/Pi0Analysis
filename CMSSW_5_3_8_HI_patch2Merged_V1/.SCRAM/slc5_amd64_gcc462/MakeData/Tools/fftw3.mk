fftw3             := fftw3
ALL_TOOLS      += fftw3
fftw3_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/fftw3/3.2.2-cms/include
fftw3_EX_INCLUDE  := $(fftw3_LOC_INCLUDE)
fftw3_LOC_LIB := fftw3
fftw3_EX_LIB  := $(fftw3_LOC_LIB)
fftw3_INIT_FUNC := $$(eval $$(call ProductCommonVars,fftw3,,,fftw3))

