gdb             := gdb
ALL_TOOLS      += gdb
gdb_INIT_FUNC := $$(eval $$(call ProductCommonVars,gdb,,,gdb))

