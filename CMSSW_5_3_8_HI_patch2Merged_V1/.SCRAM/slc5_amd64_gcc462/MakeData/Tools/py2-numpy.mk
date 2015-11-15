py2-numpy             := py2-numpy
ALL_TOOLS      += py2-numpy
py2-numpy_LOC_USE := python zlib lapack
py2-numpy_EX_USE  := $(py2-numpy_LOC_USE)
py2-numpy_INIT_FUNC := $$(eval $$(call ProductCommonVars,py2-numpy,,,py2-numpy))

