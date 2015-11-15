rootpy             := rootpy
ALL_TOOLS      += rootpy
rootpy_LOC_LIB := PyROOT
rootpy_EX_LIB  := $(rootpy_LOC_LIB)
rootpy_LOC_USE := rootgraphics
rootpy_EX_USE  := $(rootpy_LOC_USE)
rootpy_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootpy,,,rootpy))

