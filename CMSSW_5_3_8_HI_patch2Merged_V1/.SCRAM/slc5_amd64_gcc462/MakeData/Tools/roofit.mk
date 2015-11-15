roofit             := roofit
ALL_TOOLS      += roofit
roofit_LOC_LIB := RooFit
roofit_EX_LIB  := $(roofit_LOC_LIB)
roofit_LOC_USE := roofitcore rootcore rootmath roothistmatrix
roofit_EX_USE  := $(roofit_LOC_USE)
roofit_INIT_FUNC := $$(eval $$(call ProductCommonVars,roofit,,,roofit))

