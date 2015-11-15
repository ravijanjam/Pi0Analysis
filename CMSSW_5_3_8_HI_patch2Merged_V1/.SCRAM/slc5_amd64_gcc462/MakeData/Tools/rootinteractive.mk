rootinteractive             := rootinteractive
ALL_TOOLS      += rootinteractive
rootinteractive_LOC_LIB := Gui
rootinteractive_EX_LIB  := $(rootinteractive_LOC_LIB)
rootinteractive_LOC_USE := libjpg libpng rootgpad rootrint
rootinteractive_EX_USE  := $(rootinteractive_LOC_USE)
rootinteractive_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootinteractive,,,rootinteractive))

