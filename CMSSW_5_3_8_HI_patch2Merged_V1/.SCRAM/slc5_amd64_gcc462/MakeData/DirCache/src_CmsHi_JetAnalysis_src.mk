ifeq ($(strip $(CmsHi/JetAnalysis)),)
ALL_COMMONRULES += src_CmsHi_JetAnalysis_src
src_CmsHi_JetAnalysis_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_CmsHi_JetAnalysis_src,src/CmsHi/JetAnalysis/src,LIBRARY))
CmsHiJetAnalysis := self/CmsHi/JetAnalysis
CmsHi/JetAnalysis := CmsHiJetAnalysis
CmsHiJetAnalysis_files := $(patsubst src/CmsHi/JetAnalysis/src/%,%,$(wildcard $(foreach dir,src/CmsHi/JetAnalysis/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
CmsHiJetAnalysis_BuildFile    := $(WORKINGDIR)/cache/bf/src/CmsHi/JetAnalysis/BuildFile
CmsHiJetAnalysis_LOC_USE   := self root hepmc boost fastjet FWCore/PluginManager FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Framework PhysicsTools/UtilAlgos CommonTools/UtilAlgos Geometry/CaloGeometry Geometry/Records SimGeneral/HepPDTRecord SimDataFormats/GeneratorProducts SimDataFormats/HiGenData SimTracker/TrackAssociation SimTracker/Records DataFormats/HepMCCandidate DataFormats/EcalRecHit DataFormats/HcalRecHit DataFormats/HcalDigi DataFormats/HcalDetId DataFormats/DetId DataFormats/GeometryVector DataFormats/JetReco DataFormats/METReco DataFormats/PatCandidates RecoJets/JetProducers DataFormats/HeavyIonEvent CondFormats/JetMETObjects CalibFormats/HcalObjects RecoLocalCalo/HcalRecAlgos
CmsHiJetAnalysis_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,CmsHiJetAnalysis,CmsHiJetAnalysis,$(SCRAMSTORENAME_LIB)))
CmsHiJetAnalysis_PACKAGE := self/src/CmsHi/JetAnalysis/src
ALL_PRODS += CmsHiJetAnalysis
CmsHiJetAnalysis_INIT_FUNC        += $$(eval $$(call Library,CmsHiJetAnalysis,src/CmsHi/JetAnalysis/src,src_CmsHi_JetAnalysis_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(CmsHiJetAnalysis_files_exts),$(CmsHiJetAnalysis_files_exts),$(SRC_FILES_SUFFIXES))))
endif
