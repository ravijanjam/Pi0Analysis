rootcore             := rootcore
ALL_TOOLS      += rootcore
rootcore_LOC_LIB := Tree Net
rootcore_EX_LIB  := $(rootcore_LOC_LIB)
rootcore_LOC_USE := rootmathcore rootthread
rootcore_EX_USE  := $(rootcore_LOC_USE)
rootcore_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootcore,,,rootcore))

