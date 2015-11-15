rooteve             := rooteve
ALL_TOOLS      += rooteve
rooteve_LOC_LIB := Eve
rooteve_EX_LIB  := $(rooteve_LOC_LIB)
rooteve_LOC_USE := rootgeompainter rootrgl
rooteve_EX_USE  := $(rooteve_LOC_USE)
rooteve_INIT_FUNC := $$(eval $$(call ProductCommonVars,rooteve,,,rooteve))

