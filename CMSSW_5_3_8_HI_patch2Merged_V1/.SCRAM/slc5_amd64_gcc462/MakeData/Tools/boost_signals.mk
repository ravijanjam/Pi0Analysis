boost_signals             := boost_signals
ALL_TOOLS      += boost_signals
boost_signals_LOC_LIB := boost_signals
boost_signals_EX_LIB  := $(boost_signals_LOC_LIB)
boost_signals_LOC_USE := boost
boost_signals_EX_USE  := $(boost_signals_LOC_USE)
boost_signals_INIT_FUNC := $$(eval $$(call ProductCommonVars,boost_signals,,,boost_signals))

