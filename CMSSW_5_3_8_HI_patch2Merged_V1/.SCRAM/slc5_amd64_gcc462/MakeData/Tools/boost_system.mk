boost_system             := boost_system
ALL_TOOLS      += boost_system
boost_system_LOC_LIB := boost_system
boost_system_EX_LIB  := $(boost_system_LOC_LIB)
boost_system_LOC_USE := boost
boost_system_EX_USE  := $(boost_system_LOC_USE)
boost_system_INIT_FUNC := $$(eval $$(call ProductCommonVars,boost_system,,,boost_system))

