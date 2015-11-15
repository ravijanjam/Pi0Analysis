roottmva             := roottmva
ALL_TOOLS      += roottmva
roottmva_LOC_LIB := TMVA
roottmva_EX_LIB  := $(roottmva_LOC_LIB)
roottmva_LOC_USE := rootmlp rootminuit
roottmva_EX_USE  := $(roottmva_LOC_USE)
roottmva_INIT_FUNC := $$(eval $$(call ProductCommonVars,roottmva,,,roottmva))

