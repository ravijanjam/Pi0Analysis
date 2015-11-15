ifeq ($(strip $(HiAnalysisPi0/Pi0Analysis_)),)
ALL_COMMONRULES += src_HiAnalysisPi0_Pi0Analysis__src
src_HiAnalysisPi0_Pi0Analysis__src_parent := HiAnalysisPi0/Pi0Analysis_
src_HiAnalysisPi0_Pi0Analysis__src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_HiAnalysisPi0_Pi0Analysis__src,src/HiAnalysisPi0/Pi0Analysis_/src,LIBRARY))
HiAnalysisPi0Pi0Analysis_ := self/HiAnalysisPi0/Pi0Analysis_
HiAnalysisPi0/Pi0Analysis_ := HiAnalysisPi0Pi0Analysis_
HiAnalysisPi0Pi0Analysis__files := $(patsubst src/HiAnalysisPi0/Pi0Analysis_/src/%,%,$(wildcard $(foreach dir,src/HiAnalysisPi0/Pi0Analysis_/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
HiAnalysisPi0Pi0Analysis__BuildFile    := $(WORKINGDIR)/cache/bf/src/HiAnalysisPi0/Pi0Analysis_/BuildFile
HiAnalysisPi0Pi0Analysis__LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet classlib root boost DataFormats/L1GlobalTrigger L1Trigger/GlobalTriggerAnalyzer CondFormats/L1TObjects CondFormats/DataRecord Geometry/Records Geometry/CaloGeometry DataFormats/Common DataFormats/DetId DataFormats/EcalDetId DataFormats/EcalRecHit DataFormats/EgammaReco DataFormats/EgammaCandidates DataFormats/HLTReco DataFormats/JetReco DataFormats/HcalIsolatedTrack DataFormats/RecoCandidate DataFormats/Candidate DataFormats/TrackReco DataFormats/FEDRawData FWCore/MessageLogger Geometry/CaloTopology HLTrigger/HLTcore RecoEcal/EgammaCoreTools RecoEcal/EgammaClusterAlgos CondFormats/EcalObjects Geometry/EcalAlgo Utilities/Timing rootphysics SimDataFormats/Track DataFormats/GeometryVector DataFormats/Math DataFormats/VertexReco RecoCaloTools/MetaCollections RecoCaloTools/Selectors TrackingTools/MaterialEffects TrackingTools/TrajectoryState DataFormats/GeometrySurface Geometry/TrackerGeometryBuilder MagneticField/Engine MagneticField/Records JetMETCorrections/Objects DataFormats/HcalRecHit DataFormats/HeavyIonEvent CondFormats/HIObjects CondCore/DBCommon CondCore/DBOutputService
HiAnalysisPi0Pi0Analysis__PRE_INIT_FUNC += $$(eval $$(call edmPlugin,HiAnalysisPi0Pi0Analysis_,HiAnalysisPi0Pi0Analysis_,$(SCRAMSTORENAME_LIB),src/HiAnalysisPi0/Pi0Analysis_/src))
HiAnalysisPi0Pi0Analysis__PACKAGE := self/src/HiAnalysisPi0/Pi0Analysis_/src
ALL_PRODS += HiAnalysisPi0Pi0Analysis_
HiAnalysisPi0Pi0Analysis__INIT_FUNC        += $$(eval $$(call Library,HiAnalysisPi0Pi0Analysis_,src/HiAnalysisPi0/Pi0Analysis_/src,src_HiAnalysisPi0_Pi0Analysis__src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
