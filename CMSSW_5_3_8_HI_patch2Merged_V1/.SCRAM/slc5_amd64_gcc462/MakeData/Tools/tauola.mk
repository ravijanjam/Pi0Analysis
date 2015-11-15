tauola             := tauola
ALL_TOOLS      += tauola
tauola_LOC_LIB := pretauola tauola
tauola_EX_LIB  := $(tauola_LOC_LIB)
tauola_LOC_USE := f77compiler tauola_headers
tauola_EX_USE  := $(tauola_LOC_USE)
tauola_INIT_FUNC := $$(eval $$(call ProductCommonVars,tauola,,,tauola))

