bz2lib             := bz2lib
ALL_TOOLS      += bz2lib
bz2lib_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/bz2lib/1.0.5/include
bz2lib_EX_INCLUDE  := $(bz2lib_LOC_INCLUDE)
bz2lib_LOC_LIB := bz2
bz2lib_EX_LIB  := $(bz2lib_LOC_LIB)
bz2lib_INIT_FUNC := $$(eval $$(call ProductCommonVars,bz2lib,,,bz2lib))

