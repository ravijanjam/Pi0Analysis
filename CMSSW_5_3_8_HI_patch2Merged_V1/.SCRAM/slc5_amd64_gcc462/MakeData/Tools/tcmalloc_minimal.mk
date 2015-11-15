tcmalloc_minimal             := tcmalloc_minimal
ALL_TOOLS      += tcmalloc_minimal
tcmalloc_minimal_LOC_LIB := tcmalloc_minimal
tcmalloc_minimal_EX_LIB  := $(tcmalloc_minimal_LOC_LIB)
tcmalloc_minimal_INIT_FUNC := $$(eval $$(call ProductCommonVars,tcmalloc_minimal,,,tcmalloc_minimal))

