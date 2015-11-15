rivet             := rivet
ALL_TOOLS      += rivet
rivet_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/rivet/1.5.1-cms10/include
rivet_EX_INCLUDE  := $(rivet_LOC_INCLUDE)
rivet_LOC_LIB := Rivet
rivet_EX_LIB  := $(rivet_LOC_LIB)
rivet_INIT_FUNC := $$(eval $$(call ProductCommonVars,rivet,,,rivet))

