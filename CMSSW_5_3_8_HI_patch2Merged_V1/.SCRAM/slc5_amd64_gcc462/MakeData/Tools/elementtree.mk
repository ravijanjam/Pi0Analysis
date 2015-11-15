elementtree             := elementtree
ALL_TOOLS      += elementtree
elementtree_LOC_USE := gccxml python
elementtree_EX_USE  := $(elementtree_LOC_USE)
elementtree_INIT_FUNC := $$(eval $$(call ProductCommonVars,elementtree,,,elementtree))

