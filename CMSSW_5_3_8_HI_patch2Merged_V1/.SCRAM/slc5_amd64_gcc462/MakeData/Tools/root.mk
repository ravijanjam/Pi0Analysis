root             := root
ALL_TOOLS      += root
root_LOC_USE := rootphysics
root_EX_USE  := $(root_LOC_USE)
root_INIT_FUNC := $$(eval $$(call ProductCommonVars,root,,,root))

