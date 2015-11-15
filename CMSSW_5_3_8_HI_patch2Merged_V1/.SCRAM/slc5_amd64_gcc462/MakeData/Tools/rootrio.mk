rootrio             := rootrio
ALL_TOOLS      += rootrio
rootrio_LOC_LIB := RIO
rootrio_EX_LIB  := $(rootrio_LOC_LIB)
rootrio_LOC_USE := rootcint
rootrio_EX_USE  := $(rootrio_LOC_USE)
rootrio_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootrio,,,rootrio))

