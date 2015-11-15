libhepml             := libhepml
ALL_TOOLS      += libhepml
libhepml_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/libhepml/0.2.1/interface
libhepml_EX_INCLUDE  := $(libhepml_LOC_INCLUDE)
libhepml_LOC_LIB := hepml
libhepml_EX_LIB  := $(libhepml_LOC_LIB)
libhepml_INIT_FUNC := $$(eval $$(call ProductCommonVars,libhepml,,,libhepml))

