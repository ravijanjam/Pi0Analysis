rootspectrum             := rootspectrum
ALL_TOOLS      += rootspectrum
rootspectrum_LOC_LIB := Spectrum
rootspectrum_EX_LIB  := $(rootspectrum_LOC_LIB)
rootspectrum_LOC_USE := roothistmatrix
rootspectrum_EX_USE  := $(rootspectrum_LOC_USE)
rootspectrum_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootspectrum,,,rootspectrum))

