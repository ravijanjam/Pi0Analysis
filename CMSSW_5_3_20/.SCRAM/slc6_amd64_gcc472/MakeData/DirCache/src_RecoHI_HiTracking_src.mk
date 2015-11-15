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
