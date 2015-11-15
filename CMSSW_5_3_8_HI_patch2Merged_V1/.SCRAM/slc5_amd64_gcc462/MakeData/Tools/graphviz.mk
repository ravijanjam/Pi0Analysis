graphviz             := graphviz
ALL_TOOLS      += graphviz
graphviz_LOC_USE := expat zlib libjpg libpng
graphviz_EX_USE  := $(graphviz_LOC_USE)
graphviz_INIT_FUNC := $$(eval $$(call ProductCommonVars,graphviz,,,graphviz))

