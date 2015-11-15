xdaqsentinelutils             := xdaqsentinelutils
ALL_TOOLS      += xdaqsentinelutils
xdaqsentinelutils_LOC_LIB := sentinelutils
xdaqsentinelutils_EX_LIB  := $(xdaqsentinelutils_LOC_LIB)
xdaqsentinelutils_LOC_USE := xdaq
xdaqsentinelutils_EX_USE  := $(xdaqsentinelutils_LOC_USE)
xdaqsentinelutils_INIT_FUNC := $$(eval $$(call ProductCommonVars,xdaqsentinelutils,,,xdaqsentinelutils))

