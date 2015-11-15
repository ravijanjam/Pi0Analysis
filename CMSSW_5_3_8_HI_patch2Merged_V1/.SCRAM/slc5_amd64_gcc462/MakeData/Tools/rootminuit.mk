rootminuit             := rootminuit
ALL_TOOLS      += rootminuit
rootminuit_LOC_LIB := Minuit
rootminuit_EX_LIB  := $(rootminuit_LOC_LIB)
rootminuit_LOC_USE := rootgpad
rootminuit_EX_USE  := $(rootminuit_LOC_USE)
rootminuit_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootminuit,,,rootminuit))

