pythia6             := pythia6
ALL_TOOLS      += pythia6
pythia6_LOC_LIB := pythia6 pythia6_dummy pythia6_pdfdummy
pythia6_EX_LIB  := $(pythia6_LOC_LIB)
pythia6_LOC_USE := pythia6_headers f77compiler
pythia6_EX_USE  := $(pythia6_LOC_USE)
pythia6_INIT_FUNC := $$(eval $$(call ProductCommonVars,pythia6,,,pythia6))

