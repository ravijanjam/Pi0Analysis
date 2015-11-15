roothtml             := roothtml
ALL_TOOLS      += roothtml
roothtml_LOC_LIB := Html
roothtml_EX_LIB  := $(roothtml_LOC_LIB)
roothtml_LOC_USE := rootgpad
roothtml_EX_USE  := $(roothtml_LOC_USE)
roothtml_INIT_FUNC := $$(eval $$(call ProductCommonVars,roothtml,,,roothtml))

