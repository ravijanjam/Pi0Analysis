cxxcompiler             := cxxcompiler
ALL_TOOLS      += cxxcompiler
cxxcompiler_LOC_FLAGS_CXXSHAREDOBJECTFLAGS  := -fPIC
cxxcompiler_EX_FLAGS_CXXSHAREDOBJECTFLAGS   := $(cxxcompiler_LOC_FLAGS_CXXSHAREDOBJECTFLAGS)
cxxcompiler_LOC_FLAGS_LDFLAGS  := -Wl,-E -Wl,--hash-style=gnu
cxxcompiler_EX_FLAGS_LDFLAGS   := $(cxxcompiler_LOC_FLAGS_LDFLAGS)
cxxcompiler_LOC_FLAGS_SCRAM_COMPILER_NAME  := gcc462
cxxcompiler_EX_FLAGS_SCRAM_COMPILER_NAME   := $(cxxcompiler_LOC_FLAGS_SCRAM_COMPILER_NAME)
cxxcompiler_LOC_FLAGS_CPPDEFINES  := -DGNU_GCC -D_GNU_SOURCE
cxxcompiler_EX_FLAGS_CPPDEFINES   := $(cxxcompiler_LOC_FLAGS_CPPDEFINES)
cxxcompiler_LOC_FLAGS_CXXFLAGS  := -O2 -pedantic -ansi -pthread -pipe -Wno-vla -Werror=overflow -Wstrict-overflow -std=c++0x -msse3 -ftree-vectorize -Wno-strict-overflow -Werror=array-bounds -Werror=format-contains-nul -Werror=type-limits -fvisibility-inlines-hidden -felide-constructors -fmessage-length=0 -ftemplate-depth-300 -Wall -Wno-non-template-friend -Wno-long-long -Wreturn-type -Wunused -Wparentheses -Wno-deprecated -Werror=return-type -Werror=missing-braces -Werror=unused-value -Werror=address -Werror=format -Werror=sign-compare -Werror=write-strings -fdiagnostics-show-option
cxxcompiler_EX_FLAGS_CXXFLAGS   := $(cxxcompiler_LOC_FLAGS_CXXFLAGS)
cxxcompiler_LOC_FLAGS_LD_UNIT  := -r -m elf_x86_64
cxxcompiler_EX_FLAGS_LD_UNIT   := $(cxxcompiler_LOC_FLAGS_LD_UNIT)
cxxcompiler_LOC_FLAGS_SCRAM_LANGUAGE_TYPE  := C++
cxxcompiler_EX_FLAGS_SCRAM_LANGUAGE_TYPE   := $(cxxcompiler_LOC_FLAGS_SCRAM_LANGUAGE_TYPE)
cxxcompiler_LOC_FLAGS_CXXSHAREDFLAGS  := -shared -Wl,-E
cxxcompiler_EX_FLAGS_CXXSHAREDFLAGS   := $(cxxcompiler_LOC_FLAGS_CXXSHAREDFLAGS)
cxxcompiler_LOC_FLAGS_CXXDEBUGFLAG  := -g
cxxcompiler_EX_FLAGS_CXXDEBUGFLAG   := $(cxxcompiler_LOC_FLAGS_CXXDEBUGFLAG)
cxxcompiler_LOC_FLAGS_SHAREDSUFFIX  := so
cxxcompiler_EX_FLAGS_SHAREDSUFFIX   := $(cxxcompiler_LOC_FLAGS_SHAREDSUFFIX)
cxxcompiler_LOC_FLAGS_CCCOMPILER  := gcc4
cxxcompiler_EX_FLAGS_CCCOMPILER   := $(cxxcompiler_LOC_FLAGS_CCCOMPILER)
cxxcompiler_LOC_FLAGS_MODULEFLAGS  := -shared -Wl,-E
cxxcompiler_EX_FLAGS_MODULEFLAGS   := $(cxxcompiler_LOC_FLAGS_MODULEFLAGS)
cxxcompiler_INIT_FUNC := $$(eval $$(call ProductCommonVars,cxxcompiler,,,cxxcompiler))

