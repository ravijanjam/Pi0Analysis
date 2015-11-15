libpng             := libpng
ALL_TOOLS      += libpng
libpng_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/libpng/1.2.46/include
libpng_EX_INCLUDE  := $(libpng_LOC_INCLUDE)
libpng_LOC_LIB := png
libpng_EX_LIB  := $(libpng_LOC_LIB)
libpng_LOC_USE := zlib
libpng_EX_USE  := $(libpng_LOC_USE)
libpng_INIT_FUNC := $$(eval $$(call ProductCommonVars,libpng,,,libpng))

