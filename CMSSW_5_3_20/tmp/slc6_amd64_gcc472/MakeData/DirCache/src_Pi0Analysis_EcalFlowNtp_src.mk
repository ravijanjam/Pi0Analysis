ifeq ($(strip $(Pi0Analysis/EcalFlowNtp)),)
ALL_COMMONRULES += src_Pi0Analysis_EcalFlowNtp_src
src_Pi0Analysis_EcalFlowNtp_src_parent := Pi0Analysis/EcalFlowNtp
src_Pi0Analysis_EcalFlowNtp_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_Pi0Analysis_EcalFlowNtp_src,src/Pi0Analysis/EcalFlowNtp/src,LIBRARY))
Pi0AnalysisEcalFlowNtp := self/Pi0Analysis/EcalFlowNtp
Pi0Analysis/EcalFlowNtp := Pi0AnalysisEcalFlowNtp
Pi0AnalysisEcalFlowNtp_files := $(patsubst src/Pi0Analysis/EcalFlowNtp/src/%,%,$(wildcard $(foreach dir,src/Pi0Analysis/EcalFlowNtp/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
Pi0AnalysisEcalFlowNtp_BuildFile    := $(WORKINGDIR)/cache/bf/src/Pi0Analysis/EcalFlowNtp/BuildFile
Pi0AnalysisEcalFlowNtp_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet classlib root boost DataFormats/L1GlobalTrigger L1Trigger/GlobalTriggerAnalyzer CondFormats/L1TObjects CondFormats/DataRecord Geometry/Records Geometry/CaloGeometry DataFormats/Common DataFormats/DetId DataFormats/EcalDetId DataFormats/EcalRecHit DataFormats/EgammaReco DataFormats/EgammaCandidates DataFormats/HLTReco DataFormats/JetReco DataFormats/HcalIsolatedTrack DataFormats/RecoCandidate DataFormats/Candidate DataFormats/TrackReco DataFormats/FEDRawData FWCore/MessageLogger Geometry/CaloTopology HLTrigger/HLTcore RecoEcal/EgammaCoreTools RecoEcal/EgammaClusterAlgos CondFormats/EcalObjects Geometry/EcalAlgo Utilities/Timing rootphysics SimDataFormats/Track DataFormats/GeometryVector DataFormats/Math DataFormats/VertexReco RecoCaloTools/MetaCollections RecoCaloTools/Selectors TrackingTools/MaterialEffects TrackingTools/TrajectoryState DataFormats/GeometrySurface Geometry/TrackerGeometryBuilder MagneticField/Engine MagneticField/Records JetMETCorrections/Objects DataFormats/HcalRecHit DataFormats/HeavyIonEvent CondFormats/HIObjects CondCore/DBCommon CondCore/DBOutputService
Pi0AnalysisEcalFlowNtp_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,Pi0AnalysisEcalFlowNtp,Pi0AnalysisEcalFlowNtp,$(SCRAMSTORENAME_LIB),src/Pi0Analysis/EcalFlowNtp/src))
Pi0AnalysisEcalFlowNtp_PACKAGE := self/src/Pi0Analysis/EcalFlowNtp/src
ALL_PRODS += Pi0AnalysisEcalFlowNtp
Pi0AnalysisEcalFlowNtp_INIT_FUNC        += $$(eval $$(call Library,Pi0AnalysisEcalFlowNtp,src/Pi0Analysis/EcalFlowNtp/src,src_Pi0Analysis_EcalFlowNtp_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
