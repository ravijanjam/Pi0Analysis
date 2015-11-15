geant4             := geant4
ALL_TOOLS      += geant4
geant4_LOC_USE := geant4core geant4vis
geant4_EX_USE  := $(geant4_LOC_USE)
geant4_INIT_FUNC := $$(eval $$(call ProductCommonVars,geant4,,,geant4))

