ifeq ($(strip $(CondFormats/HIObjects)),)
ALL_COMMONRULES += src_CondFormats_HIObjects_src
src_CondFormats_HIObjects_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_CondFormats_HIObjects_src,src/CondFormats/HIObjects/src,LIBRARY))
CondFormatsHIObjects := self/CondFormats/HIObjects
CondFormats/HIObjects := CondFormatsHIObjects
CondFormatsHIObjects_files := $(patsubst src/CondFormats/HIObjects/src/%,%,$(wildcard $(foreach dir,src/CondFormats/HIObjects/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
CondFormatsHIObjects_BuildFile    := $(WORKINGDIR)/cache/bf/src/CondFormats/HIObjects/BuildFile
CondFormatsHIObjects_LOC_USE   := self CondFormats/Common FWCore/Framework rootrflx
CondFormatsHIObjects_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,CondFormatsHIObjectsCapabilities,CondFormatsHIObjects,$(SCRAMSTORENAME_LIB)))
CondFormatsHIObjects_PRE_INIT_FUNC += $$(eval $$(call LCGDict,CondFormatsHIObjects,0,classes,$(LOCALTOP)/src/CondFormats/HIObjects/src/classes.h,$(LOCALTOP)/src/CondFormats/HIObjects/src/classes_def.xml,$(SCRAMSTORENAME_LIB), --fail_on_warnings,Capabilities))
CondFormatsHIObjects_EX_LIB   := CondFormatsHIObjects
CondFormatsHIObjects_EX_USE   := $(foreach d,$(CondFormatsHIObjects_LOC_USE),$(if $($(d)_LOC_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsHIObjects_PACKAGE := self/src/CondFormats/HIObjects/src
ALL_PRODS += CondFormatsHIObjects
CondFormatsHIObjects_INIT_FUNC        += $$(eval $$(call Library,CondFormatsHIObjects,src/CondFormats/HIObjects/src,src_CondFormats_HIObjects_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(CondFormatsHIObjects_files_exts),$(CondFormatsHIObjects_files_exts),$(SRC_FILES_SUFFIXES))))
endif
