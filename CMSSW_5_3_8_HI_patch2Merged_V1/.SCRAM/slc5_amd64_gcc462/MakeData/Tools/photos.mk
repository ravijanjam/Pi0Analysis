photos             := photos
ALL_TOOLS      += photos
photos_LOC_LIB := photos
photos_EX_LIB  := $(photos_LOC_LIB)
photos_LOC_USE := photos_headers f77compiler
photos_EX_USE  := $(photos_LOC_USE)
photos_INIT_FUNC := $$(eval $$(call ProductCommonVars,photos,,,photos))

