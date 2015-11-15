ifeq ($(strip $(cmaguire/RpPbAnalysis)),)
ALL_COMMONRULES += src_cmaguire_RpPbAnalysis_src
src_cmaguire_RpPbAnalysis_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_cmaguire_RpPbAnalysis_src,src/cmaguire/RpPbAnalysis/src,LIBRARY))
cmaguireRpPbAnalysis := self/cmaguire/RpPbAnalysis
cmaguire/RpPbAnalysis := cmaguireRpPbAnalysis
cmaguireRpPbAnalysis_files := $(patsubst src/cmaguire/RpPbAnalysis/src/%,%,$(wildcard $(foreach dir,src/cmaguire/RpPbAnalysis/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
cmaguireRpPbAnalysis_BuildFile    := $(WORKINGDIR)/cache/bf/src/cmaguire/RpPbAnalysis/BuildFile
cmaguireRpPbAnalysis_LOC_USE   := self hepmc FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/MessageLogger FWCore/Utilities DataFormats/Common DataFormats/FEDRawData DataFormats/SiStripDetId DataFormats/TrackerRecHit2D DataFormats/SiPixelDetId DataFormats/DetId CondFormats/DataRecord CondFormats/SiStripObjects CalibFormats/SiStripObjects CalibTracker/Records FWCore/ServiceRegistry CommonTools/UtilAlgos DataFormats/SiStripCluster DataFormats/SiPixelCluster DataFormats/HeavyIonEvent DataFormats/TrackReco DataFormats/VertexReco DataFormats/HepMCCandidate DataFormats/Math DataFormats/Scalers
cmaguireRpPbAnalysis_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,cmaguireRpPbAnalysis,cmaguireRpPbAnalysis,$(SCRAMSTORENAME_LIB)))
cmaguireRpPbAnalysis_PACKAGE := self/src/cmaguire/RpPbAnalysis/src
ALL_PRODS += cmaguireRpPbAnalysis
cmaguireRpPbAnalysis_INIT_FUNC        += $$(eval $$(call Library,cmaguireRpPbAnalysis,src/cmaguire/RpPbAnalysis/src,src_cmaguire_RpPbAnalysis_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(cmaguireRpPbAnalysis_files_exts),$(cmaguireRpPbAnalysis_files_exts),$(SRC_FILES_SUFFIXES))))
endif
