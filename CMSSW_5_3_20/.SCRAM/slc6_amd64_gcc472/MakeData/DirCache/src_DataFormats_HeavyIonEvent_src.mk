ifeq ($(strip $(DataFormats/HeavyIonEvent)),)
ALL_COMMONRULES += src_DataFormats_HeavyIonEvent_src
src_DataFormats_HeavyIonEvent_src_parent := DataFormats/HeavyIonEvent
src_DataFormats_HeavyIonEvent_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_DataFormats_HeavyIonEvent_src,src/DataFormats/HeavyIonEvent/src,LIBRARY))
DataFormatsHeavyIonEvent := self/DataFormats/HeavyIonEvent
DataFormats/HeavyIonEvent := DataFormatsHeavyIonEvent
DataFormatsHeavyIonEvent_files := $(patsubst src/DataFormats/HeavyIonEvent/src/%,%,$(wildcard $(foreach dir,src/DataFormats/HeavyIonEvent/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
DataFormatsHeavyIonEvent_BuildFile    := $(WORKINGDIR)/cache/bf/src/DataFormats/HeavyIonEvent/BuildFile
DataFormatsHeavyIonEvent_LOC_USE := self  root rootrflx DataFormats/Common CondFormats/HIObjects CondFormats/DataRecord
DataFormatsHeavyIonEvent_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,DataFormatsHeavyIonEventCapabilities,DataFormatsHeavyIonEvent,$(SCRAMSTORENAME_LIB),src/DataFormats/HeavyIonEvent/src))
DataFormatsHeavyIonEvent_LCGDICTS  := x 
DataFormatsHeavyIonEvent_PRE_INIT_FUNC += $$(eval $$(call LCGDict,DataFormatsHeavyIonEvent,0,src/DataFormats/HeavyIonEvent/src/classes.h,src/DataFormats/HeavyIonEvent/src/classes_def.xml,$(SCRAMSTORENAME_LIB),$(GENREFLEX_ARGS) --fail_on_warnings,Capabilities))
DataFormatsHeavyIonEvent_ROOTDICT  := LinkDef
DataFormatsHeavyIonEvent_PRE_INIT_FUNC += $$(eval $$(call RootDict,DataFormatsHeavyIonEvent,src/DataFormats/HeavyIonEvent/src,LinkDef.h,$(SCRAMSTORENAME_LIB)))
DataFormatsHeavyIonEvent_EX_LIB   := DataFormatsHeavyIonEvent
DataFormatsHeavyIonEvent_EX_USE   := $(foreach d,$(DataFormatsHeavyIonEvent_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsHeavyIonEvent_PACKAGE := self/src/DataFormats/HeavyIonEvent/src
ALL_PRODS += DataFormatsHeavyIonEvent
DataFormatsHeavyIonEvent_INIT_FUNC        += $$(eval $$(call Library,DataFormatsHeavyIonEvent,src/DataFormats/HeavyIonEvent/src,src_DataFormats_HeavyIonEvent_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
