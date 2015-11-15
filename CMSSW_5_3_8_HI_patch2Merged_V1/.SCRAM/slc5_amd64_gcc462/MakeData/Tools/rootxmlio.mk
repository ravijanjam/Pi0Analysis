rootxmlio             := rootxmlio
ALL_TOOLS      += rootxmlio
rootxmlio_LOC_LIB := XMLIO
rootxmlio_EX_LIB  := $(rootxmlio_LOC_LIB)
rootxmlio_LOC_USE := rootrio
rootxmlio_EX_USE  := $(rootxmlio_LOC_USE)
rootxmlio_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootxmlio,,,rootxmlio))

