x11             := x11
ALL_TOOLS      += x11
x11_LOC_USE := sockets
x11_EX_USE  := $(x11_LOC_USE)
x11_INIT_FUNC := $$(eval $$(call ProductCommonVars,x11,,,x11))

