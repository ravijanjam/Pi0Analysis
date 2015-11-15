pydata             := pydata
ALL_TOOLS      += pydata
pydata_LOC_FLAGS_LDFLAGS  := $(PYDATA_BASE)/lib/pydata.o
pydata_EX_FLAGS_LDFLAGS   := $(pydata_LOC_FLAGS_LDFLAGS)
pydata_LOC_FLAGS_NO_RECURSIVE_EXPORT  := 1
pydata_EX_FLAGS_NO_RECURSIVE_EXPORT   := $(pydata_LOC_FLAGS_NO_RECURSIVE_EXPORT)
pydata_INIT_FUNC := $$(eval $$(call ProductCommonVars,pydata,,,pydata))

