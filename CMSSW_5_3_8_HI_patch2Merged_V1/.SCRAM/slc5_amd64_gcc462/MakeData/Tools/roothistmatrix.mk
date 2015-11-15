roothistmatrix             := roothistmatrix
ALL_TOOLS      += roothistmatrix
roothistmatrix_LOC_LIB := Hist Matrix
roothistmatrix_EX_LIB  := $(roothistmatrix_LOC_LIB)
roothistmatrix_LOC_USE := rootcore
roothistmatrix_EX_USE  := $(roothistmatrix_LOC_USE)
roothistmatrix_INIT_FUNC := $$(eval $$(call ProductCommonVars,roothistmatrix,,,roothistmatrix))

