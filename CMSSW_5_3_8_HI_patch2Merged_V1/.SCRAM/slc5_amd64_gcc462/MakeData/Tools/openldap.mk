openldap             := openldap
ALL_TOOLS      += openldap
openldap_LOC_USE := openssl db4
openldap_EX_USE  := $(openldap_LOC_USE)
openldap_INIT_FUNC := $$(eval $$(call ProductCommonVars,openldap,,,openldap))

