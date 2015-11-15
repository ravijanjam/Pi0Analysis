py2-cjson             := py2-cjson
ALL_TOOLS      += py2-cjson
py2-cjson_LOC_USE := python
py2-cjson_EX_USE  := $(py2-cjson_LOC_USE)
py2-cjson_INIT_FUNC := $$(eval $$(call ProductCommonVars,py2-cjson,,,py2-cjson))

