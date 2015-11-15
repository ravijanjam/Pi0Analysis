py2-cx-oracle             := py2-cx-oracle
ALL_TOOLS      += py2-cx-oracle
py2-cx-oracle_LOC_USE := python oracle
py2-cx-oracle_EX_USE  := $(py2-cx-oracle_LOC_USE)
py2-cx-oracle_INIT_FUNC := $$(eval $$(call ProductCommonVars,py2-cx-oracle,,,py2-cx-oracle))

