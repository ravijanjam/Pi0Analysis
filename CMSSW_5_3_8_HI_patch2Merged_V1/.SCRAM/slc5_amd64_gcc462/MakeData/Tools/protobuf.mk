protobuf             := protobuf
ALL_TOOLS      += protobuf
protobuf_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/protobuf/2.4.1/include
protobuf_EX_INCLUDE  := $(protobuf_LOC_INCLUDE)
protobuf_LOC_LIB := protobuf
protobuf_EX_LIB  := $(protobuf_LOC_LIB)
protobuf_INIT_FUNC := $$(eval $$(call ProductCommonVars,protobuf,,,protobuf))

