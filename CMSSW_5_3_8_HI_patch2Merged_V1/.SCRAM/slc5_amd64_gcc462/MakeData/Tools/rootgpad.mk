rootgpad             := rootgpad
ALL_TOOLS      += rootgpad
rootgpad_LOC_LIB := Gpad Graf
rootgpad_EX_LIB  := $(rootgpad_LOC_LIB)
rootgpad_LOC_USE := roothistmatrix
rootgpad_EX_USE  := $(rootgpad_LOC_USE)
rootgpad_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootgpad,,,rootgpad))

