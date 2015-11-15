boost_filesystem             := boost_filesystem
ALL_TOOLS      += boost_filesystem
boost_filesystem_LOC_LIB := boost_filesystem
boost_filesystem_EX_LIB  := $(boost_filesystem_LOC_LIB)
boost_filesystem_LOC_USE := boost_system boost
boost_filesystem_EX_USE  := $(boost_filesystem_LOC_USE)
boost_filesystem_INIT_FUNC := $$(eval $$(call ProductCommonVars,boost_filesystem,,,boost_filesystem))

