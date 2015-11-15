sockets             := sockets
ALL_TOOLS      += sockets
sockets_LOC_LIB := nsl crypt dl rt
sockets_EX_LIB  := $(sockets_LOC_LIB)
sockets_INIT_FUNC := $$(eval $$(call ProductCommonVars,sockets,,,sockets))

