qt3support             := qt3support
ALL_TOOLS      += qt3support
qt3support_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/qt/4.6.3/include/Qt3Support
qt3support_EX_INCLUDE  := $(qt3support_LOC_INCLUDE)
qt3support_LOC_LIB := Qt3Support
qt3support_EX_LIB  := $(qt3support_LOC_LIB)
qt3support_LOC_USE := qtbase
qt3support_EX_USE  := $(qt3support_LOC_USE)
qt3support_LOC_FLAGS_CPPDEFINES  := -DQT3_SUPPORT
qt3support_EX_FLAGS_CPPDEFINES   := $(qt3support_LOC_FLAGS_CPPDEFINES)
qt3support_INIT_FUNC := $$(eval $$(call ProductCommonVars,qt3support,,,qt3support))

