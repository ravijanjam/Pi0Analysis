rootgraphics             := rootgraphics
ALL_TOOLS      += rootgraphics
rootgraphics_LOC_LIB := TreePlayer Graf3d Postscript
rootgraphics_EX_LIB  := $(rootgraphics_LOC_LIB)
rootgraphics_LOC_USE := rootgpad
rootgraphics_EX_USE  := $(rootgraphics_LOC_USE)
rootgraphics_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootgraphics,,,rootgraphics))

