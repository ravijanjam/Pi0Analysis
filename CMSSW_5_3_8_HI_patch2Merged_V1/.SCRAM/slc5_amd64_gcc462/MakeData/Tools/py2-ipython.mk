py2-ipython             := py2-ipython
ALL_TOOLS      += py2-ipython
py2-ipython_LOC_USE := python
py2-ipython_EX_USE  := $(py2-ipython_LOC_USE)
py2-ipython_INIT_FUNC := $$(eval $$(call ProductCommonVars,py2-ipython,,,py2-ipython))

