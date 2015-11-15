boost_program_options             := boost_program_options
ALL_TOOLS      += boost_program_options
boost_program_options_LOC_LIB := boost_program_options
boost_program_options_EX_LIB  := $(boost_program_options_LOC_LIB)
boost_program_options_LOC_USE := boost
boost_program_options_EX_USE  := $(boost_program_options_LOC_USE)
boost_program_options_INIT_FUNC := $$(eval $$(call ProductCommonVars,boost_program_options,,,boost_program_options))

