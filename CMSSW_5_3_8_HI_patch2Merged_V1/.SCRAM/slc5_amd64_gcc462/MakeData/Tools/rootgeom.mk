rootgeom             := rootgeom
ALL_TOOLS      += rootgeom
rootgeom_LOC_LIB := Geom
rootgeom_EX_LIB  := $(rootgeom_LOC_LIB)
rootgeom_LOC_USE := rootrio rootmathcore
rootgeom_EX_USE  := $(rootgeom_LOC_USE)
rootgeom_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootgeom,,,rootgeom))

