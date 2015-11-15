rootcintex             := rootcintex
ALL_TOOLS      += rootcintex
rootcintex_LOC_LIB := Cintex
rootcintex_EX_LIB  := $(rootcintex_LOC_LIB)
rootcintex_LOC_USE := rootrflx rootcint
rootcintex_EX_USE  := $(rootcintex_LOC_USE)
rootcintex_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootcintex,,,rootcintex))

