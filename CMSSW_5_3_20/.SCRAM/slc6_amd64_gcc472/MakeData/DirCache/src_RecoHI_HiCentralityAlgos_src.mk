ifeq ($(strip $(RecoHI/HiCentralityAlgos)),)
ALL_COMMONRULES += src_RecoHI_HiCentralityAlgos_src
src_RecoHI_HiCentralityAlgos_src_parent := RecoHI/HiCentralityAlgos
src_RecoHI_HiCentralityAlgos_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_RecoHI_HiCentralityAlgos_src,src/RecoHI/HiCentralityAlgos/src,LIBRARY))
RecoHIHiCentralityAlgos := self/RecoHI/HiCentralityAlgos
RecoHI/HiCentralityAlgos := RecoHIHiCentralityAlgos
RecoHIHiCentralityAlgos_files := $(patsubst src/RecoHI/HiCentralityAlgos/src/%,%,$(wildcard $(foreach dir,src/RecoHI/HiCentralityAlgos/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
RecoHIHiCentralityAlgos_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoHI/HiCentralityAlgos/BuildFile
RecoHIHiCentralityAlgos_LOC_USE := self  root rootrflx FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/Utilities CommonTools/UtilAlgos DataFormats/Candidate DataFormats/HcalRecHit DataFormats/Common DataFormats/HeavyIonEvent DataFormats/TrackingRecHit DataFormats/TrackerRecHit2D DataFormats/TrackReco DataFormats/VertexReco CondFormats/HIObjects CondFormats/DataRecord CondCore/DBCommon CondCore/DBOutputService CondCore/PopCon Geometry/CaloGeometry Geometry/TrackerGeometryBuilder
RecoHIHiCentralityAlgos_EX_LIB   := RecoHIHiCentralityAlgos
RecoHIHiCentralityAlgos_EX_USE   := $(foreach d,$(RecoHIHiCentralityAlgos_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoHIHiCentralityAlgos_PACKAGE := self/src/RecoHI/HiCentralityAlgos/src
ALL_PRODS += RecoHIHiCentralityAlgos
RecoHIHiCentralityAlgos_INIT_FUNC        += $$(eval $$(call Library,RecoHIHiCentralityAlgos,src/RecoHI/HiCentralityAlgos/src,src_RecoHI_HiCentralityAlgos_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
