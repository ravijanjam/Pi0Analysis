jimmy_headers             := jimmy_headers
ALL_TOOLS      += jimmy_headers
jimmy_headers_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/jimmy/4.2-cms2/include
jimmy_headers_EX_INCLUDE  := $(jimmy_headers_LOC_INCLUDE)
jimmy_headers_INIT_FUNC := $$(eval $$(call ProductCommonVars,jimmy_headers,,,jimmy_headers))

