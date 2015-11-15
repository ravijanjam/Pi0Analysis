roostats             := roostats
ALL_TOOLS      += roostats
roostats_LOC_LIB := RooStats
roostats_EX_LIB  := $(roostats_LOC_LIB)
roostats_LOC_USE := roofitcore roofit rootcore roothistmatrix rootgpad
roostats_EX_USE  := $(roostats_LOC_USE)
roostats_INIT_FUNC := $$(eval $$(call ProductCommonVars,roostats,,,roostats))

