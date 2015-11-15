pythia6_headers             := pythia6_headers
ALL_TOOLS      += pythia6_headers
pythia6_headers_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/pythia6/426/include
pythia6_headers_EX_INCLUDE  := $(pythia6_headers_LOC_INCLUDE)
pythia6_headers_INIT_FUNC := $$(eval $$(call ProductCommonVars,pythia6_headers,,,pythia6_headers))

