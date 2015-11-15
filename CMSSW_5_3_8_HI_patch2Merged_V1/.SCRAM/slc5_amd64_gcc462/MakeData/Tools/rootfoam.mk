rootfoam             := rootfoam
ALL_TOOLS      += rootfoam
rootfoam_LOC_LIB := Foam
rootfoam_EX_LIB  := $(rootfoam_LOC_LIB)
rootfoam_LOC_USE := roothistmatrix
rootfoam_EX_USE  := $(rootfoam_LOC_USE)
rootfoam_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootfoam,,,rootfoam))

