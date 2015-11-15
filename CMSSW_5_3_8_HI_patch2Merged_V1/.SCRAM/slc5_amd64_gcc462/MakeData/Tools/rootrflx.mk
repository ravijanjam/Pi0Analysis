rootrflx             := rootrflx
ALL_TOOLS      += rootrflx
rootrflx_LOC_LIB := Reflex
rootrflx_EX_LIB  := $(rootrflx_LOC_LIB)
rootrflx_LOC_USE := gccxml root_interface
rootrflx_EX_USE  := $(rootrflx_LOC_USE)
rootrflx_LOC_FLAGS_GENREFLEX_CPPFLAGS  := -DCMS_DICT_IMPL -D_REENTRANT -DGNUSOURCE
rootrflx_EX_FLAGS_GENREFLEX_CPPFLAGS   := $(rootrflx_LOC_FLAGS_GENREFLEX_CPPFLAGS)
rootrflx_LOC_FLAGS_GENREFLEX_GCCXMLOPT  := -m64
rootrflx_EX_FLAGS_GENREFLEX_GCCXMLOPT   := $(rootrflx_LOC_FLAGS_GENREFLEX_GCCXMLOPT)
rootrflx_LOC_FLAGS_GENREFLEX_ARGS  := --deep
rootrflx_EX_FLAGS_GENREFLEX_ARGS   := $(rootrflx_LOC_FLAGS_GENREFLEX_ARGS)
rootrflx_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootrflx,,,rootrflx))

