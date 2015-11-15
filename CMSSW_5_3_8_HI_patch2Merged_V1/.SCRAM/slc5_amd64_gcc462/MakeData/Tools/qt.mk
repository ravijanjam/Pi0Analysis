qt             := qt
ALL_TOOLS      += qt
qt_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/qt/4.6.3/include/QtOpenGL /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/qt/4.6.3/include/QtGui
qt_EX_INCLUDE  := $(qt_LOC_INCLUDE)
qt_LOC_LIB := QtOpenGL QtGui
qt_EX_LIB  := $(qt_LOC_LIB)
qt_LOC_USE := qtbase qt3support x11 opengl
qt_EX_USE  := $(qt_LOC_USE)
qt_INIT_FUNC := $$(eval $$(call ProductCommonVars,qt,,,qt))

