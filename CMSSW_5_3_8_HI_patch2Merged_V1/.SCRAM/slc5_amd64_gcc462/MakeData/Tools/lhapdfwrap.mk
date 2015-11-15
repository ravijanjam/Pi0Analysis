lhapdfwrap             := lhapdfwrap
ALL_TOOLS      += lhapdfwrap
lhapdfwrap_LOC_LIB := LHAPDFWrap
lhapdfwrap_EX_LIB  := $(lhapdfwrap_LOC_LIB)
lhapdfwrap_LOC_USE := lhapdf
lhapdfwrap_EX_USE  := $(lhapdfwrap_LOC_USE)
lhapdfwrap_INIT_FUNC := $$(eval $$(call ProductCommonVars,lhapdfwrap,,,lhapdfwrap))

