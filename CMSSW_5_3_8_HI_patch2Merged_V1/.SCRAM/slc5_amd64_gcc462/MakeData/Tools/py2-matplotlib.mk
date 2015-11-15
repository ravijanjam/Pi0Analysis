py2-matplotlib             := py2-matplotlib
ALL_TOOLS      += py2-matplotlib
py2-matplotlib_LOC_USE := python zlib libpng py2-numpy
py2-matplotlib_EX_USE  := $(py2-matplotlib_LOC_USE)
py2-matplotlib_INIT_FUNC := $$(eval $$(call ProductCommonVars,py2-matplotlib,,,py2-matplotlib))

