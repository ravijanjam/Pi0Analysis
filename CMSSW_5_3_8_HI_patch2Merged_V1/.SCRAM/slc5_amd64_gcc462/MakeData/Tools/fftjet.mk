fftjet             := fftjet
ALL_TOOLS      += fftjet
fftjet_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/fftjet/1.3.1-cms/include
fftjet_EX_INCLUDE  := $(fftjet_LOC_INCLUDE)
fftjet_LOC_LIB := fftjet
fftjet_EX_LIB  := $(fftjet_LOC_LIB)
fftjet_INIT_FUNC := $$(eval $$(call ProductCommonVars,fftjet,,,fftjet))

