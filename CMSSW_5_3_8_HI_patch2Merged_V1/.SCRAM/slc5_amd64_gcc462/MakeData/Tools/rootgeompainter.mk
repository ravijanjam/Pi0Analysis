rootgeompainter             := rootgeompainter
ALL_TOOLS      += rootgeompainter
rootgeompainter_LOC_LIB := GeomPainter
rootgeompainter_EX_LIB  := $(rootgeompainter_LOC_LIB)
rootgeompainter_LOC_USE := rootgeom rootgraphics
rootgeompainter_EX_USE  := $(rootgeompainter_LOC_USE)
rootgeompainter_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootgeompainter,,,rootgeompainter))

