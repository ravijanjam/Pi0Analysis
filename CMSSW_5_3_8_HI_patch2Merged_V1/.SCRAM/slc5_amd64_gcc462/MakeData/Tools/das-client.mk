das-client             := das-client
ALL_TOOLS      += das-client
das-client_LOC_USE := python
das-client_EX_USE  := $(das-client_LOC_USE)
das-client_INIT_FUNC := $$(eval $$(call ProductCommonVars,das-client,,,das-client))

