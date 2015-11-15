libtiff             := libtiff
ALL_TOOLS      += libtiff
libtiff_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/libtiff/3.9.4/include
libtiff_EX_INCLUDE  := $(libtiff_LOC_INCLUDE)
libtiff_LOC_LIB := tiff
libtiff_EX_LIB  := $(libtiff_LOC_LIB)
libtiff_LOC_USE := libjpg zlib
libtiff_EX_USE  := $(libtiff_LOC_USE)
libtiff_INIT_FUNC := $$(eval $$(call ProductCommonVars,libtiff,,,libtiff))

