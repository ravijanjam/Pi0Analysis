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
ifeq ($(strip $(RecoHI/HiEgammaAlgos)),)
ALL_COMMONRULES += src_RecoHI_HiEgammaAlgos_src
src_RecoHI_HiEgammaAlgos_src_parent := RecoHI/HiEgammaAlgos
src_RecoHI_HiEgammaAlgos_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_RecoHI_HiEgammaAlgos_src,src/RecoHI/HiEgammaAlgos/src,LIBRARY))
RecoHIHiEgammaAlgos := self/RecoHI/HiEgammaAlgos
RecoHI/HiEgammaAlgos := RecoHIHiEgammaAlgos
RecoHIHiEgammaAlgos_files := $(patsubst src/RecoHI/HiEgammaAlgos/src/%,%,$(wildcard $(foreach dir,src/RecoHI/HiEgammaAlgos/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
RecoHIHiEgammaAlgos_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoHI/HiEgammaAlgos/BuildFile
RecoHIHiEgammaAlgos_LOC_USE := self  FWCore/Framework FWCore/ParameterSet DataFormats/EgammaReco DataFormats/Candidate Geometry/CaloGeometry RecoEcal/EgammaClusterAlgos DataFormats/EgammaCandidates clhep root
RecoHIHiEgammaAlgos_EX_LIB   := RecoHIHiEgammaAlgos
RecoHIHiEgammaAlgos_EX_USE   := $(foreach d,$(RecoHIHiEgammaAlgos_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoHIHiEgammaAlgos_PACKAGE := self/src/RecoHI/HiEgammaAlgos/src
ALL_PRODS += RecoHIHiEgammaAlgos
RecoHIHiEgammaAlgos_INIT_FUNC        += $$(eval $$(call Library,RecoHIHiEgammaAlgos,src/RecoHI/HiEgammaAlgos/src,src_RecoHI_HiEgammaAlgos_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ifeq ($(strip $(RecoHI/HiMuonAlgos)),)
ALL_COMMONRULES += src_RecoHI_HiMuonAlgos_src
src_RecoHI_HiMuonAlgos_src_parent := RecoHI/HiMuonAlgos
src_RecoHI_HiMuonAlgos_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_RecoHI_HiMuonAlgos_src,src/RecoHI/HiMuonAlgos/src,LIBRARY))
RecoHIHiMuonAlgos := self/RecoHI/HiMuonAlgos
RecoHI/HiMuonAlgos := RecoHIHiMuonAlgos
RecoHIHiMuonAlgos_files := $(patsubst src/RecoHI/HiMuonAlgos/src/%,%,$(wildcard $(foreach dir,src/RecoHI/HiMuonAlgos/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
RecoHIHiMuonAlgos_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoHI/HiMuonAlgos/BuildFile
RecoHIHiMuonAlgos_LOC_USE := self  FWCore/Framework FWCore/ParameterSet TrackingTools/TrackFitters TrackingTools/PatternTools DataFormats/TrackReco DataFormats/GsfTrackReco DataFormats/Math MagneticField/Engine MagneticField/Records Geometry/Records Geometry/TrackerGeometryBuilder TrackingTools/TransientTrack DataFormats/Common RecoTracker/CkfPattern RecoTracker/TransientTrackingRecHit TrackingTools/MeasurementDet RecoTracker/MeasurementDet RecoTracker/TkNavigation TrackingTools/MaterialEffects TrackingTools/TrajectoryCleaning TrackingTools/KalmanUpdators DataFormats/VertexReco RecoVertex/KalmanVertexFit RecoVertex/VertexPrimitives DataFormats/L1GlobalMuonTrigger rootrflx clhep
RecoHIHiMuonAlgos_EX_LIB   := RecoHIHiMuonAlgos
RecoHIHiMuonAlgos_EX_USE   := $(foreach d,$(RecoHIHiMuonAlgos_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoHIHiMuonAlgos_PACKAGE := self/src/RecoHI/HiMuonAlgos/src
ALL_PRODS += RecoHIHiMuonAlgos
RecoHIHiMuonAlgos_INIT_FUNC        += $$(eval $$(call Library,RecoHIHiMuonAlgos,src/RecoHI/HiMuonAlgos/src,src_RecoHI_HiMuonAlgos_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ifeq ($(strip $(RecoHI/HiTracking)),)
ALL_COMMONRULES += src_RecoHI_HiTracking_src
src_RecoHI_HiTracking_src_parent := RecoHI/HiTracking
src_RecoHI_HiTracking_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_RecoHI_HiTracking_src,src/RecoHI/HiTracking/src,LIBRARY))
RecoHIHiTracking := self/RecoHI/HiTracking
RecoHI/HiTracking := RecoHIHiTracking
RecoHIHiTracking_files := $(patsubst src/RecoHI/HiTracking/src/%,%,$(wildcard $(foreach dir,src/RecoHI/HiTracking/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
RecoHIHiTracking_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoHI/HiTracking/BuildFile
RecoHIHiTracking_LOC_USE := self  FWCore/Framework FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities Geometry/Records Geometry/TrackerGeometryBuilder TrackingTools/PatternTools RecoPixelVertexing/PixelTriplets RecoPixelVertexing/PixelTrackFitting RecoPixelVertexing/PixelLowPtUtilities SimDataFormats/GeneratorProducts RecoVertex/VertexTools TrackingTools/TrajectoryCleaning TrackingTools/TrajectoryFiltering TrackingTools/Records RecoLocalTracker/Records MagneticField/Records DataFormats/ParticleFlowCandidate
RecoHIHiTracking_EX_LIB   := RecoHIHiTracking
RecoHIHiTracking_EX_USE   := $(foreach d,$(RecoHIHiTracking_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoHIHiTracking_PACKAGE := self/src/RecoHI/HiTracking/src
ALL_PRODS += RecoHIHiTracking
RecoHIHiTracking_INIT_FUNC        += $$(eval $$(call Library,RecoHIHiTracking,src/RecoHI/HiTracking/src,src_RecoHI_HiTracking_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
