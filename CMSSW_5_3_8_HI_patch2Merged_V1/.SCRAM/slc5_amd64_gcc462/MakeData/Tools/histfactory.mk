histfactory             := histfactory
ALL_TOOLS      += histfactory
histfactory_LOC_LIB := HistFactory
histfactory_EX_LIB  := $(histfactory_LOC_LIB)
histfactory_LOC_USE := roofitcore roofit roostats rootcore roothistmatrix rootgpad rootxml rootfoam
histfactory_EX_USE  := $(histfactory_LOC_USE)
histfactory_INIT_FUNC := $$(eval $$(call ProductCommonVars,histfactory,,,histfactory))

