ccompiler             := ccompiler
ALL_TOOLS      += ccompiler
ccompiler_LOC_FLAGS_CFLAGS  := -pthread -O2
ccompiler_EX_FLAGS_CFLAGS   := $(ccompiler_LOC_FLAGS_CFLAGS)
ccompiler_LOC_FLAGS_CDEBUGFLAG  := -g
ccompiler_EX_FLAGS_CDEBUGFLAG   := $(ccompiler_LOC_FLAGS_CDEBUGFLAG)
ccompiler_LOC_FLAGS_LDFLAGS  := -Wl,-E -Wl,--hash-style=gnu
ccompiler_EX_FLAGS_LDFLAGS   := $(ccompiler_LOC_FLAGS_LDFLAGS)
ccompiler_LOC_FLAGS_SCRAM_COMPILER_NAME  := gcc462
ccompiler_EX_FLAGS_SCRAM_COMPILER_NAME   := $(ccompiler_LOC_FLAGS_SCRAM_COMPILER_NAME)
ccompiler_LOC_FLAGS_SCRAM_LANGUAGE_TYPE  := C
ccompiler_EX_FLAGS_SCRAM_LANGUAGE_TYPE   := $(ccompiler_LOC_FLAGS_SCRAM_LANGUAGE_TYPE)
ccompiler_LOC_FLAGS_CSHAREDOBJECTFLAGS  := -fPIC
ccompiler_EX_FLAGS_CSHAREDOBJECTFLAGS   := $(ccompiler_LOC_FLAGS_CSHAREDOBJECTFLAGS)
ccompiler_LOC_FLAGS_CSHAREDFLAGS  := -shared -Wl,-E
ccompiler_EX_FLAGS_CSHAREDFLAGS   := $(ccompiler_LOC_FLAGS_CSHAREDFLAGS)
ccompiler_INIT_FUNC := $$(eval $$(call ProductCommonVars,ccompiler,,,ccompiler))

