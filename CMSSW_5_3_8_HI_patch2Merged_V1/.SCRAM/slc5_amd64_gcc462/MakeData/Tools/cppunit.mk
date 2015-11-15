cppunit             := cppunit
ALL_TOOLS      += cppunit
cppunit_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/cppunit/1.12.1/include
cppunit_EX_INCLUDE  := $(cppunit_LOC_INCLUDE)
cppunit_LOC_LIB := cppunit
cppunit_EX_LIB  := $(cppunit_LOC_LIB)
cppunit_LOC_USE := sockets
cppunit_EX_USE  := $(cppunit_LOC_USE)
cppunit_INIT_FUNC := $$(eval $$(call ProductCommonVars,cppunit,,,cppunit))

