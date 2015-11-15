rooteg             := rooteg
ALL_TOOLS      += rooteg
rooteg_LOC_LIB := EG
rooteg_EX_LIB  := $(rooteg_LOC_LIB)
rooteg_LOC_USE := rootgraphics
rooteg_EX_USE  := $(rooteg_LOC_USE)
rooteg_INIT_FUNC := $$(eval $$(call ProductCommonVars,rooteg,,,rooteg))

