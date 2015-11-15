rootxml             := rootxml
ALL_TOOLS      += rootxml
rootxml_LOC_LIB := XMLParser
rootxml_EX_LIB  := $(rootxml_LOC_LIB)
rootxml_LOC_USE := rootcore
rootxml_EX_USE  := $(rootxml_LOC_USE)
rootxml_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootxml,,,rootxml))

