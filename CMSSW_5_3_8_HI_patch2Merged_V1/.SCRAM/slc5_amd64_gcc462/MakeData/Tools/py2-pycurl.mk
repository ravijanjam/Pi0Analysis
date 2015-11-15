py2-pycurl             := py2-pycurl
ALL_TOOLS      += py2-pycurl
py2-pycurl_LOC_USE := python
py2-pycurl_EX_USE  := $(py2-pycurl_LOC_USE)
py2-pycurl_INIT_FUNC := $$(eval $$(call ProductCommonVars,py2-pycurl,,,py2-pycurl))

