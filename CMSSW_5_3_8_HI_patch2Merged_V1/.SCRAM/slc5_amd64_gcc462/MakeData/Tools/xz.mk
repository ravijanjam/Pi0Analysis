xz             := xz
ALL_TOOLS      += xz
xz_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/xz/5.0.3-cms/include
xz_EX_INCLUDE  := $(xz_LOC_INCLUDE)
xz_LOC_LIB := lzma
xz_EX_LIB  := $(xz_LOC_LIB)
xz_INIT_FUNC := $$(eval $$(call ProductCommonVars,xz,,,xz))

