rootrgl             := rootrgl
ALL_TOOLS      += rootrgl
rootrgl_LOC_LIB := RGL
rootrgl_EX_LIB  := $(rootrgl_LOC_LIB)
rootrgl_LOC_USE := rootinteractive rootgraphics
rootrgl_EX_USE  := $(rootrgl_LOC_USE)
rootrgl_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootrgl,,,rootrgl))

