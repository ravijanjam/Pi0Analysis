sip             := sip
ALL_TOOLS      += sip
sip_LOC_USE := python
sip_EX_USE  := $(sip_LOC_USE)
sip_INIT_FUNC := $$(eval $$(call ProductCommonVars,sip,,,sip))

