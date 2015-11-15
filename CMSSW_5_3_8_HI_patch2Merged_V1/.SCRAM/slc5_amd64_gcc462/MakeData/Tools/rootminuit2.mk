rootminuit2             := rootminuit2
ALL_TOOLS      += rootminuit2
rootminuit2_LOC_LIB := Minuit2
rootminuit2_EX_LIB  := $(rootminuit2_LOC_LIB)
rootminuit2_LOC_USE := rootgpad
rootminuit2_EX_USE  := $(rootminuit2_LOC_USE)
rootminuit2_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootminuit2,,,rootminuit2))

