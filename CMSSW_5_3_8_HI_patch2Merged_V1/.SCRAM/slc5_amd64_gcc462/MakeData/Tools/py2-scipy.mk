py2-scipy             := py2-scipy
ALL_TOOLS      += py2-scipy
py2-scipy_LOC_USE := python py2-numpy lapack
py2-scipy_EX_USE  := $(py2-scipy_LOC_USE)
py2-scipy_INIT_FUNC := $$(eval $$(call ProductCommonVars,py2-scipy,,,py2-scipy))

