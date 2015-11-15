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
