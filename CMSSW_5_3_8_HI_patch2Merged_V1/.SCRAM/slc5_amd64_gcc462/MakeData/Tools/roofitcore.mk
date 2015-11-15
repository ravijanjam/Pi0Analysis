roofitcore             := roofitcore
ALL_TOOLS      += roofitcore
roofitcore_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/lcg/roofit/5.32.03-cms16/include
roofitcore_EX_INCLUDE  := $(roofitcore_LOC_INCLUDE)
roofitcore_LOC_LIB := RooFitCore
roofitcore_EX_LIB  := $(roofitcore_LOC_LIB)
roofitcore_LOC_USE := rootcore roothistmatrix rootgpad rootminuit
roofitcore_EX_USE  := $(roofitcore_LOC_USE)
roofitcore_INIT_FUNC := $$(eval $$(call ProductCommonVars,roofitcore,,,roofitcore))

