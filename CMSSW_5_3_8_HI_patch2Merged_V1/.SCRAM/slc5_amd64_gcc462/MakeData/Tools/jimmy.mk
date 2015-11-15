jimmy             := jimmy
ALL_TOOLS      += jimmy
jimmy_LOC_LIB := jimmy
jimmy_EX_LIB  := $(jimmy_LOC_LIB)
jimmy_LOC_USE := f77compiler herwig jimmy_headers
jimmy_EX_USE  := $(jimmy_LOC_USE)
jimmy_INIT_FUNC := $$(eval $$(call ProductCommonVars,jimmy,,,jimmy))

