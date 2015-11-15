python-ldap             := python-ldap
ALL_TOOLS      += python-ldap
python-ldap_LOC_USE := openssl openldap python
python-ldap_EX_USE  := $(python-ldap_LOC_USE)
python-ldap_INIT_FUNC := $$(eval $$(call ProductCommonVars,python-ldap,,,python-ldap))

