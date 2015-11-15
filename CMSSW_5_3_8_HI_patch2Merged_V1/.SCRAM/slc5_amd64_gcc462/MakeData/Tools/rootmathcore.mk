rootmathcore             := rootmathcore
ALL_TOOLS      += rootmathcore
rootmathcore_LOC_LIB := MathCore
rootmathcore_EX_LIB  := $(rootmathcore_LOC_LIB)
rootmathcore_LOC_USE := rootcint
rootmathcore_EX_USE  := $(rootmathcore_LOC_USE)
rootmathcore_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootmathcore,,,rootmathcore))

