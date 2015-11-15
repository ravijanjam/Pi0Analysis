hepmc             := hepmc
ALL_TOOLS      += hepmc
hepmc_LOC_LIB := HepMCfio HepMC
hepmc_EX_LIB  := $(hepmc_LOC_LIB)
hepmc_LOC_USE := hepmc_headers
hepmc_EX_USE  := $(hepmc_LOC_USE)
hepmc_INIT_FUNC := $$(eval $$(call ProductCommonVars,hepmc,,,hepmc))

