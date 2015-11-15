tcmalloc             := tcmalloc
ALL_TOOLS      += tcmalloc
tcmalloc_LOC_LIB := tcmalloc
tcmalloc_EX_LIB  := $(tcmalloc_LOC_LIB)
tcmalloc_INIT_FUNC := $$(eval $$(call ProductCommonVars,tcmalloc,,,tcmalloc))

