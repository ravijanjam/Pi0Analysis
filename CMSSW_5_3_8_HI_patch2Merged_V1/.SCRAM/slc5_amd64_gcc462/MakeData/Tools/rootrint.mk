rootrint             := rootrint
ALL_TOOLS      += rootrint
rootrint_LOC_LIB := Rint
rootrint_EX_LIB  := $(rootrint_LOC_LIB)
rootrint_LOC_USE := rootcint
rootrint_EX_USE  := $(rootrint_LOC_USE)
rootrint_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootrint,,,rootrint))

