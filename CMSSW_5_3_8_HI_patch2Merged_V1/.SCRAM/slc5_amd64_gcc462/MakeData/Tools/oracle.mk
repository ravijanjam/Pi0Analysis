oracle             := oracle
ALL_TOOLS      += oracle
oracle_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/oracle/11.2.0.3.0__10.2.0.4.0/include
oracle_EX_INCLUDE  := $(oracle_LOC_INCLUDE)
oracle_LOC_LIB := clntsh
oracle_EX_LIB  := $(oracle_LOC_LIB)
oracle_LOC_USE := sockets
oracle_EX_USE  := $(oracle_LOC_USE)
oracle_INIT_FUNC := $$(eval $$(call ProductCommonVars,oracle,,,oracle))

