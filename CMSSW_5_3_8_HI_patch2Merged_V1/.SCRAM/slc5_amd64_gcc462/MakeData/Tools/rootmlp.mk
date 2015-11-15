rootmlp             := rootmlp
ALL_TOOLS      += rootmlp
rootmlp_LOC_LIB := MLP
rootmlp_EX_LIB  := $(rootmlp_LOC_LIB)
rootmlp_LOC_USE := rootgraphics
rootmlp_EX_USE  := $(rootmlp_LOC_USE)
rootmlp_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootmlp,,,rootmlp))

