cascade             := cascade
ALL_TOOLS      += cascade
cascade_LOC_LIB := cascade_merged
cascade_EX_LIB  := $(cascade_LOC_LIB)
cascade_LOC_USE := f77compiler cascade_headers
cascade_EX_USE  := $(cascade_LOC_USE)
cascade_INIT_FUNC := $$(eval $$(call ProductCommonVars,cascade,,,cascade))

