dbs-client             := dbs-client
ALL_TOOLS      += dbs-client
dbs-client_INIT_FUNC := $$(eval $$(call ProductCommonVars,dbs-client,,,dbs-client))

