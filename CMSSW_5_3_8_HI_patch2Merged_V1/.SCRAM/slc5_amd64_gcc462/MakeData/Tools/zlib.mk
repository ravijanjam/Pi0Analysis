zlib             := zlib
ALL_TOOLS      += zlib
zlib_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/zlib/1.2.3/include
zlib_EX_INCLUDE  := $(zlib_LOC_INCLUDE)
zlib_LOC_LIB := z
zlib_EX_LIB  := $(zlib_LOC_LIB)
zlib_INIT_FUNC := $$(eval $$(call ProductCommonVars,zlib,,,zlib))

