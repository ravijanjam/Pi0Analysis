toprex             := toprex
ALL_TOOLS      += toprex
toprex_LOC_LIB := toprex
toprex_EX_LIB  := $(toprex_LOC_LIB)
toprex_LOC_USE := toprex_headers f77compiler
toprex_EX_USE  := $(toprex_LOC_USE)
toprex_INIT_FUNC := $$(eval $$(call ProductCommonVars,toprex,,,toprex))

