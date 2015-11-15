rootphysics             := rootphysics
ALL_TOOLS      += rootphysics
rootphysics_LOC_LIB := Physics
rootphysics_EX_LIB  := $(rootphysics_LOC_LIB)
rootphysics_LOC_USE := roothistmatrix
rootphysics_EX_USE  := $(rootphysics_LOC_USE)
rootphysics_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootphysics,,,rootphysics))

