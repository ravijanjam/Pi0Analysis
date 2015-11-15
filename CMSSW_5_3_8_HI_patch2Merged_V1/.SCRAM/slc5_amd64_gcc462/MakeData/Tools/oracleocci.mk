oracleocci             := oracleocci
ALL_TOOLS      += oracleocci
oracleocci_LOC_LIB := occi
oracleocci_EX_LIB  := $(oracleocci_LOC_LIB)
oracleocci_LOC_USE := oracle
oracleocci_EX_USE  := $(oracleocci_LOC_USE)
oracleocci_INIT_FUNC := $$(eval $$(call ProductCommonVars,oracleocci,,,oracleocci))

