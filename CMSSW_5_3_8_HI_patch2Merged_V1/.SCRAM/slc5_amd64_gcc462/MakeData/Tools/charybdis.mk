charybdis             := charybdis
ALL_TOOLS      += charybdis
charybdis_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/charybdis/1.003-cms2/include
charybdis_EX_INCLUDE  := $(charybdis_LOC_INCLUDE)
charybdis_LOC_LIB := charybdis
charybdis_EX_LIB  := $(charybdis_LOC_LIB)
charybdis_LOC_USE := f77compiler herwig pythia6
charybdis_EX_USE  := $(charybdis_LOC_USE)
charybdis_INIT_FUNC := $$(eval $$(call ProductCommonVars,charybdis,,,charybdis))

