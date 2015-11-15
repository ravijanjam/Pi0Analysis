ifeq ($(strip $(LCG/OracleAccess)),)
lcg_OracleAccess := coral/LCG/OracleAccess
LCG/OracleAccess := lcg_OracleAccess
OracleAccess := lcg_OracleAccess
lcg_OracleAccess_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/LCG/OracleAccess/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc462/cms/coral/CORAL_2_3_21-cms31/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_OracleAccess_LOC_USE   := coral LCG/CoralCommon oracle
lcg_OracleAccess_EX_LIB   := lcg_OracleAccess
lcg_OracleAccess_EX_USE   := $(foreach d,$(lcg_OracleAccess_LOC_USE),$(if $($(d)_LOC_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += lcg_OracleAccess
endif
ifeq ($(strip $(LCG/CoralKernel)),)
lcg_CoralKernel := coral/LCG/CoralKernel
LCG/CoralKernel := lcg_CoralKernel
CoralKernel := lcg_CoralKernel
lcg_CoralKernel_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/LCG/CoralKernel/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc462/cms/coral/CORAL_2_3_21-cms31/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_CoralKernel_LOC_USE   := coral CoralBricks LCG/CoralBase
lcg_CoralKernel_EX_LIB   := lcg_CoralKernel
lcg_CoralKernel_EX_USE   := $(foreach d,$(lcg_CoralKernel_LOC_USE),$(if $($(d)_LOC_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += lcg_CoralKernel
endif
ifeq ($(strip $(LCG/XMLAuthenticationService)),)
lcg_XMLAuthenticationService := coral/LCG/XMLAuthenticationService
LCG/XMLAuthenticationService := lcg_XMLAuthenticationService
XMLAuthenticationService := lcg_XMLAuthenticationService
lcg_XMLAuthenticationService_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/LCG/XMLAuthenticationService/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc462/cms/coral/CORAL_2_3_21-cms31/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_XMLAuthenticationService_LOC_USE   := coral LCG/CoralCommon xerces-c
lcg_XMLAuthenticationService_EX_LIB   := lcg_XMLAuthenticationService
lcg_XMLAuthenticationService_EX_USE   := $(foreach d,$(lcg_XMLAuthenticationService_LOC_USE),$(if $($(d)_LOC_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += lcg_XMLAuthenticationService
endif
ifeq ($(strip $(LCG/SQLiteAccess)),)
lcg_SQLiteAccess := coral/LCG/SQLiteAccess
LCG/SQLiteAccess := lcg_SQLiteAccess
SQLiteAccess := lcg_SQLiteAccess
lcg_SQLiteAccess_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/LCG/SQLiteAccess/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc462/cms/coral/CORAL_2_3_21-cms31/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_SQLiteAccess_LOC_USE   := coral LCG/CoralCommon sqlite
lcg_SQLiteAccess_EX_LIB   := lcg_SQLiteAccess
lcg_SQLiteAccess_EX_USE   := $(foreach d,$(lcg_SQLiteAccess_LOC_USE),$(if $($(d)_LOC_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += lcg_SQLiteAccess
endif
ifeq ($(strip $(LCG/MonitoringService)),)
lcg_MonitoringService := coral/LCG/MonitoringService
LCG/MonitoringService := lcg_MonitoringService
MonitoringService := lcg_MonitoringService
lcg_MonitoringService_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/LCG/MonitoringService/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc462/cms/coral/CORAL_2_3_21-cms31/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_MonitoringService_LOC_USE   := coral LCG/CoralCommon
lcg_MonitoringService_EX_LIB   := lcg_MonitoringService
lcg_MonitoringService_EX_USE   := $(foreach d,$(lcg_MonitoringService_LOC_USE),$(if $($(d)_LOC_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += lcg_MonitoringService
endif
ifeq ($(strip $(LCG/CoralCommon)),)
lcg_CoralCommon := coral/LCG/CoralCommon
LCG/CoralCommon := lcg_CoralCommon
CoralCommon := lcg_CoralCommon
lcg_CoralCommon_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/LCG/CoralCommon/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc462/cms/coral/CORAL_2_3_21-cms31/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_CoralCommon_LOC_USE   := coral LCG/RelationalAccess xerces-c
lcg_CoralCommon_EX_LIB   := lcg_CoralCommon
lcg_CoralCommon_EX_USE   := $(foreach d,$(lcg_CoralCommon_LOC_USE),$(if $($(d)_LOC_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += lcg_CoralCommon
endif
ifeq ($(strip $(LCG/XMLLookupService)),)
lcg_XMLLookupService := coral/LCG/XMLLookupService
LCG/XMLLookupService := lcg_XMLLookupService
XMLLookupService := lcg_XMLLookupService
lcg_XMLLookupService_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/LCG/XMLLookupService/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc462/cms/coral/CORAL_2_3_21-cms31/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_XMLLookupService_LOC_USE   := coral LCG/CoralCommon xerces-c
lcg_XMLLookupService_EX_LIB   := lcg_XMLLookupService
lcg_XMLLookupService_EX_USE   := $(foreach d,$(lcg_XMLLookupService_LOC_USE),$(if $($(d)_LOC_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += lcg_XMLLookupService
endif
ifeq ($(strip $(LCG/ConnectionService)),)
lcg_ConnectionService := coral/LCG/ConnectionService
LCG/ConnectionService := lcg_ConnectionService
ConnectionService := lcg_ConnectionService
lcg_ConnectionService_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/LCG/ConnectionService/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc462/cms/coral/CORAL_2_3_21-cms31/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_ConnectionService_LOC_USE   := coral uuid LCG/CoralCommon LCG/RelationalAccess boost
lcg_ConnectionService_EX_LIB   := lcg_ConnectionService
lcg_ConnectionService_EX_USE   := $(foreach d,$(lcg_ConnectionService_LOC_USE),$(if $($(d)_LOC_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += lcg_ConnectionService
endif
ifeq ($(strip $(LCG/FrontierAccess)),)
lcg_FrontierAccess := coral/LCG/FrontierAccess
LCG/FrontierAccess := lcg_FrontierAccess
FrontierAccess := lcg_FrontierAccess
lcg_FrontierAccess_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/LCG/FrontierAccess/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc462/cms/coral/CORAL_2_3_21-cms31/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_FrontierAccess_LOC_USE   := coral frontier_client openssl LCG/CoralCommon
lcg_FrontierAccess_EX_LIB   := lcg_FrontierAccess
lcg_FrontierAccess_EX_USE   := $(foreach d,$(lcg_FrontierAccess_LOC_USE),$(if $($(d)_LOC_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += lcg_FrontierAccess
endif
ifeq ($(strip $(LCG/RelationalService)),)
lcg_RelationalService := coral/LCG/RelationalService
LCG/RelationalService := lcg_RelationalService
RelationalService := lcg_RelationalService
lcg_RelationalService_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/LCG/RelationalService/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc462/cms/coral/CORAL_2_3_21-cms31/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_RelationalService_LOC_USE   := coral LCG/CoralCommon boost
lcg_RelationalService_EX_LIB   := lcg_RelationalService
lcg_RelationalService_EX_USE   := $(foreach d,$(lcg_RelationalService_LOC_USE),$(if $($(d)_LOC_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += lcg_RelationalService
endif
ifeq ($(strip $(LCG/EnvironmentAuthenticationService)),)
lcg_EnvironmentAuthenticationService := coral/LCG/EnvironmentAuthenticationService
LCG/EnvironmentAuthenticationService := lcg_EnvironmentAuthenticationService
EnvironmentAuthenticationService := lcg_EnvironmentAuthenticationService
lcg_EnvironmentAuthenticationService_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/LCG/EnvironmentAuthenticationService/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc462/cms/coral/CORAL_2_3_21-cms31/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_EnvironmentAuthenticationService_LOC_USE   := coral LCG/CoralCommon
lcg_EnvironmentAuthenticationService_EX_LIB   := lcg_EnvironmentAuthenticationService
lcg_EnvironmentAuthenticationService_EX_USE   := $(foreach d,$(lcg_EnvironmentAuthenticationService_LOC_USE),$(if $($(d)_LOC_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += lcg_EnvironmentAuthenticationService
endif
ifeq ($(strip $(LCG/RelationalAccess)),)
lcg_RelationalAccess := coral/LCG/RelationalAccess
LCG/RelationalAccess := lcg_RelationalAccess
RelationalAccess := lcg_RelationalAccess
lcg_RelationalAccess_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/LCG/RelationalAccess/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc462/cms/coral/CORAL_2_3_21-cms31/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_RelationalAccess_LOC_USE   := coral LCG/CoralBase LCG/CoralKernel
lcg_RelationalAccess_EX_LIB   := lcg_RelationalAccess
lcg_RelationalAccess_EX_USE   := $(foreach d,$(lcg_RelationalAccess_LOC_USE),$(if $($(d)_LOC_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += lcg_RelationalAccess
endif
ifeq ($(strip $(LCG/CoralBase)),)
lcg_CoralBase := coral/LCG/CoralBase
LCG/CoralBase := lcg_CoralBase
CoralBase := lcg_CoralBase
lcg_CoralBase_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/LCG/CoralBase/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc462/cms/coral/CORAL_2_3_21-cms31/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_CoralBase_LOC_USE   := coral boost boost_filesystem CoralBricks
lcg_CoralBase_EX_LIB   := lcg_CoralBase
lcg_CoralBase_EX_USE   := $(foreach d,$(lcg_CoralBase_LOC_USE),$(if $($(d)_LOC_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += lcg_CoralBase
endif
ifeq ($(strip $(LCG/PyCoral)),)
lcg_PyCoral := coral/LCG/PyCoral
LCG/PyCoral := lcg_PyCoral
PyCoral := lcg_PyCoral
lcg_PyCoral_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/LCG/PyCoral/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc462/cms/coral/CORAL_2_3_21-cms31/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_PyCoral_LOC_USE   := coral LCG/RelationalAccess python
lcg_PyCoral_EX_LIB   := lcg_PyCoral
lcg_PyCoral_EX_USE   := $(foreach d,$(lcg_PyCoral_LOC_USE),$(if $($(d)_LOC_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += lcg_PyCoral
endif
