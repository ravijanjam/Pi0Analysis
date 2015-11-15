xdaq             := xdaq
ALL_TOOLS      += xdaq
xdaq_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/xdaq/VR17173/include /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/xdaq/VR17173/include/linux
xdaq_EX_INCLUDE  := $(xdaq_LOC_INCLUDE)
xdaq_LOC_LIB := toolbox xdaq config xoap xgi xdata cgicc log4cplus xcept logudpappender peer logxmlappender asyncresolv ptfifo pthttp pttcp i2outils xdaq2rc xoapfilter xalan-c xalanMsg wsaddressing wsclientsubscriber wseventing wsserviceeventing
xdaq_EX_LIB  := $(xdaq_LOC_LIB)
xdaq_LOC_USE := xerces-c sockets mimetic uuid
xdaq_EX_USE  := $(xdaq_LOC_USE)
xdaq_LOC_FLAGS_CPPDEFINES  := -DSOAP__ -DLITTLE_ENDIAN__ -Dlinux
xdaq_EX_FLAGS_CPPDEFINES   := $(xdaq_LOC_FLAGS_CPPDEFINES)
xdaq_INIT_FUNC := $$(eval $$(call ProductCommonVars,xdaq,,,xdaq))

