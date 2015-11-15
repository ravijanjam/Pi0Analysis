llvm             := llvm
ALL_TOOLS      += llvm
llvm_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/llvm/3.2/include
llvm_EX_INCLUDE  := $(llvm_LOC_INCLUDE)
llvm_LOC_LIB := clang
llvm_EX_LIB  := $(llvm_LOC_LIB)
llvm_LOC_FLAGS_LDFLAGS  := -Wl,-undefined -Wl,suppress
llvm_EX_FLAGS_LDFLAGS   := $(llvm_LOC_FLAGS_LDFLAGS)
llvm_LOC_FLAGS_CXXFLAGS  := -D_DEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -O3 -fomit-frame-pointer -fPIC -Wno-enum-compare -Wno-strict-aliasing -fno-rtti
llvm_EX_FLAGS_CXXFLAGS   := $(llvm_LOC_FLAGS_CXXFLAGS)
llvm_INIT_FUNC := $$(eval $$(call ProductCommonVars,llvm,,,llvm))

