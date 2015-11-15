classlib             := classlib
ALL_TOOLS      += classlib
classlib_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/classlib/3.1.3-cms3/include
classlib_EX_INCLUDE  := $(classlib_LOC_INCLUDE)
classlib_LOC_LIB := classlib
classlib_EX_LIB  := $(classlib_LOC_LIB)
classlib_LOC_USE := zlib bz2lib pcre openssl
classlib_EX_USE  := $(classlib_LOC_USE)
classlib_LOC_FLAGS_CPPDEFINES  := -D__STDC_LIMIT_MACROS -D__STDC_FORMAT_MACROS
classlib_EX_FLAGS_CPPDEFINES   := $(classlib_LOC_FLAGS_CPPDEFINES)
classlib_INIT_FUNC := $$(eval $$(call ProductCommonVars,classlib,,,classlib))

