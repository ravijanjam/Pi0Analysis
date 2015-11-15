rootmath             := rootmath
ALL_TOOLS      += rootmath
rootmath_LOC_LIB := GenVector MathMore
rootmath_EX_LIB  := $(rootmath_LOC_LIB)
rootmath_LOC_USE := rootcore gsl
rootmath_EX_USE  := $(rootmath_LOC_USE)
rootmath_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootmath,,,rootmath))

