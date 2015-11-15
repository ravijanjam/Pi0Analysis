root_interface             := root_interface
ALL_TOOLS      += root_interface
root_interface_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/lcg/root/5.32.00-cms21/include
root_interface_EX_INCLUDE  := $(root_interface_LOC_INCLUDE)
root_interface_INIT_FUNC := $$(eval $$(call ProductCommonVars,root_interface,,,root_interface))

