boost_regex             := boost_regex
ALL_TOOLS      += boost_regex
boost_regex_LOC_LIB := boost_regex
boost_regex_EX_LIB  := $(boost_regex_LOC_LIB)
boost_regex_LOC_USE := boost
boost_regex_EX_USE  := $(boost_regex_LOC_USE)
boost_regex_INIT_FUNC := $$(eval $$(call ProductCommonVars,boost_regex,,,boost_regex))

