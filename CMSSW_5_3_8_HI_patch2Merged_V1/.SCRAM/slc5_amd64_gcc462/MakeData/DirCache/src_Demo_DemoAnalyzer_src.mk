ifeq ($(strip $(Demo/DemoAnalyzer)),)
ALL_COMMONRULES += src_Demo_DemoAnalyzer_src
src_Demo_DemoAnalyzer_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_Demo_DemoAnalyzer_src,src/Demo/DemoAnalyzer/src,LIBRARY))
DemoDemoAnalyzer := self/Demo/DemoAnalyzer
Demo/DemoAnalyzer := DemoDemoAnalyzer
DemoDemoAnalyzer_files := $(patsubst src/Demo/DemoAnalyzer/src/%,%,$(wildcard $(foreach dir,src/Demo/DemoAnalyzer/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
DemoDemoAnalyzer_BuildFile    := $(WORKINGDIR)/cache/bf/src/Demo/DemoAnalyzer/BuildFile
DemoDemoAnalyzer_LOC_USE   := self FWCore/Framework FWCore/PluginManager FWCore/ParameterSet
DemoDemoAnalyzer_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,DemoDemoAnalyzer,DemoDemoAnalyzer,$(SCRAMSTORENAME_LIB)))
DemoDemoAnalyzer_PACKAGE := self/src/Demo/DemoAnalyzer/src
ALL_PRODS += DemoDemoAnalyzer
DemoDemoAnalyzer_INIT_FUNC        += $$(eval $$(call Library,DemoDemoAnalyzer,src/Demo/DemoAnalyzer/src,src_Demo_DemoAnalyzer_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(DemoDemoAnalyzer_files_exts),$(DemoDemoAnalyzer_files_exts),$(SRC_FILES_SUFFIXES))))
endif
