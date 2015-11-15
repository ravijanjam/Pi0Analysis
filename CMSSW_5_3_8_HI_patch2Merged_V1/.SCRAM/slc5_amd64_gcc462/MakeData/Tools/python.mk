python             := python
ALL_TOOLS      += python
python_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/python/2.6.4/include/python2.6
python_EX_INCLUDE  := $(python_LOC_INCLUDE)
python_LOC_LIB := python2.6
python_EX_LIB  := $(python_LOC_LIB)
python_LOC_USE := sockets
python_EX_USE  := $(python_LOC_USE)
python_INIT_FUNC := $$(eval $$(call ProductCommonVars,python,,,python))

