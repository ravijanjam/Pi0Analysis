ifeq ($(strip $(RecoHIHiMuonAlgosPlugins)),)
RecoHIHiMuonAlgosPlugins_files := $(patsubst src/RecoHI/HiMuonAlgos/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/RecoHI/HiMuonAlgos/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoHI/HiMuonAlgos/plugins/$(file). Please fix src/RecoHI/HiMuonAlgos/plugins/BuildFile.))))
RecoHIHiMuonAlgosPlugins := self/src/RecoHI/HiMuonAlgos/plugins
RecoHIHiMuonAlgosPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoHI/HiMuonAlgos/plugins/BuildFile
RecoHIHiMuonAlgosPlugins_LOC_USE := self  boost rootrflx FWCore/Framework FWCore/PluginManager FWCore/ParameterSet Geometry/Records Geometry/TrackerGeometryBuilder RecoTracker/Record MagneticField/Records MagneticField/Engine DataFormats/VertexReco DataFormats/Common TrackingTools/TrajectoryState TrackingTools/GeomPropagators TrackingTools/DetLayers DataFormats/TrajectorySeed TrackingTools/MeasurementDet RecoTracker/MeasurementDet RecoTracker/TkNavigation TrackingTools/TrajectoryFiltering TrackingTools/TrajectoryCleaning TrackingTools/MaterialEffects TrackingTools/TrackFitters RecoVertex/KalmanVertexFit RecoVertex/VertexPrimitives TrackingTools/TransientTrack HLTrigger/HLTcore RecoMuon/GlobalTrackingTools RecoMuon/TrackingTools hepmc RecoHI/HiMuonAlgos
RecoHIHiMuonAlgosPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoHIHiMuonAlgosPlugins,RecoHIHiMuonAlgosPlugins,$(SCRAMSTORENAME_LIB),src/RecoHI/HiMuonAlgos/plugins))
RecoHIHiMuonAlgosPlugins_PACKAGE := self/src/RecoHI/HiMuonAlgos/plugins
ALL_PRODS += RecoHIHiMuonAlgosPlugins
RecoHIHiMuonAlgosPlugins_INIT_FUNC        += $$(eval $$(call Library,RecoHIHiMuonAlgosPlugins,src/RecoHI/HiMuonAlgos/plugins,src_RecoHI_HiMuonAlgos_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,RecoHIHiMuonAlgosPlugins,src/RecoHI/HiMuonAlgos/plugins))
endif
ALL_COMMONRULES += src_RecoHI_HiMuonAlgos_plugins
src_RecoHI_HiMuonAlgos_plugins_parent := RecoHI/HiMuonAlgos
src_RecoHI_HiMuonAlgos_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiMuonAlgos_plugins,src/RecoHI/HiMuonAlgos/plugins,PLUGINS))
