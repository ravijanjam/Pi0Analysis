lapack             := lapack
ALL_TOOLS      += lapack
lapack_INIT_FUNC := $$(eval $$(call ProductCommonVars,lapack,,,lapack))

