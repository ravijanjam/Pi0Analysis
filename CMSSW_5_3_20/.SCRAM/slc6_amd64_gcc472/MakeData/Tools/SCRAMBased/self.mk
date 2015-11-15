ifeq ($(strip $(SimTracker/VertexAssociation)),)
SimTrackerVertexAssociation := self/SimTracker/VertexAssociation
SimTracker/VertexAssociation := SimTrackerVertexAssociation
SimTrackerVertexAssociation_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimTrackerVertexAssociation_EX_USE := $(foreach d, self  SimDataFormats/Track FWCore/ParameterSet DataFormats/TrackReco DataFormats/VertexReco DataFormats/Common DataFormats/Math FWCore/Utilities SimDataFormats/TrackingAnalysis,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimTrackerVertexAssociation_EX_LIB   := SimTrackerVertexAssociation
ALL_EXTERNAL_PRODS += SimTrackerVertexAssociation
endif
ifeq ($(strip $(TrackPropagation/Geant4e)),)
TrackPropagationGeant4e := self/TrackPropagation/Geant4e
TrackPropagation/Geant4e := TrackPropagationGeant4e
TrackPropagationGeant4e_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackPropagationGeant4e_EX_USE := $(foreach d, self  root geant4 boost FWCore/ParameterSet FWCore/Utilities TrackingTools/GeomPropagators TrackingTools/Records TrackingTools/TrajectoryState FWCore/Framework FWCore/MessageLogger DataFormats/CLHEP clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackPropagationGeant4e_EX_LIB   := TrackPropagationGeant4e
ALL_EXTERNAL_PRODS += TrackPropagationGeant4e
endif
ifeq ($(strip $(RecoLocalTracker/Records)),)
RecoLocalTrackerRecords := self/RecoLocalTracker/Records
RecoLocalTracker/Records := RecoLocalTrackerRecords
RecoLocalTrackerRecords_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoLocalTrackerRecords_EX_USE := $(foreach d, self  FWCore/Utilities FWCore/Framework Geometry/Records MagneticField/Records clhep boost CondFormats/DataRecord CalibTracker/Records,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoLocalTrackerRecords_EX_LIB   := RecoLocalTrackerRecords
ALL_EXTERNAL_PRODS += RecoLocalTrackerRecords
endif
ifeq ($(strip $(RecoVZero/VZeroFinding)),)
RecoVZeroVZeroFinding := self/RecoVZero/VZeroFinding
RecoVZero/VZeroFinding := RecoVZeroVZeroFinding
RecoVZeroVZeroFinding_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoVZeroVZeroFinding_EX_USE := $(foreach d, self  MagneticField/Records MagneticField/Engine FWCore/Framework FWCore/ParameterSet FWCore/PluginManager Geometry/Records TrackingTools/PatternTools,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoVZeroVZeroFinding_EX_LIB   := RecoVZeroVZeroFinding
ALL_EXTERNAL_PRODS += RecoVZeroVZeroFinding
endif
ifeq ($(strip $(SimGeneral/DataMixingModule)),)
src_SimGeneral_DataMixingModule := self/SimGeneral/DataMixingModule
SimGeneral/DataMixingModule  := src_SimGeneral_DataMixingModule
src_SimGeneral_DataMixingModule_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_SimGeneral_DataMixingModule_EX_USE := $(foreach d, SimCalorimetry/HcalSimAlgos FWCore/Framework self DataFormats/SiPixelDigi DataFormats/HcalRecHit DataFormats/EcalRecHit SimCalorimetry/HcalSimProducers DataFormats/EcalDigi DataFormats/HcalDigi DataFormats/CSCDigi CondFormats/EcalObjects FWCore/PluginManager FWCore/MessageLogger DataFormats/RPCDigi DataFormats/Provenance DataFormats/Common SimCalorimetry/CaloSimAlgos CalibFormats/HcalObjects DataFormats/TrackReco FWCore/ServiceRegistry DataFormats/SiStripDigi DataFormats/DTDigi Mixing/Base FWCore/Utilities FWCore/ParameterSet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_SimGeneral_DataMixingModule
endif

ifeq ($(strip $(SimGeneral/TrackingAnalysis)),)
SimGeneralTrackingAnalysis := self/SimGeneral/TrackingAnalysis
SimGeneral/TrackingAnalysis := SimGeneralTrackingAnalysis
SimGeneralTrackingAnalysis_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimGeneralTrackingAnalysis_EX_USE := $(foreach d, self  clhep CalibFormats/SiStripObjects CalibTracker/Records CalibTracker/SiPixelESProducers CondFormats/CSCObjects CondFormats/SiPixelObjects DataFormats/DetId DataFormats/SiStripDetId DataFormats/SiPixelDetId FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet SimDataFormats/GeneratorProducts SimDataFormats/Track SimDataFormats/TrackingAnalysis SimDataFormats/Vertex SimDataFormats/TrackingHit SimTracker/Common,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimGeneralTrackingAnalysis_EX_LIB   := SimGeneralTrackingAnalysis
ALL_EXTERNAL_PRODS += SimGeneralTrackingAnalysis
endif
ifeq ($(strip $(MagneticField/VolumeBasedEngine)),)
MagneticFieldVolumeBasedEngine := self/MagneticField/VolumeBasedEngine
MagneticField/VolumeBasedEngine := MagneticFieldVolumeBasedEngine
MagneticFieldVolumeBasedEngine_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
MagneticFieldVolumeBasedEngine_EX_USE := $(foreach d, self  DataFormats/GeometrySurface DataFormats/GeometryVector FWCore/ParameterSet MagneticField/Engine MagneticField/Layers MagneticField/VolumeGeometry,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
MagneticFieldVolumeBasedEngine_EX_LIB   := MagneticFieldVolumeBasedEngine
ALL_EXTERNAL_PRODS += MagneticFieldVolumeBasedEngine
endif
ifeq ($(strip $(CondFormats/RPCObjects)),)
CondFormatsRPCObjects := self/CondFormats/RPCObjects
CondFormats/RPCObjects := CondFormatsRPCObjects
CondFormatsRPCObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsRPCObjects_EX_USE := $(foreach d, self  DataFormats/DetId DataFormats/MuonDetId FWCore/MessageLogger FWCore/Utilities boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsRPCObjects_LCGDICTS  := x 
CondFormatsRPCObjects_EX_LIB   := CondFormatsRPCObjects
ALL_EXTERNAL_PRODS += CondFormatsRPCObjects
endif
ifeq ($(strip $(DataFormats/GsfTrackReco)),)
DataFormatsGsfTrackReco := self/DataFormats/GsfTrackReco
DataFormats/GsfTrackReco := DataFormatsGsfTrackReco
DataFormatsGsfTrackReco_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsGsfTrackReco_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/TrackReco rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsGsfTrackReco_LCGDICTS  := x 
DataFormatsGsfTrackReco_EX_LIB   := DataFormatsGsfTrackReco
ALL_EXTERNAL_PRODS += DataFormatsGsfTrackReco
endif
ifeq ($(strip $(CalibFormats/CaloObjects)),)
CalibFormatsCaloObjects := self/CalibFormats/CaloObjects
CalibFormats/CaloObjects := CalibFormatsCaloObjects
CalibFormatsCaloObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibFormatsCaloObjects_EX_USE := $(foreach d, self  DataFormats/DetId boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibFormatsCaloObjects_EX_LIB   := CalibFormatsCaloObjects
ALL_EXTERNAL_PRODS += CalibFormatsCaloObjects
endif
ifeq ($(strip $(RecoEgamma/ElectronIdentification)),)
RecoEgammaElectronIdentification := self/RecoEgamma/ElectronIdentification
RecoEgamma/ElectronIdentification := RecoEgammaElectronIdentification
RecoEgammaElectronIdentification_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoEgammaElectronIdentification_EX_USE := $(foreach d, self  FWCore/Framework DataFormats/EgammaReco Geometry/CaloGeometry RecoEcal/EgammaCoreTools DataFormats/TrackReco MagneticField/Records MagneticField/Engine RecoEgamma/EgammaTools,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoEgammaElectronIdentification_EX_LIB   := RecoEgammaElectronIdentification
ALL_EXTERNAL_PRODS += RecoEgammaElectronIdentification
endif
ifeq ($(strip $(RecoEgamma/EgammaIsolationAlgos)),)
RecoEgammaEgammaIsolationAlgos := self/RecoEgamma/EgammaIsolationAlgos
RecoEgamma/EgammaIsolationAlgos := RecoEgammaEgammaIsolationAlgos
RecoEgammaEgammaIsolationAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoEgammaEgammaIsolationAlgos_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet Geometry/CaloGeometry Geometry/CaloTopology RecoCaloTools/Selectors DataFormats/Candidate DataFormats/RecoCandidate CondFormats/EcalObjects CondFormats/DataRecord RecoLocalCalo/EcalRecAlgos CommonTools/Statistics,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoEgammaEgammaIsolationAlgos_EX_LIB   := RecoEgammaEgammaIsolationAlgos
ALL_EXTERNAL_PRODS += RecoEgammaEgammaIsolationAlgos
endif
ifeq ($(strip $(RecoRomanPot/RecoFP420)),)
RecoRomanPotRecoFP420 := self/RecoRomanPot/RecoFP420
RecoRomanPot/RecoFP420 := RecoRomanPotRecoFP420
RecoRomanPotRecoFP420_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoRomanPotRecoFP420_EX_USE := $(foreach d, self  FWCore/PluginManager DataFormats/Math DataFormats/FP420Digi DataFormats/FP420Cluster DataFormats/Common FWCore/ParameterSet FWCore/Framework SimG4CMS/FP420 Mixing/Base DetectorDescription/Core FWCore/MessageLogger hector boost geant4 root clhep hepmc gsl rootmath rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoRomanPotRecoFP420_EX_LIB   := RecoRomanPotRecoFP420
ALL_EXTERNAL_PRODS += RecoRomanPotRecoFP420
endif
ifeq ($(strip $(CondFormats/CSCObjects)),)
CondFormatsCSCObjects := self/CondFormats/CSCObjects
CondFormats/CSCObjects := CondFormatsCSCObjects
CondFormatsCSCObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsCSCObjects_EX_USE := $(foreach d, self  DataFormats/MuonDetId FWCore/MessageLogger FWCore/ParameterSet rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsCSCObjects_LCGDICTS  := x 
CondFormatsCSCObjects_EX_LIB   := CondFormatsCSCObjects
ALL_EXTERNAL_PRODS += CondFormatsCSCObjects
endif
ifeq ($(strip $(DataFormats/Scalers)),)
DataFormatsScalers := self/DataFormats/Scalers
DataFormats/Scalers := DataFormatsScalers
DataFormatsScalers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsScalers_EX_USE := $(foreach d, self  DataFormats/Common boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsScalers_LCGDICTS  := x 
DataFormatsScalers_EX_LIB   := DataFormatsScalers
ALL_EXTERNAL_PRODS += DataFormatsScalers
endif
ifeq ($(strip $(CondTools/DQM)),)
CondToolsDQM := self/CondTools/DQM
CondTools/DQM := CondToolsDQM
CondToolsDQM_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondToolsDQM_EX_USE := $(foreach d, self  CondCore/DBCommon CondFormats/Common CoralBase DataFormats/Provenance FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry RelationalAccess rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondToolsDQM_EX_LIB   := CondToolsDQM
ALL_EXTERNAL_PRODS += CondToolsDQM
endif
ifeq ($(strip $(Calibration/TkAlCaRecoProducers)),)
CalibrationTkAlCaRecoProducers := self/Calibration/TkAlCaRecoProducers
Calibration/TkAlCaRecoProducers := CalibrationTkAlCaRecoProducers
CalibrationTkAlCaRecoProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibrationTkAlCaRecoProducers_EX_USE := $(foreach d, self  DataFormats/DetId DataFormats/MuonDetId DataFormats/MuonReco DataFormats/SiStripDetId DataFormats/SiPixelDetId DataFormats/TrackReco DataFormats/TrackerRecHit2D DataFormats/TrackingRecHit DataFormats/SiStripCluster DataFormats/TrajectorySeed DataFormats/Candidate DataFormats/JetReco DataFormats/METReco DataFormats/RecoCandidate DataFormats/Math DataFormats/BeamSpot FWCore/MessageLogger FWCore/Framework FWCore/Utilities FWCore/ParameterSet PhysicsTools/RecoAlgos rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibrationTkAlCaRecoProducers_EX_LIB   := CalibrationTkAlCaRecoProducers
ALL_EXTERNAL_PRODS += CalibrationTkAlCaRecoProducers
endif
ifeq ($(strip $(CondFormats/DQMObjects)),)
CondFormatsDQMObjects := self/CondFormats/DQMObjects
CondFormats/DQMObjects := CondFormatsDQMObjects
CondFormatsDQMObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsDQMObjects_EX_USE := $(foreach d, self  FWCore/MessageLogger FWCore/Utilities rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsDQMObjects_LCGDICTS  := x 
CondFormatsDQMObjects_EX_LIB   := CondFormatsDQMObjects
ALL_EXTERNAL_PRODS += CondFormatsDQMObjects
endif
ifeq ($(strip $(FastSimulation/Calorimetry)),)
FastSimulationCalorimetry := self/FastSimulation/Calorimetry
FastSimulation/Calorimetry := FastSimulationCalorimetry
FastSimulationCalorimetry_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationCalorimetry_EX_USE := $(foreach d, self  DataFormats/DetId DataFormats/HcalDetId FWCore/MessageLogger FWCore/ParameterSet FastSimulation/CaloGeometryTools FastSimulation/CaloHitMakers FastSimulation/Event FastSimulation/Particle FastSimulation/ParticlePropagator FastSimulation/ShowerDevelopment FastSimulation/Utilities FastSimulation/MaterialEffects CondFormats/DataRecord FWCore/ServiceRegistry DQMServices/Core SimG4Core/GFlash,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationCalorimetry_EX_LIB   := FastSimulationCalorimetry
ALL_EXTERNAL_PRODS += FastSimulationCalorimetry
endif
ifeq ($(strip $(L1Trigger/RegionalCaloTrigger)),)
L1TriggerRegionalCaloTrigger := self/L1Trigger/RegionalCaloTrigger
L1Trigger/RegionalCaloTrigger := L1TriggerRegionalCaloTrigger
L1TriggerRegionalCaloTrigger_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerRegionalCaloTrigger_EX_USE := $(foreach d, self  boost FWCore/Framework FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities DataFormats/L1CaloTrigger DataFormats/EcalDigi DataFormats/EcalDetId DataFormats/HcalDigi DataFormats/HcalDetId CalibFormats/CaloTPG CalibCalorimetry/EcalTPGTools CondFormats/L1TObjects CondFormats/DataRecord clhep DataFormats/JetReco DataFormats/EgammaCandidates DataFormats/HepMCCandidate CalibFormats/HcalObjects CondFormats/RunInfo root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerRegionalCaloTrigger_EX_LIB   := L1TriggerRegionalCaloTrigger
ALL_EXTERNAL_PRODS += L1TriggerRegionalCaloTrigger
endif
ifeq ($(strip $(FWCore/PluginManager)),)
FWCorePluginManager := self/FWCore/PluginManager
FWCore/PluginManager := FWCorePluginManager
FWCorePluginManager_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCorePluginManager_EX_USE := $(foreach d, self  boost boost_filesystem sigcpp rootrflx FWCore/Utilities,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCorePluginManager_EX_LIB   := FWCorePluginManager
ALL_EXTERNAL_PRODS += FWCorePluginManager
endif
ifeq ($(strip $(DQM/SiStripCommissioningSources)),)
DQMSiStripCommissioningSources := self/DQM/SiStripCommissioningSources
DQM/SiStripCommissioningSources := DQMSiStripCommissioningSources
DQMSiStripCommissioningSources_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMSiStripCommissioningSources_EX_USE := $(foreach d, self  CalibFormats/SiStripObjects CalibTracker/SiStripAPVAnalysis CondFormats/DataRecord CondFormats/SiStripObjects DataFormats/Common DataFormats/SiStripCommon DQM/SiStripCommon DQMServices/Core FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities boost rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMSiStripCommissioningSources_EX_LIB   := DQMSiStripCommissioningSources
ALL_EXTERNAL_PRODS += DQMSiStripCommissioningSources
endif
ifeq ($(strip $(RecoPixelVertexing/PixelTrackFitting)),)
RecoPixelVertexingPixelTrackFitting := self/RecoPixelVertexing/PixelTrackFitting
RecoPixelVertexing/PixelTrackFitting := RecoPixelVertexingPixelTrackFitting
RecoPixelVertexingPixelTrackFitting_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoPixelVertexingPixelTrackFitting_EX_USE := $(foreach d, self  CommonTools/Statistics DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/SiPixelDetId DataFormats/TrackerRecHit2D DataFormats/TrackingRecHit DataFormats/TrackReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager Geometry/CommonDetUnit Geometry/Records Geometry/TrackerGeometryBuilder MagneticField/Engine MagneticField/Records RecoTracker/TkMSParametrization RecoTracker/TkTrackingRegions TrackingTools/DetLayers TrackingTools/PatternTools TrackingTools/KalmanUpdators TrackingTools/Records TrackingTools/TrajectoryParametrization TrackingTools/TrajectoryState TrackingTools/TransientTrackingRecHit RecoTracker/TransientTrackingRecHit,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoPixelVertexingPixelTrackFitting_EX_LIB   := RecoPixelVertexingPixelTrackFitting
ALL_EXTERNAL_PRODS += RecoPixelVertexingPixelTrackFitting
endif
ifeq ($(strip $(DataFormats/FP420Digi)),)
DataFormatsFP420Digi := self/DataFormats/FP420Digi
DataFormats/FP420Digi := DataFormatsFP420Digi
DataFormatsFP420Digi_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsFP420Digi_EX_USE := $(foreach d, self  DataFormats/Common boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsFP420Digi_LCGDICTS  := x 
DataFormatsFP420Digi_EX_LIB   := DataFormatsFP420Digi
ALL_EXTERNAL_PRODS += DataFormatsFP420Digi
endif
ifeq ($(strip $(RecoVertex/TrimmedVertexFit)),)
RecoVertexTrimmedVertexFit := self/RecoVertex/TrimmedVertexFit
RecoVertex/TrimmedVertexFit := RecoVertexTrimmedVertexFit
RecoVertexTrimmedVertexFit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoVertexTrimmedVertexFit_EX_USE := $(foreach d, self  DataFormats/BeamSpot FWCore/MessageLogger FWCore/ParameterSet RecoVertex/TrimmedKalmanVertexFinder RecoVertex/VertexPrimitives RecoVertex/VertexTools,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoVertexTrimmedVertexFit_EX_LIB   := RecoVertexTrimmedVertexFit
ALL_EXTERNAL_PRODS += RecoVertexTrimmedVertexFit
endif
ifeq ($(strip $(DataFormats/CSCRecHit)),)
DataFormatsCSCRecHit := self/DataFormats/CSCRecHit
DataFormats/CSCRecHit := DataFormatsCSCRecHit
DataFormatsCSCRecHit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsCSCRecHit_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/MuonDetId DataFormats/GeometryVector DataFormats/TrackingRecHit rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsCSCRecHit_LCGDICTS  := x 
DataFormatsCSCRecHit_EX_LIB   := DataFormatsCSCRecHit
ALL_EXTERNAL_PRODS += DataFormatsCSCRecHit
endif
ifeq ($(strip $(RecoJets/JetAlgorithms)),)
RecoJetsJetAlgorithms := self/RecoJets/JetAlgorithms
RecoJets/JetAlgorithms := RecoJetsJetAlgorithms
RecoJetsJetAlgorithms_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoJetsJetAlgorithms_EX_USE := $(foreach d, self  fastjet ktjet DataFormats/JetReco DataFormats/Candidate FWCore/Framework SimDataFormats/Vertex SimDataFormats/Track DataFormats/HepMCCandidate,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoJetsJetAlgorithms_EX_LIB   := RecoJetsJetAlgorithms
ALL_EXTERNAL_PRODS += RecoJetsJetAlgorithms
endif
ifeq ($(strip $(RecoTracker/Record)),)
RecoTrackerRecord := self/RecoTracker/Record
RecoTracker/Record := RecoTrackerRecord
RecoTrackerRecord_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerRecord_EX_USE := $(foreach d, self  FWCore/Utilities FWCore/Framework Geometry/Records TrackingTools/Records CondFormats/DataRecord CalibTracker/Records clhep boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerRecord_EX_LIB   := RecoTrackerRecord
ALL_EXTERNAL_PRODS += RecoTrackerRecord
endif
ifeq ($(strip $(FWCore/Catalog)),)
FWCoreCatalog := self/FWCore/Catalog
FWCore/Catalog := FWCoreCatalog
FWCoreCatalog_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCoreCatalog_EX_USE := $(foreach d, self  FWCore/ServiceRegistry FWCore/Utilities xerces-c boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCoreCatalog_EX_LIB   := FWCoreCatalog
ALL_EXTERNAL_PRODS += FWCoreCatalog
endif
ifeq ($(strip $(CalibTracker/SiStripQuality)),)
CalibTrackerSiStripQuality := self/CalibTracker/SiStripQuality
CalibTracker/SiStripQuality := CalibTrackerSiStripQuality
CalibTrackerSiStripQuality_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibTrackerSiStripQuality_EX_USE := $(foreach d, self  boost root DQMServices/Core FWCore/MessageLogger CondFormats/DataRecord CondFormats/SiStripObjects CalibFormats/SiStripObjects Geometry/TrackerGeometryBuilder Geometry/Records,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibTrackerSiStripQuality_EX_LIB   := CalibTrackerSiStripQuality
ALL_EXTERNAL_PRODS += CalibTrackerSiStripQuality
endif
ifeq ($(strip $(RecoVertex/AdaptiveVertexFit)),)
RecoVertexAdaptiveVertexFit := self/RecoVertex/AdaptiveVertexFit
RecoVertex/AdaptiveVertexFit := RecoVertexAdaptiveVertexFit
RecoVertexAdaptiveVertexFit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoVertexAdaptiveVertexFit_EX_USE := $(foreach d, self  FWCore/ParameterSet DataFormats/GeometryCommonDetAlgo DataFormats/GeometryVector TrackingTools/TrajectoryState RecoVertex/VertexPrimitives,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoVertexAdaptiveVertexFit_EX_LIB   := RecoVertexAdaptiveVertexFit
ALL_EXTERNAL_PRODS += RecoVertexAdaptiveVertexFit
endif
ifeq ($(strip $(TopQuarkAnalysis/TopTools)),)
TopQuarkAnalysisTopTools := self/TopQuarkAnalysis/TopTools
TopQuarkAnalysis/TopTools := TopQuarkAnalysisTopTools
TopQuarkAnalysisTopTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TopQuarkAnalysisTopTools_EX_USE := $(foreach d, self  rootgpad DataFormats/PatCandidates,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TopQuarkAnalysisTopTools_EX_LIB   := TopQuarkAnalysisTopTools
ALL_EXTERNAL_PRODS += TopQuarkAnalysisTopTools
endif
ifeq ($(strip $(RecoMuon/MuonIsolationProducers)),)
src_RecoMuon_MuonIsolationProducers := self/RecoMuon/MuonIsolationProducers
RecoMuon/MuonIsolationProducers  := src_RecoMuon_MuonIsolationProducers
src_RecoMuon_MuonIsolationProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_RecoMuon_MuonIsolationProducers_EX_USE := $(foreach d, FWCore/Framework self Geometry/CaloGeometry RecoMuon/MuonIsolation FWCore/PluginManager MagneticField/Records FWCore/MessageLogger Geometry/CaloEventSetup Geometry/Records DataFormats/TrackReco DataFormats/MuonReco DataFormats/CaloTowers MagneticField/Engine FWCore/ParameterSet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_RecoMuon_MuonIsolationProducers
endif

ifeq ($(strip $(DetectorDescription/Parser)),)
DetectorDescriptionParser := self/DetectorDescription/Parser
DetectorDescription/Parser := DetectorDescriptionParser
DetectorDescriptionParser_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DetectorDescriptionParser_EX_USE := $(foreach d, self  DetectorDescription/Algorithm DetectorDescription/Base DetectorDescription/Core DetectorDescription/ExprAlgo FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities boost clhepheader rootmath xerces-c,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DetectorDescriptionParser_EX_LIB   := DetectorDescriptionParser
ALL_EXTERNAL_PRODS += DetectorDescriptionParser
endif
ifeq ($(strip $(CalibTracker/Records)),)
CalibTrackerRecords := self/CalibTracker/Records
CalibTracker/Records := CalibTrackerRecords
CalibTrackerRecords_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibTrackerRecords_EX_USE := $(foreach d, self  CondFormats/DataRecord FWCore/Framework Geometry/Records MagneticField/Records boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibTrackerRecords_EX_LIB   := CalibTrackerRecords
ALL_EXTERNAL_PRODS += CalibTrackerRecords
endif
ifeq ($(strip $(CalibMuon/DTDigiSync)),)
CalibMuonDTDigiSync := self/CalibMuon/DTDigiSync
CalibMuon/DTDigiSync := CalibMuonDTDigiSync
CalibMuonDTDigiSync_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibMuonDTDigiSync_EX_USE := $(foreach d, self  FWCore/Framework Geometry/Records Geometry/DTGeometry CondFormats/DTObjects CondFormats/DataRecord,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibMuonDTDigiSync_EX_LIB   := CalibMuonDTDigiSync
ALL_EXTERNAL_PRODS += CalibMuonDTDigiSync
endif
ifeq ($(strip $(SimMuon/Neutron)),)
SimMuonNeutron := self/SimMuon/Neutron
SimMuon/Neutron := SimMuonNeutron
SimMuonNeutron_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimMuonNeutron_EX_USE := $(foreach d, self  SimDataFormats/EncodedEventId FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger clhep rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimMuonNeutron_ROOTDICT  := LinkDef
SimMuonNeutron_EX_LIB   := SimMuonNeutron
ALL_EXTERNAL_PRODS += SimMuonNeutron
endif
ifeq ($(strip $(DetectorDescription/ExprAlgo)),)
DetectorDescriptionExprAlgo := self/DetectorDescription/ExprAlgo
DetectorDescription/ExprAlgo := DetectorDescriptionExprAlgo
DetectorDescriptionExprAlgo_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DetectorDescriptionExprAlgo_EX_USE := $(foreach d, self  DetectorDescription/Base FWCore/MessageLogger clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DetectorDescriptionExprAlgo_EX_LIB   := DetectorDescriptionExprAlgo
ALL_EXTERNAL_PRODS += DetectorDescriptionExprAlgo
endif
ifeq ($(strip $(Geometry/DTGeometry)),)
GeometryDTGeometry := self/Geometry/DTGeometry
Geometry/DTGeometry := GeometryDTGeometry
GeometryDTGeometry_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryDTGeometry_EX_USE := $(foreach d, self  Geometry/CommonDetUnit DataFormats/MuonDetId,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryDTGeometry_EX_LIB   := GeometryDTGeometry
ALL_EXTERNAL_PRODS += GeometryDTGeometry
endif
ifeq ($(strip $(DQMServices/XdaqCollector)),)
DQMServicesXdaqCollector := self/DQMServices/XdaqCollector
DQMServices/XdaqCollector := DQMServicesXdaqCollector
DQMServicesXdaqCollector_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMServicesXdaqCollector_EX_USE := $(foreach d, self  DQMServices/Core FWCore/Framework EventFilter/Utilities xdaq curl,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMServicesXdaqCollector_EX_LIB   := DQMServicesXdaqCollector
ALL_EXTERNAL_PRODS += DQMServicesXdaqCollector
endif
ifeq ($(strip $(SimG4Core/Application)),)
SimG4CoreApplication := self/SimG4Core/Application
SimG4Core/Application := SimG4CoreApplication
SimG4CoreApplication_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CoreApplication_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/Math SimDataFormats/GeneratorProducts SimDataFormats/Forward SimDataFormats/Track SimDataFormats/Vertex SimG4Core/Generators SimG4Core/Geometry SimG4Core/MagneticField SimG4Core/Notification SimG4Core/Physics SimG4Core/SensitiveDetector SimG4Core/Watcher SimGeneral/HepPDTRecord FWCore/ParameterSet FWCore/PluginManager FWCore/Framework MagneticField/Engine MagneticField/Records clhep geant4core hepmc heppdt rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CoreApplication_EX_LIB   := SimG4CoreApplication
ALL_EXTERNAL_PRODS += SimG4CoreApplication
endif
ifeq ($(strip $(DataFormats/RPCDigi)),)
DataFormatsRPCDigi := self/DataFormats/RPCDigi
DataFormats/RPCDigi := DataFormatsRPCDigi
DataFormatsRPCDigi_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsRPCDigi_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/MuonDetId CondFormats/RPCObjects boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsRPCDigi_LCGDICTS  := x 
DataFormatsRPCDigi_EX_LIB   := DataFormatsRPCDigi
ALL_EXTERNAL_PRODS += DataFormatsRPCDigi
endif
ifeq ($(strip $(TopQuarkAnalysis/Examples)),)
src_TopQuarkAnalysis_Examples := self/TopQuarkAnalysis/Examples
TopQuarkAnalysis/Examples  := src_TopQuarkAnalysis_Examples
src_TopQuarkAnalysis_Examples_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_TopQuarkAnalysis_Examples_EX_USE := $(foreach d, AnalysisDataFormats/TopObjects FWCore/Framework self root DataFormats/PatCandidates DataFormats/Provenance DataFormats/RecoCandidate CommonTools/UtilAlgos DataFormats/Candidate FWCore/ServiceRegistry CommonTools/CandUtils,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_TopQuarkAnalysis_Examples
endif

ifeq ($(strip $(CondTools/Hcal)),)
CondToolsHcal := self/CondTools/Hcal
CondTools/Hcal := CondToolsHcal
CondToolsHcal_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondToolsHcal_EX_USE := $(foreach d, self  boost oracle oracleocci FWCore/Framework DataFormats/HcalDetId CalibCalorimetry/HcalAlgos CalibCalorimetry/CastorCalib CondFormats/HcalObjects CondFormats/CastorObjects CalibFormats/HcalObjects CalibFormats/CastorObjects CondCore/IOVService CondCore/DBCommon RelationalAccess CondCore/MetaDataService CondCore/PopCon xerces-c,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondToolsHcal_EX_LIB   := CondToolsHcal
ALL_EXTERNAL_PRODS += CondToolsHcal
endif
ifeq ($(strip $(SimG4CMS/FP420)),)
SimG4CMSFP420 := self/SimG4CMS/FP420
SimG4CMS/FP420 := SimG4CMSFP420
SimG4CMSFP420_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CMSFP420_EX_USE := $(foreach d, self  FWCore/PluginManager SimG4Core/Watcher SimG4Core/SensitiveDetector SimG4Core/Notification SimG4Core/Application SimG4CMS/Calo SimDataFormats/SimHitMaker DataFormats/GeometryVector SimDataFormats/CaloHit DetectorDescription/Core FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger SimGeneral/HepPDTRecord boost geant4core root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CMSFP420_EX_LIB   := SimG4CMSFP420
ALL_EXTERNAL_PRODS += SimG4CMSFP420
endif
ifeq ($(strip $(L1Trigger/HardwareValidation)),)
L1TriggerHardwareValidation := self/L1Trigger/HardwareValidation
L1Trigger/HardwareValidation := L1TriggerHardwareValidation
L1TriggerHardwareValidation_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerHardwareValidation_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/MessageLogger DataFormats/EcalDigi DataFormats/L1CaloTrigger DataFormats/CSCDigi DataFormats/L1DTTrackFinder DataFormats/L1GlobalMuonTrigger DataFormats/L1GlobalTrigger DataFormats/L1Trigger DataFormats/FEDRawData CondTools/L1Trigger,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerHardwareValidation_EX_LIB   := L1TriggerHardwareValidation
ALL_EXTERNAL_PRODS += L1TriggerHardwareValidation
endif
ifeq ($(strip $(CondFormats/JetMETObjects)),)
CondFormatsJetMETObjects := self/CondFormats/JetMETObjects
CondFormats/JetMETObjects := CondFormatsJetMETObjects
CondFormatsJetMETObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsJetMETObjects_EX_USE := $(foreach d, self  DataFormats/CaloTowers FWCore/ParameterSet FWCore/Utilities root rootmath rootrflx clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsJetMETObjects_LCGDICTS  := x 
CondFormatsJetMETObjects_EX_LIB   := CondFormatsJetMETObjects
ALL_EXTERNAL_PRODS += CondFormatsJetMETObjects
endif
ifeq ($(strip $(RecoPixelVertexing/PixelTriplets)),)
RecoPixelVertexingPixelTriplets := self/RecoPixelVertexing/PixelTriplets
RecoPixelVertexing/PixelTriplets := RecoPixelVertexingPixelTriplets
RecoPixelVertexingPixelTriplets_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoPixelVertexingPixelTriplets_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet FWCore/PluginManager Geometry/Records Geometry/TrackerGeometryBuilder Geometry/CommonDetUnit Geometry/CommonTopologies RecoTracker/TkHitPairs MagneticField/Records MagneticField/Engine RecoTracker/TkSeedingLayers,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoPixelVertexingPixelTriplets_EX_LIB   := RecoPixelVertexingPixelTriplets
ALL_EXTERNAL_PRODS += RecoPixelVertexingPixelTriplets
endif
ifeq ($(strip $(Geometry/DTGeometryBuilder)),)
GeometryDTGeometryBuilder := self/Geometry/DTGeometryBuilder
Geometry/DTGeometryBuilder := GeometryDTGeometryBuilder
GeometryDTGeometryBuilder_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryDTGeometryBuilder_EX_USE := $(foreach d, self  DataFormats/GeometrySurface DataFormats/MuonDetId DetectorDescription/Core Geometry/DTGeometry Geometry/MuonNumbering clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryDTGeometryBuilder_EX_LIB   := GeometryDTGeometryBuilder
ALL_EXTERNAL_PRODS += GeometryDTGeometryBuilder
endif
ifeq ($(strip $(EventFilter/Goodies)),)
EventFilterGoodies := self/EventFilter/Goodies
EventFilter/Goodies := EventFilterGoodies
EventFilterGoodies_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterGoodies_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ServiceRegistry FWCore/ParameterSet FWCore/PythonParameterSet FWCore/PluginManager EventFilter/Utilities root rootgraphics classlib DQMServices/Core,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterGoodies_EX_LIB   := EventFilterGoodies
ALL_EXTERNAL_PRODS += EventFilterGoodies
endif
ifeq ($(strip $(CondCore/PopCon)),)
CondCorePopCon := self/CondCore/PopCon
CondCore/PopCon := CondCorePopCon
CondCorePopCon_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondCorePopCon_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet CondCore/DBCommon CondCore/DBOutputService CondCore/IOVService,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondCorePopCon_EX_LIB   := CondCorePopCon
ALL_EXTERNAL_PRODS += CondCorePopCon
endif
ifeq ($(strip $(Validation/Tools)),)
src_Validation_Tools := self/Validation/Tools
Validation/Tools  := src_Validation_Tools
src_Validation_Tools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_Validation_Tools_EX_USE := $(foreach d, self root DQMServices/Core,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_Validation_Tools
endif

ifeq ($(strip $(MagneticField/Records)),)
MagneticFieldRecords := self/MagneticField/Records
MagneticField/Records := MagneticFieldRecords
MagneticFieldRecords_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
MagneticFieldRecords_EX_USE := $(foreach d, self  FWCore/Framework Geometry/Records CondFormats/DataRecord boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
MagneticFieldRecords_EX_LIB   := MagneticFieldRecords
ALL_EXTERNAL_PRODS += MagneticFieldRecords
endif
ifeq ($(strip $(PhysicsTools/UtilAlgos)),)
PhysicsToolsUtilAlgos := self/PhysicsTools/UtilAlgos
PhysicsTools/UtilAlgos := PhysicsToolsUtilAlgos
PhysicsToolsUtilAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsUtilAlgos_EX_USE := $(foreach d, self  FWCore/ServiceRegistry FWCore/MessageLogger FWCore/Framework FWCore/ParameterSet FWCore/Services FWCore/Utilities FWCore/Common DataFormats/Common DataFormats/Provenance CommonTools/UtilAlgos DataFormats/MuonReco DataFormats/PatCandidates root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsUtilAlgos_EX_LIB   := PhysicsToolsUtilAlgos
ALL_EXTERNAL_PRODS += PhysicsToolsUtilAlgos
endif
ifeq ($(strip $(Validation/RecoB)),)
ValidationRecoB := self/Validation/RecoB
Validation/RecoB := ValidationRecoB
ValidationRecoB_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
ValidationRecoB_EX_USE := $(foreach d, self  root rootcore DataFormats/BTauReco DataFormats/Common DQMServices/Core FWCore/Framework FWCore/ParameterSet FWCore/Utilities,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ValidationRecoB_EX_LIB   := ValidationRecoB
ALL_EXTERNAL_PRODS += ValidationRecoB
endif
ifeq ($(strip $(DataFormats/TrackingSeed)),)
DataFormatsTrackingSeed := self/DataFormats/TrackingSeed
DataFormats/TrackingSeed := DataFormatsTrackingSeed
DataFormatsTrackingSeed_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsTrackingSeed_EX_USE := $(foreach d, self  DataFormats/Common rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsTrackingSeed_LCGDICTS  := x 
DataFormatsTrackingSeed_EX_LIB   := DataFormatsTrackingSeed
ALL_EXTERNAL_PRODS += DataFormatsTrackingSeed
endif
ifeq ($(strip $(Fireworks/Geometry)),)
FireworksGeometry := self/Fireworks/Geometry
Fireworks/Geometry := FireworksGeometry
FireworksGeometry_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FireworksGeometry_EX_USE := $(foreach d, self  FWCore/PluginManager FWCore/Framework FWCore/MessageLogger Geometry/CommonDetUnit Geometry/MuonNumbering Geometry/EcalCommonData Geometry/CSCGeometryBuilder DetectorDescription/Core Geometry/CaloGeometry Geometry/DTGeometry Geometry/CSCGeometry Geometry/RPCGeometry Geometry/TrackerGeometryBuilder Geometry/Records DataFormats/GeometrySurface Fireworks/Core rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FireworksGeometry_EX_LIB   := FireworksGeometry
ALL_EXTERNAL_PRODS += FireworksGeometry
endif
ifeq ($(strip $(DataFormats/SiStripDigi)),)
DataFormatsSiStripDigi := self/DataFormats/SiStripDigi
DataFormats/SiStripDigi := DataFormatsSiStripDigi
DataFormatsSiStripDigi_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsSiStripDigi_EX_USE := $(foreach d, self  DataFormats/Common boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsSiStripDigi_LCGDICTS  := x 
DataFormatsSiStripDigi_EX_LIB   := DataFormatsSiStripDigi
ALL_EXTERNAL_PRODS += DataFormatsSiStripDigi
endif
ifeq ($(strip $(SimCalorimetry/EcalSelectiveReadoutAlgos)),)
SimCalorimetryEcalSelectiveReadoutAlgos := self/SimCalorimetry/EcalSelectiveReadoutAlgos
SimCalorimetry/EcalSelectiveReadoutAlgos := SimCalorimetryEcalSelectiveReadoutAlgos
SimCalorimetryEcalSelectiveReadoutAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimCalorimetryEcalSelectiveReadoutAlgos_EX_USE := $(foreach d, self  Geometry/CaloTopology Geometry/EcalMapping DataFormats/EcalDigi DataFormats/EcalDetId boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimCalorimetryEcalSelectiveReadoutAlgos_EX_LIB   := SimCalorimetryEcalSelectiveReadoutAlgos
ALL_EXTERNAL_PRODS += SimCalorimetryEcalSelectiveReadoutAlgos
endif
ifeq ($(strip $(FastSimulation/Utilities)),)
FastSimulationUtilities := self/FastSimulation/Utilities
FastSimulation/Utilities := FastSimulationUtilities
FastSimulationUtilities_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationUtilities_EX_USE := $(foreach d, self  clhep root rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationUtilities_EX_LIB   := FastSimulationUtilities
ALL_EXTERNAL_PRODS += FastSimulationUtilities
endif
ifeq ($(strip $(AnalysisDataFormats/TrackInfo)),)
AnalysisDataFormatsTrackInfo := self/AnalysisDataFormats/TrackInfo
AnalysisDataFormats/TrackInfo := AnalysisDataFormatsTrackInfo
AnalysisDataFormatsTrackInfo_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AnalysisDataFormatsTrackInfo_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/TrackReco DataFormats/VertexReco DataFormats/TrackingRecHit DataFormats/TrajectorySeed DataFormats/TrajectoryState SimDataFormats/GeneratorProducts SimDataFormats/TrackingAnalysis TrackingTools/PatternTools FWCore/MessageLogger rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AnalysisDataFormatsTrackInfo_LCGDICTS  := x 
AnalysisDataFormatsTrackInfo_EX_LIB   := AnalysisDataFormatsTrackInfo
ALL_EXTERNAL_PRODS += AnalysisDataFormatsTrackInfo
endif
ifeq ($(strip $(PhysicsTools/JetMCAlgos)),)
PhysicsToolsJetMCAlgos := self/PhysicsTools/JetMCAlgos
PhysicsTools/JetMCAlgos := PhysicsToolsJetMCAlgos
PhysicsToolsJetMCAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsJetMCAlgos_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet PhysicsTools/JetMCUtils,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsJetMCAlgos_EX_LIB   := PhysicsToolsJetMCAlgos
ALL_EXTERNAL_PRODS += PhysicsToolsJetMCAlgos
endif
ifeq ($(strip $(RecoTracker/ConversionSeedGenerators)),)
RecoTrackerConversionSeedGenerators := self/RecoTracker/ConversionSeedGenerators
RecoTracker/ConversionSeedGenerators := RecoTrackerConversionSeedGenerators
RecoTrackerConversionSeedGenerators_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerConversionSeedGenerators_EX_USE := $(foreach d, self  root FWCore/Framework FWCore/PluginManager DataFormats/Common FWCore/ParameterSet Geometry/Records Geometry/CommonDetUnit DataFormats/TrajectorySeed DataFormats/TrackerRecHit2D Geometry/CommonTopologies Geometry/TrackerGeometryBuilder DataFormats/DetId DataFormats/SiStripDetId TrackingTools/PatternTools MagneticField/Records MagneticField/Engine TrackingTools/KalmanUpdators TrackingTools/Records RecoLocalTracker/ClusterParameterEstimator RecoTracker/TransientTrackingRecHit RecoTracker/TkSeedGenerator RecoTracker/TkSeedingLayers TrackingTools/TransientTrackingRecHit RecoTracker/TkMSParametrization TrackingTools/DetLayers RecoTracker/TkHitPairs RecoTracker/TkTrackingRegions,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerConversionSeedGenerators_EX_LIB   := RecoTrackerConversionSeedGenerators
ALL_EXTERNAL_PRODS += RecoTrackerConversionSeedGenerators
endif
ifeq ($(strip $(CalibTracker/SiStripLorentzAngle)),)
CalibTrackerSiStripLorentzAngle := self/CalibTracker/SiStripLorentzAngle
CalibTracker/SiStripLorentzAngle := CalibTrackerSiStripLorentzAngle
CalibTrackerSiStripLorentzAngle_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibTrackerSiStripLorentzAngle_EX_USE := $(foreach d, self  DataFormats/SiStripDetId root DataFormats/SiStripCluster,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibTrackerSiStripLorentzAngle_EX_LIB   := CalibTrackerSiStripLorentzAngle
ALL_EXTERNAL_PRODS += CalibTrackerSiStripLorentzAngle
endif
ifeq ($(strip $(Alignment/ReferenceTrajectories)),)
AlignmentReferenceTrajectories := self/Alignment/ReferenceTrajectories
Alignment/ReferenceTrajectories := AlignmentReferenceTrajectories
AlignmentReferenceTrajectories_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentReferenceTrajectories_EX_USE := $(foreach d, self  Alignment/TwoBodyDecay DataFormats/CLHEP DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/TrackingRecHit DataFormats/TrajectoryState FWCore/MessageLogger FWCore/PluginManager Geometry/CommonDetUnit TrackingTools/AnalyticalJacobians TrackingTools/GeomPropagators TrackingTools/MaterialEffects TrackingTools/PatternTools TrackingTools/TrajectoryState TrackingTools/TrackFitters TrackingTools/TransientTrackingRecHit RecoTracker/TransientTrackingRecHit TrackPropagation/RungeKutta,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentReferenceTrajectories_EX_LIB   := AlignmentReferenceTrajectories
ALL_EXTERNAL_PRODS += AlignmentReferenceTrajectories
endif
ifeq ($(strip $(JetMETCorrections/JetParton)),)
JetMETCorrectionsJetParton := self/JetMETCorrections/JetParton
JetMETCorrections/JetParton := JetMETCorrectionsJetParton
JetMETCorrectionsJetParton_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
JetMETCorrectionsJetParton_EX_USE := $(foreach d, self  clhep DataFormats/Common JetMETCorrections/Objects FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/JetReco DataFormats/RecoCandidate rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
JetMETCorrectionsJetParton_EX_LIB   := JetMETCorrectionsJetParton
ALL_EXTERNAL_PRODS += JetMETCorrectionsJetParton
endif
ifeq ($(strip $(CondFormats/GeometryObjects)),)
CondFormatsGeometryObjects := self/CondFormats/GeometryObjects
CondFormats/GeometryObjects := CondFormatsGeometryObjects
CondFormatsGeometryObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsGeometryObjects_EX_USE := $(foreach d, self  CondFormats/Common FWCore/MessageLogger DataFormats/Common DataFormats/DetId rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsGeometryObjects_LCGDICTS  := x 
CondFormatsGeometryObjects_EX_LIB   := CondFormatsGeometryObjects
ALL_EXTERNAL_PRODS += CondFormatsGeometryObjects
endif
ifeq ($(strip $(DQM/TrackerCommon)),)
DQMTrackerCommon := self/DQM/TrackerCommon
DQM/TrackerCommon := DQMTrackerCommon
DQMTrackerCommon_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMTrackerCommon_EX_USE := $(foreach d, self  DQMServices/Core FWCore/Framework CondFormats/DataRecord DataFormats/Common DataFormats/Scalers DataFormats/L1GlobalTrigger L1Trigger/GlobalTriggerAnalyzer HLTrigger/HLTcore rootgraphics xdaq,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMTrackerCommon_EX_LIB   := DQMTrackerCommon
ALL_EXTERNAL_PRODS += DQMTrackerCommon
endif
ifeq ($(strip $(CalibTracker/SiPixelESProducers)),)
CalibTrackerSiPixelESProducers := self/CalibTracker/SiPixelESProducers
CalibTracker/SiPixelESProducers := CalibTrackerSiPixelESProducers
CalibTrackerSiPixelESProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibTrackerSiPixelESProducers_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger CondFormats/DataRecord CondFormats/SiPixelObjects CalibTracker/Records MagneticField/VolumeBasedEngine boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibTrackerSiPixelESProducers_EX_LIB   := CalibTrackerSiPixelESProducers
ALL_EXTERNAL_PRODS += CalibTrackerSiPixelESProducers
endif
ifeq ($(strip $(DQM/SiStripCommissioningSummary)),)
DQMSiStripCommissioningSummary := self/DQM/SiStripCommissioningSummary
DQM/SiStripCommissioningSummary := DQMSiStripCommissioningSummary
DQMSiStripCommissioningSummary_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMSiStripCommissioningSummary_EX_USE := $(foreach d, self  CondFormats/SiStripObjects DataFormats/SiStripCommon DataFormats/SiStripDetId boost rootgraphics,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMSiStripCommissioningSummary_EX_LIB   := DQMSiStripCommissioningSummary
ALL_EXTERNAL_PRODS += DQMSiStripCommissioningSummary
endif
ifeq ($(strip $(SimDataFormats/GeneratorProducts)),)
SimDataFormatsGeneratorProducts := self/SimDataFormats/GeneratorProducts
SimDataFormats/GeneratorProducts := SimDataFormatsGeneratorProducts
SimDataFormatsGeneratorProducts_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsGeneratorProducts_EX_USE := $(foreach d, self  FWCore/Utilities FWCore/MessageLogger DataFormats/Common hepmc rootrflx roothistmatrix,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsGeneratorProducts_LCGDICTS  := x 
SimDataFormatsGeneratorProducts_EX_LIB   := SimDataFormatsGeneratorProducts
ALL_EXTERNAL_PRODS += SimDataFormatsGeneratorProducts
endif
ifeq ($(strip $(FastSimDataFormats/PileUpEvents)),)
FastSimDataFormatsPileUpEvents := self/FastSimDataFormats/PileUpEvents
FastSimDataFormats/PileUpEvents := FastSimDataFormatsPileUpEvents
FastSimDataFormatsPileUpEvents_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimDataFormatsPileUpEvents_EX_USE := $(foreach d, self  rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimDataFormatsPileUpEvents_LCGDICTS  := x 
FastSimDataFormatsPileUpEvents_EX_LIB   := FastSimDataFormatsPileUpEvents
ALL_EXTERNAL_PRODS += FastSimDataFormatsPileUpEvents
endif
ifeq ($(strip $(SimCalorimetry/HcalSimAlgos)),)
SimCalorimetryHcalSimAlgos := self/SimCalorimetry/HcalSimAlgos
SimCalorimetry/HcalSimAlgos := SimCalorimetryHcalSimAlgos
SimCalorimetryHcalSimAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimCalorimetryHcalSimAlgos_EX_USE := $(foreach d, self  SimCalorimetry/CaloSimAlgos CondFormats/HcalObjects CalibCalorimetry/HcalAlgos CalibFormats/HcalObjects DataFormats/HcalDigi clhep rootcore DataFormats/HcalDetId Geometry/CaloTopology,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimCalorimetryHcalSimAlgos_LCGDICTS  := x 
SimCalorimetryHcalSimAlgos_EX_LIB   := SimCalorimetryHcalSimAlgos
ALL_EXTERNAL_PRODS += SimCalorimetryHcalSimAlgos
endif
ifeq ($(strip $(DataFormats/L1GlobalMuonTrigger)),)
DataFormatsL1GlobalMuonTrigger := self/DataFormats/L1GlobalMuonTrigger
DataFormats/L1GlobalMuonTrigger := DataFormatsL1GlobalMuonTrigger
DataFormatsL1GlobalMuonTrigger_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsL1GlobalMuonTrigger_EX_USE := $(foreach d, self  DataFormats/Common FWCore/MessageLogger rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsL1GlobalMuonTrigger_LCGDICTS  := x 
DataFormatsL1GlobalMuonTrigger_EX_LIB   := DataFormatsL1GlobalMuonTrigger
ALL_EXTERNAL_PRODS += DataFormatsL1GlobalMuonTrigger
endif
ifeq ($(strip $(SimDataFormats/HiGenData)),)
SimDataFormatsHiGenData := self/SimDataFormats/HiGenData
SimDataFormats/HiGenData := SimDataFormatsHiGenData
SimDataFormatsHiGenData_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsHiGenData_EX_USE := $(foreach d, self  rootrflx DataFormats/HepMCCandidate,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsHiGenData_LCGDICTS  := x 
SimDataFormatsHiGenData_EX_LIB   := SimDataFormatsHiGenData
ALL_EXTERNAL_PRODS += SimDataFormatsHiGenData
endif
ifeq ($(strip $(Utilities/LStoreAdaptor)),)
UtilitiesLStoreAdaptor := self/Utilities/LStoreAdaptor
Utilities/LStoreAdaptor := UtilitiesLStoreAdaptor
UtilitiesLStoreAdaptor_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
UtilitiesLStoreAdaptor_EX_USE := $(foreach d, self  Utilities/StorageFactory FWCore/Utilities FWCore/MessageLogger boost boost_filesystem boost_regex,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
UtilitiesLStoreAdaptor_EX_LIB   := UtilitiesLStoreAdaptor
ALL_EXTERNAL_PRODS += UtilitiesLStoreAdaptor
endif
ifeq ($(strip $(RecoEgamma/Examples)),)
src_RecoEgamma_Examples := self/RecoEgamma/Examples
RecoEgamma/Examples  := src_RecoEgamma_Examples
src_RecoEgamma_Examples_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_RecoEgamma_Examples_EX_USE := $(foreach d, SimDataFormats/GeneratorProducts clhep RecoEcal/EgammaCoreTools FWCore/Framework self DataFormats/JetReco DataFormats/DetId DataFormats/EgammaReco root DataFormats/EgammaCandidates MagneticField/Records FWCore/PluginManager RecoEgamma/EgammaMCTools DataFormats/Common hepmc RecoEgamma/EgammaElectronAlgos CommonTools/UtilAlgos FWCore/ServiceRegistry DataFormats/TrackingRecHit MagneticField/Engine FWCore/ParameterSet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_RecoEgamma_Examples
endif

ifeq ($(strip $(SimG4CMS/Forward)),)
SimG4CMSForward := self/SimG4CMS/Forward
SimG4CMS/Forward := SimG4CMSForward
SimG4CMSForward_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CMSForward_EX_USE := $(foreach d, self  FWCore/PluginManager SimG4Core/Watcher SimG4Core/SensitiveDetector SimG4Core/Notification SimG4Core/Application SimG4CMS/Calo DataFormats/Math SimDataFormats/SimHitMaker SimDataFormats/CaloHit SimDataFormats/Forward DetectorDescription/Core FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger boost geant4core root rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CMSForward_EX_LIB   := SimG4CMSForward
ALL_EXTERNAL_PRODS += SimG4CMSForward
endif
ifeq ($(strip $(CondFormats/HcalObjects)),)
CondFormatsHcalObjects := self/CondFormats/HcalObjects
CondFormats/HcalObjects := CondFormatsHcalObjects
CondFormatsHcalObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsHcalObjects_EX_USE := $(foreach d, self  CondFormats/Common DataFormats/DetId DataFormats/HcalDetId FWCore/Utilities rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsHcalObjects_LCGDICTS  := x 
CondFormatsHcalObjects_EX_LIB   := CondFormatsHcalObjects
ALL_EXTERNAL_PRODS += CondFormatsHcalObjects
endif
ifeq ($(strip $(Mixing/Base)),)
MixingBase := self/Mixing/Base
Mixing/Base := MixingBase
MixingBase_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
MixingBase_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/Provenance FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Sources FWCore/Utilities FWCore/Version boost clhep roothistmatrix CondFormats/RunInfo CondFormats/DataRecord,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
MixingBase_EX_LIB   := MixingBase
ALL_EXTERNAL_PRODS += MixingBase
endif
ifeq ($(strip $(FastSimulation/EgammaElectronAlgos)),)
FastSimulationEgammaElectronAlgos := self/FastSimulation/EgammaElectronAlgos
FastSimulation/EgammaElectronAlgos := FastSimulationEgammaElectronAlgos
FastSimulationEgammaElectronAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationEgammaElectronAlgos_EX_USE := $(foreach d, self  FastSimulation/ParticlePropagator FastSimulation/TrackerSetup FastSimulation/Tracking RecoTracker/Record RecoTracker/TkSeedGenerator TrackingTools/KalmanUpdators TrackingTools/MaterialEffects TrackingTools/TrajectoryState TrackingTools/TransientTrackingRecHit Geometry/Records Geometry/TrackerGeometryBuilder MagneticField/Records FWCore/Framework FWCore/MessageLogger SimDataFormats/Track DataFormats/BeamSpot DataFormats/Common DataFormats/DetId DataFormats/EgammaReco DataFormats/Math DataFormats/SiPixelDetId DataFormats/TrackerRecHit2D DataFormats/TrajectorySeed RecoTracker/TkDetLayers,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationEgammaElectronAlgos_EX_LIB   := FastSimulationEgammaElectronAlgos
ALL_EXTERNAL_PRODS += FastSimulationEgammaElectronAlgos
endif
ifeq ($(strip $(DataFormats/VertexReco)),)
DataFormatsVertexReco := self/DataFormats/VertexReco
DataFormats/VertexReco := DataFormatsVertexReco
DataFormatsVertexReco_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsVertexReco_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/TrackReco FWCore/Utilities rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsVertexReco_LCGDICTS  := x 
DataFormatsVertexReco_EX_LIB   := DataFormatsVertexReco
ALL_EXTERNAL_PRODS += DataFormatsVertexReco
endif
ifeq ($(strip $(CalibCalorimetry/EcalLaserCorrection)),)
CalibCalorimetryEcalLaserCorrection := self/CalibCalorimetry/EcalLaserCorrection
CalibCalorimetry/EcalLaserCorrection := CalibCalorimetryEcalLaserCorrection
CalibCalorimetryEcalLaserCorrection_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibCalorimetryEcalLaserCorrection_EX_USE := $(foreach d, self  CondFormats/DataRecord CondFormats/EcalObjects CalibCalorimetry/EcalLaserAnalyzer DataFormats/DetId DataFormats/EcalDetId DataFormats/Provenance FWCore/MessageLogger Geometry/EcalMapping boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibCalorimetryEcalLaserCorrection_EX_LIB   := CalibCalorimetryEcalLaserCorrection
ALL_EXTERNAL_PRODS += CalibCalorimetryEcalLaserCorrection
endif
ifeq ($(strip $(EventFilter/SMProxyServer)),)
EventFilterSMProxyServer := self/EventFilter/SMProxyServer
EventFilter/SMProxyServer := EventFilterSMProxyServer
EventFilterSMProxyServer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterSMProxyServer_EX_USE := $(foreach d, self  EventFilter/StorageManager EventFilter/Utilities FWCore/MessageLogger FWCore/MessageService FWCore/ParameterSet FWCore/PluginManager FWCore/RootAutoLibraryLoader FWCore/ServiceRegistry FWCore/Utilities IOPool/Streamer boost curl xdaq,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterSMProxyServer_EX_LIB   := EventFilterSMProxyServer
ALL_EXTERNAL_PRODS += EventFilterSMProxyServer
endif
ifeq ($(strip $(FWCore/Common)),)
FWCoreCommon := self/FWCore/Common
FWCore/Common := FWCoreCommon
FWCoreCommon_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCoreCommon_EX_USE := $(foreach d, self  FWCore/ParameterSet FWCore/Utilities rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCoreCommon_LCGDICTS  := x 
FWCoreCommon_EX_LIB   := FWCoreCommon
ALL_EXTERNAL_PRODS += FWCoreCommon
endif
ifeq ($(strip $(RecoLocalTracker/ClusterParameterEstimator)),)
RecoLocalTrackerClusterParameterEstimator := self/RecoLocalTracker/ClusterParameterEstimator
RecoLocalTracker/ClusterParameterEstimator := RecoLocalTrackerClusterParameterEstimator
RecoLocalTrackerClusterParameterEstimator_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoLocalTrackerClusterParameterEstimator_EX_USE := $(foreach d, self  FWCore/Utilities DataFormats/Common TrackingTools/TrajectoryState clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoLocalTrackerClusterParameterEstimator_EX_LIB   := RecoLocalTrackerClusterParameterEstimator
ALL_EXTERNAL_PRODS += RecoLocalTrackerClusterParameterEstimator
endif
ifeq ($(strip $(Alignment/CocoaToDDL)),)
AlignmentCocoaToDDL := self/Alignment/CocoaToDDL
Alignment/CocoaToDDL := AlignmentCocoaToDDL
AlignmentCocoaToDDL_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentCocoaToDDL_EX_USE := $(foreach d, self  clhep Alignment/CocoaUtilities Alignment/CocoaModel Alignment/CocoaDDLObjects,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentCocoaToDDL_EX_LIB   := AlignmentCocoaToDDL
ALL_EXTERNAL_PRODS += AlignmentCocoaToDDL
endif
ifeq ($(strip $(SimG4Core/MagneticField)),)
SimG4CoreMagneticField := self/SimG4Core/MagneticField
SimG4Core/MagneticField := SimG4CoreMagneticField
SimG4CoreMagneticField_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CoreMagneticField_EX_USE := $(foreach d, self  FWCore/PluginManager FWCore/ParameterSet boost geant4core expat,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CoreMagneticField_EX_LIB   := SimG4CoreMagneticField
ALL_EXTERNAL_PRODS += SimG4CoreMagneticField
endif
ifeq ($(strip $(Alignment/CommonAlignment)),)
AlignmentCommonAlignment := self/Alignment/CommonAlignment
Alignment/CommonAlignment := AlignmentCommonAlignment
AlignmentCommonAlignment_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentCommonAlignment_EX_USE := $(foreach d, self  DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/TrackingRecHit FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities Geometry/CommonDetUnit Geometry/CommonTopologies clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentCommonAlignment_EX_LIB   := AlignmentCommonAlignment
ALL_EXTERNAL_PRODS += AlignmentCommonAlignment
endif
ifeq ($(strip $(RecoLuminosity/TCPReceiver)),)
RecoLuminosityTCPReceiver := self/RecoLuminosity/TCPReceiver
RecoLuminosity/TCPReceiver := RecoLuminosityTCPReceiver
RecoLuminosityTCPReceiver_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoLuminosityTCPReceiver_EX_USE := $(foreach d, self  ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoLuminosityTCPReceiver_EX_LIB   := RecoLuminosityTCPReceiver
ALL_EXTERNAL_PRODS += RecoLuminosityTCPReceiver
endif
ifeq ($(strip $(Fireworks/Candidates)),)
FireworksCandidates := self/Fireworks/Candidates
Fireworks/Candidates := FireworksCandidates
FireworksCandidates_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FireworksCandidates_EX_USE := $(foreach d, self  DataFormats/Candidate boost_system Fireworks/Core,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FireworksCandidates_EX_LIB   := FireworksCandidates
ALL_EXTERNAL_PRODS += FireworksCandidates
endif
ifeq ($(strip $(DataFormats/TrackerCommon)),)
DataFormatsTrackerCommon := self/DataFormats/TrackerCommon
DataFormats/TrackerCommon := DataFormatsTrackerCommon
DataFormatsTrackerCommon_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsTrackerCommon_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/SiStripCluster DataFormats/SiPixelDetId RecoLocalTracker/SiStripClusterizer FWCore/Framework FWCore/PluginManager FWCore/ParameterSet CommonTools/Utils FWCore/ServiceRegistry FWCore/MessageLogger rootcintex root CommonTools/UtilAlgos,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsTrackerCommon_LCGDICTS  := x 
DataFormatsTrackerCommon_EX_LIB   := DataFormatsTrackerCommon
ALL_EXTERNAL_PRODS += DataFormatsTrackerCommon
endif
ifeq ($(strip $(TopQuarkAnalysis/TopSkimming)),)
TopQuarkAnalysisTopSkimming := self/TopQuarkAnalysis/TopSkimming
TopQuarkAnalysis/TopSkimming := TopQuarkAnalysisTopSkimming
TopQuarkAnalysisTopSkimming_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TopQuarkAnalysisTopSkimming_EX_USE := $(foreach d, self  FWCore/ParameterSet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TopQuarkAnalysisTopSkimming_EX_LIB   := TopQuarkAnalysisTopSkimming
ALL_EXTERNAL_PRODS += TopQuarkAnalysisTopSkimming
endif
ifeq ($(strip $(SimGeneral/HepPDTRecord)),)
SimGeneralHepPDTRecord := self/SimGeneral/HepPDTRecord
SimGeneral/HepPDTRecord := SimGeneralHepPDTRecord
SimGeneralHepPDTRecord_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimGeneralHepPDTRecord_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet heppdt,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimGeneralHepPDTRecord_EX_LIB   := SimGeneralHepPDTRecord
ALL_EXTERNAL_PRODS += SimGeneralHepPDTRecord
endif
ifeq ($(strip $(CalibFormats/CastorObjects)),)
CalibFormatsCastorObjects := self/CalibFormats/CastorObjects
CalibFormats/CastorObjects := CalibFormatsCastorObjects
CalibFormatsCastorObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibFormatsCastorObjects_EX_USE := $(foreach d, self  FWCore/Framework DataFormats/HcalDetId DataFormats/HcalDigi CalibFormats/CaloObjects CondFormats/CastorObjects CondFormats/DataRecord boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibFormatsCastorObjects_EX_LIB   := CalibFormatsCastorObjects
ALL_EXTERNAL_PRODS += CalibFormatsCastorObjects
endif
ifeq ($(strip $(JetMETCorrections/MCJet)),)
src_JetMETCorrections_MCJet := self/JetMETCorrections/MCJet
JetMETCorrections/MCJet  := src_JetMETCorrections_MCJet
src_JetMETCorrections_MCJet_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_JetMETCorrections_MCJet_EX_USE := $(foreach d, clhep DataFormats/Common self DataFormats/JetReco Geometry/Records root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_JetMETCorrections_MCJet
endif

ifeq ($(strip $(Geometry/EcalAlgo)),)
GeometryEcalAlgo := self/Geometry/EcalAlgo
Geometry/EcalAlgo := GeometryEcalAlgo
GeometryEcalAlgo_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryEcalAlgo_EX_USE := $(foreach d, self  Geometry/CaloGeometry DataFormats/EcalDetId clhep Utilities/General CondCore/DBOutputService CondFormats/Alignment CondFormats/AlignmentRecord Geometry/Records,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryEcalAlgo_EX_LIB   := GeometryEcalAlgo
ALL_EXTERNAL_PRODS += GeometryEcalAlgo
endif
ifeq ($(strip $(RecoTracker/RoadSearchSeedFinder)),)
RecoTrackerRoadSearchSeedFinder := self/RecoTracker/RoadSearchSeedFinder
RecoTracker/RoadSearchSeedFinder := RecoTrackerRoadSearchSeedFinder
RecoTrackerRoadSearchSeedFinder_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerRoadSearchSeedFinder_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger RecoTracker/TransientTrackingRecHit Geometry/Records Geometry/CommonDetUnit Geometry/TrackerGeometryBuilder DataFormats/Common DataFormats/TrackerRecHit2D DataFormats/TrackingRecHit DataFormats/DetId DataFormats/SiStripDetId DataFormats/SiPixelDetId RecoTracker/RoadMapRecord RecoTracker/TkSeedGenerator TrackingTools/RoadSearchHitAccess MagneticField/Records,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerRoadSearchSeedFinder_EX_LIB   := RecoTrackerRoadSearchSeedFinder
ALL_EXTERNAL_PRODS += RecoTrackerRoadSearchSeedFinder
endif
ifeq ($(strip $(RecoVertex/VertexTools)),)
RecoVertexVertexTools := self/RecoVertex/VertexTools
RecoVertex/VertexTools := RecoVertexVertexTools
RecoVertexVertexTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoVertexVertexTools_EX_USE := $(foreach d, self  DataFormats/BeamSpot DataFormats/CLHEP DataFormats/GeometryCommonDetAlgo DataFormats/GeometryVector DataFormats/TrackReco DataFormats/VertexReco FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities RecoVertex/VertexPrimitives TrackingTools/GeomPropagators TrackingTools/PatternTools TrackingTools/TrajectoryParametrization TrackingTools/TrajectoryState TrackingTools/TransientTrack,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoVertexVertexTools_EX_LIB   := RecoVertexVertexTools
ALL_EXTERNAL_PRODS += RecoVertexVertexTools
endif
ifeq ($(strip $(EventFilter/Playback)),)
EventFilterPlayback := self/EventFilter/Playback
EventFilter/Playback := EventFilterPlayback
EventFilterPlayback_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterPlayback_EX_USE := $(foreach d, self  DataFormats/FEDRawData FWCore/Framework FWCore/MessageLogger,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterPlayback_EX_LIB   := EventFilterPlayback
ALL_EXTERNAL_PRODS += EventFilterPlayback
endif
ifeq ($(strip $(FastSimulation/ShowerDevelopment)),)
FastSimulationShowerDevelopment := self/FastSimulation/ShowerDevelopment
FastSimulation/ShowerDevelopment := FastSimulationShowerDevelopment
FastSimulationShowerDevelopment_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationShowerDevelopment_EX_USE := $(foreach d, self  DataFormats/Math FWCore/MessageLogger FWCore/ParameterSet FastSimulation/CaloHitMakers FastSimulation/CalorimeterProperties FastSimulation/Particle FastSimulation/Utilities DQMServices/Core clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationShowerDevelopment_EX_LIB   := FastSimulationShowerDevelopment
ALL_EXTERNAL_PRODS += FastSimulationShowerDevelopment
endif
ifeq ($(strip $(SimDataFormats/Track)),)
SimDataFormatsTrack := self/SimDataFormats/Track
SimDataFormats/Track := SimDataFormatsTrack
SimDataFormatsTrack_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsTrack_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/Math SimDataFormats/EncodedEventId rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsTrack_LCGDICTS  := x 
SimDataFormatsTrack_EX_LIB   := SimDataFormatsTrack
ALL_EXTERNAL_PRODS += SimDataFormatsTrack
endif
ifeq ($(strip $(Utilities/DCacheAdaptor)),)
UtilitiesDCacheAdaptor := self/Utilities/DCacheAdaptor
Utilities/DCacheAdaptor := UtilitiesDCacheAdaptor
UtilitiesDCacheAdaptor_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
UtilitiesDCacheAdaptor_EX_USE := $(foreach d, self  Utilities/StorageFactory FWCore/Utilities FWCore/MessageLogger dcap,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
UtilitiesDCacheAdaptor_EX_LIB   := UtilitiesDCacheAdaptor
ALL_EXTERNAL_PRODS += UtilitiesDCacheAdaptor
endif
ifeq ($(strip $(DetectorDescription/OfflineDBLoader)),)
DetectorDescriptionOfflineDBLoader := self/DetectorDescription/OfflineDBLoader
DetectorDescription/OfflineDBLoader := DetectorDescriptionOfflineDBLoader
DetectorDescriptionOfflineDBLoader_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DetectorDescriptionOfflineDBLoader_EX_USE := $(foreach d, self  DetectorDescription/Core clhep rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DetectorDescriptionOfflineDBLoader_EX_LIB   := DetectorDescriptionOfflineDBLoader
ALL_EXTERNAL_PRODS += DetectorDescriptionOfflineDBLoader
endif
ifeq ($(strip $(CondFormats/DataRecord)),)
CondFormatsDataRecord := self/CondFormats/DataRecord
CondFormats/DataRecord := CondFormatsDataRecord
CondFormatsDataRecord_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsDataRecord_EX_USE := $(foreach d, self  FWCore/Framework Geometry/Records,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsDataRecord_EX_LIB   := CondFormatsDataRecord
ALL_EXTERNAL_PRODS += CondFormatsDataRecord
endif
ifeq ($(strip $(CondFormats/Luminosity)),)
CondFormatsLuminosity := self/CondFormats/Luminosity
CondFormats/Luminosity := CondFormatsLuminosity
CondFormatsLuminosity_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsLuminosity_EX_USE := $(foreach d, self  FWCore/Utilities rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsLuminosity_LCGDICTS  := x 
CondFormatsLuminosity_EX_LIB   := CondFormatsLuminosity
ALL_EXTERNAL_PRODS += CondFormatsLuminosity
endif
ifeq ($(strip $(SimTracker/TrackHistory)),)
SimTrackerTrackHistory := self/SimTracker/TrackHistory
SimTracker/TrackHistory := SimTrackerTrackHistory
SimTrackerTrackHistory_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimTrackerTrackHistory_EX_USE := $(foreach d, self  clhep boost root DataFormats/Math DataFormats/VertexReco DataFormats/JetReco SimTracker/VertexAssociation FWCore/Framework FWCore/ParameterSet FWCore/Utilities MagneticField/Records MagneticField/Engine SimDataFormats/TrackingAnalysis SimGeneral/HepPDTRecord SimTracker/Records SimTracker/TrackAssociation SimTracker/TrackerHitAssociation TrackingTools/TransientTrack,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimTrackerTrackHistory_LCGDICTS  := x 
SimTrackerTrackHistory_EX_LIB   := SimTrackerTrackHistory
ALL_EXTERNAL_PRODS += SimTrackerTrackHistory
endif
ifeq ($(strip $(TrackingTools/TrajectoryFiltering)),)
TrackingToolsTrajectoryFiltering := self/TrackingTools/TrajectoryFiltering
TrackingTools/TrajectoryFiltering := TrackingToolsTrajectoryFiltering
TrackingToolsTrajectoryFiltering_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsTrajectoryFiltering_EX_USE := $(foreach d, self  FWCore/MessageLogger FWCore/PluginManager TrackingTools/PatternTools TrackingTools/TrajectoryParametrization TrackingTools/TrajectoryState,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsTrajectoryFiltering_EX_LIB   := TrackingToolsTrajectoryFiltering
ALL_EXTERNAL_PRODS += TrackingToolsTrajectoryFiltering
endif
ifeq ($(strip $(RecoMuon/Navigation)),)
RecoMuonNavigation := self/RecoMuon/Navigation
RecoMuon/Navigation := RecoMuonNavigation
RecoMuonNavigation_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoMuonNavigation_EX_USE := $(foreach d, self  DataFormats/GeometrySurface FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet RecoMuon/DetLayers TrackingTools/DetLayers TrackingTools/TrajectoryState Utilities/General,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoMuonNavigation_EX_LIB   := RecoMuonNavigation
ALL_EXTERNAL_PRODS += RecoMuonNavigation
endif
ifeq ($(strip $(MagneticField/Engine)),)
MagneticFieldEngine := self/MagneticField/Engine
MagneticField/Engine := MagneticFieldEngine
MagneticFieldEngine_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
MagneticFieldEngine_EX_USE := $(foreach d, self  FWCore/Utilities,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
MagneticFieldEngine_EX_LIB   := MagneticFieldEngine
ALL_EXTERNAL_PRODS += MagneticFieldEngine
endif
ifeq ($(strip $(RecoMuon/GlobalTrackingTools)),)
RecoMuonGlobalTrackingTools := self/RecoMuon/GlobalTrackingTools
RecoMuon/GlobalTrackingTools := RecoMuonGlobalTrackingTools
RecoMuonGlobalTrackingTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoMuonGlobalTrackingTools_EX_USE := $(foreach d, self  CommonTools/Statistics DataFormats/BeamSpot DataFormats/Common DataFormats/DetId DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/Math DataFormats/MuonDetId DataFormats/TrackReco DataFormats/TrajectoryState DataFormats/VertexReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry Geometry/CommonDetUnit PhysicsTools/UtilAlgos RecoMuon/Navigation RecoMuon/TrackingTools RecoMuon/TransientTrackingRecHit RecoTracker/TkDetLayers RecoTracker/TkMSParametrization RecoTracker/TkNavigation RecoTracker/TkTrackingRegions RecoTracker/TransientTrackingRecHit TrackingTools/DetLayers TrackingTools/GeomPropagators TrackingTools/PatternTools TrackingTools/Records TrackingTools/TrackFitters TrackingTools/TrackRefitter TrackingTools/TrajectoryState TrackingTools/TransientTrack TrackingTools/TransientTrackingRecHit Utilities/General Utilities/Timing CondFormats/Alignment root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoMuonGlobalTrackingTools_EX_LIB   := RecoMuonGlobalTrackingTools
ALL_EXTERNAL_PRODS += RecoMuonGlobalTrackingTools
endif
ifeq ($(strip $(PhysicsTools/TagAndProbe)),)
PhysicsToolsTagAndProbe := self/PhysicsTools/TagAndProbe
PhysicsTools/TagAndProbe := PhysicsToolsTagAndProbe
PhysicsToolsTagAndProbe_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsTagAndProbe_EX_USE := $(foreach d, self  roofit FWCore/MessageLogger FWCore/PluginManager FWCore/ParameterSet DataFormats/TrackReco DataFormats/EgammaReco DataFormats/METReco DataFormats/Math DataFormats/RecoCandidate DataFormats/Candidate DataFormats/Common CommonTools/Utils CommonTools/UtilAlgos PhysicsTools/UtilAlgos,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsTagAndProbe_LCGDICTS  := x 
PhysicsToolsTagAndProbe_ROOTDICT  := LinkDef
PhysicsToolsTagAndProbe_EX_LIB   := PhysicsToolsTagAndProbe
ALL_EXTERNAL_PRODS += PhysicsToolsTagAndProbe
endif
ifeq ($(strip $(RecoEgamma/EgammaPhotonAlgos)),)
RecoEgammaEgammaPhotonAlgos := self/RecoEgamma/EgammaPhotonAlgos
RecoEgamma/EgammaPhotonAlgos := RecoEgammaEgammaPhotonAlgos
RecoEgammaEgammaPhotonAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoEgammaEgammaPhotonAlgos_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet Geometry/CaloGeometry Geometry/CaloTopology DataFormats/CaloRecHit DataFormats/DetId RecoEgamma/EgammaTools DataFormats/Math DataFormats/EgammaCandidates DataFormats/Common DataFormats/TrajectorySeed TrackingTools/MaterialEffects TrackingTools/GeomPropagators TrackingTools/KalmanUpdators TrackingTools/TrajectoryState TrackingTools/PatternTools TrackingTools/DetLayers TrackingTools/TransientTrack RecoTracker/TkDetLayers RecoTracker/TkNavigation RecoTracker/TkTrackingRegions RecoTracker/CkfPattern RecoTracker/TkSeedGenerator RecoVertex/VertexPrimitives RecoVertex/KalmanVertexFit RecoVertex/KinematicFitPrimitives RecoVertex/KinematicFit MagneticField/Engine Utilities/General clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoEgammaEgammaPhotonAlgos_EX_LIB   := RecoEgammaEgammaPhotonAlgos
ALL_EXTERNAL_PRODS += RecoEgammaEgammaPhotonAlgos
endif
ifeq ($(strip $(DataFormats/Provenance)),)
DataFormatsProvenance := self/DataFormats/Provenance
DataFormats/Provenance := DataFormatsProvenance
DataFormatsProvenance_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsProvenance_EX_USE := $(foreach d, self  FWCore/Utilities boost rootcore rootrflx FWCore/MessageLogger,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsProvenance_LCGDICTS  := x 
DataFormatsProvenance_EX_LIB   := DataFormatsProvenance
ALL_EXTERNAL_PRODS += DataFormatsProvenance
endif
ifeq ($(strip $(RecoLocalTracker/SiPixelClusterizer)),)
RecoLocalTrackerSiPixelClusterizer := self/RecoLocalTracker/SiPixelClusterizer
RecoLocalTracker/SiPixelClusterizer := RecoLocalTrackerSiPixelClusterizer
RecoLocalTrackerSiPixelClusterizer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoLocalTrackerSiPixelClusterizer_EX_USE := $(foreach d, self  DataFormats/Common FWCore/ParameterSet DataFormats/SiPixelDetId DataFormats/SiPixelCluster,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoLocalTrackerSiPixelClusterizer_EX_LIB   := RecoLocalTrackerSiPixelClusterizer
ALL_EXTERNAL_PRODS += RecoLocalTrackerSiPixelClusterizer
endif
ifeq ($(strip $(RecoVertex/TertiaryTracksVertexFinder)),)
RecoVertexTertiaryTracksVertexFinder := self/RecoVertex/TertiaryTracksVertexFinder
RecoVertex/TertiaryTracksVertexFinder := RecoVertexTertiaryTracksVertexFinder
RecoVertexTertiaryTracksVertexFinder_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoVertexTertiaryTracksVertexFinder_EX_USE := $(foreach d, self  DataFormats/GeometryCommonDetAlgo DataFormats/GeometrySurface RecoVertex/KalmanVertexFit RecoVertex/TrimmedKalmanVertexFinder RecoVertex/VertexPrimitives RecoVertex/VertexTools TrackingTools/GeomPropagators TrackingTools/TrajectoryState TrackingTools/TransientTrack clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoVertexTertiaryTracksVertexFinder_EX_LIB   := RecoVertexTertiaryTracksVertexFinder
ALL_EXTERNAL_PRODS += RecoVertexTertiaryTracksVertexFinder
endif
ifeq ($(strip $(SimTracker/TrackAssociation)),)
SimTrackerTrackAssociation := self/SimTracker/TrackAssociation
SimTracker/TrackAssociation := SimTrackerTrackAssociation
SimTrackerTrackAssociation_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimTrackerTrackAssociation_EX_USE := $(foreach d, self  MagneticField/Engine FWCore/Framework FWCore/ParameterSet DataFormats/Common SimDataFormats/TrackingHit SimDataFormats/TrackerDigiSimLink SimTracker/TrackerHitAssociation SimDataFormats/Track DataFormats/TrackingRecHit DataFormats/TrackReco TrackingTools/GeomPropagators TrackingTools/PatternTools SimDataFormats/TrackingAnalysis DataFormats/RecoCandidate Geometry/Records Geometry/TrackerGeometryBuilder MagneticField/Records clhep boost root rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimTrackerTrackAssociation_EX_LIB   := SimTrackerTrackAssociation
ALL_EXTERNAL_PRODS += SimTrackerTrackAssociation
endif
ifeq ($(strip $(RecoCaloTools/MetaCollections)),)
RecoCaloToolsMetaCollections := self/RecoCaloTools/MetaCollections
RecoCaloTools/MetaCollections := RecoCaloToolsMetaCollections
RecoCaloToolsMetaCollections_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoCaloToolsMetaCollections_EX_USE := $(foreach d, self  DataFormats/HcalDetId,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoCaloToolsMetaCollections_EX_LIB   := RecoCaloToolsMetaCollections
ALL_EXTERNAL_PRODS += RecoCaloToolsMetaCollections
endif
ifeq ($(strip $(RecoVertex/KinematicFit)),)
RecoVertexKinematicFit := self/RecoVertex/KinematicFit
RecoVertex/KinematicFit := RecoVertexKinematicFit
RecoVertexKinematicFit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoVertexKinematicFit_EX_USE := $(foreach d, self  RecoVertex/KalmanVertexFit RecoVertex/KinematicFitPrimitives,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoVertexKinematicFit_EX_LIB   := RecoVertexKinematicFit
ALL_EXTERNAL_PRODS += RecoVertexKinematicFit
endif
ifeq ($(strip $(EventFilter/Processor)),)
EventFilterProcessor := self/EventFilter/Processor
EventFilter/Processor := EventFilterProcessor
EventFilterProcessor_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterProcessor_EX_USE := $(foreach d, self  FWCore/PluginManager FWCore/Framework FWCore/ServiceRegistry FWCore/ParameterSet FWCore/PythonParameterSet FWCore/Utilities FWCore/PrescaleService HLTrigger/Timer EventFilter/Utilities EventFilter/Modules EventFilter/Message2log4cplus boost xdaq,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterProcessor_EX_LIB   := EventFilterProcessor
ALL_EXTERNAL_PRODS += EventFilterProcessor
endif
ifeq ($(strip $(JetMETCorrections/Modules)),)
JetMETCorrectionsModules := self/JetMETCorrections/Modules
JetMETCorrections/Modules := JetMETCorrectionsModules
JetMETCorrectionsModules_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
JetMETCorrectionsModules_EX_USE := $(foreach d, self  CondCore/PluginSystem CondFormats/DataRecord CondCore/DBCommon CondCore/DBOutputService CommonTools/Utils DataFormats/Common DataFormats/JetReco FWCore/Framework FWCore/ParameterSet JetMETCorrections/Objects JetMETCorrections/Algorithms boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
JetMETCorrectionsModules_EX_LIB   := JetMETCorrectionsModules
ALL_EXTERNAL_PRODS += JetMETCorrectionsModules
endif
ifeq ($(strip $(RecoTracker/MeasurementDet)),)
RecoTrackerMeasurementDet := self/RecoTracker/MeasurementDet
RecoTracker/MeasurementDet := RecoTrackerMeasurementDet
RecoTrackerMeasurementDet_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerMeasurementDet_EX_USE := $(foreach d, self  TrackingTools/GeomPropagators CalibFormats/SiStripObjects CondFormats/SiPixelObjects CalibTracker/Records DataFormats/Common DataFormats/GeometrySurface DataFormats/SiPixelCluster DataFormats/TrackerRecHit2D FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Services Geometry/CommonDetUnit Geometry/Records Geometry/TrackerGeometryBuilder RecoLocalTracker/Records RecoLocalTracker/SiPixelRecHits RecoLocalTracker/SiStripRecHitConverter RecoTracker/TransientTrackingRecHit TrackingTools/TrajectoryState TrackingTools/TransientTrackingRecHit,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerMeasurementDet_EX_LIB   := RecoTrackerMeasurementDet
ALL_EXTERNAL_PRODS += RecoTrackerMeasurementDet
endif
ifeq ($(strip $(DetectorDescription/RegressionTest)),)
DetectorDescriptionRegressionTest := self/DetectorDescription/RegressionTest
DetectorDescription/RegressionTest := DetectorDescriptionRegressionTest
DetectorDescriptionRegressionTest_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DetectorDescriptionRegressionTest_EX_USE := $(foreach d, self  DetectorDescription/Algorithm DetectorDescription/Base DetectorDescription/Core DetectorDescription/ExprAlgo DetectorDescription/Parser clhep xerces-c,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DetectorDescriptionRegressionTest_EX_LIB   := DetectorDescriptionRegressionTest
ALL_EXTERNAL_PRODS += DetectorDescriptionRegressionTest
endif
ifeq ($(strip $(DataFormats/SiStripCluster)),)
DataFormatsSiStripCluster := self/DataFormats/SiStripCluster
DataFormats/SiStripCluster := DataFormatsSiStripCluster
DataFormatsSiStripCluster_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsSiStripCluster_EX_USE := $(foreach d, self  DataFormats/Common boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsSiStripCluster_LCGDICTS  := x 
DataFormatsSiStripCluster_EX_LIB   := DataFormatsSiStripCluster
ALL_EXTERNAL_PRODS += DataFormatsSiStripCluster
endif
ifeq ($(strip $(SimCalorimetry/EcalSimProducers)),)
SimCalorimetryEcalSimProducers := self/SimCalorimetry/EcalSimProducers
SimCalorimetry/EcalSimProducers := SimCalorimetryEcalSimProducers
SimCalorimetryEcalSimProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimCalorimetryEcalSimProducers_EX_USE := $(foreach d, self  FWCore/PluginManager FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet SimCalorimetry/EcalSimAlgos SimDataFormats/CrossingFrame SimGeneral/NoiseGenerators CondFormats/DataRecord CondFormats/ESObjects Geometry/EcalAlgo,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimCalorimetryEcalSimProducers_EX_LIB   := SimCalorimetryEcalSimProducers
ALL_EXTERNAL_PRODS += SimCalorimetryEcalSimProducers
endif
ifeq ($(strip $(Geometry/CaloTopology)),)
GeometryCaloTopology := self/Geometry/CaloTopology
Geometry/CaloTopology := GeometryCaloTopology
GeometryCaloTopology_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryCaloTopology_EX_USE := $(foreach d, self  DataFormats/CaloTowers DataFormats/HcalDetId DataFormats/EcalDetId DataFormats/Common boost Geometry/CaloGeometry,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryCaloTopology_EX_LIB   := GeometryCaloTopology
ALL_EXTERNAL_PRODS += GeometryCaloTopology
endif
ifeq ($(strip $(Alignment/LaserAlignment)),)
AlignmentLaserAlignment := self/Alignment/LaserAlignment
Alignment/LaserAlignment := AlignmentLaserAlignment
AlignmentLaserAlignment_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentLaserAlignment_EX_USE := $(foreach d, self  FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities DataFormats/GeometrySurface clhepheader rootcore rootminuit,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentLaserAlignment_LCGDICTS  := x 
AlignmentLaserAlignment_ROOTDICT  := LinkDef
AlignmentLaserAlignment_EX_LIB   := AlignmentLaserAlignment
ALL_EXTERNAL_PRODS += AlignmentLaserAlignment
endif
ifeq ($(strip $(RecoEgamma/EgammaHLTAlgos)),)
RecoEgammaEgammaHLTAlgos := self/RecoEgamma/EgammaHLTAlgos
RecoEgamma/EgammaHLTAlgos := RecoEgammaEgammaHLTAlgos
RecoEgammaEgammaHLTAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoEgammaEgammaHLTAlgos_EX_USE := $(foreach d, self  clhep MagneticField/Engine DataFormats/DetId DataFormats/TrackerRecHit2D DataFormats/TrackingRecHit DataFormats/EgammaReco DataFormats/EgammaCandidates Geometry/CommonDetUnit Geometry/TrackerGeometryBuilder RecoTracker/MeasurementDet RecoTracker/TkSeedGenerator RecoTracker/TkDetLayers RecoTracker/TkNavigation RecoTracker/CkfPattern TrackingTools/DetLayers RecoTracker/TrackProducer Geometry/CaloGeometry CondFormats/HcalObjects RecoLocalCalo/HcalRecAlgos,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoEgammaEgammaHLTAlgos_EX_LIB   := RecoEgammaEgammaHLTAlgos
ALL_EXTERNAL_PRODS += RecoEgammaEgammaHLTAlgos
endif
ifeq ($(strip $(Geometry/EcalCommonData)),)
GeometryEcalCommonData := self/Geometry/EcalCommonData
Geometry/EcalCommonData := GeometryEcalCommonData
GeometryEcalCommonData_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryEcalCommonData_EX_USE := $(foreach d, self  DetectorDescription/Core DetectorDescription/Algorithm DataFormats/EcalDetId Geometry/CaloGeometry,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryEcalCommonData_EX_LIB   := GeometryEcalCommonData
ALL_EXTERNAL_PRODS += GeometryEcalCommonData
endif
ifeq ($(strip $(CondFormats/L1TObjects)),)
CondFormatsL1TObjects := self/CondFormats/L1TObjects
CondFormats/L1TObjects := CondFormatsL1TObjects
CondFormatsL1TObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsL1TObjects_EX_USE := $(foreach d, self  boost DataFormats/MuonDetId FWCore/ParameterSet FWCore/Utilities rootrflx DataFormats/L1GlobalMuonTrigger DataFormats/L1GlobalCaloTrigger DataFormats/L1GlobalTrigger DataFormats/StdDictionaries,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsL1TObjects_LCGDICTS  := x 
CondFormatsL1TObjects_EX_LIB   := CondFormatsL1TObjects
ALL_EXTERNAL_PRODS += CondFormatsL1TObjects
endif
ifeq ($(strip $(SimTracker/TrackerHitAssociation)),)
SimTrackerTrackerHitAssociation := self/SimTracker/TrackerHitAssociation
SimTracker/TrackerHitAssociation := SimTrackerTrackerHitAssociation
SimTrackerTrackerHitAssociation_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimTrackerTrackerHitAssociation_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet DataFormats/Common SimDataFormats/CrossingFrame SimDataFormats/TrackingHit SimDataFormats/TrackerDigiSimLink DataFormats/TrackerRecHit2D TrackingTools/TransientTrackingRecHit DataFormats/SiPixelDetId clhep boost root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimTrackerTrackerHitAssociation_EX_LIB   := SimTrackerTrackerHitAssociation
ALL_EXTERNAL_PRODS += SimTrackerTrackerHitAssociation
endif
ifeq ($(strip $(Fireworks/Electrons)),)
FireworksElectrons := self/Fireworks/Electrons
Fireworks/Electrons := FireworksElectrons
FireworksElectrons_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FireworksElectrons_EX_USE := $(foreach d, self  DataFormats/EgammaReco Fireworks/Core rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FireworksElectrons_EX_LIB   := FireworksElectrons
ALL_EXTERNAL_PRODS += FireworksElectrons
endif
ifeq ($(strip $(FWCore/PrescaleService)),)
FWCorePrescaleService := self/FWCore/PrescaleService
FWCore/PrescaleService := FWCorePrescaleService
FWCorePrescaleService_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCorePrescaleService_EX_USE := $(foreach d, self  DataFormats/Provenance FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCorePrescaleService_EX_LIB   := FWCorePrescaleService
ALL_EXTERNAL_PRODS += FWCorePrescaleService
endif
ifeq ($(strip $(L1Trigger/DTTriggerServerTheta)),)
L1TriggerDTTriggerServerTheta := self/L1Trigger/DTTriggerServerTheta
L1Trigger/DTTriggerServerTheta := L1TriggerDTTriggerServerTheta
L1TriggerDTTriggerServerTheta_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerDTTriggerServerTheta_EX_USE := $(foreach d, self  FWCore/PluginManager FWCore/ParameterSet Geometry/DTGeometry L1Trigger/DTBti L1Trigger/DTUtilities L1TriggerConfig/DTTPGConfig clhep root rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerDTTriggerServerTheta_EX_LIB   := L1TriggerDTTriggerServerTheta
ALL_EXTERNAL_PRODS += L1TriggerDTTriggerServerTheta
endif
ifeq ($(strip $(PhysicsTools/PatAlgos)),)
PhysicsToolsPatAlgos := self/PhysicsTools/PatAlgos
PhysicsTools/PatAlgos := PhysicsToolsPatAlgos
PhysicsToolsPatAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsPatAlgos_EX_USE := $(foreach d, self  DataFormats/Candidate DataFormats/Common DataFormats/EgammaCandidates DataFormats/EgammaReco DataFormats/JetReco DataFormats/Math DataFormats/METReco DataFormats/MuonReco DataFormats/PatCandidates DataFormats/TauReco DataFormats/TrackReco DataFormats/VertexReco FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities PhysicsTools/PatUtils PhysicsTools/Utilities PhysicsTools/IsolationAlgos clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsPatAlgos_EX_LIB   := PhysicsToolsPatAlgos
ALL_EXTERNAL_PRODS += PhysicsToolsPatAlgos
endif
ifeq ($(strip $(EventFilter/EcalRawToDigi)),)
EventFilterEcalRawToDigi := self/EventFilter/EcalRawToDigi
EventFilter/EcalRawToDigi := EventFilterEcalRawToDigi
EventFilterEcalRawToDigi_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterEcalRawToDigi_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet boost CalibCalorimetry/EcalLaserCorrection CondFormats/DataRecord CondFormats/EcalObjects DataFormats/EcalDetId DataFormats/EcalDigi DataFormats/EcalRawData DataFormats/EcalRecHit DataFormats/FEDRawData DataFormats/Common FWCore/MessageLogger Geometry/EcalMapping Geometry/Records RecoLocalCalo/EcalRecAlgos RecoLocalCalo/EcalRecProducers Utilities/StorageFactory rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterEcalRawToDigi_EX_LIB   := EventFilterEcalRawToDigi
ALL_EXTERNAL_PRODS += EventFilterEcalRawToDigi
endif
ifeq ($(strip $(FWCore/Services)),)
FWCoreServices := self/FWCore/Services
FWCore/Services := FWCoreServices
FWCoreServices_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCoreServices_EX_USE := $(foreach d, self  DataFormats/Provenance DataFormats/Common DataFormats/Streamer FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/RootAutoLibraryLoader FWCore/ServiceRegistry FWCore/Utilities FWCore/Framework boost rootcintex rootcore roothistmatrix sigcpp xerces-c,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCoreServices_EX_LIB   := FWCoreServices
ALL_EXTERNAL_PRODS += FWCoreServices
endif
ifeq ($(strip $(TrackingTools/TrajectoryState)),)
TrackingToolsTrajectoryState := self/TrackingTools/TrajectoryState
TrackingTools/TrajectoryState := TrackingToolsTrajectoryState
TrackingToolsTrajectoryState_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsTrajectoryState_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/TrackReco DataFormats/TrajectoryState DataFormats/BeamSpot TrackingTools/AnalyticalJacobians TrackingTools/TrajectoryParametrization rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsTrajectoryState_LCGDICTS  := x 
TrackingToolsTrajectoryState_EX_LIB   := TrackingToolsTrajectoryState
ALL_EXTERNAL_PRODS += TrackingToolsTrajectoryState
endif
ifeq ($(strip $(DataFormats/FP420Cluster)),)
DataFormatsFP420Cluster := self/DataFormats/FP420Cluster
DataFormats/FP420Cluster := DataFormatsFP420Cluster
DataFormatsFP420Cluster_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsFP420Cluster_EX_USE := $(foreach d, self  DataFormats/Common boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsFP420Cluster_LCGDICTS  := x 
DataFormatsFP420Cluster_EX_LIB   := DataFormatsFP420Cluster
ALL_EXTERNAL_PRODS += DataFormatsFP420Cluster
endif
ifeq ($(strip $(RecoBTag/TrackProbability)),)
RecoBTagTrackProbability := self/RecoBTag/TrackProbability
RecoBTag/TrackProbability := RecoBTagTrackProbability
RecoBTagTrackProbability_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoBTagTrackProbability_EX_USE := $(foreach d, self  DataFormats/TrackReco FWCore/MessageLogger xerces-c,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoBTagTrackProbability_EX_LIB   := RecoBTagTrackProbability
ALL_EXTERNAL_PRODS += RecoBTagTrackProbability
endif
ifeq ($(strip $(Fireworks/Calo)),)
FireworksCalo := self/Fireworks/Calo
Fireworks/Calo := FireworksCalo
FireworksCalo_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FireworksCalo_EX_USE := $(foreach d, self  DataFormats/CaloRecHit DataFormats/CaloTowers DataFormats/DetId DataFormats/EcalDetId DataFormats/EcalRecHit DataFormats/EgammaReco DataFormats/FWLite DataFormats/JetReco Fireworks/Core Fireworks/Tracks boost_system rootgpad rootphysics,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FireworksCalo_EX_LIB   := FireworksCalo
ALL_EXTERNAL_PRODS += FireworksCalo
endif
ifeq ($(strip $(GeneratorInterface/HijingInterface)),)
GeneratorInterfaceHijingInterface := self/GeneratorInterface/HijingInterface
GeneratorInterface/HijingInterface := GeneratorInterfaceHijingInterface
GeneratorInterfaceHijingInterface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfaceHijingInterface_EX_USE := $(foreach d, self  clhep boost GeneratorInterface/Core FWCore/Framework SimDataFormats/GeneratorProducts GeneratorInterface/ExternalDecays f77compiler,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeneratorInterfaceHijingInterface_EX_LIB   := GeneratorInterfaceHijingInterface
ALL_EXTERNAL_PRODS += GeneratorInterfaceHijingInterface
endif
ifeq ($(strip $(DQM/DataScouting)),)
DQMDataScouting := self/DQM/DataScouting
DQM/DataScouting := DQMDataScouting
DQMDataScouting_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMDataScouting_EX_USE := $(foreach d, self  clhep root FWCore/Framework FWCore/ParameterSet DataFormats/Math DQMServices/Components DQMServices/Core,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMDataScouting_EX_LIB   := DQMDataScouting
ALL_EXTERNAL_PRODS += DQMDataScouting
endif
ifeq ($(strip $(SimDataFormats/TrackingHit)),)
SimDataFormatsTrackingHit := self/SimDataFormats/TrackingHit
SimDataFormats/TrackingHit := SimDataFormatsTrackingHit
SimDataFormatsTrackingHit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsTrackingHit_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/GeometryVector SimDataFormats/EncodedEventId rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsTrackingHit_LCGDICTS  := x 
SimDataFormatsTrackingHit_EX_LIB   := SimDataFormatsTrackingHit
ALL_EXTERNAL_PRODS += SimDataFormatsTrackingHit
endif
ifeq ($(strip $(DataFormats/RoadSearchCloud)),)
DataFormatsRoadSearchCloud := self/DataFormats/RoadSearchCloud
DataFormats/RoadSearchCloud := DataFormatsRoadSearchCloud
DataFormatsRoadSearchCloud_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsRoadSearchCloud_EX_USE := $(foreach d, self  DataFormats/Common rootrflx clhepheader boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsRoadSearchCloud_LCGDICTS  := x 
DataFormatsRoadSearchCloud_EX_LIB   := DataFormatsRoadSearchCloud
ALL_EXTERNAL_PRODS += DataFormatsRoadSearchCloud
endif
ifeq ($(strip $(TrackingTools/TrajectoryCleaning)),)
TrackingToolsTrajectoryCleaning := self/TrackingTools/TrajectoryCleaning
TrackingTools/TrajectoryCleaning := TrackingToolsTrajectoryCleaning
TrackingToolsTrajectoryCleaning_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsTrajectoryCleaning_EX_USE := $(foreach d, self  TrackingTools/PatternTools DataFormats/SiPixelDetId DataFormats/SiStripDetId DataFormats/TrackerRecHit2D DataFormats/TrackingRecHit FWCore/PluginManager,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsTrajectoryCleaning_EX_LIB   := TrackingToolsTrajectoryCleaning
ALL_EXTERNAL_PRODS += TrackingToolsTrajectoryCleaning
endif
ifeq ($(strip $(RecoEgamma/EgammaMCTools)),)
RecoEgammaEgammaMCTools := self/RecoEgamma/EgammaMCTools
RecoEgamma/EgammaMCTools := RecoEgammaEgammaMCTools
RecoEgammaEgammaMCTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoEgammaEgammaMCTools_EX_USE := $(foreach d, self  SimDataFormats/Track SimDataFormats/Vertex clhep SimDataFormats/CrossingFrame,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoEgammaEgammaMCTools_EX_LIB   := RecoEgammaEgammaMCTools
ALL_EXTERNAL_PRODS += RecoEgammaEgammaMCTools
endif
ifeq ($(strip $(AnalysisDataFormats/TopObjects)),)
AnalysisDataFormatsTopObjects := self/AnalysisDataFormats/TopObjects
AnalysisDataFormats/TopObjects := AnalysisDataFormatsTopObjects
AnalysisDataFormatsTopObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AnalysisDataFormatsTopObjects_EX_USE := $(foreach d, self  FWCore/Utilities DataFormats/Common DataFormats/TauReco DataFormats/JetReco DataFormats/METReco DataFormats/MuonReco DataFormats/TrackReco DataFormats/PatCandidates DataFormats/HepMCCandidate DataFormats/EgammaCandidates CommonTools/CandUtils root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AnalysisDataFormatsTopObjects_LCGDICTS  := x 
AnalysisDataFormatsTopObjects_EX_LIB   := AnalysisDataFormatsTopObjects
ALL_EXTERNAL_PRODS += AnalysisDataFormatsTopObjects
endif
ifeq ($(strip $(PhysicsTools/RooStatsCms)),)
PhysicsToolsRooStatsCms := self/PhysicsTools/RooStatsCms
PhysicsTools/RooStatsCms := PhysicsToolsRooStatsCms
PhysicsToolsRooStatsCms_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsRooStatsCms_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet root rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsRooStatsCms_LCGDICTS  := x 
PhysicsToolsRooStatsCms_EX_LIB   := PhysicsToolsRooStatsCms
ALL_EXTERNAL_PRODS += PhysicsToolsRooStatsCms
endif
ifeq ($(strip $(DataFormats/PatCandidates)),)
DataFormatsPatCandidates := self/DataFormats/PatCandidates
DataFormats/PatCandidates := DataFormatsPatCandidates
DataFormatsPatCandidates_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsPatCandidates_EX_USE := $(foreach d, self  FWCore/Utilities DataFormats/Common DataFormats/StdDictionaries DataFormats/Candidate DataFormats/MuonReco DataFormats/TauReco DataFormats/JetReco DataFormats/METReco DataFormats/EgammaCandidates DataFormats/ParticleFlowCandidate DataFormats/TrackReco DataFormats/HepMCCandidate DataFormats/BTauReco CondFormats/L1TObjects DataFormats/L1Trigger DataFormats/HLTReco boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsPatCandidates_LCGDICTS  := x 
DataFormatsPatCandidates_EX_LIB   := DataFormatsPatCandidates
ALL_EXTERNAL_PRODS += DataFormatsPatCandidates
endif
ifeq ($(strip $(JetMETCorrections/Objects)),)
JetMETCorrectionsObjects := self/JetMETCorrections/Objects
JetMETCorrections/Objects := JetMETCorrectionsObjects
JetMETCorrectionsObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
JetMETCorrectionsObjects_EX_USE := $(foreach d, self  root FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet DataFormats/Common DataFormats/JetReco,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
JetMETCorrectionsObjects_EX_LIB   := JetMETCorrectionsObjects
ALL_EXTERNAL_PRODS += JetMETCorrectionsObjects
endif
ifeq ($(strip $(DataFormats/DTDigi)),)
DataFormatsDTDigi := self/DataFormats/DTDigi
DataFormats/DTDigi := DataFormatsDTDigi
DataFormatsDTDigi_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsDTDigi_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/MuonDetId boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsDTDigi_LCGDICTS  := x 
DataFormatsDTDigi_EX_LIB   := DataFormatsDTDigi
ALL_EXTERNAL_PRODS += DataFormatsDTDigi
endif
ifeq ($(strip $(RecoTracker/RoadSearchTrackCandidateMaker)),)
RecoTrackerRoadSearchTrackCandidateMaker := self/RecoTracker/RoadSearchTrackCandidateMaker
RecoTracker/RoadSearchTrackCandidateMaker := RecoTrackerRoadSearchTrackCandidateMaker
RecoTrackerRoadSearchTrackCandidateMaker_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerRoadSearchTrackCandidateMaker_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger DataFormats/Common Geometry/CommonDetUnit Geometry/TrackerGeometryBuilder Geometry/Records MagneticField/Records MagneticField/Engine RecoTracker/TkSeedGenerator RecoTracker/MeasurementDet TrackingTools/TrajectoryState TrackingTools/GeomPropagators TrackingTools/TrajectoryCleaning TrackingTools/RoadSearchHitAccess TrackingTools/MaterialEffects TrackingTools/TrackFitters,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerRoadSearchTrackCandidateMaker_EX_LIB   := RecoTrackerRoadSearchTrackCandidateMaker
ALL_EXTERNAL_PRODS += RecoTrackerRoadSearchTrackCandidateMaker
endif
ifeq ($(strip $(Utilities/General)),)
UtilitiesGeneral := self/Utilities/General
Utilities/General := UtilitiesGeneral
UtilitiesGeneral_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
UtilitiesGeneral_EX_USE := $(foreach d, self  FWCore/Utilities boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
UtilitiesGeneral_EX_LIB   := UtilitiesGeneral
ALL_EXTERNAL_PRODS += UtilitiesGeneral
endif
ifeq ($(strip $(Validation/RecoParticleFlow)),)
ValidationRecoParticleFlow := self/Validation/RecoParticleFlow
Validation/RecoParticleFlow := ValidationRecoParticleFlow
ValidationRecoParticleFlow_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
ValidationRecoParticleFlow_EX_USE := $(foreach d, self  root rootgpad rootcore rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ValidationRecoParticleFlow_LCGDICTS  := x 
ValidationRecoParticleFlow_EX_LIB   := ValidationRecoParticleFlow
ALL_EXTERNAL_PRODS += ValidationRecoParticleFlow
endif
ifeq ($(strip $(PhysicsTools/IsolationAlgos)),)
PhysicsToolsIsolationAlgos := self/PhysicsTools/IsolationAlgos
PhysicsTools/IsolationAlgos := PhysicsToolsIsolationAlgos
PhysicsToolsIsolationAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsIsolationAlgos_EX_USE := $(foreach d, self  DataFormats/GeometryVector DataFormats/GeometrySurface TrackPropagation/SteppingHelixPropagator MagneticField/Records TrackingTools/TrajectoryState TrackingTools/TrajectoryParametrization FWCore/Framework FWCore/ParameterSet DataFormats/RecoCandidate,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsIsolationAlgos_EX_LIB   := PhysicsToolsIsolationAlgos
ALL_EXTERNAL_PRODS += PhysicsToolsIsolationAlgos
endif
ifeq ($(strip $(RecoVertex/TrimmedKalmanVertexFinder)),)
RecoVertexTrimmedKalmanVertexFinder := self/RecoVertex/TrimmedKalmanVertexFinder
RecoVertex/TrimmedKalmanVertexFinder := RecoVertexTrimmedKalmanVertexFinder
RecoVertexTrimmedKalmanVertexFinder_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoVertexTrimmedKalmanVertexFinder_EX_USE := $(foreach d, self  RecoVertex/KalmanVertexFit CommonTools/Statistics,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoVertexTrimmedKalmanVertexFinder_EX_LIB   := RecoVertexTrimmedKalmanVertexFinder
ALL_EXTERNAL_PRODS += RecoVertexTrimmedKalmanVertexFinder
endif
ifeq ($(strip $(CondCore/RegressionTest)),)
CondCoreRegressionTest := self/CondCore/RegressionTest
CondCore/RegressionTest := CondCoreRegressionTest
CondCoreRegressionTest_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondCoreRegressionTest_EX_USE := $(foreach d, self  CondCore/DBCommon CondCore/MetaDataService CondCore/IOVService,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondCoreRegressionTest_EX_LIB   := CondCoreRegressionTest
ALL_EXTERNAL_PRODS += CondCoreRegressionTest
endif
ifeq ($(strip $(Utilities/RFIOAdaptor)),)
UtilitiesRFIOAdaptor := self/Utilities/RFIOAdaptor
Utilities/RFIOAdaptor := UtilitiesRFIOAdaptor
UtilitiesRFIOAdaptor_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
UtilitiesRFIOAdaptor_EX_USE := $(foreach d, self  Utilities/StorageFactory FWCore/MessageLogger FWCore/Utilities FWCore/PluginManager,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
UtilitiesRFIOAdaptor_EX_LIB   := UtilitiesRFIOAdaptor
ALL_EXTERNAL_PRODS += UtilitiesRFIOAdaptor
endif
ifeq ($(strip $(RecoHI/HiCentralityAlgos)),)
RecoHIHiCentralityAlgos := self/RecoHI/HiCentralityAlgos
RecoHI/HiCentralityAlgos := RecoHIHiCentralityAlgos
RecoHIHiCentralityAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoHIHiCentralityAlgos_EX_USE := $(foreach d, self  root rootrflx FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/Utilities CommonTools/UtilAlgos DataFormats/Candidate DataFormats/HcalRecHit DataFormats/Common DataFormats/HeavyIonEvent DataFormats/TrackingRecHit DataFormats/TrackerRecHit2D DataFormats/TrackReco DataFormats/VertexReco CondFormats/HIObjects CondFormats/DataRecord CondCore/DBCommon CondCore/DBOutputService CondCore/PopCon Geometry/CaloGeometry Geometry/TrackerGeometryBuilder,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoHIHiCentralityAlgos_EX_LIB   := RecoHIHiCentralityAlgos
ALL_EXTERNAL_PRODS += RecoHIHiCentralityAlgos
endif
ifeq ($(strip $(Geometry/TrackerNumberingBuilder)),)
GeometryTrackerNumberingBuilder := self/Geometry/TrackerNumberingBuilder
Geometry/TrackerNumberingBuilder := GeometryTrackerNumberingBuilder
GeometryTrackerNumberingBuilder_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryTrackerNumberingBuilder_EX_USE := $(foreach d, self  DataFormats/GeometrySurface DetectorDescription/Core DetectorDescription/Base,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryTrackerNumberingBuilder_EX_LIB   := GeometryTrackerNumberingBuilder
ALL_EXTERNAL_PRODS += GeometryTrackerNumberingBuilder
endif
ifeq ($(strip $(RecoVertex/NuclearInteractionProducer)),)
RecoVertexNuclearInteractionProducer := self/RecoVertex/NuclearInteractionProducer
RecoVertex/NuclearInteractionProducer := RecoVertexNuclearInteractionProducer
RecoVertexNuclearInteractionProducer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoVertexNuclearInteractionProducer_EX_USE := $(foreach d, self  RecoVertex/KalmanVertexFit DataFormats/GeometryVector DataFormats/TrackReco DataFormats/VertexReco FWCore/Framework FWCore/ParameterSet MagneticField/Engine MagneticField/Records RecoVertex/AdaptiveVertexFit RecoVertex/VertexPrimitives TrackingTools/PatternTools TrackingTools/TrajectoryState TrackingTools/TransientTrack,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoVertexNuclearInteractionProducer_EX_LIB   := RecoVertexNuclearInteractionProducer
ALL_EXTERNAL_PRODS += RecoVertexNuclearInteractionProducer
endif
ifeq ($(strip $(FastSimulation/TrajectoryManager)),)
FastSimulationTrajectoryManager := self/FastSimulation/TrajectoryManager
FastSimulation/TrajectoryManager := FastSimulationTrajectoryManager
FastSimulationTrajectoryManager_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationTrajectoryManager_EX_USE := $(foreach d, self  DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/SiStripDetId FWCore/MessageLogger FWCore/ParameterSet FastSimulation/Event FastSimulation/MaterialEffects FastSimulation/ParticleDecay FastSimulation/ParticlePropagator FastSimulation/TrackerSetup FastSimulation/Utilities Geometry/CommonDetUnit MagneticField/Engine RecoTracker/TkDetLayers TrackingTools/DetLayers TrackingTools/GeomPropagators TrackingTools/PatternTools TrackingTools/TrajectoryState,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationTrajectoryManager_EX_LIB   := FastSimulationTrajectoryManager
ALL_EXTERNAL_PRODS += FastSimulationTrajectoryManager
endif
ifeq ($(strip $(SimG4CMS/EcalTestBeam)),)
SimG4CMSEcalTestBeam := self/SimG4CMS/EcalTestBeam
SimG4CMS/EcalTestBeam := SimG4CMSEcalTestBeam
SimG4CMSEcalTestBeam_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CMSEcalTestBeam_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/EcalDetId DataFormats/Math DetectorDescription/Core FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet Geometry/EcalCommonData Geometry/EcalTestBeam SimDataFormats/EcalTestBeam SimDataFormats/GeneratorProducts SimG4Core/Notification SimG4Core/Watcher SimG4CMS/Calo TBDataFormats/EcalTBObjects clhep rootmath geant4core,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CMSEcalTestBeam_EX_LIB   := SimG4CMSEcalTestBeam
ALL_EXTERNAL_PRODS += SimG4CMSEcalTestBeam
endif
ifeq ($(strip $(SimG4CMS/Tracker)),)
SimG4CMSTracker := self/SimG4CMS/Tracker
SimG4CMS/Tracker := SimG4CMSTracker
SimG4CMSTracker_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CMSTracker_EX_USE := $(foreach d, self  FWCore/ParameterSet SimG4Core/SensitiveDetector SimG4Core/Notification Geometry/TrackerNumberingBuilder boost geant4core SimDataFormats/SimHitMaker SimG4Core/Application,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CMSTracker_EX_LIB   := SimG4CMSTracker
ALL_EXTERNAL_PRODS += SimG4CMSTracker
endif
ifeq ($(strip $(FWCore/Framework)),)
FWCoreFramework := self/FWCore/Framework
FWCore/Framework := FWCoreFramework
FWCoreFramework_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCoreFramework_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/Provenance FWCore/Common FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/PythonParameterSet FWCore/ServiceRegistry FWCore/Utilities FWCore/Version boost rootcore rootrflx sigcpp,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCoreFramework_EX_LIB   := FWCoreFramework
ALL_EXTERNAL_PRODS += FWCoreFramework
endif
ifeq ($(strip $(RecoCaloTools/Navigation)),)
src_RecoCaloTools_Navigation := self/RecoCaloTools/Navigation
RecoCaloTools/Navigation  := src_RecoCaloTools_Navigation
src_RecoCaloTools_Navigation_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_RecoCaloTools_Navigation_EX_USE := $(foreach d, self DataFormats/EcalDetId DataFormats/HcalDetId Geometry/CaloTopology,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_RecoCaloTools_Navigation
endif

ifeq ($(strip $(RecoTracker/TkSeedGenerator)),)
RecoTrackerTkSeedGenerator := self/RecoTracker/TkSeedGenerator
RecoTracker/TkSeedGenerator := RecoTrackerTkSeedGenerator
RecoTrackerTkSeedGenerator_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerTkSeedGenerator_EX_USE := $(foreach d, self  root FWCore/Framework FWCore/PluginManager DataFormats/Common FWCore/ParameterSet Geometry/Records Geometry/CommonDetUnit DataFormats/TrajectorySeed DataFormats/TrackerRecHit2D Geometry/CommonTopologies Geometry/TrackerGeometryBuilder DataFormats/DetId DataFormats/SiStripDetId TrackingTools/PatternTools MagneticField/Records MagneticField/Engine TrackingTools/KalmanUpdators TrackingTools/Records CommonTools/Utils rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerTkSeedGenerator_LCGDICTS  := x 
RecoTrackerTkSeedGenerator_EX_LIB   := RecoTrackerTkSeedGenerator
ALL_EXTERNAL_PRODS += RecoTrackerTkSeedGenerator
endif
ifeq ($(strip $(TrackingTools/Records)),)
TrackingToolsRecords := self/TrackingTools/Records
TrackingTools/Records := TrackingToolsRecords
TrackingToolsRecords_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsRecords_EX_USE := $(foreach d, self  FWCore/Utilities FWCore/Framework Geometry/Records RecoLocalTracker/Records MagneticField/Records clhep boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsRecords_EX_LIB   := TrackingToolsRecords
ALL_EXTERNAL_PRODS += TrackingToolsRecords
endif
ifeq ($(strip $(CalibTracker/SiStripESProducers)),)
CalibTrackerSiStripESProducers := self/CalibTracker/SiStripESProducers
CalibTracker/SiStripESProducers := CalibTrackerSiStripESProducers
CalibTrackerSiStripESProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibTrackerSiStripESProducers_EX_USE := $(foreach d, self  CalibTracker/SiStripCommon CalibFormats/SiStripObjects CalibTracker/Records CondFormats/DataRecord CondFormats/SiStripObjects DataFormats/SiStripCommon FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet CondFormats/RunInfo boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibTrackerSiStripESProducers_EX_LIB   := CalibTrackerSiStripESProducers
ALL_EXTERNAL_PRODS += CalibTrackerSiStripESProducers
endif
ifeq ($(strip $(DataFormats/L1DTTrackFinder)),)
DataFormatsL1DTTrackFinder := self/DataFormats/L1DTTrackFinder
DataFormats/L1DTTrackFinder := DataFormatsL1DTTrackFinder
DataFormatsL1DTTrackFinder_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsL1DTTrackFinder_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/L1GlobalMuonTrigger rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsL1DTTrackFinder_LCGDICTS  := x 
DataFormatsL1DTTrackFinder_EX_LIB   := DataFormatsL1DTTrackFinder
ALL_EXTERNAL_PRODS += DataFormatsL1DTTrackFinder
endif
ifeq ($(strip $(TrackingTools/IPTools)),)
TrackingToolsIPTools := self/TrackingTools/IPTools
TrackingTools/IPTools := TrackingToolsIPTools
TrackingToolsIPTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsIPTools_EX_USE := $(foreach d, self  DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/VertexReco FWCore/MessageLogger TrackingTools/GeomPropagators TrackingTools/PatternTools TrackingTools/TrajectoryState TrackingTools/Records RecoVertex/VertexTools clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsIPTools_EX_LIB   := TrackingToolsIPTools
ALL_EXTERNAL_PRODS += TrackingToolsIPTools
endif
ifeq ($(strip $(DataFormats/CaloTowers)),)
DataFormatsCaloTowers := self/DataFormats/CaloTowers
DataFormats/CaloTowers := DataFormatsCaloTowers
DataFormatsCaloTowers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsCaloTowers_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/Math FWCore/Utilities DataFormats/Candidate rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsCaloTowers_LCGDICTS  := x 
DataFormatsCaloTowers_EX_LIB   := DataFormatsCaloTowers
ALL_EXTERNAL_PRODS += DataFormatsCaloTowers
endif
ifeq ($(strip $(SimDataFormats/TrackingAnalysis)),)
SimDataFormatsTrackingAnalysis := self/SimDataFormats/TrackingAnalysis
SimDataFormats/TrackingAnalysis := SimDataFormatsTrackingAnalysis
SimDataFormatsTrackingAnalysis_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsTrackingAnalysis_EX_USE := $(foreach d, self  DataFormats/Candidate DataFormats/Common DataFormats/Math DataFormats/TrackReco SimDataFormats/EncodedEventId SimDataFormats/GeneratorProducts SimDataFormats/Track SimDataFormats/TrackingHit SimDataFormats/Vertex rootrflx clhepheader,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsTrackingAnalysis_LCGDICTS  := x 
SimDataFormatsTrackingAnalysis_EX_LIB   := SimDataFormatsTrackingAnalysis
ALL_EXTERNAL_PRODS += SimDataFormatsTrackingAnalysis
endif
ifeq ($(strip $(L1Trigger/DTTrackFinder)),)
L1TriggerDTTrackFinder := self/L1Trigger/DTTrackFinder
L1Trigger/DTTrackFinder := L1TriggerDTTrackFinder
L1TriggerDTTrackFinder_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerDTTrackFinder_EX_USE := $(foreach d, self  FWCore/Framework CondFormats/L1TObjects CondFormats/DataRecord DataFormats/L1DTTrackFinder DataFormats/L1GlobalMuonTrigger DataFormats/L1CSCTrackFinder,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerDTTrackFinder_EX_LIB   := L1TriggerDTTrackFinder
ALL_EXTERNAL_PRODS += L1TriggerDTTrackFinder
endif
ifeq ($(strip $(CondFormats/PhysicsToolsObjects)),)
CondFormatsPhysicsToolsObjects := self/CondFormats/PhysicsToolsObjects
CondFormats/PhysicsToolsObjects := CondFormatsPhysicsToolsObjects
CondFormatsPhysicsToolsObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsPhysicsToolsObjects_EX_USE := $(foreach d, self  FWCore/MessageLogger FWCore/Utilities CondFormats/Common boost sigcpp rootrflx root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsPhysicsToolsObjects_LCGDICTS  := x 
CondFormatsPhysicsToolsObjects_EX_LIB   := CondFormatsPhysicsToolsObjects
ALL_EXTERNAL_PRODS += CondFormatsPhysicsToolsObjects
endif
ifeq ($(strip $(CondFormats/HIObjects)),)
CondFormatsHIObjects := self/CondFormats/HIObjects
CondFormats/HIObjects := CondFormatsHIObjects
CondFormatsHIObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsHIObjects_EX_USE := $(foreach d, self  CondFormats/Common FWCore/Framework rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsHIObjects_LCGDICTS  := x 
CondFormatsHIObjects_EX_LIB   := CondFormatsHIObjects
ALL_EXTERNAL_PRODS += CondFormatsHIObjects
endif
ifeq ($(strip $(SimG4Core/Physics)),)
SimG4CorePhysics := self/SimG4Core/Physics
SimG4Core/Physics := SimG4CorePhysics
SimG4CorePhysics_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CorePhysics_EX_USE := $(foreach d, self  DetectorDescription/Core FWCore/ParameterSet geant4core heppdt boost sigcpp expat,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CorePhysics_EX_LIB   := SimG4CorePhysics
ALL_EXTERNAL_PRODS += SimG4CorePhysics
endif
ifeq ($(strip $(HLTrigger/HLTcore)),)
HLTriggerHLTcore := self/HLTrigger/HLTcore
HLTrigger/HLTcore := HLTriggerHLTcore
HLTriggerHLTcore_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
HLTriggerHLTcore_EX_USE := $(foreach d, self  boost DataFormats/Common FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Services FWCore/MessageLogger L1Trigger/GlobalTriggerAnalyzer CondCore/DBOutputService CondFormats/HLTObjects CondFormats/DataRecord,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
HLTriggerHLTcore_EX_LIB   := HLTriggerHLTcore
ALL_EXTERNAL_PRODS += HLTriggerHLTcore
endif
ifeq ($(strip $(DataFormats/RPCRecHit)),)
DataFormatsRPCRecHit := self/DataFormats/RPCRecHit
DataFormats/RPCRecHit := DataFormatsRPCRecHit
DataFormatsRPCRecHit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsRPCRecHit_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/MuonDetId DataFormats/TrackingRecHit rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsRPCRecHit_LCGDICTS  := x 
DataFormatsRPCRecHit_EX_LIB   := DataFormatsRPCRecHit
ALL_EXTERNAL_PRODS += DataFormatsRPCRecHit
endif
ifeq ($(strip $(DataFormats/CLHEP)),)
DataFormatsCLHEP := self/DataFormats/CLHEP
DataFormats/CLHEP := DataFormatsCLHEP
DataFormatsCLHEP_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsCLHEP_EX_USE := $(foreach d, self  clhep rootrflx rootmath DataFormats/Math,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsCLHEP_LCGDICTS  := x 
DataFormatsCLHEP_EX_LIB   := DataFormatsCLHEP
ALL_EXTERNAL_PRODS += DataFormatsCLHEP
endif
ifeq ($(strip $(SimTracker/Common)),)
SimTrackerCommon := self/SimTracker/Common
SimTracker/Common := SimTrackerCommon
SimTrackerCommon_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimTrackerCommon_EX_USE := $(foreach d, self  clhep SimDataFormats/TrackingHit SimDataFormats/CrossingFrame,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimTrackerCommon_EX_LIB   := SimTrackerCommon
ALL_EXTERNAL_PRODS += SimTrackerCommon
endif
ifeq ($(strip $(SimDataFormats/EncodedEventId)),)
SimDataFormatsEncodedEventId := self/SimDataFormats/EncodedEventId
SimDataFormats/EncodedEventId := SimDataFormatsEncodedEventId
SimDataFormatsEncodedEventId_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsEncodedEventId_EX_USE := $(foreach d, self  boost rootcore rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsEncodedEventId_LCGDICTS  := x 
SimDataFormatsEncodedEventId_EX_LIB   := SimDataFormatsEncodedEventId
ALL_EXTERNAL_PRODS += SimDataFormatsEncodedEventId
endif
ifeq ($(strip $(L1Trigger/DTTraco)),)
L1TriggerDTTraco := self/L1Trigger/DTTraco
L1Trigger/DTTraco := L1TriggerDTTraco
L1TriggerDTTraco_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerDTTraco_EX_USE := $(foreach d, self  FWCore/PluginManager FWCore/ParameterSet Geometry/DTGeometry L1TriggerConfig/DTTPGConfig L1Trigger/DTUtilities L1Trigger/DTBti L1Trigger/DTTriggerServerTheta clhep root rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerDTTraco_EX_LIB   := L1TriggerDTTraco
ALL_EXTERNAL_PRODS += L1TriggerDTTraco
endif
ifeq ($(strip $(PhysicsTools/FWLite)),)
PhysicsToolsFWLite := self/PhysicsTools/FWLite
PhysicsTools/FWLite := PhysicsToolsFWLite
PhysicsToolsFWLite_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsFWLite_EX_USE := $(foreach d, self  boost rootcore rootrflx rootcintex roothistmatrix CommonTools/Utils DataFormats/FWLite DataFormats/MuonReco,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsFWLite_LCGDICTS  := x 
PhysicsToolsFWLite_EX_LIB   := PhysicsToolsFWLite
ALL_EXTERNAL_PRODS += PhysicsToolsFWLite
endif
ifeq ($(strip $(FastSimulation/ParticleDecay)),)
FastSimulationParticleDecay := self/FastSimulation/ParticleDecay
FastSimulation/ParticleDecay := FastSimulationParticleDecay
FastSimulationParticleDecay_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationParticleDecay_EX_USE := $(foreach d, self  hepmc FastSimulation/ParticlePropagator GeneratorInterface/Pythia6Interface f77compiler pydata,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationParticleDecay_EX_LIB   := FastSimulationParticleDecay
ALL_EXTERNAL_PRODS += FastSimulationParticleDecay
endif
ifeq ($(strip $(DataFormats/GeometryVector)),)
DataFormatsGeometryVector := self/DataFormats/GeometryVector
DataFormats/GeometryVector := DataFormatsGeometryVector
DataFormatsGeometryVector_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsGeometryVector_EX_USE := $(foreach d, self  rootmath rootrflx DataFormats/Math,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsGeometryVector_LCGDICTS  := x 
DataFormatsGeometryVector_EX_LIB   := DataFormatsGeometryVector
ALL_EXTERNAL_PRODS += DataFormatsGeometryVector
endif
ifeq ($(strip $(EventFilter/FEDInterface)),)
EventFilterFEDInterface := self/EventFilter/FEDInterface
EventFilter/FEDInterface := EventFilterFEDInterface
EventFilterFEDInterface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterFEDInterface_EX_USE := $(foreach d, self  xdaqheader,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterFEDInterface_EX_LIB   := EventFilterFEDInterface
ALL_EXTERNAL_PRODS += EventFilterFEDInterface
endif
ifeq ($(strip $(RecoEcal/EgammaClusterAlgos)),)
RecoEcalEgammaClusterAlgos := self/RecoEcal/EgammaClusterAlgos
RecoEcal/EgammaClusterAlgos := RecoEcalEgammaClusterAlgos
RecoEcalEgammaClusterAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoEcalEgammaClusterAlgos_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet DataFormats/EcalRecHit DataFormats/EgammaReco DataFormats/Math RecoEcal/EgammaCoreTools Geometry/CaloGeometry Geometry/CaloTopology clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoEcalEgammaClusterAlgos_EX_LIB   := RecoEcalEgammaClusterAlgos
ALL_EXTERNAL_PRODS += RecoEcalEgammaClusterAlgos
endif
ifeq ($(strip $(DetectorDescription/Base)),)
DetectorDescriptionBase := self/DetectorDescription/Base
DetectorDescription/Base := DetectorDescriptionBase
DetectorDescriptionBase_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DetectorDescriptionBase_EX_USE := $(foreach d, self  FWCore/Utilities,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DetectorDescriptionBase_EX_LIB   := DetectorDescriptionBase
ALL_EXTERNAL_PRODS += DetectorDescriptionBase
endif
ifeq ($(strip $(Geometry/HcalTowerAlgo)),)
GeometryHcalTowerAlgo := self/Geometry/HcalTowerAlgo
Geometry/HcalTowerAlgo := GeometryHcalTowerAlgo
GeometryHcalTowerAlgo_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryHcalTowerAlgo_EX_USE := $(foreach d, self  Geometry/CaloGeometry Geometry/CaloTopology Geometry/HcalCommonData DataFormats/HcalDetId DataFormats/CaloTowers FWCore/MessageLogger clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryHcalTowerAlgo_EX_LIB   := GeometryHcalTowerAlgo
ALL_EXTERNAL_PRODS += GeometryHcalTowerAlgo
endif
ifeq ($(strip $(SimDataFormats/Vertex)),)
SimDataFormatsVertex := self/SimDataFormats/Vertex
SimDataFormats/Vertex := SimDataFormatsVertex
SimDataFormatsVertex_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsVertex_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/Math SimDataFormats/EncodedEventId rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsVertex_LCGDICTS  := x 
SimDataFormatsVertex_EX_LIB   := SimDataFormatsVertex
ALL_EXTERNAL_PRODS += SimDataFormatsVertex
endif
ifeq ($(strip $(Utilities/Timing)),)
UtilitiesTiming := self/Utilities/Timing
Utilities/Timing := UtilitiesTiming
UtilitiesTiming_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
UtilitiesTiming_EX_USE := $(foreach d, self  ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
UtilitiesTiming_EX_LIB   := UtilitiesTiming
ALL_EXTERNAL_PRODS += UtilitiesTiming
endif
ifeq ($(strip $(Fireworks/Muons)),)
FireworksMuons := self/Fireworks/Muons
Fireworks/Muons := FireworksMuons
FireworksMuons_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FireworksMuons_EX_USE := $(foreach d, self  DataFormats/MuonDetId DataFormats/MuonReco DataFormats/TrackReco Fireworks/Candidates Fireworks/Core Fireworks/Tracks,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FireworksMuons_EX_LIB   := FireworksMuons
ALL_EXTERNAL_PRODS += FireworksMuons
endif
ifeq ($(strip $(DataFormats/TrackingRecHit)),)
DataFormatsTrackingRecHit := self/DataFormats/TrackingRecHit
DataFormats/TrackingRecHit := DataFormatsTrackingRecHit
DataFormatsTrackingRecHit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsTrackingRecHit_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/GeometrySurface FWCore/Utilities clhep rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsTrackingRecHit_LCGDICTS  := x 
DataFormatsTrackingRecHit_EX_LIB   := DataFormatsTrackingRecHit
ALL_EXTERNAL_PRODS += DataFormatsTrackingRecHit
endif
ifeq ($(strip $(DataFormats/GeometrySurface)),)
DataFormatsGeometrySurface := self/DataFormats/GeometrySurface
DataFormats/GeometrySurface := DataFormatsGeometrySurface
DataFormatsGeometrySurface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsGeometrySurface_EX_USE := $(foreach d, self  DataFormats/GeometryVector boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsGeometrySurface_LCGDICTS  := x 
DataFormatsGeometrySurface_EX_LIB   := DataFormatsGeometrySurface
ALL_EXTERNAL_PRODS += DataFormatsGeometrySurface
endif
ifeq ($(strip $(RecoTracker/RoadSearchHelixMaker)),)
RecoTrackerRoadSearchHelixMaker := self/RecoTracker/RoadSearchHelixMaker
RecoTracker/RoadSearchHelixMaker := RecoTrackerRoadSearchHelixMaker
RecoTrackerRoadSearchHelixMaker_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerRoadSearchHelixMaker_EX_USE := $(foreach d, self  TrackingTools/TrajectoryState DataFormats/Common DataFormats/DetId DataFormats/SiPixelDetId DataFormats/SiStripDetId DataFormats/TrackReco DataFormats/TrajectorySeed FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager Geometry/CommonDetUnit Geometry/CommonTopologies Geometry/Records Geometry/TrackerGeometryBuilder MagneticField/Engine MagneticField/Records clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerRoadSearchHelixMaker_EX_LIB   := RecoTrackerRoadSearchHelixMaker
ALL_EXTERNAL_PRODS += RecoTrackerRoadSearchHelixMaker
endif
ifeq ($(strip $(CondFormats/EcalCorrections)),)
CondFormatsEcalCorrections := self/CondFormats/EcalCorrections
CondFormats/EcalCorrections := CondFormatsEcalCorrections
CondFormatsEcalCorrections_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsEcalCorrections_EX_USE := $(foreach d, self  CondFormats/Common DataFormats/EcalDetId FWCore/Utilities rootrflx boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsEcalCorrections_LCGDICTS  := x 
CondFormatsEcalCorrections_EX_LIB   := CondFormatsEcalCorrections
ALL_EXTERNAL_PRODS += CondFormatsEcalCorrections
endif
ifeq ($(strip $(Alignment/KalmanAlignmentAlgorithm)),)
AlignmentKalmanAlignmentAlgorithm := self/Alignment/KalmanAlignmentAlgorithm
Alignment/KalmanAlignmentAlgorithm := AlignmentKalmanAlignmentAlgorithm
AlignmentKalmanAlignmentAlgorithm_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentKalmanAlignmentAlgorithm_EX_USE := $(foreach d, self  root boost FWCore/Utilities FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/PluginManager Alignment/CommonAlignment Alignment/CommonAlignmentAlgorithm TrackingTools/TransientTrack RecoTracker/TrackProducer,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentKalmanAlignmentAlgorithm_EX_LIB   := AlignmentKalmanAlignmentAlgorithm
ALL_EXTERNAL_PRODS += AlignmentKalmanAlignmentAlgorithm
endif
ifeq ($(strip $(SimG4Core/Generators)),)
SimG4CoreGenerators := self/SimG4Core/Generators
SimG4Core/Generators := SimG4CoreGenerators
SimG4CoreGenerators_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CoreGenerators_EX_USE := $(foreach d, self  FWCore/ParameterSet FWCore/MessageLogger SimDataFormats/GeneratorProducts boost geant4core rootmath expat,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CoreGenerators_EX_LIB   := SimG4CoreGenerators
ALL_EXTERNAL_PRODS += SimG4CoreGenerators
endif
ifeq ($(strip $(CalibCalorimetry/EcalCorrelatedNoiseAnalysisAlgos)),)
CalibCalorimetryEcalCorrelatedNoiseAnalysisAlgos := self/CalibCalorimetry/EcalCorrelatedNoiseAnalysisAlgos
CalibCalorimetry/EcalCorrelatedNoiseAnalysisAlgos := CalibCalorimetryEcalCorrelatedNoiseAnalysisAlgos
CalibCalorimetryEcalCorrelatedNoiseAnalysisAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibCalorimetryEcalCorrelatedNoiseAnalysisAlgos_EX_USE := $(foreach d, self  root rootinteractive,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibCalorimetryEcalCorrelatedNoiseAnalysisAlgos_ROOTDICT  := LinkDef
CalibCalorimetryEcalCorrelatedNoiseAnalysisAlgos_EX_LIB   := CalibCalorimetryEcalCorrelatedNoiseAnalysisAlgos
ALL_EXTERNAL_PRODS += CalibCalorimetryEcalCorrelatedNoiseAnalysisAlgos
endif
ifeq ($(strip $(SimDataFormats/Forward)),)
SimDataFormatsForward := self/SimDataFormats/Forward
SimDataFormats/Forward := SimDataFormatsForward
SimDataFormatsForward_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsForward_EX_USE := $(foreach d, self  DataFormats/Common FWCore/MessageLogger rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsForward_LCGDICTS  := x 
SimDataFormatsForward_EX_LIB   := SimDataFormatsForward
ALL_EXTERNAL_PRODS += SimDataFormatsForward
endif
ifeq ($(strip $(GeneratorInterface/AlpgenInterface)),)
GeneratorInterfaceAlpgenInterface := self/GeneratorInterface/AlpgenInterface
GeneratorInterface/AlpgenInterface := GeneratorInterfaceAlpgenInterface
GeneratorInterfaceAlpgenInterface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfaceAlpgenInterface_EX_USE := $(foreach d, self  boost root DataFormats/Math SimDataFormats/GeneratorProducts f77compiler,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeneratorInterfaceAlpgenInterface_EX_LIB   := GeneratorInterfaceAlpgenInterface
ALL_EXTERNAL_PRODS += GeneratorInterfaceAlpgenInterface
endif
ifeq ($(strip $(GeneratorInterface/HydjetInterface)),)
GeneratorInterfaceHydjetInterface := self/GeneratorInterface/HydjetInterface
GeneratorInterface/HydjetInterface := GeneratorInterfaceHydjetInterface
GeneratorInterfaceHydjetInterface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfaceHydjetInterface_EX_USE := $(foreach d, self  boost GeneratorInterface/Core FWCore/Framework SimDataFormats/GeneratorProducts GeneratorInterface/Pythia6Interface GeneratorInterface/PyquenInterface GeneratorInterface/ExternalDecays f77compiler,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeneratorInterfaceHydjetInterface_EX_LIB   := GeneratorInterfaceHydjetInterface
ALL_EXTERNAL_PRODS += GeneratorInterfaceHydjetInterface
endif
ifeq ($(strip $(FastSimDataFormats/External)),)
FastSimDataFormatsExternal := self/FastSimDataFormats/External
FastSimDataFormats/External := FastSimDataFormatsExternal
FastSimDataFormatsExternal_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimDataFormatsExternal_EX_USE := $(foreach d, self  DataFormats/Common rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimDataFormatsExternal_LCGDICTS  := x 
FastSimDataFormatsExternal_EX_LIB   := FastSimDataFormatsExternal
ALL_EXTERNAL_PRODS += FastSimDataFormatsExternal
endif
ifeq ($(strip $(SimCalorimetry/EcalSimAlgos)),)
SimCalorimetryEcalSimAlgos := self/SimCalorimetry/EcalSimAlgos
SimCalorimetry/EcalSimAlgos := SimCalorimetryEcalSimAlgos
SimCalorimetryEcalSimAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimCalorimetryEcalSimAlgos_EX_USE := $(foreach d, self  SimDataFormats/CaloHit DataFormats/EcalDigi DataFormats/EcalDetId SimCalorimetry/CaloSimAlgos SimGeneral/NoiseGenerators CondFormats/EcalObjects CalibCalorimetry/EcalLaserCorrection CalibFormats/CaloObjects clhep roothistmatrix,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimCalorimetryEcalSimAlgos_EX_LIB   := SimCalorimetryEcalSimAlgos
ALL_EXTERNAL_PRODS += SimCalorimetryEcalSimAlgos
endif
ifeq ($(strip $(FWCore/PythonParameterSet)),)
FWCorePythonParameterSet := self/FWCore/PythonParameterSet
FWCore/PythonParameterSet := FWCorePythonParameterSet
FWCorePythonParameterSet_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCorePythonParameterSet_EX_USE := $(foreach d, self  DataFormats/Provenance FWCore/ParameterSet FWCore/Utilities boost boost_python,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCorePythonParameterSet_EX_LIB   := FWCorePythonParameterSet
ALL_EXTERNAL_PRODS += FWCorePythonParameterSet
endif
ifeq ($(strip $(IOPool/Common)),)
IOPoolCommon := self/IOPool/Common
IOPool/Common := IOPoolCommon
IOPoolCommon_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
IOPoolCommon_EX_USE := $(foreach d, self  FWCore/ServiceRegistry FWCore/Utilities,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
IOPoolCommon_EX_LIB   := IOPoolCommon
ALL_EXTERNAL_PRODS += IOPoolCommon
endif
ifeq ($(strip $(EventFilter/Message2log4cplus)),)
EventFilterMessage2log4cplus := self/EventFilter/Message2log4cplus
EventFilter/Message2log4cplus := EventFilterMessage2log4cplus
EventFilterMessage2log4cplus_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterMessage2log4cplus_EX_USE := $(foreach d, self  DataFormats/Provenance EventFilter/Utilities FWCore/MessageLogger FWCore/MessageService FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities xdaq,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterMessage2log4cplus_EX_LIB   := EventFilterMessage2log4cplus
ALL_EXTERNAL_PRODS += EventFilterMessage2log4cplus
endif
ifeq ($(strip $(DetectorDescription/Algorithm)),)
DetectorDescriptionAlgorithm := self/DetectorDescription/Algorithm
DetectorDescription/Algorithm := DetectorDescriptionAlgorithm
DetectorDescriptionAlgorithm_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DetectorDescriptionAlgorithm_EX_USE := $(foreach d, self  DetectorDescription/Base DetectorDescription/Core DetectorDescription/ExprAlgo FWCore/PluginManager clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DetectorDescriptionAlgorithm_EX_LIB   := DetectorDescriptionAlgorithm
ALL_EXTERNAL_PRODS += DetectorDescriptionAlgorithm
endif
ifeq ($(strip $(PhysicsTools/SelectorUtils)),)
PhysicsToolsSelectorUtils := self/PhysicsTools/SelectorUtils
PhysicsTools/SelectorUtils := PhysicsToolsSelectorUtils
PhysicsToolsSelectorUtils_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsSelectorUtils_EX_USE := $(foreach d, self  CommonTools/Utils DataFormats/Math DataFormats/Candidate DataFormats/PatCandidates DataFormats/BeamSpot DataFormats/Common DataFormats/Provenance DataFormats/VertexReco FWCore/Common FWCore/FWLite FWCore/ParameterSet FWCore/Utilities rootrflx rootcore root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsSelectorUtils_LCGDICTS  := x 
PhysicsToolsSelectorUtils_EX_LIB   := PhysicsToolsSelectorUtils
ALL_EXTERNAL_PRODS += PhysicsToolsSelectorUtils
endif
ifeq ($(strip $(CommonTools/Utils)),)
CommonToolsUtils := self/CommonTools/Utils
CommonTools/Utils := CommonToolsUtils
CommonToolsUtils_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CommonToolsUtils_EX_USE := $(foreach d, self  FWCore/Utilities rootrflx boost roothistmatrix,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CommonToolsUtils_EX_LIB   := CommonToolsUtils
ALL_EXTERNAL_PRODS += CommonToolsUtils
endif
ifeq ($(strip $(CalibTracker/SiPixelConnectivity)),)
CalibTrackerSiPixelConnectivity := self/CalibTracker/SiPixelConnectivity
CalibTracker/SiPixelConnectivity := CalibTrackerSiPixelConnectivity
CalibTrackerSiPixelConnectivity_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibTrackerSiPixelConnectivity_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet FWCore/PluginManager Geometry/Records Geometry/TrackerGeometryBuilder CondFormats/SiPixelObjects CondFormats/DataRecord DataFormats/SiPixelDetId Geometry/CommonDetUnit CondCore/DBCommon CondCore/IOVService CondCore/MetaDataService boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibTrackerSiPixelConnectivity_EX_LIB   := CalibTrackerSiPixelConnectivity
ALL_EXTERNAL_PRODS += CalibTrackerSiPixelConnectivity
endif
ifeq ($(strip $(CondTools/SiPixel)),)
CondToolsSiPixel := self/CondTools/SiPixel
CondTools/SiPixel := CondToolsSiPixel
CondToolsSiPixel_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondToolsSiPixel_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger CondFormats/DataRecord CondFormats/SiPixelObjects CondCore/PopCon,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondToolsSiPixel_EX_LIB   := CondToolsSiPixel
ALL_EXTERNAL_PRODS += CondToolsSiPixel
endif
ifeq ($(strip $(DataFormats/RecoCandidate)),)
DataFormatsRecoCandidate := self/DataFormats/RecoCandidate
DataFormats/RecoCandidate := DataFormatsRecoCandidate
DataFormatsRecoCandidate_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsRecoCandidate_EX_USE := $(foreach d, self  DataFormats/CaloRecHit DataFormats/Candidate DataFormats/Common DataFormats/TrackReco clhep SimDataFormats/GeneratorProducts rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsRecoCandidate_LCGDICTS  := x 
DataFormatsRecoCandidate_EX_LIB   := DataFormatsRecoCandidate
ALL_EXTERNAL_PRODS += DataFormatsRecoCandidate
endif
ifeq ($(strip $(L1TriggerConfig/DTTPGConfig)),)
L1TriggerConfigDTTPGConfig := self/L1TriggerConfig/DTTPGConfig
L1TriggerConfig/DTTPGConfig := L1TriggerConfigDTTPGConfig
L1TriggerConfigDTTPGConfig_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerConfigDTTPGConfig_EX_USE := $(foreach d, self  DataFormats/MuonDetId FWCore/Framework CondFormats/DTObjects CondFormats/DataRecord CondCore/DBOutputService rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerConfigDTTPGConfig_EX_LIB   := L1TriggerConfigDTTPGConfig
ALL_EXTERNAL_PRODS += L1TriggerConfigDTTPGConfig
endif
ifeq ($(strip $(Validation/DTRecHits)),)
ValidationDTRecHits := self/Validation/DTRecHits
Validation/DTRecHits := ValidationDTRecHits
ValidationDTRecHits_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
ValidationDTRecHits_EX_USE := $(foreach d, self  FWCore/Framework DQMServices/Core DataFormats/DTRecHit Geometry/Records Geometry/DTGeometry root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ValidationDTRecHits_EX_LIB   := ValidationDTRecHits
ALL_EXTERNAL_PRODS += ValidationDTRecHits
endif
ifeq ($(strip $(CondCore/MetaDataService)),)
CondCoreMetaDataService := self/CondCore/MetaDataService
CondCore/MetaDataService := CondCoreMetaDataService
CondCoreMetaDataService_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondCoreMetaDataService_EX_USE := $(foreach d, self  RelationalAccess CondCore/DBCommon CondCore/ORA,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondCoreMetaDataService_EX_LIB   := CondCoreMetaDataService
ALL_EXTERNAL_PRODS += CondCoreMetaDataService
endif
ifeq ($(strip $(RecoTBCalo/HcalTBObjectUnpacker)),)
RecoTBCaloHcalTBObjectUnpacker := self/RecoTBCalo/HcalTBObjectUnpacker
RecoTBCalo/HcalTBObjectUnpacker := RecoTBCaloHcalTBObjectUnpacker
RecoTBCaloHcalTBObjectUnpacker_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTBCaloHcalTBObjectUnpacker_EX_USE := $(foreach d, self  TBDataFormats/HcalTBObjects DataFormats/FEDRawData DataFormats/HcalRecHit FWCore/Framework DataFormats/Common boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTBCaloHcalTBObjectUnpacker_EX_LIB   := RecoTBCaloHcalTBObjectUnpacker
ALL_EXTERNAL_PRODS += RecoTBCaloHcalTBObjectUnpacker
endif
ifeq ($(strip $(DataFormats/LTCDigi)),)
DataFormatsLTCDigi := self/DataFormats/LTCDigi
DataFormats/LTCDigi := DataFormatsLTCDigi
DataFormatsLTCDigi_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsLTCDigi_EX_USE := $(foreach d, self  DataFormats/Common rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsLTCDigi_LCGDICTS  := x 
DataFormatsLTCDigi_EX_LIB   := DataFormatsLTCDigi
ALL_EXTERNAL_PRODS += DataFormatsLTCDigi
endif
ifeq ($(strip $(DataFormats/CSCDigi)),)
DataFormatsCSCDigi := self/DataFormats/CSCDigi
DataFormats/CSCDigi := DataFormatsCSCDigi
DataFormatsCSCDigi_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsCSCDigi_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/MuonDetId boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsCSCDigi_LCGDICTS  := x 
DataFormatsCSCDigi_EX_LIB   := DataFormatsCSCDigi
ALL_EXTERNAL_PRODS += DataFormatsCSCDigi
endif
ifeq ($(strip $(Calibration/EcalCalibAlgos)),)
CalibrationEcalCalibAlgos := self/Calibration/EcalCalibAlgos
Calibration/EcalCalibAlgos := CalibrationEcalCalibAlgos
CalibrationEcalCalibAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibrationEcalCalibAlgos_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/EcalRecHit DataFormats/EcalDetId DataFormats/EgammaReco DataFormats/TrackReco DataFormats/EgammaCandidates CondFormats/EcalObjects CondFormats/DataRecord RecoLocalCalo/EcalRecAlgos Geometry/CaloGeometry Geometry/CaloTopology RecoEcal/EgammaClusterAlgos Geometry/EcalAlgo DataFormats/Math RecoEcal/EgammaCoreTools root xerces-c Calibration/Tools CalibCalorimetry/CaloMiscalibTools CondTools/Ecal SimDataFormats/GeneratorProducts,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibrationEcalCalibAlgos_EX_LIB   := CalibrationEcalCalibAlgos
ALL_EXTERNAL_PRODS += CalibrationEcalCalibAlgos
endif
ifeq ($(strip $(Geometry/RPCGeometryBuilder)),)
GeometryRPCGeometryBuilder := self/Geometry/RPCGeometryBuilder
Geometry/RPCGeometryBuilder := GeometryRPCGeometryBuilder
GeometryRPCGeometryBuilder_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryRPCGeometryBuilder_EX_USE := $(foreach d, self  Geometry/MuonNumbering Geometry/RPCGeometry DetectorDescription/Core,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryRPCGeometryBuilder_EX_LIB   := GeometryRPCGeometryBuilder
ALL_EXTERNAL_PRODS += GeometryRPCGeometryBuilder
endif
ifeq ($(strip $(DQMServices/Core)),)
DQMServicesCore := self/DQMServices/Core
DQMServices/Core := DQMServicesCore
DQMServicesCore_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMServicesCore_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities FWCore/Version classlib rootcintex roothistmatrix,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMServicesCore_EX_LIB   := DQMServicesCore
ALL_EXTERNAL_PRODS += DQMServicesCore
endif
ifeq ($(strip $(DQMServices/Examples)),)
DQMServicesExamples := self/DQMServices/Examples
DQMServices/Examples := DQMServicesExamples
DQMServicesExamples_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMServicesExamples_EX_USE := $(foreach d, self  DQMServices/Core FWCore/Framework,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMServicesExamples_EX_LIB   := DQMServicesExamples
ALL_EXTERNAL_PRODS += DQMServicesExamples
endif
ifeq ($(strip $(SimDataFormats/PileupSummaryInfo)),)
SimDataFormatsPileupSummaryInfo := self/SimDataFormats/PileupSummaryInfo
SimDataFormats/PileupSummaryInfo := SimDataFormatsPileupSummaryInfo
SimDataFormatsPileupSummaryInfo_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsPileupSummaryInfo_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/Provenance rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsPileupSummaryInfo_LCGDICTS  := x 
SimDataFormatsPileupSummaryInfo_EX_LIB   := SimDataFormatsPileupSummaryInfo
ALL_EXTERNAL_PRODS += SimDataFormatsPileupSummaryInfo
endif
ifeq ($(strip $(SimG4Core/Geometry)),)
SimG4CoreGeometry := self/SimG4Core/Geometry
SimG4Core/Geometry := SimG4CoreGeometry
SimG4CoreGeometry_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CoreGeometry_EX_USE := $(foreach d, self  DetectorDescription/Core geant4core Geometry/Records FWCore/MessageLogger FWCore/Utilities expat,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CoreGeometry_EX_LIB   := SimG4CoreGeometry
ALL_EXTERNAL_PRODS += SimG4CoreGeometry
endif
ifeq ($(strip $(DataFormats/Candidate)),)
DataFormatsCandidate := self/DataFormats/Candidate
DataFormats/Candidate := DataFormatsCandidate
DataFormatsCandidate_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsCandidate_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/Math FWCore/Utilities rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsCandidate_LCGDICTS  := x 
DataFormatsCandidate_EX_LIB   := DataFormatsCandidate
ALL_EXTERNAL_PRODS += DataFormatsCandidate
endif
ifeq ($(strip $(DataFormats/RoadSearchSeed)),)
DataFormatsRoadSearchSeed := self/DataFormats/RoadSearchSeed
DataFormats/RoadSearchSeed := DataFormatsRoadSearchSeed
DataFormatsRoadSearchSeed_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsRoadSearchSeed_EX_USE := $(foreach d, self  DataFormats/Common rootrflx clhepheader boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsRoadSearchSeed_LCGDICTS  := x 
DataFormatsRoadSearchSeed_EX_LIB   := DataFormatsRoadSearchSeed
ALL_EXTERNAL_PRODS += DataFormatsRoadSearchSeed
endif
ifeq ($(strip $(DQM/EcalEndcapMonitorTasks)),)
DQMEcalEndcapMonitorTasks := self/DQM/EcalEndcapMonitorTasks
DQM/EcalEndcapMonitorTasks := DQMEcalEndcapMonitorTasks
DQMEcalEndcapMonitorTasks_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMEcalEndcapMonitorTasks_EX_USE := $(foreach d, self  DQM/EcalCommon DQMServices/Core DataFormats/FEDRawData DataFormats/EcalDetId DataFormats/EcalDigi DataFormats/EcalRawData DataFormats/EcalRecHit TBDataFormats/EcalTBObjects DataFormats/EgammaReco DataFormats/Math DataFormats/L1GlobalTrigger FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry RecoEcal/EgammaCoreTools RecoLocalCalo/EcalRecAlgos CondFormats/DataRecord CondFormats/EcalObjects rootphysics,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMEcalEndcapMonitorTasks_EX_LIB   := DQMEcalEndcapMonitorTasks
ALL_EXTERNAL_PRODS += DQMEcalEndcapMonitorTasks
endif
ifeq ($(strip $(DataFormats/SiStripDetId)),)
DataFormatsSiStripDetId := self/DataFormats/SiStripDetId
DataFormats/SiStripDetId := DataFormatsSiStripDetId
DataFormatsSiStripDetId_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsSiStripDetId_EX_USE := $(foreach d, self  rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsSiStripDetId_LCGDICTS  := x 
DataFormatsSiStripDetId_EX_LIB   := DataFormatsSiStripDetId
ALL_EXTERNAL_PRODS += DataFormatsSiStripDetId
endif
ifeq ($(strip $(DataFormats/TrackReco)),)
DataFormatsTrackReco := self/DataFormats/TrackReco
DataFormats/TrackReco := DataFormatsTrackReco
DataFormatsTrackReco_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsTrackReco_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/MuonDetId DataFormats/BeamSpot DataFormats/SiPixelDetId DataFormats/SiStripDetId DataFormats/TrackingRecHit FWCore/Utilities clhepheader rootrflx rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsTrackReco_LCGDICTS  := x 
DataFormatsTrackReco_EX_LIB   := DataFormatsTrackReco
ALL_EXTERNAL_PRODS += DataFormatsTrackReco
endif
ifeq ($(strip $(DataFormats/HcalRecHit)),)
DataFormatsHcalRecHit := self/DataFormats/HcalRecHit
DataFormats/HcalRecHit := DataFormatsHcalRecHit
DataFormatsHcalRecHit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsHcalRecHit_EX_USE := $(foreach d, self  DataFormats/CaloRecHit DataFormats/Common DataFormats/HcalDetId rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsHcalRecHit_LCGDICTS  := x 
DataFormatsHcalRecHit_EX_LIB   := DataFormatsHcalRecHit
ALL_EXTERNAL_PRODS += DataFormatsHcalRecHit
endif
ifeq ($(strip $(L1Trigger/CSCTrackFinder)),)
L1TriggerCSCTrackFinder := self/L1Trigger/CSCTrackFinder
L1Trigger/CSCTrackFinder := L1TriggerCSCTrackFinder
L1TriggerCSCTrackFinder_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerCSCTrackFinder_EX_USE := $(foreach d, self  L1Trigger/CSCCommonTrigger L1Trigger/DTUtilities L1Trigger/DTTrackFinder Geometry/CSCGeometry Geometry/Records DataFormats/MuonDetId DataFormats/CSCDigi DataFormats/L1CSCTrackFinder DataFormats/L1DTTrackFinder DataFormats/L1GlobalMuonTrigger boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerCSCTrackFinder_EX_LIB   := L1TriggerCSCTrackFinder
ALL_EXTERNAL_PRODS += L1TriggerCSCTrackFinder
endif
ifeq ($(strip $(CondFormats/SiPixelObjects)),)
CondFormatsSiPixelObjects := self/CondFormats/SiPixelObjects
CondFormats/SiPixelObjects := CondFormatsSiPixelObjects
CondFormatsSiPixelObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsSiPixelObjects_EX_USE := $(foreach d, self  DataFormats/DetId DataFormats/SiPixelDetId CalibFormats/SiPixelObjects FWCore/Utilities DataFormats/FEDRawData DataFormats/SiPixelDigi CondFormats/DataRecord CondFormats/SiStripObjects root Geometry/TrackerGeometryBuilder boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsSiPixelObjects_LCGDICTS  := x 
CondFormatsSiPixelObjects_EX_LIB   := CondFormatsSiPixelObjects
ALL_EXTERNAL_PRODS += CondFormatsSiPixelObjects
endif
ifeq ($(strip $(RecoMuon/L3TrackFinder)),)
RecoMuonL3TrackFinder := self/RecoMuon/L3TrackFinder
RecoMuon/L3TrackFinder := RecoMuonL3TrackFinder
RecoMuonL3TrackFinder_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoMuonL3TrackFinder_EX_USE := $(foreach d, self  DataFormats/DetId DataFormats/GeometryCommonDetAlgo DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/SiStripDetId DataFormats/TrackReco DataFormats/TrackerRecHit2D DataFormats/TrajectorySeed DataFormats/TrajectoryState FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry Geometry/TrackerGeometryBuilder MagneticField/Engine RecoMuon/GlobalTrackingTools RecoMuon/TrackingTools RecoTracker/CkfPattern RecoTracker/MeasurementDet RecoTracker/Record RecoTracker/TkDetLayers RecoTracker/TkTrackingRegions TrackingTools/DetLayers TrackingTools/GeomPropagators TrackingTools/KalmanUpdators TrackingTools/MeasurementDet TrackingTools/PatternTools TrackingTools/TrackFitters TrackingTools/TrajectoryCleaning TrackingTools/TrajectoryFiltering TrackingTools/TrajectoryState TrackingTools/TransientTrackingRecHit,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoMuonL3TrackFinder_EX_LIB   := RecoMuonL3TrackFinder
ALL_EXTERNAL_PRODS += RecoMuonL3TrackFinder
endif
ifeq ($(strip $(RecoParticleFlow/PFClusterProducer)),)
RecoParticleFlowPFClusterProducer := self/RecoParticleFlow/PFClusterProducer
RecoParticleFlow/PFClusterProducer := RecoParticleFlowPFClusterProducer
RecoParticleFlowPFClusterProducer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoParticleFlowPFClusterProducer_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/ParticleFlowReco DataFormats/HcalDetId rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoParticleFlowPFClusterProducer_EX_LIB   := RecoParticleFlowPFClusterProducer
ALL_EXTERNAL_PRODS += RecoParticleFlowPFClusterProducer
endif
ifeq ($(strip $(RecoHI/HiJetAlgos)),)
RecoHIHiJetAlgos := self/RecoHI/HiJetAlgos
RecoHI/HiJetAlgos := RecoHIHiJetAlgos
RecoHIHiJetAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoHIHiJetAlgos_EX_USE := $(foreach d, self  cgal boost f77compiler FWCore/Framework RecoJets/JetProducers DataFormats/HeavyIonEvent,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoHIHiJetAlgos_EX_LIB   := RecoHIHiJetAlgos
ALL_EXTERNAL_PRODS += RecoHIHiJetAlgos
endif
ifeq ($(strip $(DataFormats/BTauReco)),)
DataFormatsBTauReco := self/DataFormats/BTauReco
DataFormats/BTauReco := DataFormatsBTauReco
DataFormatsBTauReco_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsBTauReco_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/JetReco DataFormats/Math DataFormats/ParticleFlowCandidate DataFormats/TrackReco DataFormats/VertexReco FWCore/Utilities boost clhep rootmath rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsBTauReco_LCGDICTS  := x 
DataFormatsBTauReco_EX_LIB   := DataFormatsBTauReco
ALL_EXTERNAL_PRODS += DataFormatsBTauReco
endif
ifeq ($(strip $(RecoVertex/VertexPrimitives)),)
RecoVertexVertexPrimitives := self/RecoVertex/VertexPrimitives
RecoVertex/VertexPrimitives := RecoVertexVertexPrimitives
RecoVertexVertexPrimitives_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoVertexVertexPrimitives_EX_USE := $(foreach d, self  DataFormats/BeamSpot DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/VertexReco,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoVertexVertexPrimitives_EX_LIB   := RecoVertexVertexPrimitives
ALL_EXTERNAL_PRODS += RecoVertexVertexPrimitives
endif
ifeq ($(strip $(DataFormats/SiPixelDetId)),)
DataFormatsSiPixelDetId := self/DataFormats/SiPixelDetId
DataFormats/SiPixelDetId := DataFormatsSiPixelDetId
DataFormatsSiPixelDetId_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsSiPixelDetId_EX_USE := $(foreach d, self  FWCore/MessageLogger rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsSiPixelDetId_LCGDICTS  := x 
DataFormatsSiPixelDetId_EX_LIB   := DataFormatsSiPixelDetId
ALL_EXTERNAL_PRODS += DataFormatsSiPixelDetId
endif
ifeq ($(strip $(QCDAnalysis/Skimming)),)
QCDAnalysisSkimming := self/QCDAnalysis/Skimming
QCDAnalysis/Skimming := QCDAnalysisSkimming
QCDAnalysisSkimming_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
QCDAnalysisSkimming_EX_USE := $(foreach d, self  DataFormats/Common FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities Geometry/Records SimDataFormats/GeneratorProducts DataFormats/EgammaCandidates DataFormats/TrackReco DataFormats/JetReco clhep root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
QCDAnalysisSkimming_EX_LIB   := QCDAnalysisSkimming
ALL_EXTERNAL_PRODS += QCDAnalysisSkimming
endif
ifeq ($(strip $(RecoTracker/RoadMapRecord)),)
RecoTrackerRoadMapRecord := self/RecoTracker/RoadMapRecord
RecoTracker/RoadMapRecord := RecoTrackerRoadMapRecord
RecoTrackerRoadMapRecord_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerRoadMapRecord_EX_USE := $(foreach d, self  FWCore/Framework FWCore/MessageLogger RecoTracker/RingRecord TrackingTools/RoadSearchHitAccess,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerRoadMapRecord_EX_LIB   := RecoTrackerRoadMapRecord
ALL_EXTERNAL_PRODS += RecoTrackerRoadMapRecord
endif
ifeq ($(strip $(SimTracker/Records)),)
SimTrackerRecords := self/SimTracker/Records
SimTracker/Records := SimTrackerRecords
SimTrackerRecords_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimTrackerRecords_EX_USE := $(foreach d, self  boost root clhep FWCore/Framework FWCore/Utilities MagneticField/Records TrackingTools/Records Geometry/Records,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimTrackerRecords_EX_LIB   := SimTrackerRecords
ALL_EXTERNAL_PRODS += SimTrackerRecords
endif
ifeq ($(strip $(OnlineDB/SiStripESSources)),)
OnlineDBSiStripESSources := self/OnlineDB/SiStripESSources
OnlineDB/SiStripESSources := OnlineDBSiStripESSources
OnlineDBSiStripESSources_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
OnlineDBSiStripESSources_EX_USE := $(foreach d, self  CalibTracker/Records CalibTracker/SiStripESProducers CalibFormats/SiStripObjects CondFormats/SiStripObjects DataFormats/SiStripCommon FWCore/Framework FWCore/MessageLogger FWCore/PluginManager OnlineDB/SiStripConfigDb tkonlineswdb boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
OnlineDBSiStripESSources_EX_LIB   := OnlineDBSiStripESSources
ALL_EXTERNAL_PRODS += OnlineDBSiStripESSources
endif
ifeq ($(strip $(MagneticField/Layers)),)
MagneticFieldLayers := self/MagneticField/Layers
MagneticField/Layers := MagneticFieldLayers
MagneticFieldLayers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
MagneticFieldLayers_EX_USE := $(foreach d, self  boost DataFormats/GeometrySurface MagneticField/VolumeGeometry,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
MagneticFieldLayers_EX_LIB   := MagneticFieldLayers
ALL_EXTERNAL_PRODS += MagneticFieldLayers
endif
ifeq ($(strip $(DataFormats/HLTReco)),)
DataFormatsHLTReco := self/DataFormats/HLTReco
DataFormats/HLTReco := DataFormatsHLTReco
DataFormatsHLTReco_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsHLTReco_EX_USE := $(foreach d, self  FWCore/Utilities DataFormats/Common DataFormats/CLHEP boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsHLTReco_LCGDICTS  := x 
DataFormatsHLTReco_EX_LIB   := DataFormatsHLTReco
ALL_EXTERNAL_PRODS += DataFormatsHLTReco
endif
ifeq ($(strip $(DataFormats/ParticleFlowReco)),)
DataFormatsParticleFlowReco := self/DataFormats/ParticleFlowReco
DataFormats/ParticleFlowReco := DataFormatsParticleFlowReco
DataFormatsParticleFlowReco_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsParticleFlowReco_EX_USE := $(foreach d, self  DataFormats/CaloRecHit DataFormats/Common DataFormats/TrackReco DataFormats/VertexReco DataFormats/Candidate FWCore/Utilities boost rootcore rootmath rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsParticleFlowReco_LCGDICTS  := x 
DataFormatsParticleFlowReco_EX_LIB   := DataFormatsParticleFlowReco
ALL_EXTERNAL_PRODS += DataFormatsParticleFlowReco
endif
ifeq ($(strip $(SimMuon/CSCDigitizer)),)
SimMuonCSCDigitizer := self/SimMuon/CSCDigitizer
SimMuon/CSCDigitizer := SimMuonCSCDigitizer
SimMuonCSCDigitizer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimMuonCSCDigitizer_EX_USE := $(foreach d, self  CalibMuon/CSCCalibration CondFormats/CSCObjects DataFormats/CSCDigi DataFormats/GeometryVector DataFormats/MuonDetId FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities FWCore/PluginManager Geometry/CSCGeometry Geometry/Records MagneticField/Engine MagneticField/Records SimDataFormats/GeneratorProducts SimDataFormats/TrackingHit SimGeneral/HepPDTRecord SimMuon/Neutron Utilities/General boost clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimMuonCSCDigitizer_EX_LIB   := SimMuonCSCDigitizer
ALL_EXTERNAL_PRODS += SimMuonCSCDigitizer
endif
ifeq ($(strip $(TrackingTools/TrackFitters)),)
TrackingToolsTrackFitters := self/TrackingTools/TrackFitters
TrackingTools/TrackFitters := TrackingToolsTrackFitters
TrackingToolsTrackFitters_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsTrackFitters_EX_USE := $(foreach d, self  boost clhep TrackingTools/PatternTools TrackingTools/TransientTrackingRecHit TrackingTools/RecoGeometry TrackingTools/GeomPropagators FWCore/MessageLogger FWCore/Utilities FWCore/Framework TrackingTools/Records DataFormats/DetId DataFormats/SiStripDetId,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsTrackFitters_EX_LIB   := TrackingToolsTrackFitters
ALL_EXTERNAL_PRODS += TrackingToolsTrackFitters
endif
ifeq ($(strip $(DQMServices/Components)),)
DQMServicesComponents := self/DQMServices/Components
DQMServices/Components := DQMServicesComponents
DQMServicesComponents_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMServicesComponents_EX_USE := $(foreach d, self  CondFormats/DataRecord CondFormats/RunInfo DataFormats/Scalers DataFormats/L1GlobalTrigger DQMServices/ClientConfig DQMServices/Core FWCore/Catalog FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Version HLTrigger/HLTcore roothistmatrix,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMServicesComponents_EX_LIB   := DQMServicesComponents
ALL_EXTERNAL_PRODS += DQMServicesComponents
endif
ifeq ($(strip $(EventFilter/CSCTFRawToDigi)),)
EventFilterCSCTFRawToDigi := self/EventFilter/CSCTFRawToDigi
EventFilter/CSCTFRawToDigi := EventFilterCSCTFRawToDigi
EventFilterCSCTFRawToDigi_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterCSCTFRawToDigi_EX_USE := $(foreach d, self  DataFormats/CSCDigi FWCore/Framework DataFormats/FEDRawData DataFormats/MuonDetId DataFormats/L1CSCTrackFinder CondFormats/CSCObjects FWCore/MessageLogger Utilities/Timing,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterCSCTFRawToDigi_EX_LIB   := EventFilterCSCTFRawToDigi
ALL_EXTERNAL_PRODS += EventFilterCSCTFRawToDigi
endif
ifeq ($(strip $(Fireworks/Core)),)
FireworksCore := self/Fireworks/Core
Fireworks/Core := FireworksCore
FireworksCore_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FireworksCore_EX_USE := $(foreach d, self  CommonTools/Utils DataFormats/Candidate DataFormats/Common DataFormats/DetId DataFormats/EcalDetId DataFormats/EcalRecHit DataFormats/FWLite DataFormats/L1GlobalTrigger DataFormats/Math DataFormats/MuonDetId DataFormats/Scalers FWCore/Common FWCore/FWLite FWCore/PluginManager FWCore/Utilities Fireworks/TableWidget boost_program_options boost_regex boost_system opengl rootcintex rootinteractive rootrflx rootgraphics sigcpp,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FireworksCore_LCGDICTS  := x 
FireworksCore_ROOTDICT  := LinkDef
FireworksCore_EX_LIB   := FireworksCore
ALL_EXTERNAL_PRODS += FireworksCore
endif
ifeq ($(strip $(SimTracker/SiStripDigitizer)),)
SimTrackerSiStripDigitizer := self/SimTracker/SiStripDigitizer
SimTracker/SiStripDigitizer := SimTrackerSiStripDigitizer
SimTrackerSiStripDigitizer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimTrackerSiStripDigitizer_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet SimDataFormats/TrackingHit SimDataFormats/TrackerDigiSimLink SimDataFormats/CrossingFrame DataFormats/Common DataFormats/SiStripDigi CalibFormats/SiStripObjects CalibTracker/Records Geometry/TrackerGeometryBuilder SimGeneral/NoiseGenerators SimGeneral/HepPDTRecord SimTracker/Common RecoLocalTracker/SiStripZeroSuppression gsl boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimTrackerSiStripDigitizer_EX_LIB   := SimTrackerSiStripDigitizer
ALL_EXTERNAL_PRODS += SimTrackerSiStripDigitizer
endif
ifeq ($(strip $(SimDataFormats/SimHitMaker)),)
SimDataFormatsSimHitMaker := self/SimDataFormats/SimHitMaker
SimDataFormats/SimHitMaker := SimDataFormatsSimHitMaker
SimDataFormatsSimHitMaker_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsSimHitMaker_EX_USE := $(foreach d, self  FWCore/MessageLogger SimDataFormats/CaloHit SimDataFormats/TrackingHit,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsSimHitMaker_EX_LIB   := SimDataFormatsSimHitMaker
ALL_EXTERNAL_PRODS += SimDataFormatsSimHitMaker
endif
ifeq ($(strip $(Alignment/CommonAlignmentMonitor)),)
AlignmentCommonAlignmentMonitor := self/Alignment/CommonAlignmentMonitor
Alignment/CommonAlignmentMonitor := AlignmentCommonAlignmentMonitor
AlignmentCommonAlignmentMonitor_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentCommonAlignmentMonitor_EX_USE := $(foreach d, self  FWCore/ParameterSet FWCore/PluginManager FWCore/MessageLogger Alignment/CommonAlignment roothistmatrix CommonTools/Utils CommonTools/UtilAlgos,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentCommonAlignmentMonitor_EX_LIB   := AlignmentCommonAlignmentMonitor
ALL_EXTERNAL_PRODS += AlignmentCommonAlignmentMonitor
endif
ifeq ($(strip $(GeneratorInterface/TauolaInterface)),)
GeneratorInterfaceTauolaInterface := self/GeneratorInterface/TauolaInterface
GeneratorInterface/TauolaInterface := GeneratorInterfaceTauolaInterface
GeneratorInterfaceTauolaInterface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfaceTauolaInterface_EX_USE := $(foreach d, self  FWCore/ParameterSet FWCore/Framework FWCore/PluginManager hepmc clhep heppdt,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeneratorInterfaceTauolaInterface_EX_LIB   := GeneratorInterfaceTauolaInterface
ALL_EXTERNAL_PRODS += GeneratorInterfaceTauolaInterface
endif
ifeq ($(strip $(CondCore/Utilities)),)
CondCoreUtilities := self/CondCore/Utilities
CondCore/Utilities := CondCoreUtilities
CondCoreUtilities_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondCoreUtilities_EX_USE := $(foreach d, self  FWCore/Utilities FWCore/PluginManager FWCore/MessageLogger FWCore/Framework boost boost_program_options CondCore/ORA CondCore/DBCommon CondCore/IOVService CondCore/MetaDataService CondCore/TagCollection rootcintex,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondCoreUtilities_LCGDICTS  := x 
CondCoreUtilities_EX_LIB   := CondCoreUtilities
ALL_EXTERNAL_PRODS += CondCoreUtilities
endif
ifeq ($(strip $(TrackingTools/GeomPropagators)),)
TrackingToolsGeomPropagators := self/TrackingTools/GeomPropagators
TrackingTools/GeomPropagators := TrackingToolsGeomPropagators
TrackingToolsGeomPropagators_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsGeomPropagators_EX_USE := $(foreach d, self  FWCore/MessageLogger FWCore/Utilities DataFormats/GeometrySurface TrackingTools/AnalyticalJacobians TrackingTools/TrajectoryState,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsGeomPropagators_EX_LIB   := TrackingToolsGeomPropagators
ALL_EXTERNAL_PRODS += TrackingToolsGeomPropagators
endif
ifeq ($(strip $(RecoTracker/CkfPattern)),)
RecoTrackerCkfPattern := self/RecoTracker/CkfPattern
RecoTracker/CkfPattern := RecoTrackerCkfPattern
RecoTrackerCkfPattern_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerCkfPattern_EX_USE := $(foreach d, self  RecoTracker/TkDetLayers FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/MessageLogger DataFormats/Common DataFormats/TrajectorySeed Geometry/TrackerGeometryBuilder TrackingTools/KalmanUpdators MagneticField/Records MagneticField/Engine TrackingTools/MeasurementDet RecoTracker/TkNavigation RecoTracker/MeasurementDet TrackingTools/PatternTools TrackingTools/MaterialEffects TrackingTools/TrajectoryCleaning TrackingTools/TrajectoryFiltering TrackingTools/TrackFitters boost root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerCkfPattern_EX_LIB   := RecoTrackerCkfPattern
ALL_EXTERNAL_PRODS += RecoTrackerCkfPattern
endif
ifeq ($(strip $(DQMServices/ClientConfig)),)
DQMServicesClientConfig := self/DQMServices/ClientConfig
DQMServices/ClientConfig := DQMServicesClientConfig
DQMServicesClientConfig_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMServicesClientConfig_EX_USE := $(foreach d, self  DQMServices/Core xerces-c,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMServicesClientConfig_EX_LIB   := DQMServicesClientConfig
ALL_EXTERNAL_PRODS += DQMServicesClientConfig
endif
ifeq ($(strip $(HeavyFlavorAnalysis/Skimming)),)
HeavyFlavorAnalysisSkimming := self/HeavyFlavorAnalysis/Skimming
HeavyFlavorAnalysis/Skimming := HeavyFlavorAnalysisSkimming
HeavyFlavorAnalysisSkimming_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
HeavyFlavorAnalysisSkimming_EX_USE := $(foreach d, self  FWCore/MessageLogger FWCore/Framework FWCore/ParameterSet DataFormats/TrackReco DataFormats/MuonReco,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
HeavyFlavorAnalysisSkimming_EX_LIB   := HeavyFlavorAnalysisSkimming
ALL_EXTERNAL_PRODS += HeavyFlavorAnalysisSkimming
endif
ifeq ($(strip $(RecoHI/HiTracking)),)
RecoHIHiTracking := self/RecoHI/HiTracking
RecoHI/HiTracking := RecoHIHiTracking
RecoHIHiTracking_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoHIHiTracking_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities Geometry/Records Geometry/TrackerGeometryBuilder TrackingTools/PatternTools RecoPixelVertexing/PixelTriplets RecoPixelVertexing/PixelTrackFitting RecoPixelVertexing/PixelLowPtUtilities SimDataFormats/GeneratorProducts RecoVertex/VertexTools TrackingTools/TrajectoryCleaning TrackingTools/TrajectoryFiltering TrackingTools/Records RecoLocalTracker/Records MagneticField/Records DataFormats/ParticleFlowCandidate,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoHIHiTracking_EX_LIB   := RecoHIHiTracking
ALL_EXTERNAL_PRODS += RecoHIHiTracking
endif
ifeq ($(strip $(RecoTracker/TkTrackingRegions)),)
RecoTrackerTkTrackingRegions := self/RecoTracker/TkTrackingRegions
RecoTracker/TkTrackingRegions := RecoTrackerTkTrackingRegions
RecoTrackerTkTrackingRegions_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerTkTrackingRegions_EX_USE := $(foreach d, self  clhep boost FWCore/Framework FWCore/PluginManager FWCore/ParameterSet Geometry/TrackerGeometryBuilder RecoTracker/Record RecoTracker/TkSeedingLayers RecoTracker/TkMSParametrization RecoTracker/MeasurementDet TrackingTools/PatternTools TrackingTools/TransientTrackingRecHit TrackingTools/MeasurementDet TrackingTools/KalmanUpdators,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerTkTrackingRegions_EX_LIB   := RecoTrackerTkTrackingRegions
ALL_EXTERNAL_PRODS += RecoTrackerTkTrackingRegions
endif
ifeq ($(strip $(DataFormats/Luminosity)),)
DataFormatsLuminosity := self/DataFormats/Luminosity
DataFormats/Luminosity := DataFormatsLuminosity
DataFormatsLuminosity_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsLuminosity_EX_USE := $(foreach d, self  rootrflx DataFormats/Common FWCore/Utilities,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsLuminosity_LCGDICTS  := x 
DataFormatsLuminosity_EX_LIB   := DataFormatsLuminosity
ALL_EXTERNAL_PRODS += DataFormatsLuminosity
endif
ifeq ($(strip $(CalibCalorimetry/HcalTPGAlgos)),)
CalibCalorimetryHcalTPGAlgos := self/CalibCalorimetry/HcalTPGAlgos
CalibCalorimetry/HcalTPGAlgos := CalibCalorimetryHcalTPGAlgos
CalibCalorimetryHcalTPGAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibCalorimetryHcalTPGAlgos_EX_USE := $(foreach d, self  DataFormats/HcalDigi CalibFormats/HcalObjects Geometry/HcalTowerAlgo CalibCalorimetry/HcalAlgos DataFormats/DetId DataFormats/HcalDetId CondFormats/HcalObjects CalibFormats/CaloObjects CondFormats/DataRecord xerces-c,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibCalorimetryHcalTPGAlgos_EX_LIB   := CalibCalorimetryHcalTPGAlgos
ALL_EXTERNAL_PRODS += CalibCalorimetryHcalTPGAlgos
endif
ifeq ($(strip $(DQM/SiStripMonitorSummary)),)
DQMSiStripMonitorSummary := self/DQM/SiStripMonitorSummary
DQM/SiStripMonitorSummary := DQMSiStripMonitorSummary
DQMSiStripMonitorSummary_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMSiStripMonitorSummary_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/PluginManager DataFormats/Common DataFormats/FEDRawData DataFormats/SiStripDetId DataFormats/SiStripDigi CondFormats/DataRecord CondFormats/SiStripObjects DQM/SiStripCommon DQMServices/Core CalibFormats/SiStripObjects CalibTracker/Records CalibTracker/SiStripAPVAnalysis CondCore/DBOutputService CommonTools/TrackerMap,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMSiStripMonitorSummary_EX_LIB   := DQMSiStripMonitorSummary
ALL_EXTERNAL_PRODS += DQMSiStripMonitorSummary
endif
ifeq ($(strip $(SimDataFormats/TrackerDigiSimLink)),)
SimDataFormatsTrackerDigiSimLink := self/SimDataFormats/TrackerDigiSimLink
SimDataFormats/TrackerDigiSimLink := SimDataFormatsTrackerDigiSimLink
SimDataFormatsTrackerDigiSimLink_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsTrackerDigiSimLink_EX_USE := $(foreach d, self  DataFormats/Common SimDataFormats/EncodedEventId boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsTrackerDigiSimLink_LCGDICTS  := x 
SimDataFormatsTrackerDigiSimLink_EX_LIB   := SimDataFormatsTrackerDigiSimLink
ALL_EXTERNAL_PRODS += SimDataFormatsTrackerDigiSimLink
endif
ifeq ($(strip $(TrackingTools/DetLayers)),)
TrackingToolsDetLayers := self/TrackingTools/DetLayers
TrackingTools/DetLayers := TrackingToolsDetLayers
TrackingToolsDetLayers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsDetLayers_EX_USE := $(foreach d, self  FWCore/Utilities FWCore/MessageLogger DataFormats/GeometrySurface TrackingTools/TrajectoryState TrackingTools/TrajectoryParametrization boost clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsDetLayers_EX_LIB   := TrackingToolsDetLayers
ALL_EXTERNAL_PRODS += TrackingToolsDetLayers
endif
ifeq ($(strip $(CondTools/RPC)),)
CondToolsRPC := self/CondTools/RPC
CondTools/RPC := CondToolsRPC
CondToolsRPC_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondToolsRPC_EX_USE := $(foreach d, self  CondFormats/RPCObjects CondFormats/L1TObjects CondFormats/DataRecord CondCore/PopCon CondCore/IOVService CondCore/DBOutputService CondCore/DBCommon CondCore/MetaDataService L1Trigger/RPCTrigger FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/ServiceRegistry boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondToolsRPC_EX_LIB   := CondToolsRPC
ALL_EXTERNAL_PRODS += CondToolsRPC
endif
ifeq ($(strip $(DataFormats/ParticleFlowCandidate)),)
DataFormatsParticleFlowCandidate := self/DataFormats/ParticleFlowCandidate
DataFormats/ParticleFlowCandidate := DataFormatsParticleFlowCandidate
DataFormatsParticleFlowCandidate_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsParticleFlowCandidate_EX_USE := $(foreach d, self  DataFormats/Candidate DataFormats/Common DataFormats/Math DataFormats/TrackReco DataFormats/GsfTrackReco DataFormats/DTRecHit DataFormats/CSCRecHit FWCore/Utilities rootcore rootmath rootrflx clhepheader,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsParticleFlowCandidate_LCGDICTS  := x 
DataFormatsParticleFlowCandidate_EX_LIB   := DataFormatsParticleFlowCandidate
ALL_EXTERNAL_PRODS += DataFormatsParticleFlowCandidate
endif
ifeq ($(strip $(RecoVertex/GhostTrackFitter)),)
RecoVertexGhostTrackFitter := self/RecoVertex/GhostTrackFitter
RecoVertex/GhostTrackFitter := RecoVertexGhostTrackFitter
RecoVertexGhostTrackFitter_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoVertexGhostTrackFitter_EX_USE := $(foreach d, self  FWCore/ParameterSet FWCore/Utilities DataFormats/Math DataFormats/GeometryVector DataFormats/GeometrySurface DataFormats/GeometryCommonDetAlgo DataFormats/TrackReco TrackingTools/TransientTrack TrackingTools/TrajectoryState TrackingTools/GeomPropagators RecoVertex/VertexTools RecoVertex/VertexPrimitives RecoVertex/KalmanVertexFit RecoVertex/AdaptiveVertexFit rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoVertexGhostTrackFitter_EX_LIB   := RecoVertexGhostTrackFitter
ALL_EXTERNAL_PRODS += RecoVertexGhostTrackFitter
endif
ifeq ($(strip $(SimCalorimetry/HcalSimProducers)),)
SimCalorimetryHcalSimProducers := self/SimCalorimetry/HcalSimProducers
SimCalorimetry/HcalSimProducers := SimCalorimetryHcalSimProducers
SimCalorimetryHcalSimProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimCalorimetryHcalSimProducers_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet SimCalorimetry/HcalSimAlgos SimDataFormats/CrossingFrame,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimCalorimetryHcalSimProducers_EX_LIB   := SimCalorimetryHcalSimProducers
ALL_EXTERNAL_PRODS += SimCalorimetryHcalSimProducers
endif
ifeq ($(strip $(OnlineDB/EcalCondDB)),)
OnlineDBEcalCondDB := self/OnlineDB/EcalCondDB
OnlineDB/EcalCondDB := OnlineDBEcalCondDB
OnlineDBEcalCondDB_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
OnlineDBEcalCondDB_EX_USE := $(foreach d, self  OnlineDB/Oracle DataFormats/EcalDetId,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
OnlineDBEcalCondDB_EX_LIB   := OnlineDBEcalCondDB
ALL_EXTERNAL_PRODS += OnlineDBEcalCondDB
endif
ifeq ($(strip $(FWCore/MessageLogger)),)
FWCoreMessageLogger := self/FWCore/MessageLogger
FWCore/MessageLogger := FWCoreMessageLogger
FWCoreMessageLogger_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCoreMessageLogger_EX_USE := $(foreach d, self  FWCore/Utilities boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCoreMessageLogger_LCGDICTS  := x 
FWCoreMessageLogger_EX_LIB   := FWCoreMessageLogger
ALL_EXTERNAL_PRODS += FWCoreMessageLogger
endif
ifeq ($(strip $(PhysicsTools/JetMCUtils)),)
PhysicsToolsJetMCUtils := self/PhysicsTools/JetMCUtils
PhysicsTools/JetMCUtils := PhysicsToolsJetMCUtils
PhysicsToolsJetMCUtils_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsJetMCUtils_EX_USE := $(foreach d, self  DataFormats/Candidate DataFormats/Common rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsJetMCUtils_EX_LIB   := PhysicsToolsJetMCUtils
ALL_EXTERNAL_PRODS += PhysicsToolsJetMCUtils
endif
ifeq ($(strip $(L1Trigger/GlobalCaloTrigger)),)
L1TriggerGlobalCaloTrigger := self/L1Trigger/GlobalCaloTrigger
L1Trigger/GlobalCaloTrigger := L1TriggerGlobalCaloTrigger
L1TriggerGlobalCaloTrigger_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerGlobalCaloTrigger_EX_USE := $(foreach d, self  boost DataFormats/L1GlobalCaloTrigger CondFormats/L1TObjects CondFormats/DataRecord,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerGlobalCaloTrigger_EX_LIB   := L1TriggerGlobalCaloTrigger
ALL_EXTERNAL_PRODS += L1TriggerGlobalCaloTrigger
endif
ifeq ($(strip $(Alignment/TwoBodyDecay)),)
AlignmentTwoBodyDecay := self/Alignment/TwoBodyDecay
Alignment/TwoBodyDecay := AlignmentTwoBodyDecay
AlignmentTwoBodyDecay_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentTwoBodyDecay_EX_USE := $(foreach d, self  rootmath boost FWCore/Framework FWCore/Utilities FWCore/ParameterSet RecoVertex/VertexTools RecoVertex/LinearizationPointFinders TrackingTools/TransientTrack,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentTwoBodyDecay_EX_LIB   := AlignmentTwoBodyDecay
ALL_EXTERNAL_PRODS += AlignmentTwoBodyDecay
endif
ifeq ($(strip $(CommonTools/CandUtils)),)
CommonToolsCandUtils := self/CommonTools/CandUtils
CommonTools/CandUtils := CommonToolsCandUtils
CommonToolsCandUtils_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CommonToolsCandUtils_EX_USE := $(foreach d, self  DataFormats/Candidate,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CommonToolsCandUtils_EX_LIB   := CommonToolsCandUtils
ALL_EXTERNAL_PRODS += CommonToolsCandUtils
endif
ifeq ($(strip $(RecoBTag/ImpactParameter)),)
src_RecoBTag_ImpactParameter := self/RecoBTag/ImpactParameter
RecoBTag/ImpactParameter  := src_RecoBTag_ImpactParameter
src_RecoBTag_ImpactParameter_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_RecoBTag_ImpactParameter_EX_USE := $(foreach d, DataFormats/BTauReco self,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_RecoBTag_ImpactParameter
endif

ifeq ($(strip $(Alignment/TrackerAlignment)),)
AlignmentTrackerAlignment := self/Alignment/TrackerAlignment
Alignment/TrackerAlignment := AlignmentTrackerAlignment
AlignmentTrackerAlignment_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentTrackerAlignment_EX_USE := $(foreach d, self  Alignment/CommonAlignment CondCore/DBOutputService DataFormats/GeometrySurface DataFormats/SiPixelDetId DataFormats/SiStripDetId DataFormats/TrackingRecHit FWCore/Framework FWCore/MessageLogger FWCore/ServiceRegistry FWCore/Utilities Geometry/CommonDetUnit Geometry/Records Geometry/TrackerGeometryBuilder,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentTrackerAlignment_EX_LIB   := AlignmentTrackerAlignment
ALL_EXTERNAL_PRODS += AlignmentTrackerAlignment
endif
ifeq ($(strip $(EventFilter/HcalRawToDigi)),)
EventFilterHcalRawToDigi := self/EventFilter/HcalRawToDigi
EventFilter/HcalRawToDigi := EventFilterHcalRawToDigi
EventFilterHcalRawToDigi_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterHcalRawToDigi_EX_USE := $(foreach d, self  DataFormats/HcalDetId DataFormats/HcalDigi DataFormats/FEDRawData FWCore/MessageLogger CondFormats/HcalObjects FWCore/Utilities boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterHcalRawToDigi_EX_LIB   := EventFilterHcalRawToDigi
ALL_EXTERNAL_PRODS += EventFilterHcalRawToDigi
endif
ifeq ($(strip $(Alignment/CommonAlignmentAlgorithm)),)
AlignmentCommonAlignmentAlgorithm := self/Alignment/CommonAlignmentAlgorithm
Alignment/CommonAlignmentAlgorithm := AlignmentCommonAlignmentAlgorithm
AlignmentCommonAlignmentAlgorithm_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentCommonAlignmentAlgorithm_EX_USE := $(foreach d, self  Alignment/CommonAlignment Alignment/CommonAlignmentParametrization Alignment/MuonAlignment Alignment/TrackerAlignment DataFormats/CLHEP DataFormats/TrackingRecHit CondFormats/Alignment DataFormats/SiStripDetId FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentCommonAlignmentAlgorithm_EX_LIB   := AlignmentCommonAlignmentAlgorithm
ALL_EXTERNAL_PRODS += AlignmentCommonAlignmentAlgorithm
endif
ifeq ($(strip $(RecoTracker/TkHitPairs)),)
RecoTrackerTkHitPairs := self/RecoTracker/TkHitPairs
RecoTracker/TkHitPairs := RecoTrackerTkHitPairs
RecoTrackerTkHitPairs_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerTkHitPairs_EX_USE := $(foreach d, self  clhep boost RecoTracker/Record RecoTracker/TkDetLayers FWCore/ParameterSet TrackingTools/DetLayers DataFormats/TrackerRecHit2D FWCore/Framework DataFormats/SiStripDetId TrackingTools/TransientTrackingRecHit RecoTracker/TkMSParametrization RecoTracker/TkSeedingLayers,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerTkHitPairs_EX_LIB   := RecoTrackerTkHitPairs
ALL_EXTERNAL_PRODS += RecoTrackerTkHitPairs
endif
ifeq ($(strip $(RecoVertex/AdaptiveVertexFinder)),)
RecoVertexAdaptiveVertexFinder := self/RecoVertex/AdaptiveVertexFinder
RecoVertex/AdaptiveVertexFinder := RecoVertexAdaptiveVertexFinder
RecoVertexAdaptiveVertexFinder_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoVertexAdaptiveVertexFinder_EX_USE := $(foreach d, self  RecoVertex/KalmanVertexFit RecoVertex/AdaptiveVertexFit RecoVertex/VertexPrimitives RecoVertex/VertexTools TrackingTools/IPTools,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoVertexAdaptiveVertexFinder_EX_LIB   := RecoVertexAdaptiveVertexFinder
ALL_EXTERNAL_PRODS += RecoVertexAdaptiveVertexFinder
endif
ifeq ($(strip $(EventFilter/GctRawToDigi)),)
EventFilterGctRawToDigi := self/EventFilter/GctRawToDigi
EventFilter/GctRawToDigi := EventFilterGctRawToDigi
EventFilterGctRawToDigi_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterGctRawToDigi_EX_USE := $(foreach d, self  FWCore/Framework FWCore/MessageLogger DataFormats/FEDRawData DataFormats/L1CaloTrigger DataFormats/L1GlobalCaloTrigger DataFormats/L1Trigger L1Trigger/TextToDigi CondFormats/L1TObjects CondFormats/DataRecord,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterGctRawToDigi_EX_LIB   := EventFilterGctRawToDigi
ALL_EXTERNAL_PRODS += EventFilterGctRawToDigi
endif
ifeq ($(strip $(L1Trigger/TextToDigi)),)
L1TriggerTextToDigi := self/L1Trigger/TextToDigi
L1Trigger/TextToDigi := L1TriggerTextToDigi
L1TriggerTextToDigi_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerTextToDigi_EX_USE := $(foreach d, self  ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerTextToDigi_EX_LIB   := L1TriggerTextToDigi
ALL_EXTERNAL_PRODS += L1TriggerTextToDigi
endif
ifeq ($(strip $(MagneticField/GeomBuilder)),)
MagneticFieldGeomBuilder := self/MagneticField/GeomBuilder
MagneticField/GeomBuilder := MagneticFieldGeomBuilder
MagneticFieldGeomBuilder_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
MagneticFieldGeomBuilder_EX_USE := $(foreach d, self  DataFormats/GeometrySurface DataFormats/GeometryVector DetectorDescription/Base DetectorDescription/Core FWCore/Framework FWCore/Utilities MagneticField/Engine MagneticField/Interpolation MagneticField/Layers MagneticField/VolumeGeometry Utilities/BinningTools clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
MagneticFieldGeomBuilder_EX_LIB   := MagneticFieldGeomBuilder
ALL_EXTERNAL_PRODS += MagneticFieldGeomBuilder
endif
ifeq ($(strip $(SimCalorimetry/EcalTrigPrimAlgos)),)
SimCalorimetryEcalTrigPrimAlgos := self/SimCalorimetry/EcalTrigPrimAlgos
SimCalorimetry/EcalTrigPrimAlgos := SimCalorimetryEcalTrigPrimAlgos
SimCalorimetryEcalTrigPrimAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimCalorimetryEcalTrigPrimAlgos_EX_USE := $(foreach d, self  DataFormats/EcalDigi DataFormats/EcalDetId CondFormats/L1TObjects CondFormats/EcalObjects CondFormats/DataRecord Geometry/CaloTopology Geometry/CaloGeometry Geometry/Records Geometry/EcalMapping FWCore/Framework FWCore/Utilities clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimCalorimetryEcalTrigPrimAlgos_EX_LIB   := SimCalorimetryEcalTrigPrimAlgos
ALL_EXTERNAL_PRODS += SimCalorimetryEcalTrigPrimAlgos
endif
ifeq ($(strip $(Validation/CSCRecHits)),)
ValidationCSCRecHits := self/Validation/CSCRecHits
Validation/CSCRecHits := ValidationCSCRecHits
ValidationCSCRecHits_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
ValidationCSCRecHits_EX_USE := $(foreach d, self  DataFormats/CSCRecHit DQMServices/Core FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry Geometry/CSCGeometry Geometry/Records SimMuon/MCTruth Validation/MuonCSCDigis,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ValidationCSCRecHits_EX_LIB   := ValidationCSCRecHits
ALL_EXTERNAL_PRODS += ValidationCSCRecHits
endif
ifeq ($(strip $(RecoMuon/Records)),)
RecoMuonRecords := self/RecoMuon/Records
RecoMuon/Records := RecoMuonRecords
RecoMuonRecords_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoMuonRecords_EX_USE := $(foreach d, self  FWCore/Framework Geometry/Records boost CondFormats/DataRecord,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoMuonRecords_EX_LIB   := RecoMuonRecords
ALL_EXTERNAL_PRODS += RecoMuonRecords
endif
ifeq ($(strip $(MuonAnalysis/MuonAssociators)),)
MuonAnalysisMuonAssociators := self/MuonAnalysis/MuonAssociators
MuonAnalysis/MuonAssociators := MuonAnalysisMuonAssociators
MuonAnalysisMuonAssociators_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
MuonAnalysisMuonAssociators_EX_USE := $(foreach d, self  CommonTools/Utils DataFormats/CLHEP DataFormats/Candidate DataFormats/GeometrySurface DataFormats/HepMCCandidate DataFormats/L1Trigger DataFormats/Math DataFormats/RecoCandidate DataFormats/TrackReco DataFormats/CSCRecHit DataFormats/CSCDigi DataFormats/L1CSCTrackFinder FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities Geometry/CommonDetUnit Geometry/Records L1Trigger/CSCTrackFinder MagneticField/Engine MagneticField/Records RecoMuon/DetLayers RecoMuon/Records TrackingTools/DetLayers TrackingTools/GeomPropagators TrackingTools/KalmanUpdators TrackingTools/PatternTools TrackingTools/Records TrackingTools/TrajectoryState SimDataFormats/Track SimDataFormats/Vertex,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
MuonAnalysisMuonAssociators_EX_LIB   := MuonAnalysisMuonAssociators
ALL_EXTERNAL_PRODS += MuonAnalysisMuonAssociators
endif
ifeq ($(strip $(DataFormats/CaloRecHit)),)
DataFormatsCaloRecHit := self/DataFormats/CaloRecHit
DataFormats/CaloRecHit := DataFormatsCaloRecHit
DataFormatsCaloRecHit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsCaloRecHit_EX_USE := $(foreach d, self  DataFormats/Common rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsCaloRecHit_LCGDICTS  := x 
DataFormatsCaloRecHit_EX_LIB   := DataFormatsCaloRecHit
ALL_EXTERNAL_PRODS += DataFormatsCaloRecHit
endif
ifeq ($(strip $(DQM/DTMonitorModule)),)
DQMDTMonitorModule := self/DQM/DTMonitorModule
DQM/DTMonitorModule := DQMDTMonitorModule
DQMDTMonitorModule_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMDTMonitorModule_EX_USE := $(foreach d, self  FWCore/Framework DQMServices/Core DQMServices/Components DataFormats/FEDRawData DataFormats/DTDigi DataFormats/L1DTTrackFinder DataFormats/L1GlobalMuonTrigger CondFormats/DTObjects CondFormats/DataRecord Geometry/Records Geometry/DTGeometry DataFormats/DTRecHit HLTrigger/HLTcore CalibMuon/DTDigiSync RecoMuon/MeasurementDet RecoMuon/TrackingTools boost rootgraphics,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMDTMonitorModule_EX_LIB   := DQMDTMonitorModule
ALL_EXTERNAL_PRODS += DQMDTMonitorModule
endif
ifeq ($(strip $(DataFormats/SiStripCommon)),)
DataFormatsSiStripCommon := self/DataFormats/SiStripCommon
DataFormats/SiStripCommon := DataFormatsSiStripCommon
DataFormatsSiStripCommon_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsSiStripCommon_EX_USE := $(foreach d, self  FWCore/MessageLogger DataFormats/Common boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsSiStripCommon_LCGDICTS  := x 
DataFormatsSiStripCommon_EX_LIB   := DataFormatsSiStripCommon
ALL_EXTERNAL_PRODS += DataFormatsSiStripCommon
endif
ifeq ($(strip $(DataFormats/FWLite)),)
DataFormatsFWLite := self/DataFormats/FWLite
DataFormats/FWLite := DataFormatsFWLite
DataFormatsFWLite_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsFWLite_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/Provenance FWCore/Common FWCore/FWLite FWCore/ParameterSet FWCore/Utilities rootrflx rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsFWLite_LCGDICTS  := x 
DataFormatsFWLite_EX_LIB   := DataFormatsFWLite
ALL_EXTERNAL_PRODS += DataFormatsFWLite
endif
ifeq ($(strip $(Validation/RecoTrack)),)
ValidationRecoTrack := self/Validation/RecoTrack
Validation/RecoTrack := ValidationRecoTrack
ValidationRecoTrack_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
ValidationRecoTrack_EX_USE := $(foreach d, self  DQMServices/ClientConfig DQMServices/Core SimDataFormats/TrackingAnalysis DataFormats/TrackReco root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ValidationRecoTrack_EX_LIB   := ValidationRecoTrack
ALL_EXTERNAL_PRODS += ValidationRecoTrack
endif
ifeq ($(strip $(TopQuarkAnalysis/TopKinFitter)),)
TopQuarkAnalysisTopKinFitter := self/TopQuarkAnalysis/TopKinFitter
TopQuarkAnalysis/TopKinFitter := TopQuarkAnalysisTopKinFitter
TopQuarkAnalysisTopKinFitter_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TopQuarkAnalysisTopKinFitter_EX_USE := $(foreach d, self  CommonTools/Utils FWCore/ParameterSet PhysicsTools/KinFitter AnalysisDataFormats/TopObjects,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TopQuarkAnalysisTopKinFitter_EX_LIB   := TopQuarkAnalysisTopKinFitter
ALL_EXTERNAL_PRODS += TopQuarkAnalysisTopKinFitter
endif
ifeq ($(strip $(DataFormats/TrajectorySeed)),)
DataFormatsTrajectorySeed := self/DataFormats/TrajectorySeed
DataFormats/TrajectorySeed := DataFormatsTrajectorySeed
DataFormatsTrajectorySeed_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsTrajectorySeed_EX_USE := $(foreach d, self  DataFormats/Common rootrflx clhepheader,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsTrajectorySeed_LCGDICTS  := x 
DataFormatsTrajectorySeed_EX_LIB   := DataFormatsTrajectorySeed
ALL_EXTERNAL_PRODS += DataFormatsTrajectorySeed
endif
ifeq ($(strip $(DataFormats/MuonDetId)),)
DataFormatsMuonDetId := self/DataFormats/MuonDetId
DataFormats/MuonDetId := DataFormatsMuonDetId
DataFormatsMuonDetId_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsMuonDetId_EX_USE := $(foreach d, self  FWCore/Utilities rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsMuonDetId_LCGDICTS  := x 
DataFormatsMuonDetId_EX_LIB   := DataFormatsMuonDetId
ALL_EXTERNAL_PRODS += DataFormatsMuonDetId
endif
ifeq ($(strip $(RecoJets/JetPlusTracks)),)
RecoJetsJetPlusTracks := self/RecoJets/JetPlusTracks
RecoJets/JetPlusTracks := RecoJetsJetPlusTracks
RecoJetsJetPlusTracks_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoJetsJetPlusTracks_EX_USE := $(foreach d, self  boost CondFormats/JetMETObjects DataFormats/Common DataFormats/EgammaCandidates DataFormats/JetReco DataFormats/Math DataFormats/MuonReco DataFormats/TrackReco FWCore/Framework FWCore/PluginManager FWCore/ParameterSet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoJetsJetPlusTracks_EX_LIB   := RecoJetsJetPlusTracks
ALL_EXTERNAL_PRODS += RecoJetsJetPlusTracks
endif
ifeq ($(strip $(CalibFormats/SiPixelObjects)),)
CalibFormatsSiPixelObjects := self/CalibFormats/SiPixelObjects
CalibFormats/SiPixelObjects := CalibFormatsSiPixelObjects
CalibFormatsSiPixelObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibFormatsSiPixelObjects_EX_USE := $(foreach d, self  ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibFormatsSiPixelObjects_EX_LIB   := CalibFormatsSiPixelObjects
ALL_EXTERNAL_PRODS += CalibFormatsSiPixelObjects
endif
ifeq ($(strip $(DQM/SiStripHistoricInfoClient)),)
DQMSiStripHistoricInfoClient := self/DQM/SiStripHistoricInfoClient
DQM/SiStripHistoricInfoClient := DQMSiStripHistoricInfoClient
DQMSiStripHistoricInfoClient_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMSiStripHistoricInfoClient_EX_USE := $(foreach d, self  DataFormats/SiStripDetId FWCore/MessageLogger rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMSiStripHistoricInfoClient_EX_LIB   := DQMSiStripHistoricInfoClient
ALL_EXTERNAL_PRODS += DQMSiStripHistoricInfoClient
endif
ifeq ($(strip $(RecoEgamma/EgammaHFProducers)),)
RecoEgammaEgammaHFProducers := self/RecoEgamma/EgammaHFProducers
RecoEgamma/EgammaHFProducers := RecoEgammaEgammaHFProducers
RecoEgammaEgammaHFProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoEgammaEgammaHFProducers_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet FWCore/PluginManager Geometry/CaloGeometry DataFormats/EgammaReco Geometry/Records DataFormats/RecoCandidate SimDataFormats/GeneratorProducts root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoEgammaEgammaHFProducers_EX_LIB   := RecoEgammaEgammaHFProducers
ALL_EXTERNAL_PRODS += RecoEgammaEgammaHFProducers
endif
ifeq ($(strip $(Alignment/CommonAlignmentParametrization)),)
AlignmentCommonAlignmentParametrization := self/Alignment/CommonAlignmentParametrization
Alignment/CommonAlignmentParametrization := AlignmentCommonAlignmentParametrization
AlignmentCommonAlignmentParametrization_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentCommonAlignmentParametrization_EX_USE := $(foreach d, self  Alignment/CommonAlignment Geometry/CommonTopologies TrackingTools/TrajectoryState FWCore/MessageLogger FWCore/Utilities roothistmatrix,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentCommonAlignmentParametrization_EX_LIB   := AlignmentCommonAlignmentParametrization
ALL_EXTERNAL_PRODS += AlignmentCommonAlignmentParametrization
endif
ifeq ($(strip $(RecoBTag/SecondaryVertex)),)
RecoBTagSecondaryVertex := self/RecoBTag/SecondaryVertex
RecoBTag/SecondaryVertex := RecoBTagSecondaryVertex
RecoBTagSecondaryVertex_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoBTagSecondaryVertex_EX_USE := $(foreach d, self  FWCore/ParameterSet FWCore/Utilities DataFormats/Math DataFormats/TrackReco DataFormats/VertexReco DataFormats/BTauReco DataFormats/PatCandidates rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoBTagSecondaryVertex_EX_LIB   := RecoBTagSecondaryVertex
ALL_EXTERNAL_PRODS += RecoBTagSecondaryVertex
endif
ifeq ($(strip $(TrackPropagation/SteppingHelixPropagator)),)
TrackPropagationSteppingHelixPropagator := self/TrackPropagation/SteppingHelixPropagator
TrackPropagation/SteppingHelixPropagator := TrackPropagationSteppingHelixPropagator
TrackPropagationSteppingHelixPropagator_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackPropagationSteppingHelixPropagator_EX_USE := $(foreach d, self  TrackingTools/GeomPropagators FWCore/MessageLogger MagneticField/Engine MagneticField/VolumeBasedEngine MagneticField/VolumeGeometry FWCore/Framework FWCore/PluginManager FWCore/ParameterSet TrackingTools/AnalyticalJacobians,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackPropagationSteppingHelixPropagator_EX_LIB   := TrackPropagationSteppingHelixPropagator
ALL_EXTERNAL_PRODS += TrackPropagationSteppingHelixPropagator
endif
ifeq ($(strip $(FastSimDataFormats/NuclearInteractions)),)
FastSimDataFormatsNuclearInteractions := self/FastSimDataFormats/NuclearInteractions
FastSimDataFormats/NuclearInteractions := FastSimDataFormatsNuclearInteractions
FastSimDataFormatsNuclearInteractions_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimDataFormatsNuclearInteractions_EX_USE := $(foreach d, self  rootrflx rootcore DataFormats/Common SimDataFormats/Vertex,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimDataFormatsNuclearInteractions_LCGDICTS  := x 
FastSimDataFormatsNuclearInteractions_EX_LIB   := FastSimDataFormatsNuclearInteractions
ALL_EXTERNAL_PRODS += FastSimDataFormatsNuclearInteractions
endif
ifeq ($(strip $(GeneratorInterface/AMPTInterface)),)
GeneratorInterfaceAMPTInterface := self/GeneratorInterface/AMPTInterface
GeneratorInterface/AMPTInterface := GeneratorInterfaceAMPTInterface
GeneratorInterfaceAMPTInterface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfaceAMPTInterface_EX_USE := $(foreach d, self  boost GeneratorInterface/Core FWCore/Framework SimDataFormats/GeneratorProducts GeneratorInterface/ExternalDecays f77compiler,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeneratorInterfaceAMPTInterface_EX_LIB   := GeneratorInterfaceAMPTInterface
ALL_EXTERNAL_PRODS += GeneratorInterfaceAMPTInterface
endif
ifeq ($(strip $(RecoBTau/JetTagComputer)),)
RecoBTauJetTagComputer := self/RecoBTau/JetTagComputer
RecoBTau/JetTagComputer := RecoBTauJetTagComputer
RecoBTauJetTagComputer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoBTauJetTagComputer_EX_USE := $(foreach d, self  CondFormats/DataRecord CondFormats/PhysicsToolsObjects DataFormats/BTauReco DataFormats/Common DataFormats/JetReco FWCore/Framework FWCore/ParameterSet FWCore/Utilities PhysicsTools/MVAComputer boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoBTauJetTagComputer_EX_LIB   := RecoBTauJetTagComputer
ALL_EXTERNAL_PRODS += RecoBTauJetTagComputer
endif
ifeq ($(strip $(FWCore/Version)),)
FWCoreVersion := self/FWCore/Version
FWCore/Version := FWCoreVersion
FWCoreVersion_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCoreVersion_EX_USE := $(foreach d, self  ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCoreVersion_EX_LIB   := FWCoreVersion
ALL_EXTERNAL_PRODS += FWCoreVersion
endif
ifeq ($(strip $(RecoLuminosity/LumiProducer)),)
RecoLuminosityLumiProducer := self/RecoLuminosity/LumiProducer
RecoLuminosity/LumiProducer := RecoLuminosityLumiProducer
RecoLuminosityLumiProducer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoLuminosityLumiProducer_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet CoralBase RelationalAccess FWCore/ServiceRegistry FWCore/Utilities,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoLuminosityLumiProducer_ROOTDICT  := LinkDef
RecoLuminosityLumiProducer_EX_LIB   := RecoLuminosityLumiProducer
ALL_EXTERNAL_PRODS += RecoLuminosityLumiProducer
endif
ifeq ($(strip $(RecoJets/FFTJetAlgorithms)),)
RecoJetsFFTJetAlgorithms := self/RecoJets/FFTJetAlgorithms
RecoJets/FFTJetAlgorithms := RecoJetsFFTJetAlgorithms
RecoJetsFFTJetAlgorithms_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoJetsFFTJetAlgorithms_EX_USE := $(foreach d, self  DataFormats/JetReco DataFormats/Common rootrflx fftjet fftw3,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoJetsFFTJetAlgorithms_EX_LIB   := RecoJetsFFTJetAlgorithms
ALL_EXTERNAL_PRODS += RecoJetsFFTJetAlgorithms
endif
ifeq ($(strip $(RecoJets/FFTJetProducers)),)
RecoJetsFFTJetProducers := self/RecoJets/FFTJetProducers
RecoJets/FFTJetProducers := RecoJetsFFTJetProducers
RecoJetsFFTJetProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoJetsFFTJetProducers_EX_USE := $(foreach d, self  FWCore/Framework RecoJets/FFTJetAlgorithms RecoJets/JetProducers,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoJetsFFTJetProducers_EX_LIB   := RecoJetsFFTJetProducers
ALL_EXTERNAL_PRODS += RecoJetsFFTJetProducers
endif
ifeq ($(strip $(SimCalorimetry/EcalTestBeamAlgos)),)
SimCalorimetryEcalTestBeamAlgos := self/SimCalorimetry/EcalTestBeamAlgos
SimCalorimetry/EcalTestBeamAlgos := SimCalorimetryEcalTestBeamAlgos
SimCalorimetryEcalTestBeamAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimCalorimetryEcalTestBeamAlgos_EX_USE := $(foreach d, self  DataFormats/EcalDetId DataFormats/EcalDigi SimDataFormats/EcalTestBeam Geometry/CaloGeometry Geometry/CaloTopology FWCore/Framework,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimCalorimetryEcalTestBeamAlgos_EX_LIB   := SimCalorimetryEcalTestBeamAlgos
ALL_EXTERNAL_PRODS += SimCalorimetryEcalTestBeamAlgos
endif
ifeq ($(strip $(FWCore/FWLite)),)
FWCoreFWLite := self/FWCore/FWLite
FWCore/FWLite := FWCoreFWLite
FWCoreFWLite_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCoreFWLite_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/Provenance FWCore/PluginManager FWCore/RootAutoLibraryLoader FWCore/Utilities boost rootcintex rootcore rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCoreFWLite_ROOTDICT  := LinkDef
FWCoreFWLite_EX_LIB   := FWCoreFWLite
ALL_EXTERNAL_PRODS += FWCoreFWLite
endif
ifeq ($(strip $(AnalysisDataFormats/SiStripClusterInfo)),)
src_AnalysisDataFormats_SiStripClusterInfo := self/AnalysisDataFormats/SiStripClusterInfo
AnalysisDataFormats/SiStripClusterInfo  := src_AnalysisDataFormats_SiStripClusterInfo
src_AnalysisDataFormats_SiStripClusterInfo_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_AnalysisDataFormats_SiStripClusterInfo_EX_USE := $(foreach d, self,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_AnalysisDataFormats_SiStripClusterInfo
endif

ifeq ($(strip $(FastSimulation/Tracking)),)
FastSimulationTracking := self/FastSimulation/Tracking
FastSimulation/Tracking := FastSimulationTracking
FastSimulationTracking_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationTracking_EX_USE := $(foreach d, self  DataFormats/GeometryVector DataFormats/SiPixelDetId DataFormats/SiStripDetId DataFormats/TrackingRecHit DataFormats/TrackerRecHit2D Geometry/CommonDetUnit,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationTracking_EX_LIB   := FastSimulationTracking
ALL_EXTERNAL_PRODS += FastSimulationTracking
endif
ifeq ($(strip $(CaloOnlineTools/EcalTools)),)
CaloOnlineToolsEcalTools := self/CaloOnlineTools/EcalTools
CaloOnlineTools/EcalTools := CaloOnlineToolsEcalTools
CaloOnlineToolsEcalTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CaloOnlineToolsEcalTools_EX_USE := $(foreach d, self  root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CaloOnlineToolsEcalTools_EX_LIB   := CaloOnlineToolsEcalTools
ALL_EXTERNAL_PRODS += CaloOnlineToolsEcalTools
endif
ifeq ($(strip $(SimTracker/SiPixelDigitizer)),)
SimTrackerSiPixelDigitizer := self/SimTracker/SiPixelDigitizer
SimTracker/SiPixelDigitizer := SimTrackerSiPixelDigitizer
SimTrackerSiPixelDigitizer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimTrackerSiPixelDigitizer_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet DataFormats/Common DataFormats/SiPixelDigi SimDataFormats/TrackingHit SimDataFormats/TrackerDigiSimLink SimDataFormats/CrossingFrame CondFormats/SiPixelObjects Geometry/TrackerGeometryBuilder SimGeneral/NoiseGenerators SimTracker/Common CalibTracker/SiPixelESProducers gsl boost clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimTrackerSiPixelDigitizer_EX_LIB   := SimTrackerSiPixelDigitizer
ALL_EXTERNAL_PRODS += SimTrackerSiPixelDigitizer
endif
ifeq ($(strip $(RecoTracker/RoadSearchCloudMaker)),)
RecoTrackerRoadSearchCloudMaker := self/RecoTracker/RoadSearchCloudMaker
RecoTracker/RoadSearchCloudMaker := RecoTrackerRoadSearchCloudMaker
RecoTrackerRoadSearchCloudMaker_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerRoadSearchCloudMaker_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger DataFormats/Common DataFormats/TrackerRecHit2D DataFormats/SiStripDetId DataFormats/SiPixelDetId Geometry/Records Geometry/CommonDetUnit Geometry/TrackerGeometryBuilder Geometry/CommonTopologies RecoTracker/RoadMapRecord RecoTracker/RingRecord TrackingTools/RoadSearchHitAccess RecoLocalTracker/SiStripRecHitConverter,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerRoadSearchCloudMaker_EX_LIB   := RecoTrackerRoadSearchCloudMaker
ALL_EXTERNAL_PRODS += RecoTrackerRoadSearchCloudMaker
endif
ifeq ($(strip $(SimDataFormats/ValidationFormats)),)
SimDataFormatsValidationFormats := self/SimDataFormats/ValidationFormats
SimDataFormats/ValidationFormats := SimDataFormatsValidationFormats
SimDataFormatsValidationFormats_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsValidationFormats_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/GeometryVector clhep geant4 rootrflx expat,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsValidationFormats_LCGDICTS  := x 
SimDataFormatsValidationFormats_EX_LIB   := SimDataFormatsValidationFormats
ALL_EXTERNAL_PRODS += SimDataFormatsValidationFormats
endif
ifeq ($(strip $(Geometry/CSCGeometry)),)
GeometryCSCGeometry := self/Geometry/CSCGeometry
Geometry/CSCGeometry := GeometryCSCGeometry
GeometryCSCGeometry_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryCSCGeometry_EX_USE := $(foreach d, self  DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/MuonDetId FWCore/MessageLogger FWCore/Utilities Geometry/CommonDetUnit Geometry/CommonTopologies clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryCSCGeometry_EX_LIB   := GeometryCSCGeometry
ALL_EXTERNAL_PRODS += GeometryCSCGeometry
endif
ifeq ($(strip $(DataFormats/TrackerRecHit2D)),)
DataFormatsTrackerRecHit2D := self/DataFormats/TrackerRecHit2D
DataFormats/TrackerRecHit2D := DataFormatsTrackerRecHit2D
DataFormatsTrackerRecHit2D_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsTrackerRecHit2D_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/TrackingRecHit FWCore/MessageLogger rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsTrackerRecHit2D_LCGDICTS  := x 
DataFormatsTrackerRecHit2D_EX_LIB   := DataFormatsTrackerRecHit2D
ALL_EXTERNAL_PRODS += DataFormatsTrackerRecHit2D
endif
ifeq ($(strip $(EventFilter/Modules)),)
EventFilterModules := self/EventFilter/Modules
EventFilter/Modules := EventFilterModules
EventFilterModules_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterModules_EX_USE := $(foreach d, self  DQMServices/Core DataFormats/Provenance EventFilter/StorageManager EventFilter/Utilities EventFilter/ShmBuffer FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities FWCore/Version FWCore/PluginManager IOPool/Streamer xdaq zlib,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterModules_EX_LIB   := EventFilterModules
ALL_EXTERNAL_PRODS += EventFilterModules
endif
ifeq ($(strip $(PhysicsTools/CondLiteIO)),)
PhysicsToolsCondLiteIO := self/PhysicsTools/CondLiteIO
PhysicsTools/CondLiteIO := PhysicsToolsCondLiteIO
PhysicsToolsCondLiteIO_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsCondLiteIO_EX_USE := $(foreach d, self  DataFormats/Provenance DataFormats/FWLite rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsCondLiteIO_EX_LIB   := PhysicsToolsCondLiteIO
ALL_EXTERNAL_PRODS += PhysicsToolsCondLiteIO
endif
ifeq ($(strip $(JetMETCorrections/Algorithms)),)
JetMETCorrectionsAlgorithms := self/JetMETCorrections/Algorithms
JetMETCorrections/Algorithms := JetMETCorrectionsAlgorithms
JetMETCorrectionsAlgorithms_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
JetMETCorrectionsAlgorithms_EX_USE := $(foreach d, self  CondFormats/JetMETObjects DataFormats/Common DataFormats/EgammaCandidates DataFormats/JetReco DataFormats/Math DataFormats/MuonReco DataFormats/TrackReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet JetMETCorrections/Objects boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
JetMETCorrectionsAlgorithms_EX_LIB   := JetMETCorrectionsAlgorithms
ALL_EXTERNAL_PRODS += JetMETCorrectionsAlgorithms
endif
ifeq ($(strip $(CalibMuon/DTCalibration)),)
CalibMuonDTCalibration := self/CalibMuon/DTCalibration
CalibMuon/DTCalibration := CalibMuonDTCalibration
CalibMuonDTCalibration_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibMuonDTCalibration_EX_USE := $(foreach d, self  FWCore/Framework DataFormats/DTDigi DataFormats/DTRecHit Geometry/DTGeometry Geometry/Records CondFormats/DTObjects CondFormats/DataRecord CondCore/DBOutputService CalibMuon/DTDigiSync root rootmath rootcore roofit,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibMuonDTCalibration_EX_LIB   := CalibMuonDTCalibration
ALL_EXTERNAL_PRODS += CalibMuonDTCalibration
endif
ifeq ($(strip $(DQM/EcalBarrelMonitorClient)),)
DQMEcalBarrelMonitorClient := self/DQM/EcalBarrelMonitorClient
DQM/EcalBarrelMonitorClient := DQMEcalBarrelMonitorClient
DQMEcalBarrelMonitorClient_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMEcalBarrelMonitorClient_EX_USE := $(foreach d, self  DQM/EcalCommon DQMServices/Core DataFormats/EcalDetId FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry DQM/EcalBarrelMonitorTasks rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMEcalBarrelMonitorClient_EX_LIB   := DQMEcalBarrelMonitorClient
ALL_EXTERNAL_PRODS += DQMEcalBarrelMonitorClient
endif
ifeq ($(strip $(FWCore/TFWLiteSelector)),)
FWCoreTFWLiteSelector := self/FWCore/TFWLiteSelector
FWCore/TFWLiteSelector := FWCoreTFWLiteSelector
FWCoreTFWLiteSelector_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCoreTFWLiteSelector_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/Provenance FWCore/Framework FWCore/ParameterSet FWCore/Utilities rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCoreTFWLiteSelector_LCGDICTS  := x 
FWCoreTFWLiteSelector_EX_LIB   := FWCoreTFWLiteSelector
ALL_EXTERNAL_PRODS += FWCoreTFWLiteSelector
endif
ifeq ($(strip $(DataFormats/EcalDigi)),)
DataFormatsEcalDigi := self/DataFormats/EcalDigi
DataFormats/EcalDigi := DataFormatsEcalDigi
DataFormatsEcalDigi_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsEcalDigi_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/EcalDetId boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsEcalDigi_LCGDICTS  := x 
DataFormatsEcalDigi_EX_LIB   := DataFormatsEcalDigi
ALL_EXTERNAL_PRODS += DataFormatsEcalDigi
endif
ifeq ($(strip $(RecoParticleFlow/PFClusterTools)),)
RecoParticleFlowPFClusterTools := self/RecoParticleFlow/PFClusterTools
RecoParticleFlow/PFClusterTools := RecoParticleFlowPFClusterTools
RecoParticleFlowPFClusterTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoParticleFlowPFClusterTools_EX_USE := $(foreach d, self  CondFormats/PhysicsToolsObjects DataFormats/ParticleFlowReco DataFormats/Math DataFormats/EcalDetId boost rootphysics rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoParticleFlowPFClusterTools_LCGDICTS  := x 
RecoParticleFlowPFClusterTools_EX_LIB   := RecoParticleFlowPFClusterTools
ALL_EXTERNAL_PRODS += RecoParticleFlowPFClusterTools
endif
ifeq ($(strip $(CondFormats/DTObjects)),)
CondFormatsDTObjects := self/CondFormats/DTObjects
CondFormats/DTObjects := CondFormatsDTObjects
CondFormatsDTObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsDTObjects_EX_USE := $(foreach d, self  CondFormats/Common DataFormats/MuonDetId FWCore/Utilities CondCore/DBCommon rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsDTObjects_LCGDICTS  := x 
CondFormatsDTObjects_EX_LIB   := CondFormatsDTObjects
ALL_EXTERNAL_PRODS += CondFormatsDTObjects
endif
ifeq ($(strip $(GeneratorInterface/PhotosInterface)),)
GeneratorInterfacePhotosInterface := self/GeneratorInterface/PhotosInterface
GeneratorInterface/PhotosInterface := GeneratorInterfacePhotosInterface
GeneratorInterfacePhotosInterface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfacePhotosInterface_EX_USE := $(foreach d, self  FWCore/ParameterSet FWCore/Framework FWCore/PluginManager hepmc clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeneratorInterfacePhotosInterface_EX_LIB   := GeneratorInterfacePhotosInterface
ALL_EXTERNAL_PRODS += GeneratorInterfacePhotosInterface
endif
ifeq ($(strip $(EventFilter/ResourceBroker)),)
EventFilterResourceBroker := self/EventFilter/ResourceBroker
EventFilter/ResourceBroker := EventFilterResourceBroker
EventFilterResourceBroker_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterResourceBroker_EX_USE := $(foreach d, self  EventFilter/ShmBuffer EventFilter/Utilities DataFormats/FEDRawData xdaq,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterResourceBroker_EX_LIB   := EventFilterResourceBroker
ALL_EXTERNAL_PRODS += EventFilterResourceBroker
endif
ifeq ($(strip $(TBDataFormats/EcalTBObjects)),)
TBDataFormatsEcalTBObjects := self/TBDataFormats/EcalTBObjects
TBDataFormats/EcalTBObjects := TBDataFormatsEcalTBObjects
TBDataFormatsEcalTBObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TBDataFormatsEcalTBObjects_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/EcalDetId boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TBDataFormatsEcalTBObjects_LCGDICTS  := x 
TBDataFormatsEcalTBObjects_EX_LIB   := TBDataFormatsEcalTBObjects
ALL_EXTERNAL_PRODS += TBDataFormatsEcalTBObjects
endif
ifeq ($(strip $(Validation/RecoJets)),)
src_Validation_RecoJets := self/Validation/RecoJets
Validation/RecoJets  := src_Validation_RecoJets
src_Validation_RecoJets_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_Validation_RecoJets_EX_USE := $(foreach d, self FWCore/MessageLogger JetMETCorrections/Objects CommonTools/UtilAlgos FWCore/ServiceRegistry rootgraphics FWCore/ParameterSet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_Validation_RecoJets
endif

ifeq ($(strip $(TrackingTools/PatternTools)),)
TrackingToolsPatternTools := self/TrackingTools/PatternTools
TrackingTools/PatternTools := TrackingToolsPatternTools
TrackingToolsPatternTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsPatternTools_EX_USE := $(foreach d, self  DataFormats/BeamSpot DataFormats/Common DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/TrackReco DataFormats/TrackerRecHit2D FWCore/MessageLogger FWCore/Utilities Geometry/CommonDetUnit TrackingTools/AnalyticalJacobians TrackingTools/GeomPropagators TrackingTools/TrajectoryParametrization TrackingTools/TrajectoryState rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsPatternTools_LCGDICTS  := x 
TrackingToolsPatternTools_EX_LIB   := TrackingToolsPatternTools
ALL_EXTERNAL_PRODS += TrackingToolsPatternTools
endif
ifeq ($(strip $(DataFormats/VZero)),)
DataFormatsVZero := self/DataFormats/VZero
DataFormats/VZero := DataFormatsVZero
DataFormatsVZero_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsVZero_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/TrackReco DataFormats/VertexReco rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsVZero_LCGDICTS  := x 
DataFormatsVZero_EX_LIB   := DataFormatsVZero
ALL_EXTERNAL_PRODS += DataFormatsVZero
endif
ifeq ($(strip $(DataFormats/TrackCandidate)),)
DataFormatsTrackCandidate := self/DataFormats/TrackCandidate
DataFormats/TrackCandidate := DataFormatsTrackCandidate
DataFormatsTrackCandidate_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsTrackCandidate_EX_USE := $(foreach d, self  DataFormats/Common rootrflx clhepheader,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsTrackCandidate_LCGDICTS  := x 
DataFormatsTrackCandidate_EX_LIB   := DataFormatsTrackCandidate
ALL_EXTERNAL_PRODS += DataFormatsTrackCandidate
endif
ifeq ($(strip $(DQM/SiPixelCommon)),)
DQMSiPixelCommon := self/DQM/SiPixelCommon
DQM/SiPixelCommon := DQMSiPixelCommon
DQMSiPixelCommon_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMSiPixelCommon_EX_USE := $(foreach d, self  boost FWCore/Framework DQMServices/Core DataFormats/SiPixelDetId rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMSiPixelCommon_EX_LIB   := DQMSiPixelCommon
ALL_EXTERNAL_PRODS += DQMSiPixelCommon
endif
ifeq ($(strip $(Validation/MuonCSCDigis)),)
ValidationMuonCSCDigis := self/Validation/MuonCSCDigis
Validation/MuonCSCDigis := ValidationMuonCSCDigis
ValidationMuonCSCDigis_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
ValidationMuonCSCDigis_EX_USE := $(foreach d, self  DQMServices/Core DataFormats/CSCDigi DataFormats/Common FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry Geometry/CSCGeometry Geometry/Records SimDataFormats/CrossingFrame SimDataFormats/TrackingHit SimMuon/MCTruth,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ValidationMuonCSCDigis_EX_LIB   := ValidationMuonCSCDigis
ALL_EXTERNAL_PRODS += ValidationMuonCSCDigis
endif
ifeq ($(strip $(DataFormats/Streamer)),)
DataFormatsStreamer := self/DataFormats/Streamer
DataFormats/Streamer := DataFormatsStreamer
DataFormatsStreamer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsStreamer_EX_USE := $(foreach d, self  DataFormats/Provenance rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsStreamer_LCGDICTS  := x 
DataFormatsStreamer_EX_LIB   := DataFormatsStreamer
ALL_EXTERNAL_PRODS += DataFormatsStreamer
endif
ifeq ($(strip $(DQMServices/Diagnostic)),)
DQMServicesDiagnostic := self/DQMServices/Diagnostic
DQMServices/Diagnostic := DQMServicesDiagnostic
DQMServicesDiagnostic_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMServicesDiagnostic_EX_USE := $(foreach d, self  CondCore/Utilities CondFormats/DQMObjects DQMServices/Core rootgraphics,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMServicesDiagnostic_EX_LIB   := DQMServicesDiagnostic
ALL_EXTERNAL_PRODS += DQMServicesDiagnostic
endif
ifeq ($(strip $(GeneratorInterface/HiGenCommon)),)
GeneratorInterfaceHiGenCommon := self/GeneratorInterface/HiGenCommon
GeneratorInterface/HiGenCommon := GeneratorInterfaceHiGenCommon
GeneratorInterfaceHiGenCommon_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfaceHiGenCommon_EX_USE := $(foreach d, self  GeneratorInterface/Core SimDataFormats/GeneratorProducts SimGeneral/HepPDTRecord FWCore/ParameterSet IOMC/EventVertexGenerators,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeneratorInterfaceHiGenCommon_EX_LIB   := GeneratorInterfaceHiGenCommon
ALL_EXTERNAL_PRODS += GeneratorInterfaceHiGenCommon
endif
ifeq ($(strip $(CondFormats/Common)),)
CondFormatsCommon := self/CondFormats/Common
CondFormats/Common := CondFormatsCommon
CondFormatsCommon_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsCommon_EX_USE := $(foreach d, self  DataFormats/StdDictionaries boost FWCore/MessageLogger FWCore/Utilities rootrflx CondCore/ORA,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsCommon_LCGDICTS  := x 
CondFormatsCommon_EX_LIB   := CondFormatsCommon
ALL_EXTERNAL_PRODS += CondFormatsCommon
endif
ifeq ($(strip $(FastSimulation/Particle)),)
FastSimulationParticle := self/FastSimulation/Particle
FastSimulation/Particle := FastSimulationParticle
FastSimulationParticle_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationParticle_EX_USE := $(foreach d, self  DataFormats/Math SimGeneral/HepPDTRecord rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationParticle_EX_LIB   := FastSimulationParticle
ALL_EXTERNAL_PRODS += FastSimulationParticle
endif
ifeq ($(strip $(EventFilter/Utilities)),)
EventFilterUtilities := self/EventFilter/Utilities
EventFilter/Utilities := EventFilterUtilities
EventFilterUtilities_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterUtilities_EX_USE := $(foreach d, self  FWCore/MessageLogger FWCore/ServiceRegistry EventFilter/FEDInterface xdaq curl,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterUtilities_EX_LIB   := EventFilterUtilities
ALL_EXTERNAL_PRODS += EventFilterUtilities
endif
ifeq ($(strip $(GeneratorInterface/ReggeGribovPartonMCInterface)),)
GeneratorInterfaceReggeGribovPartonMCInterface := self/GeneratorInterface/ReggeGribovPartonMCInterface
GeneratorInterface/ReggeGribovPartonMCInterface := GeneratorInterfaceReggeGribovPartonMCInterface
GeneratorInterfaceReggeGribovPartonMCInterface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfaceReggeGribovPartonMCInterface_EX_USE := $(foreach d, self  clhep boost GeneratorInterface/Core FWCore/Framework SimDataFormats/GeneratorProducts GeneratorInterface/ExternalDecays f77compiler,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeneratorInterfaceReggeGribovPartonMCInterface_EX_LIB   := GeneratorInterfaceReggeGribovPartonMCInterface
ALL_EXTERNAL_PRODS += GeneratorInterfaceReggeGribovPartonMCInterface
endif
ifeq ($(strip $(FWCore/ParameterSet)),)
FWCoreParameterSet := self/FWCore/ParameterSet
FWCore/ParameterSet := FWCoreParameterSet
FWCoreParameterSet_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCoreParameterSet_EX_USE := $(foreach d, self  DataFormats/Provenance FWCore/MessageLogger FWCore/PluginManager FWCore/Utilities boost boost_filesystem,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCoreParameterSet_EX_LIB   := FWCoreParameterSet
ALL_EXTERNAL_PRODS += FWCoreParameterSet
endif
ifeq ($(strip $(Alignment/CocoaFit)),)
AlignmentCocoaFit := self/Alignment/CocoaFit
Alignment/CocoaFit := AlignmentCocoaFit
AlignmentCocoaFit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentCocoaFit_EX_USE := $(foreach d, self  Alignment/CocoaUtilities Alignment/CocoaModel Alignment/CocoaDaq FWCore/Utilities clhep meschach FWCore/Framework FWCore/ParameterSet CondFormats/OptAlignObjects CondFormats/DataRecord CondFormats/Alignment CondFormats/AlignmentRecord CondCore/DBCommon CondCore/DBOutputService,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentCocoaFit_ROOTDICT  := LinkDef
AlignmentCocoaFit_EX_LIB   := AlignmentCocoaFit
ALL_EXTERNAL_PRODS += AlignmentCocoaFit
endif
ifeq ($(strip $(SimCalorimetry/CaloSimAlgos)),)
SimCalorimetryCaloSimAlgos := self/SimCalorimetry/CaloSimAlgos
SimCalorimetry/CaloSimAlgos := SimCalorimetryCaloSimAlgos
SimCalorimetryCaloSimAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimCalorimetryCaloSimAlgos_EX_USE := $(foreach d, self  CalibFormats/CaloObjects DataFormats/DetId SimDataFormats/CaloHit SimDataFormats/EncodedEventId SimDataFormats/GeneratorProducts hepmc DataFormats/Common Geometry/CaloGeometry FWCore/MessageLogger FWCore/ServiceRegistry clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimCalorimetryCaloSimAlgos_EX_LIB   := SimCalorimetryCaloSimAlgos
ALL_EXTERNAL_PRODS += SimCalorimetryCaloSimAlgos
endif
ifeq ($(strip $(TopQuarkAnalysis/TopHitFit)),)
TopQuarkAnalysisTopHitFit := self/TopQuarkAnalysis/TopHitFit
TopQuarkAnalysis/TopHitFit := TopQuarkAnalysisTopHitFit
TopQuarkAnalysisTopHitFit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TopQuarkAnalysisTopHitFit_EX_USE := $(foreach d, self  clhep root DataFormats/PatCandidates FWCore/ParameterSet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TopQuarkAnalysisTopHitFit_EX_LIB   := TopQuarkAnalysisTopHitFit
ALL_EXTERNAL_PRODS += TopQuarkAnalysisTopHitFit
endif
ifeq ($(strip $(RecoTBCalo/EcalTBAnalysisCoreTools)),)
RecoTBCaloEcalTBAnalysisCoreTools := self/RecoTBCalo/EcalTBAnalysisCoreTools
RecoTBCalo/EcalTBAnalysisCoreTools := RecoTBCaloEcalTBAnalysisCoreTools
RecoTBCaloEcalTBAnalysisCoreTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTBCaloEcalTBAnalysisCoreTools_EX_USE := $(foreach d, self  DataFormats/EcalRecHit DataFormats/EgammaReco DataFormats/Math Geometry/CaloGeometry Geometry/CaloTopology Geometry/EcalTestBeam Geometry/EcalAlgo clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTBCaloEcalTBAnalysisCoreTools_EX_LIB   := RecoTBCaloEcalTBAnalysisCoreTools
ALL_EXTERNAL_PRODS += RecoTBCaloEcalTBAnalysisCoreTools
endif
ifeq ($(strip $(CommonTools/ParticleFlow)),)
CommonToolsParticleFlow := self/CommonTools/ParticleFlow
CommonTools/ParticleFlow := CommonToolsParticleFlow
CommonToolsParticleFlow_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CommonToolsParticleFlow_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/ParticleFlowCandidate DataFormats/EgammaCandidates DataFormats/METReco DataFormats/JetReco DataFormats/PatCandidates rootmath FWCore/ParameterSet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CommonToolsParticleFlow_EX_LIB   := CommonToolsParticleFlow
ALL_EXTERNAL_PRODS += CommonToolsParticleFlow
endif
ifeq ($(strip $(RecoParticleFlow/Benchmark)),)
RecoParticleFlowBenchmark := self/RecoParticleFlow/Benchmark
RecoParticleFlow/Benchmark := RecoParticleFlowBenchmark
RecoParticleFlowBenchmark_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoParticleFlowBenchmark_EX_USE := $(foreach d, self  DQMServices/Core DataFormats/Candidate DataFormats/Common DataFormats/HepMCCandidate DataFormats/JetReco DataFormats/ParticleFlowCandidate DataFormats/TauReco DataFormats/Math FWCore/Utilities SimDataFormats/GeneratorProducts,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoParticleFlowBenchmark_LCGDICTS  := x 
RecoParticleFlowBenchmark_EX_LIB   := RecoParticleFlowBenchmark
ALL_EXTERNAL_PRODS += RecoParticleFlowBenchmark
endif
ifeq ($(strip $(Geometry/EcalMapping)),)
GeometryEcalMapping := self/Geometry/EcalMapping
Geometry/EcalMapping := GeometryEcalMapping
GeometryEcalMapping_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryEcalMapping_EX_USE := $(foreach d, self  FWCore/Framework DataFormats/EcalDetId CondFormats/DataRecord boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryEcalMapping_EX_LIB   := GeometryEcalMapping
ALL_EXTERNAL_PRODS += GeometryEcalMapping
endif
ifeq ($(strip $(Fireworks/Eve)),)
FireworksEve := self/Fireworks/Eve
Fireworks/Eve := FireworksEve
FireworksEve_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FireworksEve_EX_USE := $(foreach d, self  FWCore/PluginManager FWCore/Framework CondFormats/DataRecord CondFormats/RunInfo rootcore rootinteractive,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FireworksEve_ROOTDICT  := LinkDef
FireworksEve_EX_LIB   := FireworksEve
ALL_EXTERNAL_PRODS += FireworksEve
endif
ifeq ($(strip $(CondFormats/BTauObjects)),)
CondFormatsBTauObjects := self/CondFormats/BTauObjects
CondFormats/BTauObjects := CondFormatsBTauObjects
CondFormatsBTauObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsBTauObjects_EX_USE := $(foreach d, self  CondFormats/Common FWCore/MessageLogger FWCore/Utilities boost rootrflx CondFormats/PhysicsToolsObjects,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsBTauObjects_LCGDICTS  := x 
CondFormatsBTauObjects_EX_LIB   := CondFormatsBTauObjects
ALL_EXTERNAL_PRODS += CondFormatsBTauObjects
endif
ifeq ($(strip $(Fireworks/ParticleFlow)),)
FireworksParticleFlow := self/Fireworks/ParticleFlow
Fireworks/ParticleFlow := FireworksParticleFlow
FireworksParticleFlow_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FireworksParticleFlow_EX_USE := $(foreach d, self  DataFormats/ParticleFlowCandidate Fireworks/Core Fireworks/Candidates Fireworks/Tracks,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FireworksParticleFlow_EX_LIB   := FireworksParticleFlow
ALL_EXTERNAL_PRODS += FireworksParticleFlow
endif
ifeq ($(strip $(DQM/SiPixelHistoricInfoClient)),)
DQMSiPixelHistoricInfoClient := self/DQM/SiPixelHistoricInfoClient
DQM/SiPixelHistoricInfoClient := DQMSiPixelHistoricInfoClient
DQMSiPixelHistoricInfoClient_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMSiPixelHistoricInfoClient_EX_USE := $(foreach d, self  CondCore/DBOutputService CondFormats/DataRecord CondFormats/SiPixelObjects DQM/SiPixelCommon rootgraphics,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMSiPixelHistoricInfoClient_EX_LIB   := DQMSiPixelHistoricInfoClient
ALL_EXTERNAL_PRODS += DQMSiPixelHistoricInfoClient
endif
ifeq ($(strip $(TrackPropagation/RungeKutta)),)
TrackPropagationRungeKutta := self/TrackPropagation/RungeKutta
TrackPropagation/RungeKutta := TrackPropagationRungeKutta
TrackPropagationRungeKutta_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackPropagationRungeKutta_EX_USE := $(foreach d, self  TrackingTools/TrajectoryState TrackingTools/GeomPropagators MagneticField/VolumeGeometry FWCore/MessageLogger FWCore/Utilities FWCore/Framework MagneticField/Engine,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackPropagationRungeKutta_EX_LIB   := TrackPropagationRungeKutta
ALL_EXTERNAL_PRODS += TrackPropagationRungeKutta
endif
ifeq ($(strip $(Calibration/Tools)),)
CalibrationTools := self/Calibration/Tools
Calibration/Tools := CalibrationTools
CalibrationTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibrationTools_EX_USE := $(foreach d, self  Utilities/Timing FWCore/Framework FWCore/ParameterSet DataFormats/EcalRecHit DataFormats/EgammaReco DataFormats/CaloTowers DataFormats/HcalDetId DataFormats/EgammaCandidates rootcore rootminuit rootgraphics Geometry/CaloGeometry Geometry/CommonDetUnit Geometry/TrackerGeometryBuilder DataFormats/GeometrySurface Geometry/Records DataFormats/DetId TrackingTools/GeomPropagators MagneticField/Engine MagneticField/Records TrackPropagation/SteppingHelixPropagator,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibrationTools_EX_LIB   := CalibrationTools
ALL_EXTERNAL_PRODS += CalibrationTools
endif
ifeq ($(strip $(QCDAnalysis/ChargedHadronSpectra)),)
QCDAnalysisChargedHadronSpectra := self/QCDAnalysis/ChargedHadronSpectra
QCDAnalysis/ChargedHadronSpectra := QCDAnalysisChargedHadronSpectra
QCDAnalysisChargedHadronSpectra_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
QCDAnalysisChargedHadronSpectra_EX_USE := $(foreach d, self  TrackingTools/Records MagneticField/Engine MagneticField/Records TrackingTools/PatternTools Geometry/TrackerGeometryBuilder Geometry/CaloGeometry SimDataFormats/GeneratorProducts SimTracker/TrackerHitAssociation SimDataFormats/TrackingAnalysis,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
QCDAnalysisChargedHadronSpectra_EX_LIB   := QCDAnalysisChargedHadronSpectra
ALL_EXTERNAL_PRODS += QCDAnalysisChargedHadronSpectra
endif
ifeq ($(strip $(L1Trigger/CSCCommonTrigger)),)
L1TriggerCSCCommonTrigger := self/L1Trigger/CSCCommonTrigger
L1Trigger/CSCCommonTrigger := L1TriggerCSCCommonTrigger
L1TriggerCSCCommonTrigger_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerCSCCommonTrigger_EX_USE := $(foreach d, self  Geometry/CSCGeometry Geometry/CommonDetUnit Geometry/CommonTopologies DataFormats/MuonDetId DataFormats/CSCDigi boost clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerCSCCommonTrigger_EX_LIB   := L1TriggerCSCCommonTrigger
ALL_EXTERNAL_PRODS += L1TriggerCSCCommonTrigger
endif
ifeq ($(strip $(JetMETCorrections/TauJet)),)
JetMETCorrectionsTauJet := self/JetMETCorrections/TauJet
JetMETCorrections/TauJet := JetMETCorrectionsTauJet
JetMETCorrectionsTauJet_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
JetMETCorrectionsTauJet_EX_USE := $(foreach d, self  clhep DataFormats/Common FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/JetReco DataFormats/TauReco JetMETCorrections/Objects TrackingTools/TransientTrack Geometry/CaloGeometry DataFormats/BTauReco RecoTauTag/TauTagTools TrackingTools/TrackAssociator RecoTauTag/RecoTau rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
JetMETCorrectionsTauJet_EX_LIB   := JetMETCorrectionsTauJet
ALL_EXTERNAL_PRODS += JetMETCorrectionsTauJet
endif
ifeq ($(strip $(DataFormats/SiPixelDigi)),)
DataFormatsSiPixelDigi := self/DataFormats/SiPixelDigi
DataFormats/SiPixelDigi := DataFormatsSiPixelDigi
DataFormatsSiPixelDigi_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsSiPixelDigi_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/SiPixelDetId rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsSiPixelDigi_LCGDICTS  := x 
DataFormatsSiPixelDigi_EX_LIB   := DataFormatsSiPixelDigi
ALL_EXTERNAL_PRODS += DataFormatsSiPixelDigi
endif
ifeq ($(strip $(RecoTracker/TransientTrackingRecHit)),)
RecoTrackerTransientTrackingRecHit := self/RecoTracker/TransientTrackingRecHit
RecoTracker/TransientTrackingRecHit := RecoTrackerTransientTrackingRecHit
RecoTrackerTransientTrackingRecHit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerTransientTrackingRecHit_EX_USE := $(foreach d, self  TrackingTools/TransientTrackingRecHit DataFormats/TrackerRecHit2D RecoLocalTracker/Records RecoLocalTracker/ClusterParameterEstimator RecoLocalTracker/SiPixelRecHits RecoLocalTracker/SiStripRecHitConverter FWCore/Framework DataFormats/Common clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerTransientTrackingRecHit_EX_LIB   := RecoTrackerTransientTrackingRecHit
ALL_EXTERNAL_PRODS += RecoTrackerTransientTrackingRecHit
endif
ifeq ($(strip $(GeneratorInterface/ExternalDecays)),)
GeneratorInterfaceExternalDecays := self/GeneratorInterface/ExternalDecays
GeneratorInterface/ExternalDecays := GeneratorInterfaceExternalDecays
GeneratorInterfaceExternalDecays_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfaceExternalDecays_EX_USE := $(foreach d, self  FWCore/ParameterSet FWCore/Framework FWCore/PluginManager heppdt SimGeneral/HepPDTRecord clhep hepmc GeneratorInterface/EvtGenInterface GeneratorInterface/PhotosInterface GeneratorInterface/TauolaInterface,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeneratorInterfaceExternalDecays_EX_LIB   := GeneratorInterfaceExternalDecays
ALL_EXTERNAL_PRODS += GeneratorInterfaceExternalDecays
endif
ifeq ($(strip $(DQM/EcalEndcapMonitorModule)),)
DQMEcalEndcapMonitorModule := self/DQM/EcalEndcapMonitorModule
DQM/EcalEndcapMonitorModule := DQMEcalEndcapMonitorModule
DQMEcalEndcapMonitorModule_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMEcalEndcapMonitorModule_EX_USE := $(foreach d, self  DQM/EcalCommon DQMServices/Core DataFormats/EcalDetId DataFormats/EcalDigi DataFormats/EcalRawData DataFormats/EcalRecHit FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMEcalEndcapMonitorModule_EX_LIB   := DQMEcalEndcapMonitorModule
ALL_EXTERNAL_PRODS += DQMEcalEndcapMonitorModule
endif
ifeq ($(strip $(RecoTracker/DeDx)),)
RecoTrackerDeDx := self/RecoTracker/DeDx
RecoTracker/DeDx := RecoTrackerDeDx
RecoTrackerDeDx_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerDeDx_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/ServiceRegistry DataFormats/TrackReco DataFormats/DetId DataFormats/TrackerRecHit2D Geometry/Records Geometry/TrackerGeometryBuilder CondCore/DBOutputService CondFormats/PhysicsToolsObjects CondFormats/DataRecord TrackingTools/TrajectoryState PhysicsTools/UtilAlgos HLTrigger/HLTcore rootcore root clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerDeDx_EX_LIB   := RecoTrackerDeDx
ALL_EXTERNAL_PRODS += RecoTrackerDeDx
endif
ifeq ($(strip $(TopQuarkAnalysis/TopEventSelection)),)
TopQuarkAnalysisTopEventSelection := self/TopQuarkAnalysis/TopEventSelection
TopQuarkAnalysis/TopEventSelection := TopQuarkAnalysisTopEventSelection
TopQuarkAnalysisTopEventSelection_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TopQuarkAnalysisTopEventSelection_EX_USE := $(foreach d, self  FWCore/Framework PhysicsTools/CandUtils TopQuarkAnalysis/TopTools DataFormats/PatCandidates AnalysisDataFormats/TopObjects,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TopQuarkAnalysisTopEventSelection_EX_LIB   := TopQuarkAnalysisTopEventSelection
ALL_EXTERNAL_PRODS += TopQuarkAnalysisTopEventSelection
endif
ifeq ($(strip $(RecoCaloTools/Selectors)),)
RecoCaloToolsSelectors := self/RecoCaloTools/Selectors
RecoCaloTools/Selectors := RecoCaloToolsSelectors
RecoCaloToolsSelectors_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoCaloToolsSelectors_EX_USE := $(foreach d, self  Geometry/CaloGeometry RecoCaloTools/MetaCollections,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoCaloToolsSelectors_EX_LIB   := RecoCaloToolsSelectors
ALL_EXTERNAL_PRODS += RecoCaloToolsSelectors
endif
ifeq ($(strip $(GeneratorInterface/CascadeInterface)),)
src_GeneratorInterface_CascadeInterface := self/GeneratorInterface/CascadeInterface
GeneratorInterface/CascadeInterface  := src_GeneratorInterface_CascadeInterface
src_GeneratorInterface_CascadeInterface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_GeneratorInterface_CascadeInterface_EX_USE := $(foreach d, SimDataFormats/GeneratorProducts cascade clhep boost GeneratorInterface/Core FWCore/Framework self pythia6 f77compiler,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_GeneratorInterface_CascadeInterface
endif

ifeq ($(strip $(EgammaAnalysis/ElectronTools)),)
EgammaAnalysisElectronTools := self/EgammaAnalysis/ElectronTools
EgammaAnalysis/ElectronTools := EgammaAnalysisElectronTools
EgammaAnalysisElectronTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EgammaAnalysisElectronTools_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ServiceRegistry FWCore/Utilities FWCore/MessageLogger FWCore/ParameterSet Geometry/CaloTopology CondCore/DBOutputService CondFormats/EgammaObjects CondFormats/PhysicsToolsObjects RecoEgamma/EgammaTools RecoEcal/EgammaCoreTools DataFormats/Candidate DataFormats/Common DataFormats/EgammaCandidates DataFormats/PatCandidates DataFormats/EgammaReco DataFormats/TrackReco TrackingTools/IPTools PhysicsTools/UtilAlgos clhep root roottmva,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EgammaAnalysisElectronTools_EX_LIB   := EgammaAnalysisElectronTools
ALL_EXTERNAL_PRODS += EgammaAnalysisElectronTools
endif
ifeq ($(strip $(SimDataFormats/JetMatching)),)
SimDataFormatsJetMatching := self/SimDataFormats/JetMatching
SimDataFormats/JetMatching := SimDataFormatsJetMatching
SimDataFormatsJetMatching_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsJetMatching_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/HepMCCandidate DataFormats/JetReco rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsJetMatching_LCGDICTS  := x 
SimDataFormatsJetMatching_EX_LIB   := SimDataFormatsJetMatching
ALL_EXTERNAL_PRODS += SimDataFormatsJetMatching
endif
ifeq ($(strip $(PhysicsTools/RecoAlgos)),)
PhysicsToolsRecoAlgos := self/PhysicsTools/RecoAlgos
PhysicsTools/RecoAlgos := PhysicsToolsRecoAlgos
PhysicsToolsRecoAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsRecoAlgos_EX_USE := $(foreach d, self  PhysicsTools/RecoUtils FWCore/ParameterSet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsRecoAlgos_EX_LIB   := PhysicsToolsRecoAlgos
ALL_EXTERNAL_PRODS += PhysicsToolsRecoAlgos
endif
ifeq ($(strip $(CalibTracker/SiStripCommon)),)
CalibTrackerSiStripCommon := self/CalibTracker/SiStripCommon
CalibTracker/SiStripCommon := CalibTrackerSiStripCommon
CalibTrackerSiStripCommon_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibTrackerSiStripCommon_EX_USE := $(foreach d, self  CondFormats/SiStripObjects DataFormats/Common DataFormats/SiStripDetId FWCore/Framework FWCore/MessageLogger FWCore/ServiceRegistry CondFormats/DataRecord rootrflx clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibTrackerSiStripCommon_EX_LIB   := CalibTrackerSiStripCommon
ALL_EXTERNAL_PRODS += CalibTrackerSiStripCommon
endif
ifeq ($(strip $(EventFilter/ShmBuffer)),)
EventFilterShmBuffer := self/EventFilter/ShmBuffer
EventFilter/ShmBuffer := EventFilterShmBuffer
EventFilterShmBuffer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterShmBuffer_EX_USE := $(foreach d, self  EventFilter/FEDInterface EventFilter/Utilities,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterShmBuffer_EX_LIB   := EventFilterShmBuffer
ALL_EXTERNAL_PRODS += EventFilterShmBuffer
endif
ifeq ($(strip $(RecoParticleFlow/PFRootEvent)),)
RecoParticleFlowPFRootEvent := self/RecoParticleFlow/PFRootEvent
RecoParticleFlow/PFRootEvent := RecoParticleFlowPFRootEvent
RecoParticleFlowPFRootEvent_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoParticleFlowPFRootEvent_EX_USE := $(foreach d, self  DQMServices/Core DataFormats/CaloTowers DataFormats/Candidate DataFormats/Common DataFormats/FWLite DataFormats/HepMCCandidate DataFormats/JetReco DataFormats/METReco DataFormats/Math DataFormats/MuonReco DataFormats/ParticleFlowCandidate DataFormats/ParticleFlowReco DataFormats/Provenance DataFormats/RecoCandidate DataFormats/TrackReco DataFormats/VertexReco FWCore/FWLite FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry Geometry/CaloTopology RecoParticleFlow/Benchmark RecoParticleFlow/PFClusterProducer RecoParticleFlow/PFClusterTools RecoParticleFlow/PFProducer RecoParticleFlow/PFTracking SimDataFormats/GeneratorProducts DQMOffline/PFTau fastjet rootinteractive rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoParticleFlowPFRootEvent_LCGDICTS  := x 
RecoParticleFlowPFRootEvent_EX_LIB   := RecoParticleFlowPFRootEvent
ALL_EXTERNAL_PRODS += RecoParticleFlowPFRootEvent
endif
ifeq ($(strip $(DataFormats/EgammaCandidates)),)
DataFormatsEgammaCandidates := self/DataFormats/EgammaCandidates
DataFormats/EgammaCandidates := DataFormatsEgammaCandidates
DataFormatsEgammaCandidates_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsEgammaCandidates_EX_USE := $(foreach d, self  DataFormats/Candidate DataFormats/Common DataFormats/EgammaReco DataFormats/CaloRecHit DataFormats/CaloTowers DataFormats/Math DataFormats/RecoCandidate DataFormats/TrackReco DataFormats/TrackerRecHit2D DataFormats/TrackingRecHit DataFormats/VertexReco DataFormats/GeometryCommonDetAlgo DataFormats/ParticleFlowCandidate FWCore/MessageLogger rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsEgammaCandidates_LCGDICTS  := x 
DataFormatsEgammaCandidates_EX_LIB   := DataFormatsEgammaCandidates
ALL_EXTERNAL_PRODS += DataFormatsEgammaCandidates
endif
ifeq ($(strip $(RecoMuon/TrackerSeedGenerator)),)
RecoMuonTrackerSeedGenerator := self/RecoMuon/TrackerSeedGenerator
RecoMuon/TrackerSeedGenerator := RecoMuonTrackerSeedGenerator
RecoMuonTrackerSeedGenerator_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoMuonTrackerSeedGenerator_EX_USE := $(foreach d, self  DataFormats/BeamSpot DataFormats/Common DataFormats/GeometryCommonDetAlgo DataFormats/GeometryVector DataFormats/L1GlobalMuonTrigger DataFormats/TrackReco DataFormats/TrackerRecHit2D DataFormats/TrackingRecHit DataFormats/TrajectorySeed FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager MagneticField/Engine MagneticField/Records RecoPixelVertexing/PixelTrackFitting RecoTracker/TkMSParametrization RecoTracker/TkSeedingLayers RecoTracker/TkTrackingRegions RecoTracker/TransientTrackingRecHit TrackingTools/PatternTools TrackingTools/Records TrackingTools/TrajectoryState TrackingTools/TransientTrackingRecHit,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoMuonTrackerSeedGenerator_EX_LIB   := RecoMuonTrackerSeedGenerator
ALL_EXTERNAL_PRODS += RecoMuonTrackerSeedGenerator
endif
ifeq ($(strip $(GeneratorInterface/Core)),)
GeneratorInterfaceCore := self/GeneratorInterface/Core
GeneratorInterface/Core := GeneratorInterfaceCore
GeneratorInterfaceCore_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfaceCore_EX_USE := $(foreach d, self  FWCore/ServiceRegistry FWCore/Utilities SimDataFormats/GeneratorProducts GeneratorInterface/LHEInterface boost clhep lhapdf f77compiler,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeneratorInterfaceCore_EX_LIB   := GeneratorInterfaceCore
ALL_EXTERNAL_PRODS += GeneratorInterfaceCore
endif
ifeq ($(strip $(DQM/EcalEndcapMonitorClient)),)
DQMEcalEndcapMonitorClient := self/DQM/EcalEndcapMonitorClient
DQM/EcalEndcapMonitorClient := DQMEcalEndcapMonitorClient
DQMEcalEndcapMonitorClient_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMEcalEndcapMonitorClient_EX_USE := $(foreach d, self  DQM/EcalCommon DQMServices/Core DataFormats/EcalDetId FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMEcalEndcapMonitorClient_EX_LIB   := DQMEcalEndcapMonitorClient
ALL_EXTERNAL_PRODS += DQMEcalEndcapMonitorClient
endif
ifeq ($(strip $(PhysicsTools/MVAComputer)),)
PhysicsToolsMVAComputer := self/PhysicsTools/MVAComputer
PhysicsTools/MVAComputer := PhysicsToolsMVAComputer
PhysicsToolsMVAComputer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsMVAComputer_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet FWCore/Utilities CondFormats/PhysicsToolsObjects rootcore boost zlib,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsMVAComputer_LCGDICTS  := x 
PhysicsToolsMVAComputer_EX_LIB   := PhysicsToolsMVAComputer
ALL_EXTERNAL_PRODS += PhysicsToolsMVAComputer
endif
ifeq ($(strip $(RecoLocalCalo/EcalRecAlgos)),)
RecoLocalCaloEcalRecAlgos := self/RecoLocalCalo/EcalRecAlgos
RecoLocalCalo/EcalRecAlgos := RecoLocalCaloEcalRecAlgos
RecoLocalCaloEcalRecAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoLocalCaloEcalRecAlgos_EX_USE := $(foreach d, self  clhep DataFormats/EcalRecHit root rootminuit FWCore/MessageLogger FWCore/ParameterSet FWCore/Framework CondFormats/ESObjects CondFormats/EcalObjects CondFormats/DataRecord,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoLocalCaloEcalRecAlgos_EX_LIB   := RecoLocalCaloEcalRecAlgos
ALL_EXTERNAL_PRODS += RecoLocalCaloEcalRecAlgos
endif
ifeq ($(strip $(EventFilter/CSCRawToDigi)),)
EventFilterCSCRawToDigi := self/EventFilter/CSCRawToDigi
EventFilter/CSCRawToDigi := EventFilterCSCRawToDigi
EventFilterCSCRawToDigi_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterCSCRawToDigi_EX_USE := $(foreach d, self  DataFormats/CSCDigi FWCore/Framework DataFormats/FEDRawData CondFormats/CSCObjects FWCore/MessageLogger FWCore/Utilities CondFormats/DataRecord DataFormats/L1CSCTrackFinder,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterCSCRawToDigi_EX_LIB   := EventFilterCSCRawToDigi
ALL_EXTERNAL_PRODS += EventFilterCSCRawToDigi
endif
ifeq ($(strip $(Geometry/ForwardGeometry)),)
GeometryForwardGeometry := self/Geometry/ForwardGeometry
Geometry/ForwardGeometry := GeometryForwardGeometry
GeometryForwardGeometry_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryForwardGeometry_EX_USE := $(foreach d, self  Geometry/CaloGeometry Geometry/CaloTopology DataFormats/HcalDetId DataFormats/CaloTowers FWCore/MessageLogger clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryForwardGeometry_EX_LIB   := GeometryForwardGeometry
ALL_EXTERNAL_PRODS += GeometryForwardGeometry
endif
ifeq ($(strip $(Geometry/TrackingGeometryAligner)),)
src_Geometry_TrackingGeometryAligner := self/Geometry/TrackingGeometryAligner
Geometry/TrackingGeometryAligner  := src_Geometry_TrackingGeometryAligner
src_Geometry_TrackingGeometryAligner_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_Geometry_TrackingGeometryAligner_EX_USE := $(foreach d, self,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_Geometry_TrackingGeometryAligner
endif

ifeq ($(strip $(RecoJets/JetAssociationAlgorithms)),)
RecoJetsJetAssociationAlgorithms := self/RecoJets/JetAssociationAlgorithms
RecoJets/JetAssociationAlgorithms := RecoJetsJetAssociationAlgorithms
RecoJetsJetAssociationAlgorithms_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoJetsJetAssociationAlgorithms_EX_USE := $(foreach d, self  DataFormats/Math DataFormats/JetReco DataFormats/TrackReco DataFormats/VertexReco DataFormats/GeometrySurface TrackingTools/GeomPropagators TrackingTools/TrajectoryParametrization TrackingTools/TrajectoryState TrackingTools/TransientTrack Geometry/CaloGeometry,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoJetsJetAssociationAlgorithms_EX_LIB   := RecoJetsJetAssociationAlgorithms
ALL_EXTERNAL_PRODS += RecoJetsJetAssociationAlgorithms
endif
ifeq ($(strip $(Calibration/EcalTBTools)),)
CalibrationEcalTBTools := self/Calibration/EcalTBTools
Calibration/EcalTBTools := CalibrationEcalTBTools
CalibrationEcalTBTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibrationEcalTBTools_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet root clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibrationEcalTBTools_ROOTDICT  := LinkDef
CalibrationEcalTBTools_EX_LIB   := CalibrationEcalTBTools
ALL_EXTERNAL_PRODS += CalibrationEcalTBTools
endif
ifeq ($(strip $(CommonTools/UtilAlgos)),)
CommonToolsUtilAlgos := self/CommonTools/UtilAlgos
CommonTools/UtilAlgos := CommonToolsUtilAlgos
CommonToolsUtilAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CommonToolsUtilAlgos_EX_USE := $(foreach d, self  CommonTools/Utils FWCore/ServiceRegistry FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities DataFormats/Provenance roothistmatrix,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CommonToolsUtilAlgos_EX_LIB   := CommonToolsUtilAlgos
ALL_EXTERNAL_PRODS += CommonToolsUtilAlgos
endif
ifeq ($(strip $(CondFormats/SiStripObjects)),)
CondFormatsSiStripObjects := self/CondFormats/SiStripObjects
CondFormats/SiStripObjects := CondFormatsSiStripObjects
CondFormatsSiStripObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsSiStripObjects_EX_USE := $(foreach d, self  CondFormats/Common DataFormats/SiStripCommon DataFormats/SiStripDetId DataFormats/FEDRawData FWCore/MessageLogger FWCore/Utilities boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsSiStripObjects_LCGDICTS  := x 
CondFormatsSiStripObjects_EX_LIB   := CondFormatsSiStripObjects
ALL_EXTERNAL_PRODS += CondFormatsSiStripObjects
endif
ifeq ($(strip $(DQM/EcalCommon)),)
DQMEcalCommon := self/DQM/EcalCommon
DQM/EcalCommon := DQMEcalCommon
DQMEcalCommon_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMEcalCommon_EX_USE := $(foreach d, self  DataFormats/DetId DataFormats/EcalDetId DataFormats/EcalRawData DataFormats/FEDRawData FWCore/Utilities FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry Geometry/EcalMapping Geometry/CaloTopology Geometry/CaloGeometry Geometry/Records CondCore/DBOutputService CondFormats/DataRecord CondFormats/EcalObjects DQMServices/Core rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMEcalCommon_EX_LIB   := DQMEcalCommon
ALL_EXTERNAL_PRODS += DQMEcalCommon
endif
ifeq ($(strip $(CalibTracker/SiPixelTools)),)
CalibTrackerSiPixelTools := self/CalibTracker/SiPixelTools
CalibTracker/SiPixelTools := CalibTrackerSiPixelTools
CalibTrackerSiPixelTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibTrackerSiPixelTools_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/MessageLogger FWCore/ServiceRegistry DataFormats/FEDRawData DataFormats/SiPixelDigi CondFormats/DataRecord CondFormats/SiPixelObjects CondCore/DBOutputService Geometry/Records root Geometry/CommonDetUnit Geometry/TrackerGeometryBuilder CalibFormats/SiPixelObjects DQM/SiPixelCommon DQMServices/Core,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibTrackerSiPixelTools_EX_LIB   := CalibTrackerSiPixelTools
ALL_EXTERNAL_PRODS += CalibTrackerSiPixelTools
endif
ifeq ($(strip $(DataFormats/L1Trigger)),)
DataFormatsL1Trigger := self/DataFormats/L1Trigger
DataFormats/L1Trigger := DataFormatsL1Trigger
DataFormatsL1Trigger_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsL1Trigger_EX_USE := $(foreach d, self  DataFormats/Candidate DataFormats/Common DataFormats/L1GlobalMuonTrigger rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsL1Trigger_LCGDICTS  := x 
DataFormatsL1Trigger_EX_LIB   := DataFormatsL1Trigger
ALL_EXTERNAL_PRODS += DataFormatsL1Trigger
endif
ifeq ($(strip $(CalibCalorimetry/CaloTPG)),)
CalibCalorimetryCaloTPG := self/CalibCalorimetry/CaloTPG
CalibCalorimetry/CaloTPG := CalibCalorimetryCaloTPG
CalibCalorimetryCaloTPG_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibCalorimetryCaloTPG_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet CalibFormats/CaloTPG CalibFormats/HcalObjects Geometry/CaloTopology Geometry/HcalTowerAlgo,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibCalorimetryCaloTPG_EX_LIB   := CalibCalorimetryCaloTPG
ALL_EXTERNAL_PRODS += CalibCalorimetryCaloTPG
endif
ifeq ($(strip $(RecoLuminosity/ROOTSchema)),)
RecoLuminosityROOTSchema := self/RecoLuminosity/ROOTSchema
RecoLuminosity/ROOTSchema := RecoLuminosityROOTSchema
RecoLuminosityROOTSchema_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoLuminosityROOTSchema_EX_USE := $(foreach d, self  rootgraphics RecoLuminosity/TCPReceiver,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoLuminosityROOTSchema_ROOTDICT  := LinkDef
RecoLuminosityROOTSchema_EX_LIB   := RecoLuminosityROOTSchema
ALL_EXTERNAL_PRODS += RecoLuminosityROOTSchema
endif
ifeq ($(strip $(SimDataFormats/EcalTestBeam)),)
SimDataFormatsEcalTestBeam := self/SimDataFormats/EcalTestBeam
SimDataFormats/EcalTestBeam := SimDataFormatsEcalTestBeam
SimDataFormatsEcalTestBeam_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsEcalTestBeam_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/DetId DataFormats/CaloTowers rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsEcalTestBeam_LCGDICTS  := x 
SimDataFormatsEcalTestBeam_EX_LIB   := SimDataFormatsEcalTestBeam
ALL_EXTERNAL_PRODS += SimDataFormatsEcalTestBeam
endif
ifeq ($(strip $(SimCalorimetry/EcalSelectiveReadoutProducers)),)
SimCalorimetryEcalSelectiveReadoutProducers := self/SimCalorimetry/EcalSelectiveReadoutProducers
SimCalorimetry/EcalSelectiveReadoutProducers := SimCalorimetryEcalSelectiveReadoutProducers
SimCalorimetryEcalSelectiveReadoutProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimCalorimetryEcalSelectiveReadoutProducers_EX_USE := $(foreach d, self  SimCalorimetry/EcalSelectiveReadoutAlgos FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger DataFormats/EcalDigi DataFormats/EcalDetId CondFormats/DataRecord CondFormats/EcalObjects CondCore/EcalPlugins CondCore/DBOutputService CondCore/DBCommon,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimCalorimetryEcalSelectiveReadoutProducers_EX_LIB   := SimCalorimetryEcalSelectiveReadoutProducers
ALL_EXTERNAL_PRODS += SimCalorimetryEcalSelectiveReadoutProducers
endif
ifeq ($(strip $(SimCalorimetry/CastorSim)),)
SimCalorimetryCastorSim := self/SimCalorimetry/CastorSim
SimCalorimetry/CastorSim := SimCalorimetryCastorSim
SimCalorimetryCastorSim_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimCalorimetryCastorSim_EX_USE := $(foreach d, self  SimCalorimetry/CaloSimAlgos CondFormats/CastorObjects CalibCalorimetry/CastorCalib CalibFormats/CastorObjects CalibCalorimetry/HcalAlgos DataFormats/HcalDigi Geometry/HcalTowerAlgo clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimCalorimetryCastorSim_EX_LIB   := SimCalorimetryCastorSim
ALL_EXTERNAL_PRODS += SimCalorimetryCastorSim
endif
ifeq ($(strip $(DataFormats/METReco)),)
DataFormatsMETReco := self/DataFormats/METReco
DataFormats/METReco := DataFormatsMETReco
DataFormatsMETReco_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsMETReco_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/RecoCandidate FWCore/Utilities boost root rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsMETReco_LCGDICTS  := x 
DataFormatsMETReco_EX_LIB   := DataFormatsMETReco
ALL_EXTERNAL_PRODS += DataFormatsMETReco
endif
ifeq ($(strip $(CondFormats/AlignmentRecord)),)
CondFormatsAlignmentRecord := self/CondFormats/AlignmentRecord
CondFormats/AlignmentRecord := CondFormatsAlignmentRecord
CondFormatsAlignmentRecord_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsAlignmentRecord_EX_USE := $(foreach d, self  FWCore/Framework,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsAlignmentRecord_EX_LIB   := CondFormatsAlignmentRecord
ALL_EXTERNAL_PRODS += CondFormatsAlignmentRecord
endif
ifeq ($(strip $(Geometry/CommonDetUnit)),)
GeometryCommonDetUnit := self/Geometry/CommonDetUnit
Geometry/CommonDetUnit := GeometryCommonDetUnit
GeometryCommonDetUnit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryCommonDetUnit_EX_USE := $(foreach d, self  DataFormats/GeometrySurface FWCore/Utilities clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryCommonDetUnit_EX_LIB   := GeometryCommonDetUnit
ALL_EXTERNAL_PRODS += GeometryCommonDetUnit
endif
ifeq ($(strip $(DQM/HcalMonitorTasks)),)
DQMHcalMonitorTasks := self/DQM/HcalMonitorTasks
DQM/HcalMonitorTasks := DQMHcalMonitorTasks
DQMHcalMonitorTasks_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMHcalMonitorTasks_EX_USE := $(foreach d, self  DataFormats/HcalRecHit DataFormats/HcalDigi TBDataFormats/HcalTBObjects EventFilter/HcalRawToDigi CalibFormats/HcalObjects CalibCalorimetry/HcalAlgos Geometry/HcalTowerAlgo FWCore/ParameterSet FWCore/Framework FWCore/MessageLogger DQMServices/Core rootmath DataFormats/L1GlobalTrigger DataFormats/L1GlobalMuonTrigger DataFormats/Math DataFormats/Common DataFormats/L1Trigger DataFormats/L1GlobalCaloTrigger DataFormats/Candidate L1Trigger/RegionalCaloTrigger DataFormats/L1CaloTrigger DataFormats/EcalDigi HLTrigger/HLTanalyzers DataFormats/METReco DataFormats/JetReco DataFormats/TrackReco RecoMET/METAlgorithms CondFormats/RunInfo,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMHcalMonitorTasks_EX_LIB   := DQMHcalMonitorTasks
ALL_EXTERNAL_PRODS += DQMHcalMonitorTasks
endif
ifeq ($(strip $(RecoLocalCalo/EcalDeadChannelRecoveryAlgos)),)
RecoLocalCaloEcalDeadChannelRecoveryAlgos := self/RecoLocalCalo/EcalDeadChannelRecoveryAlgos
RecoLocalCalo/EcalDeadChannelRecoveryAlgos := RecoLocalCaloEcalDeadChannelRecoveryAlgos
RecoLocalCaloEcalDeadChannelRecoveryAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoLocalCaloEcalDeadChannelRecoveryAlgos_EX_USE := $(foreach d, self  DataFormats/EcalDetId DataFormats/EcalRecHit Geometry/CaloGeometry Geometry/CaloTopology Geometry/Records rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoLocalCaloEcalDeadChannelRecoveryAlgos_EX_LIB   := RecoLocalCaloEcalDeadChannelRecoveryAlgos
ALL_EXTERNAL_PRODS += RecoLocalCaloEcalDeadChannelRecoveryAlgos
endif
ifeq ($(strip $(RecoLocalCalo/HcalRecAlgos)),)
RecoLocalCaloHcalRecAlgos := self/RecoLocalCalo/HcalRecAlgos
RecoLocalCalo/HcalRecAlgos := RecoLocalCaloHcalRecAlgos
RecoLocalCaloHcalRecAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoLocalCaloHcalRecAlgos_EX_USE := $(foreach d, self  boost DataFormats/HcalDigi DataFormats/HcalRecHit CalibFormats/HcalObjects CalibFormats/CaloObjects CalibCalorimetry/HcalAlgos RecoMET/METAlgorithms DataFormats/CaloTowers FWCore/Framework FWCore/PluginManager FWCore/ParameterSet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoLocalCaloHcalRecAlgos_EX_LIB   := RecoLocalCaloHcalRecAlgos
ALL_EXTERNAL_PRODS += RecoLocalCaloHcalRecAlgos
endif
ifeq ($(strip $(L1Trigger/CSCTriggerPrimitives)),)
L1TriggerCSCTriggerPrimitives := self/L1Trigger/CSCTriggerPrimitives
L1Trigger/CSCTriggerPrimitives := L1TriggerCSCTriggerPrimitives
L1TriggerCSCTriggerPrimitives_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerCSCTriggerPrimitives_EX_USE := $(foreach d, self  CondFormats/CSCObjects DataFormats/CSCDigi DataFormats/L1CSCTrackFinder DataFormats/MuonDetId FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities L1Trigger/CSCCommonTrigger,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerCSCTriggerPrimitives_EX_LIB   := L1TriggerCSCTriggerPrimitives
ALL_EXTERNAL_PRODS += L1TriggerCSCTriggerPrimitives
endif
ifeq ($(strip $(SimG4Core/Notification)),)
SimG4CoreNotification := self/SimG4Core/Notification
SimG4Core/Notification := SimG4CoreNotification
SimG4CoreNotification_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CoreNotification_EX_USE := $(foreach d, self  geant4core FWCore/MessageLogger rootmath expat,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CoreNotification_EX_LIB   := SimG4CoreNotification
ALL_EXTERNAL_PRODS += SimG4CoreNotification
endif
ifeq ($(strip $(RecoBTag/BTagTools)),)
RecoBTagBTagTools := self/RecoBTag/BTagTools
RecoBTag/BTagTools := RecoBTagBTagTools
RecoBTagBTagTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoBTagBTagTools_EX_USE := $(foreach d, self  DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/VertexReco FWCore/MessageLogger TrackingTools/GeomPropagators TrackingTools/PatternTools TrackingTools/TrajectoryState clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoBTagBTagTools_EX_LIB   := RecoBTagBTagTools
ALL_EXTERNAL_PRODS += RecoBTagBTagTools
endif
ifeq ($(strip $(CondCore/PluginSystem)),)
src_CondCore_PluginSystem := self/CondCore/PluginSystem
CondCore/PluginSystem  := src_CondCore_PluginSystem
src_CondCore_PluginSystem_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_CondCore_PluginSystem_EX_USE := $(foreach d, CondCore/ESSources self,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_CondCore_PluginSystem
endif

ifeq ($(strip $(GeneratorInterface/LHEInterface)),)
GeneratorInterfaceLHEInterface := self/GeneratorInterface/LHEInterface
GeneratorInterface/LHEInterface := GeneratorInterfaceLHEInterface
GeneratorInterfaceLHEInterface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfaceLHEInterface_EX_USE := $(foreach d, self  FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities SimDataFormats/GeneratorProducts Utilities/StorageFactory hepmc boost sigcpp xerces-c rootmath libhepml fastjet xz,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeneratorInterfaceLHEInterface_EX_LIB   := GeneratorInterfaceLHEInterface
ALL_EXTERNAL_PRODS += GeneratorInterfaceLHEInterface
endif
ifeq ($(strip $(L1Trigger/DTTriggerServerPhi)),)
L1TriggerDTTriggerServerPhi := self/L1Trigger/DTTriggerServerPhi
L1Trigger/DTTriggerServerPhi := L1TriggerDTTriggerServerPhi
L1TriggerDTTriggerServerPhi_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerDTTriggerServerPhi_EX_USE := $(foreach d, self  FWCore/PluginManager FWCore/ParameterSet Geometry/DTGeometry L1TriggerConfig/DTTPGConfig L1Trigger/DTUtilities L1Trigger/DTTraco clhep root rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerDTTriggerServerPhi_EX_LIB   := L1TriggerDTTriggerServerPhi
ALL_EXTERNAL_PRODS += L1TriggerDTTriggerServerPhi
endif
ifeq ($(strip $(SimG4Core/SensitiveDetector)),)
SimG4CoreSensitiveDetector := self/SimG4Core/SensitiveDetector
SimG4Core/SensitiveDetector := SimG4CoreSensitiveDetector
SimG4CoreSensitiveDetector_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CoreSensitiveDetector_EX_USE := $(foreach d, self  SimG4Core/Geometry boost geant4core sigcpp,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CoreSensitiveDetector_EX_LIB   := SimG4CoreSensitiveDetector
ALL_EXTERNAL_PRODS += SimG4CoreSensitiveDetector
endif
ifeq ($(strip $(EventFilter/RPCRawToDigi)),)
EventFilterRPCRawToDigi := self/EventFilter/RPCRawToDigi
EventFilter/RPCRawToDigi := EventFilterRPCRawToDigi
EventFilterRPCRawToDigi_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterRPCRawToDigi_EX_USE := $(foreach d, self  FWCore/Framework DataFormats/FEDRawData FWCore/PluginManager FWCore/ParameterSet DataFormats/RPCDigi CondFormats/DataRecord CondFormats/RPCObjects FWCore/MessageLogger rootrflx boost root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterRPCRawToDigi_EX_LIB   := EventFilterRPCRawToDigi
ALL_EXTERNAL_PRODS += EventFilterRPCRawToDigi
endif
ifeq ($(strip $(IOPool/Streamer)),)
IOPoolStreamer := self/IOPool/Streamer
IOPool/Streamer := IOPoolStreamer
IOPoolStreamer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
IOPoolStreamer_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/Provenance DataFormats/Streamer FWCore/Catalog FWCore/Framework FWCore/ParameterSet FWCore/PluginManager FWCore/RootAutoLibraryLoader FWCore/ServiceRegistry FWCore/Sources FWCore/Utilities FWCore/Version Utilities/StorageFactory boost rootcintex rootcore rootrflx zlib,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
IOPoolStreamer_EX_LIB   := IOPoolStreamer
ALL_EXTERNAL_PRODS += IOPoolStreamer
endif
ifeq ($(strip $(GeneratorInterface/PartonShowerVeto)),)
GeneratorInterfacePartonShowerVeto := self/GeneratorInterface/PartonShowerVeto
GeneratorInterface/PartonShowerVeto := GeneratorInterfacePartonShowerVeto
GeneratorInterfacePartonShowerVeto_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfacePartonShowerVeto_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet SimDataFormats/GeneratorProducts hepmc GeneratorInterface/Pythia6Interface GeneratorInterface/AlpgenInterface GeneratorInterface/LHEInterface f77compiler,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeneratorInterfacePartonShowerVeto_EX_LIB   := GeneratorInterfacePartonShowerVeto
ALL_EXTERNAL_PRODS += GeneratorInterfacePartonShowerVeto
endif
ifeq ($(strip $(RecoEgamma/EgammaTools)),)
RecoEgammaEgammaTools := self/RecoEgamma/EgammaTools
RecoEgamma/EgammaTools := RecoEgammaEgammaTools
RecoEgammaEgammaTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoEgammaEgammaTools_EX_USE := $(foreach d, self  FWCore/Framework DataFormats/HcalRecHit DataFormats/EgammaReco DataFormats/EgammaCandidates Geometry/CaloGeometry RecoCaloTools/MetaCollections clhep root PhysicsTools/MVAComputer PhysicsTools/MVATrainer CondFormats/DataRecord CondFormats/EgammaObjects CondCore/EgammaPlugins RecoEcal/EgammaCoreTools CondCore/DBOutputService roottmva,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoEgammaEgammaTools_EX_LIB   := RecoEgammaEgammaTools
ALL_EXTERNAL_PRODS += RecoEgammaEgammaTools
endif
ifeq ($(strip $(SimG4Core/PhysicsLists)),)
SimG4CorePhysicsLists := self/SimG4Core/PhysicsLists
SimG4Core/PhysicsLists := SimG4CorePhysicsLists
SimG4CorePhysicsLists_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CorePhysicsLists_EX_USE := $(foreach d, self  FWCore/MessageLogger SimG4Core/Physics SimG4Core/MagneticField geant4core heppdt expat,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CorePhysicsLists_EX_LIB   := SimG4CorePhysicsLists
ALL_EXTERNAL_PRODS += SimG4CorePhysicsLists
endif
ifeq ($(strip $(Geometry/HcalCommonData)),)
GeometryHcalCommonData := self/Geometry/HcalCommonData
Geometry/HcalCommonData := GeometryHcalCommonData
GeometryHcalCommonData_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryHcalCommonData_EX_USE := $(foreach d, self  DetectorDescription/Base DetectorDescription/Core,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryHcalCommonData_EX_LIB   := GeometryHcalCommonData
ALL_EXTERNAL_PRODS += GeometryHcalCommonData
endif
ifeq ($(strip $(CalibTracker/SiStripAPVAnalysis)),)
CalibTrackerSiStripAPVAnalysis := self/CalibTracker/SiStripAPVAnalysis
CalibTracker/SiStripAPVAnalysis := CalibTrackerSiStripAPVAnalysis
CalibTrackerSiStripAPVAnalysis_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibTrackerSiStripAPVAnalysis_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/ServiceRegistry FWCore/Utilities DataFormats/Common CondFormats/SiStripObjects CondFormats/DataRecord,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibTrackerSiStripAPVAnalysis_EX_LIB   := CalibTrackerSiStripAPVAnalysis
ALL_EXTERNAL_PRODS += CalibTrackerSiStripAPVAnalysis
endif
ifeq ($(strip $(SimG4Core/CustomPhysics)),)
SimG4CoreCustomPhysics := self/SimG4Core/CustomPhysics
SimG4Core/CustomPhysics := SimG4CoreCustomPhysics
SimG4CoreCustomPhysics_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CoreCustomPhysics_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager FWCore/MessageLogger SimG4Core/Physics SimG4Core/PhysicsLists geant4core clhep boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CoreCustomPhysics_EX_LIB   := SimG4CoreCustomPhysics
ALL_EXTERNAL_PRODS += SimG4CoreCustomPhysics
endif
ifeq ($(strip $(PerfTools/EdmEvent)),)
PerfToolsEdmEvent := self/PerfTools/EdmEvent
PerfTools/EdmEvent := PerfToolsEdmEvent
PerfToolsEdmEvent_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PerfToolsEdmEvent_EX_USE := $(foreach d, self  FWCore/FWLite rootgraphics boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PerfToolsEdmEvent_EX_LIB   := PerfToolsEdmEvent
ALL_EXTERNAL_PRODS += PerfToolsEdmEvent
endif
ifeq ($(strip $(DataFormats/HcalDigi)),)
DataFormatsHcalDigi := self/DataFormats/HcalDigi
DataFormats/HcalDigi := DataFormatsHcalDigi
DataFormatsHcalDigi_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsHcalDigi_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/HcalDetId boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsHcalDigi_LCGDICTS  := x 
DataFormatsHcalDigi_EX_LIB   := DataFormatsHcalDigi
ALL_EXTERNAL_PRODS += DataFormatsHcalDigi
endif
ifeq ($(strip $(AnalysisDataFormats/Egamma)),)
AnalysisDataFormatsEgamma := self/AnalysisDataFormats/Egamma
AnalysisDataFormats/Egamma := AnalysisDataFormatsEgamma
AnalysisDataFormatsEgamma_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AnalysisDataFormatsEgamma_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/Math rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AnalysisDataFormatsEgamma_LCGDICTS  := x 
AnalysisDataFormatsEgamma_EX_LIB   := AnalysisDataFormatsEgamma
ALL_EXTERNAL_PRODS += AnalysisDataFormatsEgamma
endif
ifeq ($(strip $(TBDataFormats/HcalTBObjects)),)
TBDataFormatsHcalTBObjects := self/TBDataFormats/HcalTBObjects
TBDataFormats/HcalTBObjects := TBDataFormatsHcalTBObjects
TBDataFormatsHcalTBObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TBDataFormatsHcalTBObjects_EX_USE := $(foreach d, self  DataFormats/Common boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TBDataFormatsHcalTBObjects_LCGDICTS  := x 
TBDataFormatsHcalTBObjects_EX_LIB   := TBDataFormatsHcalTBObjects
ALL_EXTERNAL_PRODS += TBDataFormatsHcalTBObjects
endif
ifeq ($(strip $(RecoTracker/RingRecord)),)
RecoTrackerRingRecord := self/RecoTracker/RingRecord
RecoTracker/RingRecord := RecoTrackerRingRecord
RecoTrackerRingRecord_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerRingRecord_EX_USE := $(foreach d, self  FWCore/Framework FWCore/MessageLogger DataFormats/DetId DataFormats/SiStripDetId Geometry/Records,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerRingRecord_EX_LIB   := RecoTrackerRingRecord
ALL_EXTERNAL_PRODS += RecoTrackerRingRecord
endif
ifeq ($(strip $(CondCore/ESSources)),)
CondCoreESSources := self/CondCore/ESSources
CondCore/ESSources := CondCoreESSources
CondCoreESSources_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondCoreESSources_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet CondCore/DBCommon CondCore/IOVService CondCore/MetaDataService CondCore/TagCollection,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondCoreESSources_EX_LIB   := CondCoreESSources
ALL_EXTERNAL_PRODS += CondCoreESSources
endif
ifeq ($(strip $(GeneratorInterface/ThePEGInterface)),)
GeneratorInterfaceThePEGInterface := self/GeneratorInterface/ThePEGInterface
GeneratorInterface/ThePEGInterface := GeneratorInterfaceThePEGInterface
GeneratorInterfaceThePEGInterface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfaceThePEGInterface_EX_USE := $(foreach d, self  SimDataFormats/GeneratorProducts GeneratorInterface/Core hepmc thepeg,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeneratorInterfaceThePEGInterface_EX_LIB   := GeneratorInterfaceThePEGInterface
ALL_EXTERNAL_PRODS += GeneratorInterfaceThePEGInterface
endif
ifeq ($(strip $(CondFormats/RecoMuonObjects)),)
CondFormatsRecoMuonObjects := self/CondFormats/RecoMuonObjects
CondFormats/RecoMuonObjects := CondFormatsRecoMuonObjects
CondFormatsRecoMuonObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsRecoMuonObjects_EX_USE := $(foreach d, self  FWCore/Utilities CondFormats/Common CondFormats/PhysicsToolsObjects rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsRecoMuonObjects_LCGDICTS  := x 
CondFormatsRecoMuonObjects_EX_LIB   := CondFormatsRecoMuonObjects
ALL_EXTERNAL_PRODS += CondFormatsRecoMuonObjects
endif
ifeq ($(strip $(DataFormats/MuonSeed)),)
DataFormatsMuonSeed := self/DataFormats/MuonSeed
DataFormats/MuonSeed := DataFormatsMuonSeed
DataFormatsMuonSeed_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsMuonSeed_EX_USE := $(foreach d, self  rootrflx clhepheader DataFormats/Common,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsMuonSeed_LCGDICTS  := x 
DataFormatsMuonSeed_EX_LIB   := DataFormatsMuonSeed
ALL_EXTERNAL_PRODS += DataFormatsMuonSeed
endif
ifeq ($(strip $(Alignment/CocoaModel)),)
AlignmentCocoaModel := self/Alignment/CocoaModel
Alignment/CocoaModel := AlignmentCocoaModel
AlignmentCocoaModel_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentCocoaModel_EX_USE := $(foreach d, self  clhep Alignment/CocoaUtilities Alignment/CocoaDDLObjects Alignment/CocoaDaq CondFormats/OptAlignObjects FWCore/ParameterSet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentCocoaModel_EX_LIB   := AlignmentCocoaModel
ALL_EXTERNAL_PRODS += AlignmentCocoaModel
endif
ifeq ($(strip $(AnalysisDataFormats/SUSYBSMObjects)),)
AnalysisDataFormatsSUSYBSMObjects := self/AnalysisDataFormats/SUSYBSMObjects
AnalysisDataFormats/SUSYBSMObjects := AnalysisDataFormatsSUSYBSMObjects
AnalysisDataFormatsSUSYBSMObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AnalysisDataFormatsSUSYBSMObjects_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/MuonReco FWCore/Utilities rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AnalysisDataFormatsSUSYBSMObjects_LCGDICTS  := x 
AnalysisDataFormatsSUSYBSMObjects_EX_LIB   := AnalysisDataFormatsSUSYBSMObjects
ALL_EXTERNAL_PRODS += AnalysisDataFormatsSUSYBSMObjects
endif
ifeq ($(strip $(TrackingTools/TransientTrack)),)
TrackingToolsTransientTrack := self/TrackingTools/TransientTrack
TrackingTools/TransientTrack := TrackingToolsTransientTrack
TrackingToolsTransientTrack_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsTransientTrack_EX_USE := $(foreach d, self  DataFormats/BeamSpot DataFormats/Common DataFormats/GeometrySurface DataFormats/GsfTrackReco DataFormats/TrackReco DataFormats/TrackingRecHit FWCore/Framework FWCore/MessageLogger Geometry/CommonDetUnit Geometry/Records TrackingTools/GeomPropagators TrackingTools/GsfTools TrackingTools/PatternTools TrackingTools/TrajectoryState,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsTransientTrack_EX_LIB   := TrackingToolsTransientTrack
ALL_EXTERNAL_PRODS += TrackingToolsTransientTrack
endif
ifeq ($(strip $(RecoLocalTracker/SiPixelRecHits)),)
RecoLocalTrackerSiPixelRecHits := self/RecoLocalTracker/SiPixelRecHits
RecoLocalTracker/SiPixelRecHits := RecoLocalTrackerSiPixelRecHits
RecoLocalTrackerSiPixelRecHits_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoLocalTrackerSiPixelRecHits_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet CondFormats/SiPixelObjects CalibTracker/SiPixelESProducers DataFormats/TrackerRecHit2D TrackingTools/TrajectoryState boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoLocalTrackerSiPixelRecHits_EX_LIB   := RecoLocalTrackerSiPixelRecHits
ALL_EXTERNAL_PRODS += RecoLocalTrackerSiPixelRecHits
endif
ifeq ($(strip $(Utilities/BinningTools)),)
UtilitiesBinningTools := self/Utilities/BinningTools
Utilities/BinningTools := UtilitiesBinningTools
UtilitiesBinningTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
UtilitiesBinningTools_EX_USE := $(foreach d, self  ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
UtilitiesBinningTools_EX_LIB   := UtilitiesBinningTools
ALL_EXTERNAL_PRODS += UtilitiesBinningTools
endif
ifeq ($(strip $(L1Trigger/RPCTrigger)),)
L1TriggerRPCTrigger := self/L1Trigger/RPCTrigger
L1Trigger/RPCTrigger := L1TriggerRPCTrigger
L1TriggerRPCTrigger_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerRPCTrigger_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/RPCDigi Geometry/RPCGeometry Geometry/Records Geometry/CommonDetUnit Geometry/CommonTopologies DataFormats/MuonDetId DataFormats/L1GlobalMuonTrigger xerces-c CondFormats/RPCObjects CondFormats/L1TObjects CondFormats/DataRecord,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerRPCTrigger_EX_LIB   := L1TriggerRPCTrigger
ALL_EXTERNAL_PRODS += L1TriggerRPCTrigger
endif
ifeq ($(strip $(RecoParticleFlow/PFClusterShapeProducer)),)
RecoParticleFlowPFClusterShapeProducer := self/RecoParticleFlow/PFClusterShapeProducer
RecoParticleFlow/PFClusterShapeProducer := RecoParticleFlowPFClusterShapeProducer
RecoParticleFlowPFClusterShapeProducer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoParticleFlowPFClusterShapeProducer_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/EgammaReco,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoParticleFlowPFClusterShapeProducer_EX_LIB   := RecoParticleFlowPFClusterShapeProducer
ALL_EXTERNAL_PRODS += RecoParticleFlowPFClusterShapeProducer
endif
ifeq ($(strip $(GeneratorInterface/ExhumeInterface)),)
GeneratorInterfaceExhumeInterface := self/GeneratorInterface/ExhumeInterface
GeneratorInterface/ExhumeInterface := GeneratorInterfaceExhumeInterface
GeneratorInterfaceExhumeInterface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfaceExhumeInterface_EX_USE := $(foreach d, self  FWCore/Framework GeneratorInterface/Core GeneratorInterface/Pythia6Interface SimDataFormats/GeneratorProducts boost clhep f77compiler heppdt,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeneratorInterfaceExhumeInterface_EX_LIB   := GeneratorInterfaceExhumeInterface
ALL_EXTERNAL_PRODS += GeneratorInterfaceExhumeInterface
endif
ifeq ($(strip $(TrackingTools/TrackAssociator)),)
TrackingToolsTrackAssociator := self/TrackingTools/TrackAssociator
TrackingTools/TrackAssociator := TrackingToolsTrackAssociator
TrackingToolsTrackAssociator_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsTrackAssociator_EX_USE := $(foreach d, self  CondFormats/CSCObjects DataFormats/CaloTowers DataFormats/Common DataFormats/DetId DataFormats/DTRecHit DataFormats/CSCRecHit DataFormats/EcalDetId DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/HcalDetId DataFormats/Math DataFormats/MuonDetId DataFormats/SiPixelDetId DataFormats/SiStripDetId DataFormats/TrackingRecHit DataFormats/TrackReco FWCore/Framework FWCore/MessageLogger FWCore/PluginManager FWCore/ParameterSet FWCore/Utilities Geometry/CaloGeometry Geometry/CommonDetUnit Geometry/CSCGeometry Geometry/RPCGeometry Geometry/DTGeometry Geometry/Records MagneticField/Engine MagneticField/Records TrackingTools/GeomPropagators TrackingTools/Records TrackingTools/TrajectoryState TrackPropagation/SteppingHelixPropagator,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsTrackAssociator_EX_LIB   := TrackingToolsTrackAssociator
ALL_EXTERNAL_PRODS += TrackingToolsTrackAssociator
endif
ifeq ($(strip $(RecoTracker/TrackProducer)),)
RecoTrackerTrackProducer := self/RecoTracker/TrackProducer
RecoTracker/TrackProducer := RecoTrackerTrackProducer
RecoTrackerTrackProducer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerTrackProducer_EX_USE := $(foreach d, self  TrackingTools/GsfTools DataFormats/Common DataFormats/GsfTrackReco DataFormats/SiPixelDetId DataFormats/SiStripDetId DataFormats/TrackReco DataFormats/TrackingRecHit DataFormats/TrajectorySeed FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet Geometry/CommonDetUnit Geometry/Records Geometry/TrackerGeometryBuilder MagneticField/Engine MagneticField/Records RecoTracker/TkNavigation RecoTracker/MeasurementDet TrackingTools/GeomPropagators TrackingTools/PatternTools TrackingTools/Records TrackingTools/TrackFitters TrackingTools/TrajectoryState TrackingTools/KalmanUpdators Utilities/General,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerTrackProducer_EX_LIB   := RecoTrackerTrackProducer
ALL_EXTERNAL_PRODS += RecoTrackerTrackProducer
endif
ifeq ($(strip $(RecoEgamma/PhotonIdentification)),)
RecoEgammaPhotonIdentification := self/RecoEgamma/PhotonIdentification
RecoEgamma/PhotonIdentification := RecoEgammaPhotonIdentification
RecoEgammaPhotonIdentification_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoEgammaPhotonIdentification_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager DataFormats/HcalRecHit DataFormats/EgammaReco RecoEcal/EgammaCoreTools DataFormats/BeamSpot Geometry/CaloGeometry RecoEgamma/EgammaIsolationAlgos,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoEgammaPhotonIdentification_EX_LIB   := RecoEgammaPhotonIdentification
ALL_EXTERNAL_PRODS += RecoEgammaPhotonIdentification
endif
ifeq ($(strip $(RecoMuon/MuonIdentification)),)
RecoMuonMuonIdentification := self/RecoMuon/MuonIdentification
RecoMuon/MuonIdentification := RecoMuonMuonIdentification
RecoMuonMuonIdentification_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoMuonMuonIdentification_EX_USE := $(foreach d, self  DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/Math DataFormats/TrajectoryState DataFormats/VertexReco FWCore/ServiceRegistry RecoMuon/Navigation RecoMuon/TransientTrackingRecHit RecoMuon/MuonIsolation RecoTracker/TkDetLayers RecoTracker/TkMSParametrization RecoTracker/TransientTrackingRecHit TrackingTools/DetLayers TrackingTools/GeomPropagators TrackingTools/PatternTools TrackingTools/Records TrackingTools/TrackFitters TrackingTools/TrackRefitter TrackingTools/TrajectoryState TrackingTools/TransientTrackingRecHit Geometry/DTGeometry DataFormats/DetId DataFormats/MuonDetId DataFormats/MuonReco DataFormats/TrackReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet Geometry/CommonDetUnit Geometry/CSCGeometry Geometry/Records SimDataFormats/Track SimDataFormats/TrackingHit roothistmatrix RecoMuon/TrackingTools DataFormats/CSCRecHit RecoLocalCalo/HcalRecAlgos,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoMuonMuonIdentification_EX_LIB   := RecoMuonMuonIdentification
ALL_EXTERNAL_PRODS += RecoMuonMuonIdentification
endif
ifeq ($(strip $(DataFormats/SiPixelRawData)),)
DataFormatsSiPixelRawData := self/DataFormats/SiPixelRawData
DataFormats/SiPixelRawData := DataFormatsSiPixelRawData
DataFormatsSiPixelRawData_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsSiPixelRawData_EX_USE := $(foreach d, self  DataFormats/Common rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsSiPixelRawData_LCGDICTS  := x 
DataFormatsSiPixelRawData_EX_LIB   := DataFormatsSiPixelRawData
ALL_EXTERNAL_PRODS += DataFormatsSiPixelRawData
endif
ifeq ($(strip $(FWCore/Sources)),)
FWCoreSources := self/FWCore/Sources
FWCore/Sources := FWCoreSources
FWCoreSources_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCoreSources_EX_USE := $(foreach d, self  DataFormats/Provenance FWCore/Catalog FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCoreSources_EX_LIB   := FWCoreSources
ALL_EXTERNAL_PRODS += FWCoreSources
endif
ifeq ($(strip $(FastSimulation/TrackingRecHitProducer)),)
FastSimulationTrackingRecHitProducer := self/FastSimulation/TrackingRecHitProducer
FastSimulation/TrackingRecHitProducer := FastSimulationTrackingRecHitProducer
FastSimulationTrackingRecHitProducer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationTrackingRecHitProducer_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/DetId DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/SiPixelCluster DataFormats/SiPixelDetId DataFormats/SiStripCluster DataFormats/SiStripDetId DataFormats/TrackerRecHit2D DataFormats/TrackingRecHit FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/ServiceRegistry FWCore/Utilities FastSimDataFormats/External FastSimulation/Utilities Geometry/CommonDetUnit Geometry/CommonTopologies Geometry/Records Geometry/TrackerGeometryBuilder MagneticField/Engine MagneticField/Records RecoLocalTracker/ClusterParameterEstimator RecoLocalTracker/SiPixelRecHits RecoLocalTracker/Records SimDataFormats/CrossingFrame SimDataFormats/EncodedEventId SimDataFormats/TrackingHit boost clhep gsl,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationTrackingRecHitProducer_EX_LIB   := FastSimulationTrackingRecHitProducer
ALL_EXTERNAL_PRODS += FastSimulationTrackingRecHitProducer
endif
ifeq ($(strip $(DataFormats/MuonData)),)
DataFormatsMuonData := self/DataFormats/MuonData
DataFormats/MuonData := DataFormatsMuonData
DataFormatsMuonData_EX_USE := $(foreach d, self  ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += DataFormatsMuonData
endif
ifeq ($(strip $(Fireworks/TableWidget)),)
FireworksTableWidget := self/Fireworks/TableWidget
Fireworks/TableWidget := FireworksTableWidget
FireworksTableWidget_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FireworksTableWidget_EX_USE := $(foreach d, self  rootcintex rootinteractive,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FireworksTableWidget_ROOTDICT  := LinkDef
FireworksTableWidget_EX_LIB   := FireworksTableWidget
ALL_EXTERNAL_PRODS += FireworksTableWidget
endif
ifeq ($(strip $(RecoBTag/Records)),)
RecoBTagRecords := self/RecoBTag/Records
RecoBTag/Records := RecoBTagRecords
RecoBTagRecords_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoBTagRecords_EX_USE := $(foreach d, self  FWCore/Framework CondFormats/DataRecord,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoBTagRecords_EX_LIB   := RecoBTagRecords
ALL_EXTERNAL_PRODS += RecoBTagRecords
endif
ifeq ($(strip $(DQMOffline/CalibCalo)),)
DQMOfflineCalibCalo := self/DQMOffline/CalibCalo
DQMOffline/CalibCalo := DQMOfflineCalibCalo
DQMOfflineCalibCalo_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMOfflineCalibCalo_EX_USE := $(foreach d, self  DQMServices/Components DQMServices/Core Geometry/Records Geometry/CaloGeometry DataFormats/Common DataFormats/DetId DataFormats/EcalDetId DataFormats/EcalRecHit DataFormats/EgammaReco DataFormats/HLTReco DataFormats/JetReco DataFormats/HcalIsolatedTrack DataFormats/Math DataFormats/RecoCandidate DataFormats/TrackReco DataFormats/FEDRawData FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet Geometry/CaloTopology EventFilter/HcalRawToDigi HLTrigger/HLTcore RecoEcal/EgammaCoreTools Utilities/Timing rootphysics,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMOfflineCalibCalo_EX_LIB   := DQMOfflineCalibCalo
ALL_EXTERNAL_PRODS += DQMOfflineCalibCalo
endif
ifeq ($(strip $(RecoMuon/MuonSeedGenerator)),)
RecoMuonMuonSeedGenerator := self/RecoMuon/MuonSeedGenerator
RecoMuon/MuonSeedGenerator := RecoMuonMuonSeedGenerator
RecoMuonMuonSeedGenerator_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoMuonMuonSeedGenerator_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/DTRecHit DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/Math DataFormats/MuonDetId DataFormats/RPCRecHit DataFormats/TrackingRecHit DataFormats/TrajectorySeed DataFormats/TrajectoryState FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager Geometry/CSCGeometry Geometry/CommonDetUnit Geometry/RPCGeometry Geometry/Records MagneticField/Engine MagneticField/Records RecoMuon/DetLayers RecoMuon/MeasurementDet RecoMuon/Records RecoMuon/TrackingTools RecoMuon/TransientTrackingRecHit SimDataFormats/TrackingHit TrackPropagation/SteppingHelixPropagator TrackingTools/DetLayers TrackingTools/TrajectoryState gsl rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoMuonMuonSeedGenerator_EX_LIB   := RecoMuonMuonSeedGenerator
ALL_EXTERNAL_PRODS += RecoMuonMuonSeedGenerator
endif
ifeq ($(strip $(Fireworks/Tracks)),)
FireworksTracks := self/Fireworks/Tracks
Fireworks/Tracks := FireworksTracks
FireworksTracks_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FireworksTracks_EX_USE := $(foreach d, self  DataFormats/CaloTowers DataFormats/EcalDetId DataFormats/GsfTrackReco DataFormats/HcalDetId DataFormats/MuonDetId DataFormats/SiPixelCluster DataFormats/SiPixelDetId DataFormats/SiStripCluster DataFormats/SiStripDetId DataFormats/TrackReco DataFormats/TrackerRecHit2D DataFormats/TrackingRecHit Fireworks/Core rootmath rootphysics,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FireworksTracks_EX_LIB   := FireworksTracks
ALL_EXTERNAL_PRODS += FireworksTracks
endif
ifeq ($(strip $(FWCore/MessageService)),)
FWCoreMessageService := self/FWCore/MessageService
FWCore/MessageService := FWCoreMessageService
FWCoreMessageService_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCoreMessageService_EX_USE := $(foreach d, self  DataFormats/Provenance FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCoreMessageService_EX_LIB   := FWCoreMessageService
ALL_EXTERNAL_PRODS += FWCoreMessageService
endif
ifeq ($(strip $(RecoLocalMuon/DTRecHit)),)
RecoLocalMuonDTRecHit := self/RecoLocalMuon/DTRecHit
RecoLocalMuon/DTRecHit := RecoLocalMuonDTRecHit
RecoLocalMuonDTRecHit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoLocalMuonDTRecHit_EX_USE := $(foreach d, self  DataFormats/GeometryVector DataFormats/GeometrySurface DataFormats/DTRecHit DataFormats/DTDigi DataFormats/Common Geometry/DTGeometry CalibMuon/DTDigiSync,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoLocalMuonDTRecHit_EX_LIB   := RecoLocalMuonDTRecHit
ALL_EXTERNAL_PRODS += RecoLocalMuonDTRecHit
endif
ifeq ($(strip $(SimDataFormats/CaloHit)),)
SimDataFormatsCaloHit := self/SimDataFormats/CaloHit
SimDataFormats/CaloHit := SimDataFormatsCaloHit
SimDataFormatsCaloHit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsCaloHit_EX_USE := $(foreach d, self  DataFormats/Common SimDataFormats/EncodedEventId boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsCaloHit_LCGDICTS  := x 
SimDataFormatsCaloHit_ROOTDICT  := LinkDef
SimDataFormatsCaloHit_EX_LIB   := SimDataFormatsCaloHit
ALL_EXTERNAL_PRODS += SimDataFormatsCaloHit
endif
ifeq ($(strip $(RecoParticleFlow/PFProducer)),)
RecoParticleFlowPFProducer := self/RecoParticleFlow/PFProducer
RecoParticleFlow/PFProducer := RecoParticleFlowPFProducer
RecoParticleFlowPFProducer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoParticleFlowPFProducer_EX_USE := $(foreach d, self  CondFormats/DataRecord CondFormats/EgammaObjects DataFormats/CaloRecHit DataFormats/Common DataFormats/EgammaCandidates DataFormats/ParticleFlowCandidate DataFormats/ParticleFlowReco DataFormats/Provenance DataFormats/TrackReco DataFormats/VertexReco DataFormats/MuonReco DataFormats/EcalDetId RecoParticleFlow/PFClusterTools RecoEcal/EgammaCoreTools boost clhep rootmath roottmva,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoParticleFlowPFProducer_EX_LIB   := RecoParticleFlowPFProducer
ALL_EXTERNAL_PRODS += RecoParticleFlowPFProducer
endif
ifeq ($(strip $(PhysicsTools/CandUtils)),)
PhysicsToolsCandUtils := self/PhysicsTools/CandUtils
PhysicsTools/CandUtils := PhysicsToolsCandUtils
PhysicsToolsCandUtils_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsCandUtils_EX_USE := $(foreach d, self  DataFormats/Candidate roothistmatrix,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsCandUtils_EX_LIB   := PhysicsToolsCandUtils
ALL_EXTERNAL_PRODS += PhysicsToolsCandUtils
endif
ifeq ($(strip $(RecoTracker/TkSeedingLayers)),)
RecoTrackerTkSeedingLayers := self/RecoTracker/TkSeedingLayers
RecoTracker/TkSeedingLayers := RecoTrackerTkSeedingLayers
RecoTrackerTkSeedingLayers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerTkSeedingLayers_EX_USE := $(foreach d, self  boost clhep CondFormats/DataRecord DataFormats/SiPixelDetId DataFormats/SiStripDetId DataFormats/TrackerRecHit2D FWCore/Framework FWCore/ParameterSet FWCore/PluginManager Geometry/CommonDetUnit Geometry/Records Geometry/TrackerGeometryBuilder RecoTracker/Record RecoTracker/TkDetLayers RecoTracker/TransientTrackingRecHit TrackingTools/DetLayers TrackingTools/TransientTrackingRecHit,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerTkSeedingLayers_EX_LIB   := RecoTrackerTkSeedingLayers
ALL_EXTERNAL_PRODS += RecoTrackerTkSeedingLayers
endif
ifeq ($(strip $(SimG4CMS/CherenkovAnalysis)),)
SimG4CMSCherenkovAnalysis := self/SimG4CMS/CherenkovAnalysis
SimG4CMS/CherenkovAnalysis := SimG4CMSCherenkovAnalysis
SimG4CMSCherenkovAnalysis_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CMSCherenkovAnalysis_EX_USE := $(foreach d, self  FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry CommonTools/UtilAlgos SimG4Core/SensitiveDetector SimG4Core/Notification SimG4Core/Application SimG4CMS/Calo DataFormats/Math SimDataFormats/SimHitMaker SimDataFormats/CaloHit DetectorDescription/Core boost geant4core root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CMSCherenkovAnalysis_EX_LIB   := SimG4CMSCherenkovAnalysis
ALL_EXTERNAL_PRODS += SimG4CMSCherenkovAnalysis
endif
ifeq ($(strip $(RecoVertex/GaussianSumVertexFit)),)
RecoVertexGaussianSumVertexFit := self/RecoVertex/GaussianSumVertexFit
RecoVertex/GaussianSumVertexFit := RecoVertexGaussianSumVertexFit
RecoVertexGaussianSumVertexFit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoVertexGaussianSumVertexFit_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/GeometryCommonDetAlgo DataFormats/GeometrySurface FWCore/ParameterSet RecoVertex/AdaptiveVertexFit RecoVertex/KalmanVertexFit RecoVertex/LinearizationPointFinders RecoVertex/VertexPrimitives RecoVertex/VertexTools TrackingTools/GsfTools TrackingTools/PatternTools TrackingTools/TrajectoryState TrackingTools/TransientTrack,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoVertexGaussianSumVertexFit_EX_LIB   := RecoVertexGaussianSumVertexFit
ALL_EXTERNAL_PRODS += RecoVertexGaussianSumVertexFit
endif
ifeq ($(strip $(JetMETCorrections/Type1MET)),)
JetMETCorrectionsType1MET := self/JetMETCorrections/Type1MET
JetMETCorrections/Type1MET := JetMETCorrectionsType1MET
JetMETCorrectionsType1MET_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
JetMETCorrectionsType1MET_EX_USE := $(foreach d, self  FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities CondFormats/EgammaObjects DataFormats/Candidate DataFormats/JetReco DataFormats/ParticleFlowCandidate DataFormats/Math DataFormats/METReco DataFormats/MuonReco DataFormats/TauReco DataFormats/VertexReco JetMETCorrections/Objects root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
JetMETCorrectionsType1MET_EX_LIB   := JetMETCorrectionsType1MET
ALL_EXTERNAL_PRODS += JetMETCorrectionsType1MET
endif
ifeq ($(strip $(SimDataFormats/CrossingFrame)),)
SimDataFormatsCrossingFrame := self/SimDataFormats/CrossingFrame
SimDataFormats/CrossingFrame := SimDataFormatsCrossingFrame
SimDataFormatsCrossingFrame_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsCrossingFrame_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/HcalDetId DataFormats/Provenance FWCore/MessageLogger FWCore/Utilities SimDataFormats/CaloHit SimDataFormats/EncodedEventId SimDataFormats/Track SimDataFormats/TrackingHit SimDataFormats/Vertex SimDataFormats/GeneratorProducts rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsCrossingFrame_LCGDICTS  := x 
SimDataFormatsCrossingFrame_EX_LIB   := SimDataFormatsCrossingFrame
ALL_EXTERNAL_PRODS += SimDataFormatsCrossingFrame
endif
ifeq ($(strip $(RecoMET/METAlgorithms)),)
RecoMETMETAlgorithms := self/RecoMET/METAlgorithms
RecoMET/METAlgorithms := RecoMETMETAlgorithms
RecoMETMETAlgorithms_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoMETMETAlgorithms_EX_USE := $(foreach d, self  DataFormats/METReco DataFormats/CaloTowers DataFormats/Common DataFormats/CSCRecHit FWCore/ParameterSet rootphysics MagneticField/Records MagneticField/Engine TrackingTools/GeomPropagators TrackingTools/TrackAssociator Geometry/CaloTopology Geometry/CSCGeometry RecoEcal/EgammaCoreTools DataFormats/ParticleFlowCandidate DataFormats/L1GlobalMuonTrigger DataFormats/MuonReco DataFormats/ParticleFlowReco CondFormats/JetMETObjects RecoMuon/TrackingTools RecoParticleFlow/PFClusterTools,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoMETMETAlgorithms_EX_LIB   := RecoMETMETAlgorithms
ALL_EXTERNAL_PRODS += RecoMETMETAlgorithms
endif
ifeq ($(strip $(Alignment/CocoaUtilities)),)
AlignmentCocoaUtilities := self/Alignment/CocoaUtilities
Alignment/CocoaUtilities := AlignmentCocoaUtilities
AlignmentCocoaUtilities_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentCocoaUtilities_EX_USE := $(foreach d, self  clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentCocoaUtilities_EX_LIB   := AlignmentCocoaUtilities
ALL_EXTERNAL_PRODS += AlignmentCocoaUtilities
endif
ifeq ($(strip $(TrackingTools/AnalyticalJacobians)),)
TrackingToolsAnalyticalJacobians := self/TrackingTools/AnalyticalJacobians
TrackingTools/AnalyticalJacobians := TrackingToolsAnalyticalJacobians
TrackingToolsAnalyticalJacobians_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsAnalyticalJacobians_EX_USE := $(foreach d, self  TrackingTools/TrajectoryParametrization DataFormats/GeometrySurface DataFormats/Math rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsAnalyticalJacobians_EX_LIB   := TrackingToolsAnalyticalJacobians
ALL_EXTERNAL_PRODS += TrackingToolsAnalyticalJacobians
endif
ifeq ($(strip $(Geometry/CaloGeometry)),)
GeometryCaloGeometry := self/Geometry/CaloGeometry
Geometry/CaloGeometry := GeometryCaloGeometry
GeometryCaloGeometry_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryCaloGeometry_EX_USE := $(foreach d, self  DataFormats/EcalDetId DataFormats/HcalDetId DataFormats/CaloTowers DataFormats/GeometryVector clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryCaloGeometry_EX_LIB   := GeometryCaloGeometry
ALL_EXTERNAL_PRODS += GeometryCaloGeometry
endif
ifeq ($(strip $(CondFormats/ESObjects)),)
CondFormatsESObjects := self/CondFormats/ESObjects
CondFormats/ESObjects := CondFormatsESObjects
CondFormatsESObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsESObjects_EX_USE := $(foreach d, self  FWCore/Utilities DataFormats/EcalDetId DataFormats/Math boost rootmath rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsESObjects_LCGDICTS  := x 
CondFormatsESObjects_EX_LIB   := CondFormatsESObjects
ALL_EXTERNAL_PRODS += CondFormatsESObjects
endif
ifeq ($(strip $(RecoLocalTracker/SiStripRecHitConverter)),)
RecoLocalTrackerSiStripRecHitConverter := self/RecoLocalTracker/SiStripRecHitConverter
RecoLocalTracker/SiStripRecHitConverter := RecoLocalTrackerSiStripRecHitConverter
RecoLocalTrackerSiStripRecHitConverter_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoLocalTrackerSiStripRecHitConverter_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet DataFormats/Common DataFormats/TrackerRecHit2D DataFormats/SiStripCluster DataFormats/SiStripDetId DataFormats/GeometrySurface RecoLocalTracker/Records RecoLocalTracker/ClusterParameterEstimator Geometry/CommonDetUnit Geometry/Records Geometry/TrackerGeometryBuilder MagneticField/Records CondFormats/SiStripObjects CalibFormats/SiStripObjects CalibTracker/Records TrackingTools/TransientTrackingRecHit,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoLocalTrackerSiStripRecHitConverter_EX_LIB   := RecoLocalTrackerSiStripRecHitConverter
ALL_EXTERNAL_PRODS += RecoLocalTrackerSiStripRecHitConverter
endif
ifeq ($(strip $(CondCore/IOVService)),)
CondCoreIOVService := self/CondCore/IOVService
CondCore/IOVService := CondCoreIOVService
CondCoreIOVService_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondCoreIOVService_EX_USE := $(foreach d, self  CondFormats/Common CondCore/DBCommon CondCore/MetaDataService,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondCoreIOVService_EX_LIB   := CondCoreIOVService
ALL_EXTERNAL_PRODS += CondCoreIOVService
endif
ifeq ($(strip $(DataFormats/L1GlobalCaloTrigger)),)
DataFormatsL1GlobalCaloTrigger := self/DataFormats/L1GlobalCaloTrigger
DataFormats/L1GlobalCaloTrigger := DataFormatsL1GlobalCaloTrigger
DataFormatsL1GlobalCaloTrigger_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsL1GlobalCaloTrigger_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/L1CaloTrigger boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsL1GlobalCaloTrigger_LCGDICTS  := x 
DataFormatsL1GlobalCaloTrigger_EX_LIB   := DataFormatsL1GlobalCaloTrigger
ALL_EXTERNAL_PRODS += DataFormatsL1GlobalCaloTrigger
endif
ifeq ($(strip $(TrackingTools/GsfTools)),)
TrackingToolsGsfTools := self/TrackingTools/GsfTools
TrackingTools/GsfTools := TrackingToolsGsfTools
TrackingToolsGsfTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsGsfTools_EX_USE := $(foreach d, self  boost clhep FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities Geometry/CommonDetUnit DataFormats/GeometrySurface TrackingTools/GeomPropagators TrackingTools/TrajectoryParametrization TrackingTools/TrajectoryState TrackingTools/PatternTools DataFormats/GsfTrackReco DataFormats/TrackReco,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsGsfTools_EX_LIB   := TrackingToolsGsfTools
ALL_EXTERNAL_PRODS += TrackingToolsGsfTools
endif
ifeq ($(strip $(CondFormats/BeamSpotObjects)),)
CondFormatsBeamSpotObjects := self/CondFormats/BeamSpotObjects
CondFormats/BeamSpotObjects := CondFormatsBeamSpotObjects
CondFormatsBeamSpotObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsBeamSpotObjects_EX_USE := $(foreach d, self  CondFormats/Common FWCore/Utilities rootrflx clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsBeamSpotObjects_LCGDICTS  := x 
CondFormatsBeamSpotObjects_EX_LIB   := CondFormatsBeamSpotObjects
ALL_EXTERNAL_PRODS += CondFormatsBeamSpotObjects
endif
ifeq ($(strip $(CondFormats/CastorObjects)),)
CondFormatsCastorObjects := self/CondFormats/CastorObjects
CondFormats/CastorObjects := CondFormatsCastorObjects
CondFormatsCastorObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsCastorObjects_EX_USE := $(foreach d, self  DataFormats/DetId DataFormats/HcalDetId FWCore/Utilities rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsCastorObjects_LCGDICTS  := x 
CondFormatsCastorObjects_EX_LIB   := CondFormatsCastorObjects
ALL_EXTERNAL_PRODS += CondFormatsCastorObjects
endif
ifeq ($(strip $(DataFormats/L1CaloTrigger)),)
DataFormatsL1CaloTrigger := self/DataFormats/L1CaloTrigger
DataFormats/L1CaloTrigger := DataFormatsL1CaloTrigger
DataFormatsL1CaloTrigger_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsL1CaloTrigger_EX_USE := $(foreach d, self  DataFormats/Common rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsL1CaloTrigger_LCGDICTS  := x 
DataFormatsL1CaloTrigger_EX_LIB   := DataFormatsL1CaloTrigger
ALL_EXTERNAL_PRODS += DataFormatsL1CaloTrigger
endif
ifeq ($(strip $(RecoBTag/XMLCalibration)),)
RecoBTagXMLCalibration := self/RecoBTag/XMLCalibration
RecoBTag/XMLCalibration := RecoBTagXMLCalibration
RecoBTagXMLCalibration_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoBTagXMLCalibration_EX_USE := $(foreach d, self  FWCore/MessageLogger xerces-c,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoBTagXMLCalibration_EX_LIB   := RecoBTagXMLCalibration
ALL_EXTERNAL_PRODS += RecoBTagXMLCalibration
endif
ifeq ($(strip $(RecoTracker/TkNavigation)),)
RecoTrackerTkNavigation := self/RecoTracker/TkNavigation
RecoTracker/TkNavigation := RecoTrackerTkNavigation
RecoTrackerTkNavigation_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerTkNavigation_EX_USE := $(foreach d, self  TrackingTools/PatternTools Utilities/General TrackingTools/GeomPropagators TrackingTools/DetLayers DataFormats/TrackingRecHit DataFormats/DetId TrackingTools/TrackAssociator,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerTkNavigation_EX_LIB   := RecoTrackerTkNavigation
ALL_EXTERNAL_PRODS += RecoTrackerTkNavigation
endif
ifeq ($(strip $(EventFilter/SiPixelRawToDigi)),)
EventFilterSiPixelRawToDigi := self/EventFilter/SiPixelRawToDigi
EventFilter/SiPixelRawToDigi := EventFilterSiPixelRawToDigi
EventFilterSiPixelRawToDigi_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterSiPixelRawToDigi_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/FEDRawData DataFormats/SiPixelDigi DataFormats/SiPixelRawData CondFormats/SiPixelObjects DataFormats/Candidate CondFormats/DataRecord Utilities/Timing root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterSiPixelRawToDigi_EX_LIB   := EventFilterSiPixelRawToDigi
ALL_EXTERNAL_PRODS += EventFilterSiPixelRawToDigi
endif
ifeq ($(strip $(SimGeneral/GFlash)),)
SimGeneralGFlash := self/SimGeneral/GFlash
SimGeneral/GFlash := SimGeneralGFlash
SimGeneralGFlash_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimGeneralGFlash_EX_USE := $(foreach d, self  FWCore/ParameterSet FWCore/MessageLogger clhep root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimGeneralGFlash_EX_LIB   := SimGeneralGFlash
ALL_EXTERNAL_PRODS += SimGeneralGFlash
endif
ifeq ($(strip $(RecoTracker/NuclearSeedGenerator)),)
RecoTrackerNuclearSeedGenerator := self/RecoTracker/NuclearSeedGenerator
RecoTracker/NuclearSeedGenerator := RecoTrackerNuclearSeedGenerator
RecoTrackerNuclearSeedGenerator_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerNuclearSeedGenerator_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/GeometryVector DataFormats/TrackReco DataFormats/TrajectorySeed FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities Geometry/Records Geometry/TrackerGeometryBuilder MagneticField/Engine RecoTracker/MeasurementDet RecoTracker/Record RecoTracker/TkDetLayers RecoTracker/TkNavigation RecoTracker/TkSeedGenerator TrackingTools/DetLayers TrackingTools/GeomPropagators TrackingTools/KalmanUpdators TrackingTools/MeasurementDet TrackingTools/PatternTools TrackingTools/Records TrackingTools/TrajectoryState TrackingTools/TransientTrackingRecHit boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerNuclearSeedGenerator_EX_LIB   := RecoTrackerNuclearSeedGenerator
ALL_EXTERNAL_PRODS += RecoTrackerNuclearSeedGenerator
endif
ifeq ($(strip $(FastSimulation/CaloHitMakers)),)
FastSimulationCaloHitMakers := self/FastSimulation/CaloHitMakers
FastSimulation/CaloHitMakers := FastSimulationCaloHitMakers
FastSimulationCaloHitMakers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationCaloHitMakers_EX_USE := $(foreach d, self  DataFormats/DetId DataFormats/EcalDetId DataFormats/HcalDetId DataFormats/Math FastSimulation/CaloGeometryTools FastSimulation/CalorimeterProperties FastSimulation/Event FastSimulation/Utilities Geometry/CaloTopology Geometry/EcalAlgo FWCore/MessageLogger rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationCaloHitMakers_EX_LIB   := FastSimulationCaloHitMakers
ALL_EXTERNAL_PRODS += FastSimulationCaloHitMakers
endif
ifeq ($(strip $(Geometry/Records)),)
GeometryRecords := self/Geometry/Records
Geometry/Records := GeometryRecords
GeometryRecords_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryRecords_EX_USE := $(foreach d, self  FWCore/Utilities FWCore/Framework CondFormats/AlignmentRecord boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryRecords_EX_LIB   := GeometryRecords
ALL_EXTERNAL_PRODS += GeometryRecords
endif
ifeq ($(strip $(RecoLocalCalo/CastorReco)),)
RecoLocalCaloCastorReco := self/RecoLocalCalo/CastorReco
RecoLocalCalo/CastorReco := RecoLocalCaloCastorReco
RecoLocalCaloCastorReco_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoLocalCaloCastorReco_EX_USE := $(foreach d, self  CalibCalorimetry/CastorCalib CalibFormats/CastorObjects DataFormats/HcalDigi DataFormats/HcalRecHit FWCore/MessageLogger,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoLocalCaloCastorReco_EX_LIB   := RecoLocalCaloCastorReco
ALL_EXTERNAL_PRODS += RecoLocalCaloCastorReco
endif
ifeq ($(strip $(RecoJets/JetProducers)),)
RecoJetsJetProducers := self/RecoJets/JetProducers
RecoJets/JetProducers := RecoJetsJetProducers
RecoJetsJetProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoJetsJetProducers_EX_USE := $(foreach d, self  boost FWCore/Framework DataFormats/JetReco Geometry/CaloGeometry Geometry/CaloTopology Geometry/Records Geometry/CommonDetUnit SimDataFormats/CaloHit RecoJets/JetAlgorithms DataFormats/CastorReco fastjet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoJetsJetProducers_EX_LIB   := RecoJetsJetProducers
ALL_EXTERNAL_PRODS += RecoJetsJetProducers
endif
ifeq ($(strip $(DataFormats/EcalRecHit)),)
DataFormatsEcalRecHit := self/DataFormats/EcalRecHit
DataFormats/EcalRecHit := DataFormatsEcalRecHit
DataFormatsEcalRecHit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsEcalRecHit_EX_USE := $(foreach d, self  DataFormats/CaloRecHit DataFormats/Common DataFormats/EcalDetId rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsEcalRecHit_LCGDICTS  := x 
DataFormatsEcalRecHit_EX_LIB   := DataFormatsEcalRecHit
ALL_EXTERNAL_PRODS += DataFormatsEcalRecHit
endif
ifeq ($(strip $(GeneratorInterface/PomwigInterface)),)
GeneratorInterfacePomwigInterface := self/GeneratorInterface/PomwigInterface
GeneratorInterface/PomwigInterface := GeneratorInterfacePomwigInterface
GeneratorInterfacePomwigInterface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfacePomwigInterface_EX_USE := $(foreach d, self  FWCore/Framework GeneratorInterface/Core GeneratorInterface/Herwig6Interface SimDataFormats/GeneratorProducts boost clhep heppdt f77compiler,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeneratorInterfacePomwigInterface_EX_LIB   := GeneratorInterfacePomwigInterface
ALL_EXTERNAL_PRODS += GeneratorInterfacePomwigInterface
endif
ifeq ($(strip $(GeneratorInterface/Pythia8Interface)),)
src_GeneratorInterface_Pythia8Interface := self/GeneratorInterface/Pythia8Interface
GeneratorInterface/Pythia8Interface  := src_GeneratorInterface_Pythia8Interface
src_GeneratorInterface_Pythia8Interface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_GeneratorInterface_Pythia8Interface_EX_USE := $(foreach d, self,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_GeneratorInterface_Pythia8Interface
endif

ifeq ($(strip $(CondCore/ORA)),)
CondCoreORA := self/CondCore/ORA
CondCore/ORA := CondCoreORA
CondCoreORA_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondCoreORA_EX_USE := $(foreach d, self  boost CoralCommon CoralKernel RelationalAccess FWCore/Framework FWCore/Utilities,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondCoreORA_EX_LIB   := CondCoreORA
ALL_EXTERNAL_PRODS += CondCoreORA
endif
ifeq ($(strip $(EventFilter/AutoBU)),)
EventFilterAutoBU := self/EventFilter/AutoBU
EventFilter/AutoBU := EventFilterAutoBU
EventFilterAutoBU_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterAutoBU_EX_USE := $(foreach d, self  EventFilter/Utilities EventFilter/Playback DataFormats/FEDRawData root clhep xdaq,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterAutoBU_EX_LIB   := EventFilterAutoBU
ALL_EXTERNAL_PRODS += EventFilterAutoBU
endif
ifeq ($(strip $(IORawData/DaqSource)),)
IORawDataDaqSource := self/IORawData/DaqSource
IORawData/DaqSource := IORawDataDaqSource
IORawDataDaqSource_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
IORawDataDaqSource_EX_USE := $(foreach d, self  FWCore/PluginManager,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
IORawDataDaqSource_EX_LIB   := IORawDataDaqSource
ALL_EXTERNAL_PRODS += IORawDataDaqSource
endif
ifeq ($(strip $(Geometry/MuonNumbering)),)
GeometryMuonNumbering := self/Geometry/MuonNumbering
Geometry/MuonNumbering := GeometryMuonNumbering
GeometryMuonNumbering_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryMuonNumbering_EX_USE := $(foreach d, self  DataFormats/MuonDetId DetectorDescription/Core,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryMuonNumbering_EX_LIB   := GeometryMuonNumbering
ALL_EXTERNAL_PRODS += GeometryMuonNumbering
endif
ifeq ($(strip $(Fireworks/Vertices)),)
FireworksVertices := self/Fireworks/Vertices
Fireworks/Vertices := FireworksVertices
FireworksVertices_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FireworksVertices_EX_USE := $(foreach d, self  DataFormats/VertexReco Fireworks/Core rootcore opengl,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FireworksVertices_ROOTDICT  := LinkDef
FireworksVertices_EX_LIB   := FireworksVertices
ALL_EXTERNAL_PRODS += FireworksVertices
endif
ifeq ($(strip $(EventFilter/CastorRawToDigi)),)
EventFilterCastorRawToDigi := self/EventFilter/CastorRawToDigi
EventFilter/CastorRawToDigi := EventFilterCastorRawToDigi
EventFilterCastorRawToDigi_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterCastorRawToDigi_EX_USE := $(foreach d, self  DataFormats/HcalDetId DataFormats/HcalDigi DataFormats/FEDRawData FWCore/MessageLogger CondFormats/CastorObjects FWCore/Utilities EventFilter/HcalRawToDigi boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterCastorRawToDigi_EX_LIB   := EventFilterCastorRawToDigi
ALL_EXTERNAL_PRODS += EventFilterCastorRawToDigi
endif
ifeq ($(strip $(CaloOnlineTools/HcalOnlineDb)),)
CaloOnlineToolsHcalOnlineDb := self/CaloOnlineTools/HcalOnlineDb
CaloOnlineTools/HcalOnlineDb := CaloOnlineToolsHcalOnlineDb
CaloOnlineToolsHcalOnlineDb_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CaloOnlineToolsHcalOnlineDb_EX_USE := $(foreach d, self  FWCore/Framework FWCore/Utilities FWCore/PluginManager FWCore/ParameterSet FWCore/ServiceRegistry boost oracle DataFormats/Common rootrflx xerces-c xdaq zlib DataFormats/HcalDetId CalibCalorimetry/CaloTPG CalibCalorimetry/HcalAlgos CalibCalorimetry/HcalTPGAlgos CondTools/Hcal OnlineDB/Oracle,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CaloOnlineToolsHcalOnlineDb_EX_LIB   := CaloOnlineToolsHcalOnlineDb
ALL_EXTERNAL_PRODS += CaloOnlineToolsHcalOnlineDb
endif
ifeq ($(strip $(RecoEgamma/EgammaElectronAlgos)),)
RecoEgammaEgammaElectronAlgos := self/RecoEgamma/EgammaElectronAlgos
RecoEgamma/EgammaElectronAlgos := RecoEgammaEgammaElectronAlgos
RecoEgammaEgammaElectronAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoEgammaEgammaElectronAlgos_EX_USE := $(foreach d, self  TrackingTools/MaterialEffects FWCore/Framework FWCore/ParameterSet clhep MagneticField/Engine DataFormats/DetId DataFormats/TrackerRecHit2D DataFormats/TrackingRecHit DataFormats/GsfTrackReco DataFormats/TrackReco DataFormats/EgammaReco DataFormats/EgammaCandidates DataFormats/CaloRecHit Geometry/CommonDetUnit Geometry/TrackerGeometryBuilder Geometry/CaloGeometry RecoTracker/MeasurementDet RecoTracker/TkSeedGenerator RecoTracker/TkDetLayers RecoTracker/TkNavigation TrackingTools/DetLayers TrackingTools/GsfTools TrackingTools/GsfTracking RecoTracker/TrackProducer DataFormats/HcalRecHit RecoCaloTools/Selectors RecoCaloTools/MetaCollections RecoEcal/EgammaCoreTools RecoEgamma/EgammaTools RecoEgamma/EgammaIsolationAlgos TrackingTools/MeasurementDet RecoTracker/TkTrackingRegions,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoEgammaEgammaElectronAlgos_EX_LIB   := RecoEgammaEgammaElectronAlgos
ALL_EXTERNAL_PRODS += RecoEgammaEgammaElectronAlgos
endif
ifeq ($(strip $(GeneratorInterface/Herwig6Interface)),)
GeneratorInterfaceHerwig6Interface := self/GeneratorInterface/Herwig6Interface
GeneratorInterface/Herwig6Interface := GeneratorInterfaceHerwig6Interface
GeneratorInterfaceHerwig6Interface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfaceHerwig6Interface_EX_USE := $(foreach d, self  SimDataFormats/GeneratorProducts GeneratorInterface/Core tauola boost clhep herwig fastjet jimmy f77compiler,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeneratorInterfaceHerwig6Interface_EX_LIB   := GeneratorInterfaceHerwig6Interface
ALL_EXTERNAL_PRODS += GeneratorInterfaceHerwig6Interface
endif
ifeq ($(strip $(DataFormats/Common)),)
DataFormatsCommon := self/DataFormats/Common
DataFormats/Common := DataFormatsCommon
DataFormatsCommon_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsCommon_EX_USE := $(foreach d, self  DataFormats/Provenance FWCore/MessageLogger FWCore/Utilities DataFormats/StdDictionaries boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsCommon_LCGDICTS  := x 
DataFormatsCommon_EX_LIB   := DataFormatsCommon
ALL_EXTERNAL_PRODS += DataFormatsCommon
endif
ifeq ($(strip $(DQMOffline/Ecal)),)
DQMOfflineEcal := self/DQMOffline/Ecal
DQMOffline/Ecal := DQMOfflineEcal
DQMOfflineEcal_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMOfflineEcal_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DQMServices/Core DataFormats/L1GlobalMuonTrigger DataFormats/L1GlobalTrigger CondFormats/L1TObjects CondFormats/DataRecord DQM/EcalCommon CondFormats/EcalObjects Geometry/CaloTopology DataFormats/EcalDetId DataFormats/EcalRecHit DataFormats/EgammaReco RecoEgamma/EgammaTools RecoEcal/EgammaCoreTools MagneticField/Engine MagneticField/Records CommonTools/UtilAlgos,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMOfflineEcal_EX_LIB   := DQMOfflineEcal
ALL_EXTERNAL_PRODS += DQMOfflineEcal
endif
ifeq ($(strip $(CommonTools/RecoUtils)),)
CommonToolsRecoUtils := self/CommonTools/RecoUtils
CommonTools/RecoUtils := CommonToolsRecoUtils
CommonToolsRecoUtils_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CommonToolsRecoUtils_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/EgammaCandidates DataFormats/L1GlobalTrigger DataFormats/RecoCandidate DataFormats/Scalers DataFormats/TrackReco DataFormats/VertexReco DataFormats/ParticleFlowReco DataFormats/ParticleFlowCandidate L1Trigger/GlobalTriggerAnalyzer MagneticField/Records MagneticField/Engine HLTrigger/HLTcore RecoEgamma/EgammaTools RecoVertex/KinematicFit RecoVertex/KinematicFitPrimitives rootrflx TrackingTools/TransientTrack TrackingTools/IPTools TrackingTools/Records FWCore/Framework,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CommonToolsRecoUtils_EX_LIB   := CommonToolsRecoUtils
ALL_EXTERNAL_PRODS += CommonToolsRecoUtils
endif
ifeq ($(strip $(TrackPropagation/NavGeometry)),)
TrackPropagationNavGeometry := self/TrackPropagation/NavGeometry
TrackPropagation/NavGeometry := TrackPropagationNavGeometry
TrackPropagationNavGeometry_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackPropagationNavGeometry_EX_USE := $(foreach d, self  MagneticField/VolumeGeometry TrackingTools/GeomPropagators FWCore/MessageLogger,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackPropagationNavGeometry_EX_LIB   := TrackPropagationNavGeometry
ALL_EXTERNAL_PRODS += TrackPropagationNavGeometry
endif
ifeq ($(strip $(Alignment/MuonAlignmentAlgorithms)),)
AlignmentMuonAlignmentAlgorithms := self/Alignment/MuonAlignmentAlgorithms
Alignment/MuonAlignmentAlgorithms := AlignmentMuonAlignmentAlgorithms
AlignmentMuonAlignmentAlgorithms_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentMuonAlignmentAlgorithms_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet FWCore/PluginManager FWCore/ServiceRegistry FWCore/Utilities CommonTools/Utils DataFormats/TrackReco Geometry/CSCGeometry Geometry/CommonDetUnit TrackingTools/TrackFitters Alignment/CommonAlignment RecoMuon/TransientTrackingRecHit clhep root rootcore rootminuit,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentMuonAlignmentAlgorithms_EX_LIB   := AlignmentMuonAlignmentAlgorithms
ALL_EXTERNAL_PRODS += AlignmentMuonAlignmentAlgorithms
endif
ifeq ($(strip $(CondCore/DBCommon)),)
CondCoreDBCommon := self/CondCore/DBCommon
CondCore/DBCommon := CondCoreDBCommon
CondCoreDBCommon_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondCoreDBCommon_EX_USE := $(foreach d, self  boost CoralCommon CoralKernel RelationalAccess FWCore/Framework CondCore/ORA,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondCoreDBCommon_EX_LIB   := CondCoreDBCommon
ALL_EXTERNAL_PRODS += CondCoreDBCommon
endif
ifeq ($(strip $(CalibTracker/SiStripDCS)),)
CalibTrackerSiStripDCS := self/CalibTracker/SiStripDCS
CalibTracker/SiStripDCS := CalibTrackerSiStripDCS
CalibTrackerSiStripDCS_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibTrackerSiStripDCS_EX_USE := $(foreach d, self  CalibFormats/SiStripObjects CondFormats/SiStripObjects DataFormats/Common CondFormats/Common DataFormats/SiStripCommon FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/ServiceRegistry FWCore/Utilities Geometry/Records Geometry/TrackerGeometryBuilder CondCore/DBOutputService DataFormats/SiStripDetId CondCore/DBCommon CoralCommon CondCore/PopCon OnlineDB/SiStripConfigDb CalibTracker/Records tkonlineswdb boost root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibTrackerSiStripDCS_EX_LIB   := CalibTrackerSiStripDCS
ALL_EXTERNAL_PRODS += CalibTrackerSiStripDCS
endif
ifeq ($(strip $(PhysicsTools/PatExamples)),)
PhysicsToolsPatExamples := self/PhysicsTools/PatExamples
PhysicsTools/PatExamples := PhysicsToolsPatExamples
PhysicsToolsPatExamples_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsPatExamples_EX_USE := $(foreach d, self  DataFormats/Math DataFormats/Common DataFormats/JetReco DataFormats/MuonReco DataFormats/PatCandidates FWCore/Utilities FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry PhysicsTools/PatUtils PhysicsTools/UtilAlgos PhysicsTools/Utilities clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsPatExamples_EX_LIB   := PhysicsToolsPatExamples
ALL_EXTERNAL_PRODS += PhysicsToolsPatExamples
endif
ifeq ($(strip $(RecoVertex/PrimaryVertexProducer)),)
RecoVertexPrimaryVertexProducer := self/RecoVertex/PrimaryVertexProducer
RecoVertex/PrimaryVertexProducer := RecoVertexPrimaryVertexProducer
RecoVertexPrimaryVertexProducer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoVertexPrimaryVertexProducer_EX_USE := $(foreach d, self  DataFormats/BeamSpot DataFormats/VertexReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet RecoVertex/AdaptiveVertexFit RecoVertex/KalmanVertexFit RecoVertex/TrimmedKalmanVertexFinder RecoVertex/VertexPrimitives RecoVertex/VertexTools TrackingTools/TransientTrack,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoVertexPrimaryVertexProducer_EX_LIB   := RecoVertexPrimaryVertexProducer
ALL_EXTERNAL_PRODS += RecoVertexPrimaryVertexProducer
endif
ifeq ($(strip $(TopQuarkAnalysis/TopObjectResolutions)),)
TopQuarkAnalysisTopObjectResolutions := self/TopQuarkAnalysis/TopObjectResolutions
TopQuarkAnalysis/TopObjectResolutions := TopQuarkAnalysisTopObjectResolutions
TopQuarkAnalysisTopObjectResolutions_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TopQuarkAnalysisTopObjectResolutions_EX_USE := $(foreach d, self  CommonTools/UtilAlgos FWCore/Framework FWCore/PluginManager FWCore/ParameterSet root AnalysisDataFormats/TopObjects,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += TopQuarkAnalysisTopObjectResolutions
endif
ifeq ($(strip $(CommonTools/CandAlgos)),)
CommonToolsCandAlgos := self/CommonTools/CandAlgos
CommonTools/CandAlgos := CommonToolsCandAlgos
CommonToolsCandAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CommonToolsCandAlgos_EX_USE := $(foreach d, self  SimGeneral/HepPDTRecord FWCore/Framework FWCore/ParameterSet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CommonToolsCandAlgos_EX_LIB   := CommonToolsCandAlgos
ALL_EXTERNAL_PRODS += CommonToolsCandAlgos
endif
ifeq ($(strip $(RecoMuon/MeasurementDet)),)
RecoMuonMeasurementDet := self/RecoMuon/MeasurementDet
RecoMuon/MeasurementDet := RecoMuonMeasurementDet
RecoMuonMeasurementDet_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoMuonMeasurementDet_EX_USE := $(foreach d, self  DataFormats/MuonDetId DataFormats/DTRecHit DataFormats/CSCRecHit FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Services RecoMuon/TransientTrackingRecHit,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoMuonMeasurementDet_EX_LIB   := RecoMuonMeasurementDet
ALL_EXTERNAL_PRODS += RecoMuonMeasurementDet
endif
ifeq ($(strip $(Geometry/RPCGeometry)),)
GeometryRPCGeometry := self/Geometry/RPCGeometry
Geometry/RPCGeometry := GeometryRPCGeometry
GeometryRPCGeometry_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryRPCGeometry_EX_USE := $(foreach d, self  Geometry/CommonDetUnit Geometry/CommonTopologies DataFormats/MuonDetId,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryRPCGeometry_EX_LIB   := GeometryRPCGeometry
ALL_EXTERNAL_PRODS += GeometryRPCGeometry
endif
ifeq ($(strip $(DataFormats/EcalDetId)),)
DataFormatsEcalDetId := self/DataFormats/EcalDetId
DataFormats/EcalDetId := DataFormatsEcalDetId
DataFormatsEcalDetId_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsEcalDetId_EX_USE := $(foreach d, self  DataFormats/Common FWCore/Utilities boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsEcalDetId_LCGDICTS  := x 
DataFormatsEcalDetId_EX_LIB   := DataFormatsEcalDetId
ALL_EXTERNAL_PRODS += DataFormatsEcalDetId
endif
ifeq ($(strip $(MagneticField/Interpolation)),)
MagneticFieldInterpolation := self/MagneticField/Interpolation
MagneticField/Interpolation := MagneticFieldInterpolation
MagneticFieldInterpolation_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
MagneticFieldInterpolation_EX_USE := $(foreach d, self  DataFormats/GeometrySurface DataFormats/GeometryVector MagneticField/VolumeGeometry,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
MagneticFieldInterpolation_EX_LIB   := MagneticFieldInterpolation
ALL_EXTERNAL_PRODS += MagneticFieldInterpolation
endif
ifeq ($(strip $(Calibration/IsolatedParticles)),)
CalibrationIsolatedParticles := self/Calibration/IsolatedParticles
Calibration/IsolatedParticles := CalibrationIsolatedParticles
CalibrationIsolatedParticles_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibrationIsolatedParticles_EX_USE := $(foreach d, self  clhep boost root FWCore/Utilities FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/Services FWCore/ServiceRegistry FWCore/MessageLogger CondFormats/DataRecord MagneticField/Engine MagneticField/Records Utilities/Timing DataFormats/DetId DataFormats/EcalDetId DataFormats/HcalDetId DataFormats/EcalRecHit DataFormats/HcalRecHit DataFormats/Common DataFormats/TrackReco DataFormats/EgammaReco DataFormats/Provenance SimDataFormats/CaloHit SimDataFormats/Track SimDataFormats/GeneratorProducts SimDataFormats/Vertex SimTracker/TrackerHitAssociation SimGeneral/HepPDTRecord Geometry/CaloGeometry Geometry/CommonDetUnit Geometry/TrackerGeometryBuilder Geometry/EcalAlgo Geometry/CaloTopology Geometry/Records RecoLocalCalo/EcalRecAlgos TrackingTools/TrajectoryState TrackingTools/GeomPropagators TrackingTools/TrackAssociator,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibrationIsolatedParticles_EX_LIB   := CalibrationIsolatedParticles
ALL_EXTERNAL_PRODS += CalibrationIsolatedParticles
endif
ifeq ($(strip $(DQM/EcalBarrelMonitorTasks)),)
DQMEcalBarrelMonitorTasks := self/DQM/EcalBarrelMonitorTasks
DQM/EcalBarrelMonitorTasks := DQMEcalBarrelMonitorTasks
DQMEcalBarrelMonitorTasks_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMEcalBarrelMonitorTasks_EX_USE := $(foreach d, self  DQM/EcalCommon DQMServices/Core DataFormats/FEDRawData DataFormats/EcalDetId DataFormats/EcalDigi DataFormats/EcalRawData DataFormats/EcalRecHit TBDataFormats/EcalTBObjects DataFormats/EgammaReco DataFormats/Math DataFormats/L1GlobalTrigger FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry RecoLocalCalo/EcalRecAlgos RecoEcal/EgammaCoreTools CondFormats/DataRecord CondFormats/EcalObjects Geometry/CaloTopology rootphysics,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMEcalBarrelMonitorTasks_EX_LIB   := DQMEcalBarrelMonitorTasks
ALL_EXTERNAL_PRODS += DQMEcalBarrelMonitorTasks
endif
ifeq ($(strip $(IOMC/RandomEngine)),)
IOMCRandomEngine := self/IOMC/RandomEngine
IOMC/RandomEngine := IOMCRandomEngine
IOMCRandomEngine_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
IOMCRandomEngine_EX_USE := $(foreach d, self  DataFormats/Provenance FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities FWCore/MessageLogger SimDataFormats/RandomEngine boost clhep rootcore rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
IOMCRandomEngine_EX_LIB   := IOMCRandomEngine
ALL_EXTERNAL_PRODS += IOMCRandomEngine
endif
ifeq ($(strip $(SimDataFormats/RPCDigiSimLink)),)
SimDataFormatsRPCDigiSimLink := self/SimDataFormats/RPCDigiSimLink
SimDataFormats/RPCDigiSimLink := SimDataFormatsRPCDigiSimLink
SimDataFormatsRPCDigiSimLink_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsRPCDigiSimLink_EX_USE := $(foreach d, self  DataFormats/Common SimDataFormats/EncodedEventId SimDataFormats/TrackingHit boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsRPCDigiSimLink_LCGDICTS  := x 
SimDataFormatsRPCDigiSimLink_EX_LIB   := SimDataFormatsRPCDigiSimLink
ALL_EXTERNAL_PRODS += SimDataFormatsRPCDigiSimLink
endif
ifeq ($(strip $(DQM/SiStripCommissioningDbClients)),)
DQMSiStripCommissioningDbClients := self/DQM/SiStripCommissioningDbClients
DQM/SiStripCommissioningDbClients := DQMSiStripCommissioningDbClients
DQMSiStripCommissioningDbClients_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMSiStripCommissioningDbClients_EX_USE := $(foreach d, self  CalibFormats/SiStripObjects CondFormats/SiStripObjects DataFormats/DetId DataFormats/GeometryVector DataFormats/SiStripCommon CondFormats/DataRecord DQM/SiStripCommissioningClients DQMServices/Core FWCore/MessageLogger FWCore/PluginManager FWCore/ServiceRegistry Geometry/CommonDetUnit Geometry/CommonTopologies Geometry/Records Geometry/TrackerGeometryBuilder OnlineDB/SiStripConfigDb OnlineDB/SiStripESSources boost rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMSiStripCommissioningDbClients_EX_LIB   := DQMSiStripCommissioningDbClients
ALL_EXTERNAL_PRODS += DQMSiStripCommissioningDbClients
endif
ifeq ($(strip $(DQMOffline/RecoB)),)
DQMOfflineRecoB := self/DQMOffline/RecoB
DQMOffline/RecoB := DQMOfflineRecoB
DQMOfflineRecoB_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMOfflineRecoB_EX_USE := $(foreach d, self  DataFormats/BTauReco DataFormats/Common DataFormats/JetReco DataFormats/TrackReco SimDataFormats/JetMatching FWCore/Framework FWCore/ParameterSet CondFormats/DataRecord RecoBTau/JetTagComputer rootcore DQMServices/Core rootgpad JetMETCorrections/Objects boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMOfflineRecoB_EX_LIB   := DQMOfflineRecoB
ALL_EXTERNAL_PRODS += DQMOfflineRecoB
endif
ifeq ($(strip $(Alignment/LaserAlignmentSimulation)),)
AlignmentLaserAlignmentSimulation := self/Alignment/LaserAlignmentSimulation
Alignment/LaserAlignmentSimulation := AlignmentLaserAlignmentSimulation
AlignmentLaserAlignmentSimulation_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentLaserAlignmentSimulation_EX_USE := $(foreach d, self  FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities SimG4Core/Notification clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentLaserAlignmentSimulation_EX_LIB   := AlignmentLaserAlignmentSimulation
ALL_EXTERNAL_PRODS += AlignmentLaserAlignmentSimulation
endif
ifeq ($(strip $(DQMOffline/EGamma)),)
DQMOfflineEGamma := self/DQMOffline/EGamma
DQMOffline/EGamma := DQMOfflineEGamma
DQMOfflineEGamma_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMOfflineEGamma_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet DQMServices/Components DQMServices/Core,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMOfflineEGamma_EX_LIB   := DQMOfflineEGamma
ALL_EXTERNAL_PRODS += DQMOfflineEGamma
endif
ifeq ($(strip $(CondTools/RunInfo)),)
CondToolsRunInfo := self/CondTools/RunInfo
CondTools/RunInfo := CondToolsRunInfo
CondToolsRunInfo_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondToolsRunInfo_EX_USE := $(foreach d, self  CondCore/DBCommon CondCore/DBOutputService CondCore/IOVService CondCore/MetaDataService CondCore/PopCon CondFormats/RunInfo CoralBase DataFormats/Provenance FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry RelationalAccess rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondToolsRunInfo_EX_LIB   := CondToolsRunInfo
ALL_EXTERNAL_PRODS += CondToolsRunInfo
endif
ifeq ($(strip $(RecoVertex/KalmanVertexFit)),)
RecoVertexKalmanVertexFit := self/RecoVertex/KalmanVertexFit
RecoVertex/KalmanVertexFit := RecoVertexKalmanVertexFit
RecoVertexKalmanVertexFit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoVertexKalmanVertexFit_EX_USE := $(foreach d, self  CommonTools/Statistics DataFormats/CLHEP DataFormats/GeometryCommonDetAlgo DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/VertexReco FWCore/MessageLogger RecoVertex/LinearizationPointFinders RecoVertex/VertexPrimitives RecoVertex/VertexTools SimDataFormats/TrackingAnalysis SimTracker/TrackAssociation TrackingTools/TrajectoryState TrackingTools/TransientTrack rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoVertexKalmanVertexFit_EX_LIB   := RecoVertexKalmanVertexFit
ALL_EXTERNAL_PRODS += RecoVertexKalmanVertexFit
endif
ifeq ($(strip $(RecoPixelVertexing/PixelLowPtUtilities)),)
RecoPixelVertexingPixelLowPtUtilities := self/RecoPixelVertexing/PixelLowPtUtilities
RecoPixelVertexing/PixelLowPtUtilities := RecoPixelVertexingPixelLowPtUtilities
RecoPixelVertexingPixelLowPtUtilities_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoPixelVertexingPixelLowPtUtilities_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities Geometry/Records Geometry/TrackerGeometryBuilder TrackingTools/PatternTools RecoPixelVertexing/PixelTriplets RecoPixelVertexing/PixelTrackFitting TrackingTools/TrajectoryFiltering TrackingTools/Records RecoLocalTracker/Records MagneticField/Records DataFormats/VertexReco,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoPixelVertexingPixelLowPtUtilities_EX_LIB   := RecoPixelVertexingPixelLowPtUtilities
ALL_EXTERNAL_PRODS += RecoPixelVertexingPixelLowPtUtilities
endif
ifeq ($(strip $(CalibFormats/CaloTPG)),)
CalibFormatsCaloTPG := self/CalibFormats/CaloTPG
CalibFormats/CaloTPG := CalibFormatsCaloTPG
CalibFormatsCaloTPG_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibFormatsCaloTPG_EX_USE := $(foreach d, self  DataFormats/HcalDetId DataFormats/HcalDigi DataFormats/EcalDetId DataFormats/EcalDigi CalibFormats/CaloObjects FWCore/Framework boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibFormatsCaloTPG_EX_LIB   := CalibFormatsCaloTPG
ALL_EXTERNAL_PRODS += CalibFormatsCaloTPG
endif
ifeq ($(strip $(PhysicsTools/PatUtils)),)
PhysicsToolsPatUtils := self/PhysicsTools/PatUtils
PhysicsTools/PatUtils := PhysicsToolsPatUtils
PhysicsToolsPatUtils_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsPatUtils_EX_USE := $(foreach d, self  TrackingTools/Records CommonTools/Utils DataFormats/Math DataFormats/Candidate DataFormats/PatCandidates DataFormats/TrackReco DataFormats/MuonReco DataFormats/GsfTrackReco DataFormats/VertexReco TrackingTools/TransientTrack Utilities/General root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsPatUtils_LCGDICTS  := x 
PhysicsToolsPatUtils_EX_LIB   := PhysicsToolsPatUtils
ALL_EXTERNAL_PRODS += PhysicsToolsPatUtils
endif
ifeq ($(strip $(PhysicsTools/Utilities)),)
PhysicsToolsUtilities := self/PhysicsTools/Utilities
PhysicsTools/Utilities := PhysicsToolsUtilities
PhysicsToolsUtilities_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsUtilities_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/Provenance FWCore/Utilities SimDataFormats/PileupSummaryInfo rootrflx roofit rootcore root boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsUtilities_LCGDICTS  := x 
PhysicsToolsUtilities_EX_LIB   := PhysicsToolsUtilities
ALL_EXTERNAL_PRODS += PhysicsToolsUtilities
endif
ifeq ($(strip $(DataFormats/DTRecHit)),)
DataFormatsDTRecHit := self/DataFormats/DTRecHit
DataFormats/DTRecHit := DataFormatsDTRecHit
DataFormatsDTRecHit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsDTRecHit_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/DTDigi DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/MuonDetId DataFormats/TrackingRecHit FWCore/Utilities rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsDTRecHit_LCGDICTS  := x 
DataFormatsDTRecHit_EX_LIB   := DataFormatsDTRecHit
ALL_EXTERNAL_PRODS += DataFormatsDTRecHit
endif
ifeq ($(strip $(SimCalorimetry/EcalZeroSuppressionAlgos)),)
src_SimCalorimetry_EcalZeroSuppressionAlgos := self/SimCalorimetry/EcalZeroSuppressionAlgos
SimCalorimetry/EcalZeroSuppressionAlgos  := src_SimCalorimetry_EcalZeroSuppressionAlgos
src_SimCalorimetry_EcalZeroSuppressionAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_SimCalorimetry_EcalZeroSuppressionAlgos_EX_USE := $(foreach d, self DataFormats/EcalDigi FWCore/MessageLogger DataFormats/EcalDetId,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_SimCalorimetry_EcalZeroSuppressionAlgos
endif

ifeq ($(strip $(DQM/EcalEndcapMonitorDbModule)),)
DQMEcalEndcapMonitorDbModule := self/DQM/EcalEndcapMonitorDbModule
DQM/EcalEndcapMonitorDbModule := DQMEcalEndcapMonitorDbModule
DQMEcalEndcapMonitorDbModule_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMEcalEndcapMonitorDbModule_EX_USE := $(foreach d, self  CoralBase DQMServices/Core FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry RelationalAccess rootcore xerces-c DQM/EcalBarrelMonitorDbModule,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMEcalEndcapMonitorDbModule_EX_LIB   := DQMEcalEndcapMonitorDbModule
ALL_EXTERNAL_PRODS += DQMEcalEndcapMonitorDbModule
endif
ifeq ($(strip $(FWCore/ServiceRegistry)),)
FWCoreServiceRegistry := self/FWCore/ServiceRegistry
FWCore/ServiceRegistry := FWCoreServiceRegistry
FWCoreServiceRegistry_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCoreServiceRegistry_EX_USE := $(foreach d, self  boost sigcpp FWCore/ParameterSet FWCore/PluginManager FWCore/PythonParameterSet FWCore/Utilities,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCoreServiceRegistry_EX_LIB   := FWCoreServiceRegistry
ALL_EXTERNAL_PRODS += FWCoreServiceRegistry
endif
ifeq ($(strip $(SimGeneral/PileupInformation)),)
src_SimGeneral_PileupInformation := self/SimGeneral/PileupInformation
SimGeneral/PileupInformation  := src_SimGeneral_PileupInformation
src_SimGeneral_PileupInformation_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_SimGeneral_PileupInformation_EX_USE := $(foreach d, CondFormats/SiPixelObjects SimDataFormats/GeneratorProducts clhep SimDataFormats/Track FWCore/Framework self SimDataFormats/TrackingHit SimDataFormats/TrackingAnalysis CondFormats/CSCObjects SimDataFormats/PileupSummaryInfo FWCore/MessageLogger SimDataFormats/Vertex SimTracker/Common FWCore/ParameterSet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_SimGeneral_PileupInformation
endif

ifeq ($(strip $(RecoBTag/PerformanceDB)),)
RecoBTagPerformanceDB := self/RecoBTag/PerformanceDB
RecoBTag/PerformanceDB := RecoBTagPerformanceDB
RecoBTagPerformanceDB_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoBTagPerformanceDB_EX_USE := $(foreach d, self  FWCore/PluginManager FWCore/ParameterSet FWCore/Utilities FWCore/MessageLogger,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoBTagPerformanceDB_EX_LIB   := RecoBTagPerformanceDB
ALL_EXTERNAL_PRODS += RecoBTagPerformanceDB
endif
ifeq ($(strip $(DetectorDescription/Core)),)
DetectorDescriptionCore := self/DetectorDescription/Core
DetectorDescription/Core := DetectorDescriptionCore
DetectorDescriptionCore_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DetectorDescriptionCore_EX_USE := $(foreach d, self  DetectorDescription/Base DetectorDescription/ExprAlgo FWCore/Utilities FWCore/MessageLogger boost rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DetectorDescriptionCore_EX_LIB   := DetectorDescriptionCore
ALL_EXTERNAL_PRODS += DetectorDescriptionCore
endif
ifeq ($(strip $(EventFilter/StorageManager)),)
EventFilterStorageManager := self/EventFilter/StorageManager
EventFilter/StorageManager := EventFilterStorageManager
EventFilterStorageManager_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterStorageManager_EX_USE := $(foreach d, self  xdaq mimetic xerces-c boost zlib DQMServices/Core FWCore/Framework FWCore/MessageLogger FWCore/MessageService FWCore/PythonParameterSet FWCore/ParameterSet FWCore/PluginManager FWCore/RootAutoLibraryLoader FWCore/ServiceRegistry FWCore/Sources FWCore/Utilities FWCore/Version DataFormats/Common DataFormats/Provenance DataFormats/Streamer IOPool/Streamer EventFilter/Utilities root curl,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterStorageManager_EX_LIB   := EventFilterStorageManager
ALL_EXTERNAL_PRODS += EventFilterStorageManager
endif
ifeq ($(strip $(CondFormats/Calibration)),)
CondFormatsCalibration := self/CondFormats/Calibration
CondFormats/Calibration := CondFormatsCalibration
CondFormatsCalibration_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsCalibration_EX_USE := $(foreach d, self  CondFormats/Common FWCore/Utilities rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsCalibration_LCGDICTS  := x 
CondFormatsCalibration_EX_LIB   := CondFormatsCalibration
ALL_EXTERNAL_PRODS += CondFormatsCalibration
endif
ifeq ($(strip $(DataFormats/HeavyIonEvent)),)
DataFormatsHeavyIonEvent := self/DataFormats/HeavyIonEvent
DataFormats/HeavyIonEvent := DataFormatsHeavyIonEvent
DataFormatsHeavyIonEvent_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsHeavyIonEvent_EX_USE := $(foreach d, self  root rootrflx DataFormats/Common CondFormats/HIObjects CondFormats/DataRecord,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsHeavyIonEvent_LCGDICTS  := x 
DataFormatsHeavyIonEvent_ROOTDICT  := LinkDef
DataFormatsHeavyIonEvent_EX_LIB   := DataFormatsHeavyIonEvent
ALL_EXTERNAL_PRODS += DataFormatsHeavyIonEvent
endif
ifeq ($(strip $(Alignment/CocoaDaq)),)
AlignmentCocoaDaq := self/Alignment/CocoaDaq
Alignment/CocoaDaq := AlignmentCocoaDaq
AlignmentCocoaDaq_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentCocoaDaq_EX_USE := $(foreach d, self  rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentCocoaDaq_ROOTDICT  := LinkDef
AlignmentCocoaDaq_EX_LIB   := AlignmentCocoaDaq
ALL_EXTERNAL_PRODS += AlignmentCocoaDaq
endif
ifeq ($(strip $(DataFormats/BeamSpot)),)
DataFormatsBeamSpot := self/DataFormats/BeamSpot
DataFormats/BeamSpot := DataFormatsBeamSpot
DataFormatsBeamSpot_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsBeamSpot_EX_USE := $(foreach d, self  DataFormats/Common rootcore rootrflx clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsBeamSpot_LCGDICTS  := x 
DataFormatsBeamSpot_EX_LIB   := DataFormatsBeamSpot
ALL_EXTERNAL_PRODS += DataFormatsBeamSpot
endif
ifeq ($(strip $(PhysicsTools/KinFitter)),)
PhysicsToolsKinFitter := self/PhysicsTools/KinFitter
PhysicsTools/KinFitter := PhysicsToolsKinFitter
PhysicsToolsKinFitter_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsKinFitter_EX_USE := $(foreach d, self  root FWCore/MessageLogger,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsKinFitter_EX_LIB   := PhysicsToolsKinFitter
ALL_EXTERNAL_PRODS += PhysicsToolsKinFitter
endif
ifeq ($(strip $(DQM/CSCMonitorModule)),)
DQMCSCMonitorModule := self/DQM/CSCMonitorModule
DQM/CSCMonitorModule := DQMCSCMonitorModule
DQMCSCMonitorModule_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMCSCMonitorModule_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DQMServices/Core DQMServices/Components EventFilter/CSCRawToDigi xerces-c,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMCSCMonitorModule_EX_LIB   := DQMCSCMonitorModule
ALL_EXTERNAL_PRODS += DQMCSCMonitorModule
endif
ifeq ($(strip $(DataFormats/HcalIsolatedTrack)),)
DataFormatsHcalIsolatedTrack := self/DataFormats/HcalIsolatedTrack
DataFormats/HcalIsolatedTrack := DataFormatsHcalIsolatedTrack
DataFormatsHcalIsolatedTrack_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsHcalIsolatedTrack_EX_USE := $(foreach d, self  DataFormats/Candidate DataFormats/Common DataFormats/Math DataFormats/RecoCandidate DataFormats/TrackReco FWCore/MessageLogger rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsHcalIsolatedTrack_LCGDICTS  := x 
DataFormatsHcalIsolatedTrack_EX_LIB   := DataFormatsHcalIsolatedTrack
ALL_EXTERNAL_PRODS += DataFormatsHcalIsolatedTrack
endif
ifeq ($(strip $(CalibMuon/CSCCalibration)),)
CalibMuonCSCCalibration := self/CalibMuon/CSCCalibration
CalibMuon/CSCCalibration := CalibMuonCSCCalibration
CalibMuonCSCCalibration_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibMuonCSCCalibration_EX_USE := $(foreach d, self  CondFormats/CSCObjects CondFormats/DataRecord DataFormats/MuonDetId FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibMuonCSCCalibration_EX_LIB   := CalibMuonCSCCalibration
ALL_EXTERNAL_PRODS += CalibMuonCSCCalibration
endif
ifeq ($(strip $(EventFilter/SiStripRawToDigi)),)
EventFilterSiStripRawToDigi := self/EventFilter/SiStripRawToDigi
EventFilter/SiStripRawToDigi := EventFilterSiStripRawToDigi
EventFilterSiStripRawToDigi_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterSiStripRawToDigi_EX_USE := $(foreach d, self  CondFormats/DataRecord CondFormats/SiStripObjects DataFormats/Common DataFormats/DetId DataFormats/FEDRawData DataFormats/SiStripDigi DataFormats/SiStripCluster DataFormats/SiStripCommon RecoLocalTracker/SiStripZeroSuppression FWCore/Framework FWCore/MessageLogger FWCore/Utilities boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterSiStripRawToDigi_EX_LIB   := EventFilterSiStripRawToDigi
ALL_EXTERNAL_PRODS += EventFilterSiStripRawToDigi
endif
ifeq ($(strip $(CondFormats/EcalObjects)),)
CondFormatsEcalObjects := self/CondFormats/EcalObjects
CondFormats/EcalObjects := CondFormatsEcalObjects
CondFormatsEcalObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsEcalObjects_EX_USE := $(foreach d, self  FWCore/Utilities CondFormats/Common CondFormats/Alignment DataFormats/StdDictionaries DataFormats/EcalDetId DataFormats/Math boost rootmath rootrflx clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsEcalObjects_LCGDICTS  := x 
CondFormatsEcalObjects_EX_LIB   := CondFormatsEcalObjects
ALL_EXTERNAL_PRODS += CondFormatsEcalObjects
endif
ifeq ($(strip $(RecoVertex/KinematicFitPrimitives)),)
RecoVertexKinematicFitPrimitives := self/RecoVertex/KinematicFitPrimitives
RecoVertex/KinematicFitPrimitives := RecoVertexKinematicFitPrimitives
RecoVertexKinematicFitPrimitives_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoVertexKinematicFitPrimitives_EX_USE := $(foreach d, self  TrackingTools/TransientTrack TrackingTools/GeomPropagators RecoVertex/VertexPrimitives,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoVertexKinematicFitPrimitives_EX_LIB   := RecoVertexKinematicFitPrimitives
ALL_EXTERNAL_PRODS += RecoVertexKinematicFitPrimitives
endif
ifeq ($(strip $(RecoTracker/TkMSParametrization)),)
RecoTrackerTkMSParametrization := self/RecoTracker/TkMSParametrization
RecoTracker/TkMSParametrization := RecoTrackerTkMSParametrization
RecoTrackerTkMSParametrization_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerTkMSParametrization_EX_USE := $(foreach d, self  clhep boost root TrackingTools/DetLayers FWCore/Framework RecoTracker/TkDetLayers RecoTracker/Record MagneticField/Records MagneticField/Engine,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerTkMSParametrization_EX_LIB   := RecoTrackerTkMSParametrization
ALL_EXTERNAL_PRODS += RecoTrackerTkMSParametrization
endif
ifeq ($(strip $(Alignment/SurveyAnalysis)),)
AlignmentSurveyAnalysis := self/Alignment/SurveyAnalysis
Alignment/SurveyAnalysis := AlignmentSurveyAnalysis
AlignmentSurveyAnalysis_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentSurveyAnalysis_EX_USE := $(foreach d, self  roothistmatrix Alignment/CommonAlignment DataFormats/MuonDetId DataFormats/SiStripDetId FWCore/Framework FWCore/MessageLogger FWCore/Utilities,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentSurveyAnalysis_EX_LIB   := AlignmentSurveyAnalysis
ALL_EXTERNAL_PRODS += AlignmentSurveyAnalysis
endif
ifeq ($(strip $(RecoVertex/MultiVertexFit)),)
RecoVertexMultiVertexFit := self/RecoVertex/MultiVertexFit
RecoVertex/MultiVertexFit := RecoVertexMultiVertexFit
RecoVertexMultiVertexFit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoVertexMultiVertexFit_EX_USE := $(foreach d, self  CommonTools/Clustering1D DataFormats/GeometryCommonDetAlgo DataFormats/GeometryVector RecoVertex/KalmanVertexFit RecoVertex/LinearizationPointFinders RecoVertex/VertexPrimitives RecoVertex/VertexTools TrackingTools/PatternTools TrackingTools/TransientTrack,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoVertexMultiVertexFit_EX_LIB   := RecoVertexMultiVertexFit
ALL_EXTERNAL_PRODS += RecoVertexMultiVertexFit
endif
ifeq ($(strip $(CondTools/DT)),)
CondToolsDT := self/CondTools/DT
CondTools/DT := CondToolsDT
CondToolsDT_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondToolsDT_EX_USE := $(foreach d, self  CondCore/DBCommon CondFormats/DTObjects CondFormats/DataRecord CoralBase DataFormats/Provenance FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry CondCore/DBOutputService RelationalAccess rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondToolsDT_EX_LIB   := CondToolsDT
ALL_EXTERNAL_PRODS += CondToolsDT
endif
ifeq ($(strip $(SimRomanPot/SimFP420)),)
SimRomanPotSimFP420 := self/SimRomanPot/SimFP420
SimRomanPot/SimFP420 := SimRomanPotSimFP420
SimRomanPotSimFP420_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimRomanPotSimFP420_EX_USE := $(foreach d, self  FWCore/PluginManager SimDataFormats/TrackingHit DataFormats/Math SimDataFormats/TrackerDigiSimLink SimDataFormats/CrossingFrame DataFormats/FP420Digi DataFormats/Common SimGeneral/HepPDTRecord SimG4Core/Watcher SimG4Core/SensitiveDetector SimG4Core/Notification SimG4Core/Application SimG4CMS/Calo SimG4CMS/FP420 SimDataFormats/SimHitMaker SimDataFormats/CaloHit Mixing/Base DetectorDescription/Core FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger boost geant4core root clhep hepmc gsl,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimRomanPotSimFP420_EX_LIB   := SimRomanPotSimFP420
ALL_EXTERNAL_PRODS += SimRomanPotSimFP420
endif
ifeq ($(strip $(RecoParticleFlow/PFTracking)),)
RecoParticleFlowPFTracking := self/RecoParticleFlow/PFTracking
RecoParticleFlow/PFTracking := RecoParticleFlowPFTracking
RecoParticleFlowPFTracking_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoParticleFlowPFTracking_EX_USE := $(foreach d, self  RecoVertex/KalmanVertexFit DataFormats/EgammaCandidates DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/GsfTrackReco DataFormats/Math DataFormats/ParticleFlowReco DataFormats/TrackReco DataFormats/TrackerRecHit2D DataFormats/TrackingRecHit DataFormats/TrajectorySeed DataFormats/SiPixelDetId DataFormats/SiStripDetId DataFormats/BeamSpot Geometry/CommonDetUnit Geometry/TrackerGeometryBuilder Geometry/Records Utilities/General FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FastSimulation/BaseParticlePropagator RecoParticleFlow/PFClusterTools TrackingTools/GsfTools TrackingTools/PatternTools TrackingTools/TrajectoryState TrackingTools/TransientTrack TrackingTools/TrajectoryParametrization RecoVertex/VertexPrimitives RecoVertex/AdaptiveVertexFit TrackingTools/IPTools DataFormats/VertexReco rootcore roottmva,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoParticleFlowPFTracking_EX_LIB   := RecoParticleFlowPFTracking
ALL_EXTERNAL_PRODS += RecoParticleFlowPFTracking
endif
ifeq ($(strip $(DQM/SiStripCommissioningClients)),)
DQMSiStripCommissioningClients := self/DQM/SiStripCommissioningClients
DQM/SiStripCommissioningClients := DQMSiStripCommissioningClients
DQMSiStripCommissioningClients_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMSiStripCommissioningClients_EX_USE := $(foreach d, self  CondFormats/SiStripObjects DataFormats/SiStripCommon DQM/SiStripCommissioningAnalysis DQM/SiStripCommissioningSummary DQM/SiStripCommon DQMServices/Core DQMServices/ClientConfig FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/ServiceRegistry FWCore/Utilities boost rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMSiStripCommissioningClients_EX_LIB   := DQMSiStripCommissioningClients
ALL_EXTERNAL_PRODS += DQMSiStripCommissioningClients
endif
ifeq ($(strip $(Utilities/StorageFactory)),)
UtilitiesStorageFactory := self/Utilities/StorageFactory
Utilities/StorageFactory := UtilitiesStorageFactory
UtilitiesStorageFactory_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
UtilitiesStorageFactory_EX_USE := $(foreach d, self  FWCore/PluginManager FWCore/MessageLogger FWCore/Utilities boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
UtilitiesStorageFactory_EX_LIB   := UtilitiesStorageFactory
ALL_EXTERNAL_PRODS += UtilitiesStorageFactory
endif
ifeq ($(strip $(RecoHI/HiEgammaAlgos)),)
RecoHIHiEgammaAlgos := self/RecoHI/HiEgammaAlgos
RecoHI/HiEgammaAlgos := RecoHIHiEgammaAlgos
RecoHIHiEgammaAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoHIHiEgammaAlgos_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet DataFormats/EgammaReco DataFormats/Candidate Geometry/CaloGeometry RecoEcal/EgammaClusterAlgos DataFormats/EgammaCandidates clhep root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoHIHiEgammaAlgos_EX_LIB   := RecoHIHiEgammaAlgos
ALL_EXTERNAL_PRODS += RecoHIHiEgammaAlgos
endif
ifeq ($(strip $(DPGAnalysis/SiStripTools)),)
DPGAnalysisSiStripTools := self/DPGAnalysis/SiStripTools
DPGAnalysis/SiStripTools := DPGAnalysisSiStripTools
DPGAnalysisSiStripTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DPGAnalysisSiStripTools_EX_USE := $(foreach d, self  root rootrflx FWCore/MessageLogger FWCore/Utilities FWCore/ServiceRegistry FWCore/Framework FWCore/ParameterSet CommonTools/UtilAlgos DataFormats/Luminosity DataFormats/Provenance DataFormats/SiStripDigi DataFormats/SiStripCluster DataFormats/SiPixelCluster DataFormats/Scalers DataFormats/Common DataFormats/DetId DataFormats/SiStripDetId DataFormats/TrackReco DataFormats/TrackerCommon CondFormats/DataRecord CondFormats/SiStripObjects CalibFormats/SiStripObjects CalibTracker/Records SimDataFormats/PileupSummaryInfo,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DPGAnalysisSiStripTools_LCGDICTS  := x 
DPGAnalysisSiStripTools_EX_LIB   := DPGAnalysisSiStripTools
ALL_EXTERNAL_PRODS += DPGAnalysisSiStripTools
endif
ifeq ($(strip $(Geometry/CSCGeometryBuilder)),)
GeometryCSCGeometryBuilder := self/Geometry/CSCGeometryBuilder
Geometry/CSCGeometryBuilder := GeometryCSCGeometryBuilder
GeometryCSCGeometryBuilder_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryCSCGeometryBuilder_EX_USE := $(foreach d, self  DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/MuonDetId DetectorDescription/Core FWCore/MessageLogger Geometry/CSCGeometry Geometry/CommonDetUnit Geometry/MuonNumbering,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryCSCGeometryBuilder_EX_LIB   := GeometryCSCGeometryBuilder
ALL_EXTERNAL_PRODS += GeometryCSCGeometryBuilder
endif
ifeq ($(strip $(Geometry/TrackerGeometryBuilder)),)
GeometryTrackerGeometryBuilder := self/Geometry/TrackerGeometryBuilder
Geometry/TrackerGeometryBuilder := GeometryTrackerGeometryBuilder
GeometryTrackerGeometryBuilder_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryTrackerGeometryBuilder_EX_USE := $(foreach d, self  DataFormats/GeometrySurface DataFormats/SiPixelDetId DataFormats/SiStripDetId DetectorDescription/Core FWCore/MessageLogger Geometry/CommonDetUnit Geometry/CommonTopologies Geometry/TrackerNumberingBuilder Utilities/General clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryTrackerGeometryBuilder_EX_LIB   := GeometryTrackerGeometryBuilder
ALL_EXTERNAL_PRODS += GeometryTrackerGeometryBuilder
endif
ifeq ($(strip $(FastSimulation/Muons)),)
src_FastSimulation_Muons := self/FastSimulation/Muons
FastSimulation/Muons  := src_FastSimulation_Muons
src_FastSimulation_Muons_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_FastSimulation_Muons_EX_USE := $(foreach d, TrackingTools/DetLayers self RecoMuon/GlobalTrackingTools DataFormats/TrackReco FWCore/ServiceRegistry Utilities/General TrackingTools/PatternTools FastSimDataFormats/L1GlobalMuonTrigger FWCore/ParameterSet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_FastSimulation_Muons
endif

ifeq ($(strip $(DQMOffline/PFTau)),)
DQMOfflinePFTau := self/DQMOffline/PFTau
DQMOffline/PFTau := DQMOfflinePFTau
DQMOfflinePFTau_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMOfflinePFTau_EX_USE := $(foreach d, self  DQMServices/Core DataFormats/Candidate DataFormats/Common DataFormats/ParticleFlowCandidate DataFormats/TauReco DataFormats/METReco DataFormats/Math FWCore/Utilities SimDataFormats/GeneratorProducts,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMOfflinePFTau_EX_LIB   := DQMOfflinePFTau
ALL_EXTERNAL_PRODS += DQMOfflinePFTau
endif
ifeq ($(strip $(TopQuarkAnalysis/TopPairBSM)),)
TopQuarkAnalysisTopPairBSM := self/TopQuarkAnalysis/TopPairBSM
TopQuarkAnalysis/TopPairBSM := TopQuarkAnalysisTopPairBSM
TopQuarkAnalysisTopPairBSM_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TopQuarkAnalysisTopPairBSM_EX_USE := $(foreach d, self  fastjet ktjet DataFormats/JetReco DataFormats/Candidate DataFormats/Common DataFormats/PatCandidates FWCore/Framework FWCore/ParameterSet AnalysisDataFormats/TopObjects TopQuarkAnalysis/TopTools PhysicsTools/HepMCCandAlgos rootcore root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TopQuarkAnalysisTopPairBSM_EX_LIB   := TopQuarkAnalysisTopPairBSM
ALL_EXTERNAL_PRODS += TopQuarkAnalysisTopPairBSM
endif
ifeq ($(strip $(DataFormats/WrappedStdDictionaries)),)
DataFormatsWrappedStdDictionaries := self/DataFormats/WrappedStdDictionaries
DataFormats/WrappedStdDictionaries := DataFormatsWrappedStdDictionaries
DataFormatsWrappedStdDictionaries_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsWrappedStdDictionaries_EX_USE := $(foreach d, self  DataFormats/Common rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsWrappedStdDictionaries_LCGDICTS  := x 
DataFormatsWrappedStdDictionaries_EX_LIB   := DataFormatsWrappedStdDictionaries
ALL_EXTERNAL_PRODS += DataFormatsWrappedStdDictionaries
endif
ifeq ($(strip $(DataFormats/JetReco)),)
DataFormatsJetReco := self/DataFormats/JetReco
DataFormats/JetReco := DataFormatsJetReco
DataFormatsJetReco_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsJetReco_EX_USE := $(foreach d, self  DataFormats/CaloTowers DataFormats/ParticleFlowCandidate DataFormats/Candidate DataFormats/Common DataFormats/HepMCCandidate DataFormats/ParticleFlowReco DataFormats/TrackReco FWCore/Utilities rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsJetReco_LCGDICTS  := x 
DataFormatsJetReco_EX_LIB   := DataFormatsJetReco
ALL_EXTERNAL_PRODS += DataFormatsJetReco
endif
ifeq ($(strip $(PhysicsTools/MVATrainer)),)
PhysicsToolsMVATrainer := self/PhysicsTools/MVATrainer
PhysicsTools/MVATrainer := PhysicsToolsMVATrainer
PhysicsToolsMVATrainer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsMVATrainer_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities CondFormats/PhysicsToolsObjects CondCore/DBOutputService PhysicsTools/MVAComputer boost rootcore roothistmatrix xerces-c,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsMVATrainer_LCGDICTS  := x 
PhysicsToolsMVATrainer_EX_LIB   := PhysicsToolsMVATrainer
ALL_EXTERNAL_PRODS += PhysicsToolsMVATrainer
endif
ifeq ($(strip $(Alignment/CommonAlignmentProducer)),)
AlignmentCommonAlignmentProducer := self/Alignment/CommonAlignmentProducer
Alignment/CommonAlignmentProducer := AlignmentCommonAlignmentProducer
AlignmentCommonAlignmentProducer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentCommonAlignmentProducer_EX_USE := $(foreach d, self  DataFormats/MuonDetId DataFormats/SiStripDetId DataFormats/SiPixelDetId DataFormats/TrackReco DataFormats/TrackerRecHit2D DataFormats/TrackingRecHit DataFormats/Candidate DataFormats/RecoCandidate DataFormats/Math FWCore/MessageLogger FWCore/Framework FWCore/Utilities FWCore/ParameterSet DataFormats/Alignment rootcore root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentCommonAlignmentProducer_EX_LIB   := AlignmentCommonAlignmentProducer
ALL_EXTERNAL_PRODS += AlignmentCommonAlignmentProducer
endif
ifeq ($(strip $(FastSimulation/CalorimeterProperties)),)
FastSimulationCalorimeterProperties := self/FastSimulation/CalorimeterProperties
FastSimulation/CalorimeterProperties := FastSimulationCalorimeterProperties
FastSimulationCalorimeterProperties_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationCalorimeterProperties_EX_USE := $(foreach d, self  DataFormats/DetId DataFormats/EcalDetId FWCore/MessageLogger FWCore/ParameterSet Geometry/CaloGeometry Geometry/CaloTopology Geometry/EcalAlgo,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationCalorimeterProperties_EX_LIB   := FastSimulationCalorimeterProperties
ALL_EXTERNAL_PRODS += FastSimulationCalorimeterProperties
endif
ifeq ($(strip $(CommonTools/RecoAlgos)),)
CommonToolsRecoAlgos := self/CommonTools/RecoAlgos
CommonTools/RecoAlgos := CommonToolsRecoAlgos
CommonToolsRecoAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CommonToolsRecoAlgos_EX_USE := $(foreach d, self  SimGeneral/HepPDTRecord DataFormats/RecoCandidate FWCore/Framework FWCore/ParameterSet DataFormats/TrackReco DataFormats/MuonReco DataFormats/TrackingRecHit DataFormats/SiStripCluster DataFormats/SiPixelCluster DataFormats/TrackerRecHit2D DataFormats/METReco,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CommonToolsRecoAlgos_EX_LIB   := CommonToolsRecoAlgos
ALL_EXTERNAL_PRODS += CommonToolsRecoAlgos
endif
ifeq ($(strip $(Alignment/MuonAlignment)),)
AlignmentMuonAlignment := self/Alignment/MuonAlignment
Alignment/MuonAlignment := AlignmentMuonAlignment
AlignmentMuonAlignment_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentMuonAlignment_EX_USE := $(foreach d, self  Alignment/CommonAlignment Geometry/DTGeometry Geometry/DTGeometryBuilder Geometry/CSCGeometry Geometry/CSCGeometryBuilder Geometry/CommonTopologies DetectorDescription/Core Geometry/Records DataFormats/DetId FWCore/Framework CondCore/DBCommon CondCore/DBOutputService CondFormats/Alignment DataFormats/MuonDetId DataFormats/TrackingRecHit xerces-c,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentMuonAlignment_EX_LIB   := AlignmentMuonAlignment
ALL_EXTERNAL_PRODS += AlignmentMuonAlignment
endif
ifeq ($(strip $(RecoVertex/BeamSpotProducer)),)
RecoVertexBeamSpotProducer := self/RecoVertex/BeamSpotProducer
RecoVertex/BeamSpotProducer := RecoVertexBeamSpotProducer
RecoVertexBeamSpotProducer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoVertexBeamSpotProducer_EX_USE := $(foreach d, self  CondCore/DBOutputService DataFormats/BeamSpot DataFormats/Scalers DataFormats/Common DataFormats/SiPixelDetId DataFormats/SiStripDetId DataFormats/TrackReco DataFormats/VertexReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/ServiceRegistry FWCore/Utilities clhep rootcore rootminuit2,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoVertexBeamSpotProducer_EX_LIB   := RecoVertexBeamSpotProducer
ALL_EXTERNAL_PRODS += RecoVertexBeamSpotProducer
endif
ifeq ($(strip $(RecoVertex/ConfigurableVertexReco)),)
RecoVertexConfigurableVertexReco := self/RecoVertex/ConfigurableVertexReco
RecoVertex/ConfigurableVertexReco := RecoVertexConfigurableVertexReco
RecoVertexConfigurableVertexReco_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoVertexConfigurableVertexReco_EX_USE := $(foreach d, self  FWCore/ParameterSet RecoVertex/AdaptiveVertexFit RecoVertex/TrimmedKalmanVertexFinder RecoVertex/AdaptiveVertexFinder RecoVertex/MultiVertexFit DataFormats/Math,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoVertexConfigurableVertexReco_EX_LIB   := RecoVertexConfigurableVertexReco
ALL_EXTERNAL_PRODS += RecoVertexConfigurableVertexReco
endif
ifeq ($(strip $(DataFormats/V0Candidate)),)
DataFormatsV0Candidate := self/DataFormats/V0Candidate
DataFormats/V0Candidate := DataFormatsV0Candidate
DataFormatsV0Candidate_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsV0Candidate_EX_USE := $(foreach d, self  DataFormats/CaloRecHit DataFormats/Common DataFormats/Math DataFormats/Candidate DataFormats/VertexReco FWCore/Utilities rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsV0Candidate_LCGDICTS  := x 
DataFormatsV0Candidate_EX_LIB   := DataFormatsV0Candidate
ALL_EXTERNAL_PRODS += DataFormatsV0Candidate
endif
ifeq ($(strip $(CommonTools/TrackerMap)),)
CommonToolsTrackerMap := self/CommonTools/TrackerMap
CommonTools/TrackerMap := CommonToolsTrackerMap
CommonToolsTrackerMap_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CommonToolsTrackerMap_EX_USE := $(foreach d, self  FWCore/Framework CondFormats/SiStripObjects CalibFormats/SiStripObjects rootgraphics,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CommonToolsTrackerMap_EX_LIB   := CommonToolsTrackerMap
ALL_EXTERNAL_PRODS += CommonToolsTrackerMap
endif
ifeq ($(strip $(DataFormats/Math)),)
DataFormatsMath := self/DataFormats/Math
DataFormats/Math := DataFormatsMath
DataFormatsMath_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsMath_EX_USE := $(foreach d, self  DataFormats/Common rootmath rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsMath_LCGDICTS  := x 
DataFormatsMath_EX_LIB   := DataFormatsMath
ALL_EXTERNAL_PRODS += DataFormatsMath
endif
ifeq ($(strip $(TopQuarkAnalysis/TopJetCombination)),)
TopQuarkAnalysisTopJetCombination := self/TopQuarkAnalysis/TopJetCombination
TopQuarkAnalysis/TopJetCombination := TopQuarkAnalysisTopJetCombination
TopQuarkAnalysisTopJetCombination_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TopQuarkAnalysisTopJetCombination_EX_USE := $(foreach d, self  AnalysisDataFormats/TopObjects TopQuarkAnalysis/TopTools FWCore/Framework,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TopQuarkAnalysisTopJetCombination_EX_LIB   := TopQuarkAnalysisTopJetCombination
ALL_EXTERNAL_PRODS += TopQuarkAnalysisTopJetCombination
endif
ifeq ($(strip $(L1Trigger/GlobalTriggerAnalyzer)),)
L1TriggerGlobalTriggerAnalyzer := self/L1Trigger/GlobalTriggerAnalyzer
L1Trigger/GlobalTriggerAnalyzer := L1TriggerGlobalTriggerAnalyzer
L1TriggerGlobalTriggerAnalyzer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerGlobalTriggerAnalyzer_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet DataFormats/Common DataFormats/L1GlobalTrigger DataFormats/L1GlobalMuonTrigger DataFormats/L1GlobalCaloTrigger DataFormats/L1Trigger CondFormats/L1TObjects CondFormats/DataRecord CommonTools/UtilAlgos,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerGlobalTriggerAnalyzer_EX_LIB   := L1TriggerGlobalTriggerAnalyzer
ALL_EXTERNAL_PRODS += L1TriggerGlobalTriggerAnalyzer
endif
ifeq ($(strip $(RecoHI/HiMuonAlgos)),)
RecoHIHiMuonAlgos := self/RecoHI/HiMuonAlgos
RecoHI/HiMuonAlgos := RecoHIHiMuonAlgos
RecoHIHiMuonAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoHIHiMuonAlgos_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet TrackingTools/TrackFitters TrackingTools/PatternTools DataFormats/TrackReco DataFormats/GsfTrackReco DataFormats/Math MagneticField/Engine MagneticField/Records Geometry/Records Geometry/TrackerGeometryBuilder TrackingTools/TransientTrack DataFormats/Common RecoTracker/CkfPattern RecoTracker/TransientTrackingRecHit TrackingTools/MeasurementDet RecoTracker/MeasurementDet RecoTracker/TkNavigation TrackingTools/MaterialEffects TrackingTools/TrajectoryCleaning TrackingTools/KalmanUpdators DataFormats/VertexReco RecoVertex/KalmanVertexFit RecoVertex/VertexPrimitives DataFormats/L1GlobalMuonTrigger rootrflx clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoHIHiMuonAlgos_EX_LIB   := RecoHIHiMuonAlgos
ALL_EXTERNAL_PRODS += RecoHIHiMuonAlgos
endif
ifeq ($(strip $(DataFormats/HepMCCandidate)),)
DataFormatsHepMCCandidate := self/DataFormats/HepMCCandidate
DataFormats/HepMCCandidate := DataFormatsHepMCCandidate
DataFormatsHepMCCandidate_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsHepMCCandidate_EX_USE := $(foreach d, self  DataFormats/Candidate DataFormats/Common root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsHepMCCandidate_LCGDICTS  := x 
DataFormatsHepMCCandidate_EX_LIB   := DataFormatsHepMCCandidate
ALL_EXTERNAL_PRODS += DataFormatsHepMCCandidate
endif
ifeq ($(strip $(CondFormats/Alignment)),)
CondFormatsAlignment := self/CondFormats/Alignment
CondFormats/Alignment := CondFormatsAlignment
CondFormatsAlignment_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsAlignment_EX_USE := $(foreach d, self  CondFormats/Common DataFormats/CLHEP DataFormats/Math boost clhep rootrflx DataFormats/DetId FWCore/Utilities,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsAlignment_LCGDICTS  := x 
CondFormatsAlignment_EX_LIB   := CondFormatsAlignment
ALL_EXTERNAL_PRODS += CondFormatsAlignment
endif
ifeq ($(strip $(DataFormats/Histograms)),)
DataFormatsHistograms := self/DataFormats/Histograms
DataFormats/Histograms := DataFormatsHistograms
DataFormatsHistograms_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsHistograms_EX_USE := $(foreach d, self  boost rootrflx roothistmatrix DataFormats/Common,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsHistograms_LCGDICTS  := x 
DataFormatsHistograms_EX_LIB   := DataFormatsHistograms
ALL_EXTERNAL_PRODS += DataFormatsHistograms
endif
ifeq ($(strip $(DataFormats/METObjects)),)
DataFormatsMETObjects := self/DataFormats/METObjects
DataFormats/METObjects := DataFormatsMETObjects
DataFormatsMETObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsMETObjects_EX_USE := $(foreach d, self  DataFormats/Common rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsMETObjects_LCGDICTS  := x 
DataFormatsMETObjects_EX_LIB   := DataFormatsMETObjects
ALL_EXTERNAL_PRODS += DataFormatsMETObjects
endif
ifeq ($(strip $(Utilities/ReleaseScripts)),)
src_Utilities_ReleaseScripts := self/Utilities/ReleaseScripts
Utilities/ReleaseScripts  := src_Utilities_ReleaseScripts
src_Utilities_ReleaseScripts_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_Utilities_ReleaseScripts_EX_USE := $(foreach d, self,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_Utilities_ReleaseScripts
endif

ifeq ($(strip $(RecoMuon/TrackingTools)),)
RecoMuonTrackingTools := self/RecoMuon/TrackingTools
RecoMuon/TrackingTools := RecoMuonTrackingTools
RecoMuonTrackingTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoMuonTrackingTools_EX_USE := $(foreach d, self  DataFormats/BeamSpot DataFormats/Common DataFormats/DetId DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/Math DataFormats/TrackReco DataFormats/TrajectorySeed FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities Geometry/CommonDetUnit Geometry/Records MagneticField/Engine MagneticField/Records RecoMuon/DetLayers RecoMuon/Navigation RecoMuon/Records RecoMuon/TransientTrackingRecHit RecoVertex/KalmanVertexFit TrackingTools/DetLayers TrackingTools/GeomPropagators TrackingTools/KalmanUpdators TrackingTools/PatternTools TrackingTools/Records TrackingTools/TrackFitters TrackingTools/TrajectoryState TrackingTools/TransientTrack TrackingTools/TransientTrackingRecHit DataFormats/CSCRecHit DataFormats/DTRecHit TrackingTools/TrackRefitter roothistmatrix,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoMuonTrackingTools_EX_LIB   := RecoMuonTrackingTools
ALL_EXTERNAL_PRODS += RecoMuonTrackingTools
endif
ifeq ($(strip $(RecoMuon/GlobalTrackFinder)),)
RecoMuonGlobalTrackFinder := self/RecoMuon/GlobalTrackFinder
RecoMuon/GlobalTrackFinder := RecoMuonGlobalTrackFinder
RecoMuonGlobalTrackFinder_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoMuonGlobalTrackFinder_EX_USE := $(foreach d, self  DataFormats/TrackReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry RecoMuon/GlobalTrackingTools RecoMuon/TrackingTools TrackingTools/PatternTools,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoMuonGlobalTrackFinder_EX_LIB   := RecoMuonGlobalTrackFinder
ALL_EXTERNAL_PRODS += RecoMuonGlobalTrackFinder
endif
ifeq ($(strip $(CondFormats/EgammaObjects)),)
CondFormatsEgammaObjects := self/CondFormats/EgammaObjects
CondFormats/EgammaObjects := CondFormatsEgammaObjects
CondFormatsEgammaObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsEgammaObjects_EX_USE := $(foreach d, self  FWCore/Utilities CondFormats/Common CondFormats/PhysicsToolsObjects rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsEgammaObjects_LCGDICTS  := x 
CondFormatsEgammaObjects_EX_LIB   := CondFormatsEgammaObjects
ALL_EXTERNAL_PRODS += CondFormatsEgammaObjects
endif
ifeq ($(strip $(RecoLocalCalo/EcalRecProducers)),)
RecoLocalCaloEcalRecProducers := self/RecoLocalCalo/EcalRecProducers
RecoLocalCalo/EcalRecProducers := RecoLocalCaloEcalRecProducers
RecoLocalCaloEcalRecProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoLocalCaloEcalRecProducers_EX_USE := $(foreach d, self  FWCore/MessageLogger FWCore/Framework clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoLocalCaloEcalRecProducers_EX_LIB   := RecoLocalCaloEcalRecProducers
ALL_EXTERNAL_PRODS += RecoLocalCaloEcalRecProducers
endif
ifeq ($(strip $(PerfTools/Callgrind)),)
PerfToolsCallgrind := self/PerfTools/Callgrind
PerfTools/Callgrind := PerfToolsCallgrind
PerfToolsCallgrind_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PerfToolsCallgrind_EX_USE := $(foreach d, self  FWCore/ServiceRegistry FWCore/MessageLogger FWCore/ParameterSet valgrind,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PerfToolsCallgrind_EX_LIB   := PerfToolsCallgrind
ALL_EXTERNAL_PRODS += PerfToolsCallgrind
endif
ifeq ($(strip $(FWCore/RootAutoLibraryLoader)),)
FWCoreRootAutoLibraryLoader := self/FWCore/RootAutoLibraryLoader
FWCore/RootAutoLibraryLoader := FWCoreRootAutoLibraryLoader
FWCoreRootAutoLibraryLoader_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCoreRootAutoLibraryLoader_EX_USE := $(foreach d, self  FWCore/PluginManager rootrflx rootcintex rootcore boost_regex boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCoreRootAutoLibraryLoader_EX_LIB   := FWCoreRootAutoLibraryLoader
ALL_EXTERNAL_PRODS += FWCoreRootAutoLibraryLoader
endif
ifeq ($(strip $(PhysicsTools/ParallelAnalysis)),)
PhysicsToolsParallelAnalysis := self/PhysicsTools/ParallelAnalysis
PhysicsTools/ParallelAnalysis := PhysicsToolsParallelAnalysis
PhysicsToolsParallelAnalysis_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsParallelAnalysis_EX_USE := $(foreach d, self  DataFormats/Common FWCore/Framework FWCore/PluginManager FWCore/TFWLiteSelector clhep rootgpad rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsParallelAnalysis_LCGDICTS  := x 
PhysicsToolsParallelAnalysis_EX_LIB   := PhysicsToolsParallelAnalysis
ALL_EXTERNAL_PRODS += PhysicsToolsParallelAnalysis
endif
ifeq ($(strip $(SimMuon/MCTruth)),)
SimMuonMCTruth := self/SimMuon/MCTruth
SimMuon/MCTruth := SimMuonMCTruth
SimMuonMCTruth_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimMuonMCTruth_EX_USE := $(foreach d, self  CondFormats/DataRecord FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities DataFormats/Common DataFormats/GeometryVector DataFormats/CSCRecHit DataFormats/DTRecHit DataFormats/RPCRecHit DataFormats/TrackingRecHit DataFormats/TrackReco DataFormats/MuonReco SimDataFormats/Track SimDataFormats/TrackingHit SimDataFormats/TrackerDigiSimLink SimDataFormats/DigiSimLinks SimTracker/TrackerHitAssociation SimDataFormats/TrackingAnalysis CondFormats/CSCObjects Geometry/CommonTopologies Geometry/Records Geometry/CSCGeometry Geometry/DTGeometry boost clhep root rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimMuonMCTruth_EX_LIB   := SimMuonMCTruth
ALL_EXTERNAL_PRODS += SimMuonMCTruth
endif
ifeq ($(strip $(GeneratorInterface/EvtGenInterface)),)
GeneratorInterfaceEvtGenInterface := self/GeneratorInterface/EvtGenInterface
GeneratorInterface/EvtGenInterface := GeneratorInterfaceEvtGenInterface
GeneratorInterfaceEvtGenInterface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfaceEvtGenInterface_EX_USE := $(foreach d, self  FWCore/ParameterSet FWCore/Framework FWCore/PluginManager hepmc clhep heppdt,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeneratorInterfaceEvtGenInterface_EX_LIB   := GeneratorInterfaceEvtGenInterface
ALL_EXTERNAL_PRODS += GeneratorInterfaceEvtGenInterface
endif
ifeq ($(strip $(CondFormats/HLTObjects)),)
CondFormatsHLTObjects := self/CondFormats/HLTObjects
CondFormats/HLTObjects := CondFormatsHLTObjects
CondFormatsHLTObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsHLTObjects_EX_USE := $(foreach d, self  FWCore/Utilities CondFormats/Common rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsHLTObjects_LCGDICTS  := x 
CondFormatsHLTObjects_EX_LIB   := CondFormatsHLTObjects
ALL_EXTERNAL_PRODS += CondFormatsHLTObjects
endif
ifeq ($(strip $(DataFormats/SiPixelCluster)),)
DataFormatsSiPixelCluster := self/DataFormats/SiPixelCluster
DataFormats/SiPixelCluster := DataFormatsSiPixelCluster
DataFormatsSiPixelCluster_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsSiPixelCluster_EX_USE := $(foreach d, self  DataFormats/Common rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsSiPixelCluster_LCGDICTS  := x 
DataFormatsSiPixelCluster_EX_LIB   := DataFormatsSiPixelCluster
ALL_EXTERNAL_PRODS += DataFormatsSiPixelCluster
endif
ifeq ($(strip $(FastSimulation/ParticlePropagator)),)
FastSimulationParticlePropagator := self/FastSimulation/ParticlePropagator
FastSimulation/ParticlePropagator := FastSimulationParticlePropagator
FastSimulationParticlePropagator_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationParticlePropagator_EX_USE := $(foreach d, self  DataFormats/GeometrySurface DataFormats/GeometryVector FWCore/Framework FastSimulation/BaseParticlePropagator FastSimulation/Event FastSimulation/TrackerSetup FastSimulation/Utilities MagneticField/Engine MagneticField/Records boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationParticlePropagator_EX_LIB   := FastSimulationParticlePropagator
ALL_EXTERNAL_PRODS += FastSimulationParticlePropagator
endif
ifeq ($(strip $(SimCalorimetry/HcalTrigPrimAlgos)),)
SimCalorimetryHcalTrigPrimAlgos := self/SimCalorimetry/HcalTrigPrimAlgos
SimCalorimetry/HcalTrigPrimAlgos := SimCalorimetryHcalTrigPrimAlgos
SimCalorimetryHcalTrigPrimAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimCalorimetryHcalTrigPrimAlgos_EX_USE := $(foreach d, self  CondFormats/HcalObjects CalibCalorimetry/HcalAlgos CalibCalorimetry/HcalTPGAlgos CalibFormats/HcalObjects DataFormats/HcalDigi CalibFormats/CaloTPG Geometry/HcalTowerAlgo EventFilter/HcalRawToDigi clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimCalorimetryHcalTrigPrimAlgos_EX_LIB   := SimCalorimetryHcalTrigPrimAlgos
ALL_EXTERNAL_PRODS += SimCalorimetryHcalTrigPrimAlgos
endif
ifeq ($(strip $(MagneticField/UniformEngine)),)
MagneticFieldUniformEngine := self/MagneticField/UniformEngine
MagneticField/UniformEngine := MagneticFieldUniformEngine
MagneticFieldUniformEngine_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
MagneticFieldUniformEngine_EX_USE := $(foreach d, self  MagneticField/Engine,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
MagneticFieldUniformEngine_EX_LIB   := MagneticFieldUniformEngine
ALL_EXTERNAL_PRODS += MagneticFieldUniformEngine
endif
ifeq ($(strip $(RecoLocalTracker/SiStripClusterizer)),)
RecoLocalTrackerSiStripClusterizer := self/RecoLocalTracker/SiStripClusterizer
RecoLocalTracker/SiStripClusterizer := RecoLocalTrackerSiStripClusterizer
RecoLocalTrackerSiStripClusterizer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoLocalTrackerSiStripClusterizer_EX_USE := $(foreach d, self  DataFormats/Common FWCore/Framework FWCore/ParameterSet DataFormats/SiStripDigi DataFormats/SiStripCluster DataFormats/SiStripDetId CondFormats/DataRecord CondFormats/SiStripObjects CalibFormats/SiStripObjects CalibTracker/Records,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoLocalTrackerSiStripClusterizer_EX_LIB   := RecoLocalTrackerSiStripClusterizer
ALL_EXTERNAL_PRODS += RecoLocalTrackerSiStripClusterizer
endif
ifeq ($(strip $(RecoTracker/TkDetLayers)),)
RecoTrackerTkDetLayers := self/RecoTracker/TkDetLayers
RecoTracker/TkDetLayers := RecoTrackerTkDetLayers
RecoTrackerTkDetLayers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerTkDetLayers_EX_USE := $(foreach d, self  TrackingTools/DetLayers TrackingTools/GeomPropagators TrackingTools/PatternTools clhep Utilities/General DataFormats/SiStripDetId DataFormats/SiPixelDetId Geometry/TrackerGeometryBuilder FWCore/MessageLogger,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerTkDetLayers_EX_LIB   := RecoTrackerTkDetLayers
ALL_EXTERNAL_PRODS += RecoTrackerTkDetLayers
endif
ifeq ($(strip $(RecoBTag/SoftLepton)),)
RecoBTagSoftLepton := self/RecoBTag/SoftLepton
RecoBTag/SoftLepton := RecoBTagSoftLepton
RecoBTagSoftLepton_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoBTagSoftLepton_EX_USE := $(foreach d, self  FWCore/ParameterSet DataFormats/BTauReco RecoBTau/JetTagComputer,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoBTagSoftLepton_EX_LIB   := RecoBTagSoftLepton
ALL_EXTERNAL_PRODS += RecoBTagSoftLepton
endif
ifeq ($(strip $(DataFormats/HcalDetId)),)
DataFormatsHcalDetId := self/DataFormats/HcalDetId
DataFormats/HcalDetId := DataFormatsHcalDetId
DataFormatsHcalDetId_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsHcalDetId_EX_USE := $(foreach d, self  FWCore/Utilities boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsHcalDetId_LCGDICTS  := x 
DataFormatsHcalDetId_EX_LIB   := DataFormatsHcalDetId
ALL_EXTERNAL_PRODS += DataFormatsHcalDetId
endif
ifeq ($(strip $(Validation/MuonRPCGeometry)),)
ValidationMuonRPCGeometry := self/Validation/MuonRPCGeometry
Validation/MuonRPCGeometry := ValidationMuonRPCGeometry
ValidationMuonRPCGeometry_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
ValidationMuonRPCGeometry_EX_USE := $(foreach d, self  DataFormats/MuonDetId FWCore/Framework Geometry/CommonDetUnit Geometry/CommonTopologies Geometry/Records Geometry/RPCGeometry,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ValidationMuonRPCGeometry_EX_LIB   := ValidationMuonRPCGeometry
ALL_EXTERNAL_PRODS += ValidationMuonRPCGeometry
endif
ifeq ($(strip $(TrackingTools/MeasurementDet)),)
TrackingToolsMeasurementDet := self/TrackingTools/MeasurementDet
TrackingTools/MeasurementDet := TrackingToolsMeasurementDet
TrackingToolsMeasurementDet_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsMeasurementDet_EX_USE := $(foreach d, self  TrackingTools/TransientTrackingRecHit TrackingTools/PatternTools,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsMeasurementDet_EX_LIB   := TrackingToolsMeasurementDet
ALL_EXTERNAL_PRODS += TrackingToolsMeasurementDet
endif
ifeq ($(strip $(SimG4CMS/HcalTestBeam)),)
SimG4CMSHcalTestBeam := self/SimG4CMS/HcalTestBeam
SimG4CMS/HcalTestBeam := SimG4CMSHcalTestBeam
SimG4CMSHcalTestBeam_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CMSHcalTestBeam_EX_USE := $(foreach d, self  SimG4Core/Notification SimG4Core/Watcher SimG4CMS/Calo Geometry/EcalCommonData Geometry/HcalCommonData DataFormats/HcalDetId DataFormats/Math SimDataFormats/HcalTestBeam FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/ServiceRegistry CommonTools/UtilAlgos geant4core boost root hepmc rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CMSHcalTestBeam_EX_LIB   := SimG4CMSHcalTestBeam
ALL_EXTERNAL_PRODS += SimG4CMSHcalTestBeam
endif
ifeq ($(strip $(CalibCalorimetry/EcalTPGTools)),)
CalibCalorimetryEcalTPGTools := self/CalibCalorimetry/EcalTPGTools
CalibCalorimetry/EcalTPGTools := CalibCalorimetryEcalTPGTools
CalibCalorimetryEcalTPGTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibCalorimetryEcalTPGTools_EX_USE := $(foreach d, self  DataFormats/EcalDigi DataFormats/EcalDetId CondFormats/DataRecord CondFormats/EcalObjects SimCalorimetry/EcalSimAlgos FWCore/Framework FWCore/Utilities CondCore/DBCommon CondCore/DBOutputService,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibCalorimetryEcalTPGTools_EX_LIB   := CalibCalorimetryEcalTPGTools
ALL_EXTERNAL_PRODS += CalibCalorimetryEcalTPGTools
endif
ifeq ($(strip $(DataFormats/L1CSCTrackFinder)),)
DataFormatsL1CSCTrackFinder := self/DataFormats/L1CSCTrackFinder
DataFormats/L1CSCTrackFinder := DataFormatsL1CSCTrackFinder
DataFormatsL1CSCTrackFinder_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsL1CSCTrackFinder_EX_USE := $(foreach d, self  DataFormats/CSCDigi DataFormats/Common DataFormats/DetId DataFormats/L1GlobalMuonTrigger DataFormats/MuonDetId rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsL1CSCTrackFinder_LCGDICTS  := x 
DataFormatsL1CSCTrackFinder_EX_LIB   := DataFormatsL1CSCTrackFinder
ALL_EXTERNAL_PRODS += DataFormatsL1CSCTrackFinder
endif
ifeq ($(strip $(TrackingTools/TrackRefitter)),)
TrackingToolsTrackRefitter := self/TrackingTools/TrackRefitter
TrackingTools/TrackRefitter := TrackingToolsTrackRefitter
TrackingToolsTrackRefitter_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsTrackRefitter_EX_USE := $(foreach d, self  FWCore/Framework TrackingTools/TransientTrackingRecHit TrackingTools/TransientTrack TrackingTools/TrackFitters RecoMuon/TransientTrackingRecHit MagneticField/Engine clhep root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsTrackRefitter_EX_LIB   := TrackingToolsTrackRefitter
ALL_EXTERNAL_PRODS += TrackingToolsTrackRefitter
endif
ifeq ($(strip $(Validation/RecoEgamma)),)
src_Validation_RecoEgamma := self/Validation/RecoEgamma
Validation/RecoEgamma  := src_Validation_RecoEgamma
src_Validation_RecoEgamma_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_Validation_RecoEgamma_EX_USE := $(foreach d, FWCore/Framework self DQMServices/Components DQMServices/Core FWCore/ParameterSet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_Validation_RecoEgamma
endif

ifeq ($(strip $(Alignment/CocoaAnalysis)),)
AlignmentCocoaAnalysis := self/Alignment/CocoaAnalysis
Alignment/CocoaAnalysis := AlignmentCocoaAnalysis
AlignmentCocoaAnalysis_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentCocoaAnalysis_EX_USE := $(foreach d, self  Alignment/CocoaUtilities Alignment/CocoaModel clhep rootcore meschach,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentCocoaAnalysis_ROOTDICT  := LinkDef
AlignmentCocoaAnalysis_EX_LIB   := AlignmentCocoaAnalysis
ALL_EXTERNAL_PRODS += AlignmentCocoaAnalysis
endif
ifeq ($(strip $(CalibFormats/SiStripObjects)),)
CalibFormatsSiStripObjects := self/CalibFormats/SiStripObjects
CalibFormats/SiStripObjects := CalibFormatsSiStripObjects
CalibFormatsSiStripObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibFormatsSiStripObjects_EX_USE := $(foreach d, self  FWCore/Framework FWCore/MessageLogger DataFormats/SiStripCommon DataFormats/SiStripDetId CondFormats/SiStripObjects CalibTracker/SiStripCommon boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibFormatsSiStripObjects_EX_LIB   := CalibFormatsSiStripObjects
ALL_EXTERNAL_PRODS += CalibFormatsSiStripObjects
endif
ifeq ($(strip $(PhysicsTools/HepMCCandAlgos)),)
PhysicsToolsHepMCCandAlgos := self/PhysicsTools/HepMCCandAlgos
PhysicsTools/HepMCCandAlgos := PhysicsToolsHepMCCandAlgos
PhysicsToolsHepMCCandAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsHepMCCandAlgos_EX_USE := $(foreach d, self  SimGeneral/HepPDTRecord DataFormats/Candidate DataFormats/Common DataFormats/HepMCCandidate,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsHepMCCandAlgos_EX_LIB   := PhysicsToolsHepMCCandAlgos
ALL_EXTERNAL_PRODS += PhysicsToolsHepMCCandAlgos
endif
ifeq ($(strip $(L1Trigger/DTBti)),)
L1TriggerDTBti := self/L1Trigger/DTBti
L1Trigger/DTBti := L1TriggerDTBti
L1TriggerDTBti_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerDTBti_EX_USE := $(foreach d, self  FWCore/Framework DataFormats/Common FWCore/PluginManager FWCore/ParameterSet CalibMuon/DTDigiSync DataFormats/DTDigi Geometry/DTGeometry L1TriggerConfig/DTTPGConfig L1Trigger/DTUtilities clhep root rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerDTBti_EX_LIB   := L1TriggerDTBti
ALL_EXTERNAL_PRODS += L1TriggerDTBti
endif
ifeq ($(strip $(CondTools/L1Trigger)),)
CondToolsL1Trigger := self/CondTools/L1Trigger
CondTools/L1Trigger := CondToolsL1Trigger
CondToolsL1Trigger_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondToolsL1Trigger_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet CondCore/DBOutputService CondCore/DBCommon CondCore/IOVService CondCore/MetaDataService CondCore/PluginSystem CondFormats/DataRecord CondFormats/L1TObjects,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondToolsL1Trigger_EX_LIB   := CondToolsL1Trigger
ALL_EXTERNAL_PRODS += CondToolsL1Trigger
endif
ifeq ($(strip $(DQM/HLTEvF)),)
DQMHLTEvF := self/DQM/HLTEvF
DQM/HLTEvF := DQMHLTEvF
DQMHLTEvF_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMHLTEvF_EX_USE := $(foreach d, self  DQMServices/Core DataFormats/Common DataFormats/HLTReco DataFormats/Provenance DataFormats/BTauReco DataFormats/TauReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Services FWCore/Utilities Geometry/CaloGeometry Geometry/CaloTopology RecoEcal/EgammaCoreTools HLTrigger/HLTcore sigcpp rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMHLTEvF_EX_LIB   := DQMHLTEvF
ALL_EXTERNAL_PRODS += DQMHLTEvF
endif
ifeq ($(strip $(DQM/SiStripCommon)),)
DQMSiStripCommon := self/DQM/SiStripCommon
DQM/SiStripCommon := DQMSiStripCommon
DQMSiStripCommon_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMSiStripCommon_EX_USE := $(foreach d, self  DataFormats/SiStripDetId DataFormats/DetId DataFormats/SiStripDigi DataFormats/Common CalibTracker/SiStripCommon CommonTools/TrackerMap DQMServices/Core FWCore/MessageLogger FWCore/Utilities FWCore/ServiceRegistry boost rootgraphics,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMSiStripCommon_EX_LIB   := DQMSiStripCommon
ALL_EXTERNAL_PRODS += DQMSiStripCommon
endif
ifeq ($(strip $(CondFormats/RunInfo)),)
CondFormatsRunInfo := self/CondFormats/RunInfo
CondFormats/RunInfo := CondFormatsRunInfo
CondFormatsRunInfo_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsRunInfo_EX_USE := $(foreach d, self  CondFormats/Common FWCore/Utilities CoralBase rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsRunInfo_LCGDICTS  := x 
CondFormatsRunInfo_EX_LIB   := CondFormatsRunInfo
ALL_EXTERNAL_PRODS += CondFormatsRunInfo
endif
ifeq ($(strip $(DQM/SiStripMonitorHardware)),)
DQMSiStripMonitorHardware := self/DQM/SiStripMonitorHardware
DQM/SiStripMonitorHardware := DQMSiStripMonitorHardware
DQMSiStripMonitorHardware_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMSiStripMonitorHardware_EX_USE := $(foreach d, self  FWCore/MessageLogger FWCore/Framework FWCore/ParameterSet FWCore/Utilities FWCore/ServiceRegistry FWCore/Sources DQMServices/Core DataFormats/SiStripCommon DataFormats/SiStripDigi DataFormats/Common DataFormats/FEDRawData CondFormats/SiStripObjects CommonTools/UtilAlgos EventFilter/SiStripRawToDigi DQM/SiStripCommon boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMSiStripMonitorHardware_EX_LIB   := DQMSiStripMonitorHardware
ALL_EXTERNAL_PRODS += DQMSiStripMonitorHardware
endif
ifeq ($(strip $(SimDataFormats/DigiSimLinks)),)
SimDataFormatsDigiSimLinks := self/SimDataFormats/DigiSimLinks
SimDataFormats/DigiSimLinks := SimDataFormatsDigiSimLinks
SimDataFormatsDigiSimLinks_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsDigiSimLinks_EX_USE := $(foreach d, self  DataFormats/Common SimDataFormats/EncodedEventId DataFormats/MuonDetId boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsDigiSimLinks_LCGDICTS  := x 
SimDataFormatsDigiSimLinks_EX_LIB   := SimDataFormatsDigiSimLinks
ALL_EXTERNAL_PRODS += SimDataFormatsDigiSimLinks
endif
ifeq ($(strip $(DQM/SiPixelMonitorRawData)),)
DQMSiPixelMonitorRawData := self/DQM/SiPixelMonitorRawData
DQM/SiPixelMonitorRawData := DQMSiPixelMonitorRawData
DQMSiPixelMonitorRawData_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMSiPixelMonitorRawData_EX_USE := $(foreach d, self  DataFormats/FEDRawData FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DQMServices/Core DQM/SiPixelCommon Geometry/CommonDetUnit boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMSiPixelMonitorRawData_EX_LIB   := DQMSiPixelMonitorRawData
ALL_EXTERNAL_PRODS += DQMSiPixelMonitorRawData
endif
ifeq ($(strip $(CalibCalorimetry/HcalAlgos)),)
CalibCalorimetryHcalAlgos := self/CalibCalorimetry/HcalAlgos
CalibCalorimetry/HcalAlgos := CalibCalorimetryHcalAlgos
CalibCalorimetryHcalAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibCalorimetryHcalAlgos_EX_USE := $(foreach d, self  boost root clhep FWCore/Framework FWCore/MessageLogger DataFormats/HcalDetId CondFormats/HcalObjects DataFormats/HcalDigi CalibFormats/HcalObjects,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibCalorimetryHcalAlgos_EX_LIB   := CalibCalorimetryHcalAlgos
ALL_EXTERNAL_PRODS += CalibCalorimetryHcalAlgos
endif
ifeq ($(strip $(SimCalorimetry/HcalZeroSuppressionAlgos)),)
SimCalorimetryHcalZeroSuppressionAlgos := self/SimCalorimetry/HcalZeroSuppressionAlgos
SimCalorimetry/HcalZeroSuppressionAlgos := SimCalorimetryHcalZeroSuppressionAlgos
SimCalorimetryHcalZeroSuppressionAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimCalorimetryHcalZeroSuppressionAlgos_EX_USE := $(foreach d, self  DataFormats/HcalDetId DataFormats/HcalDigi CondFormats/HcalObjects CalibFormats/HcalObjects boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimCalorimetryHcalZeroSuppressionAlgos_EX_LIB   := SimCalorimetryHcalZeroSuppressionAlgos
ALL_EXTERNAL_PRODS += SimCalorimetryHcalZeroSuppressionAlgos
endif
ifeq ($(strip $(RecoLocalTracker/SiStripZeroSuppression)),)
RecoLocalTrackerSiStripZeroSuppression := self/RecoLocalTracker/SiStripZeroSuppression
RecoLocalTracker/SiStripZeroSuppression := RecoLocalTrackerSiStripZeroSuppression
RecoLocalTrackerSiStripZeroSuppression_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoLocalTrackerSiStripZeroSuppression_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/Utilities FWCore/ServiceRegistry DataFormats/Common DataFormats/FEDRawData DataFormats/SiStripDetId CondFormats/DataRecord CondFormats/SiStripObjects CalibFormats/SiStripObjects CalibTracker/Records CommonTools/UtilAlgos root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoLocalTrackerSiStripZeroSuppression_EX_LIB   := RecoLocalTrackerSiStripZeroSuppression
ALL_EXTERNAL_PRODS += RecoLocalTrackerSiStripZeroSuppression
endif
ifeq ($(strip $(DataFormats/GeometryCommonDetAlgo)),)
DataFormatsGeometryCommonDetAlgo := self/DataFormats/GeometryCommonDetAlgo
DataFormats/GeometryCommonDetAlgo := DataFormatsGeometryCommonDetAlgo
DataFormatsGeometryCommonDetAlgo_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsGeometryCommonDetAlgo_EX_USE := $(foreach d, self  DataFormats/Math DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/Common FWCore/Utilities rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsGeometryCommonDetAlgo_LCGDICTS  := x 
DataFormatsGeometryCommonDetAlgo_EX_LIB   := DataFormatsGeometryCommonDetAlgo
ALL_EXTERNAL_PRODS += DataFormatsGeometryCommonDetAlgo
endif
ifeq ($(strip $(RecoMuon/StandAloneTrackFinder)),)
RecoMuonStandAloneTrackFinder := self/RecoMuon/StandAloneTrackFinder
RecoMuon/StandAloneTrackFinder := RecoMuonStandAloneTrackFinder
RecoMuonStandAloneTrackFinder_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoMuonStandAloneTrackFinder_EX_USE := $(foreach d, self  DataFormats/TrajectorySeed DataFormats/TrajectoryState FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities Geometry/CommonDetUnit RecoMuon/MeasurementDet RecoMuon/Navigation RecoMuon/TrackingTools TrackingTools/DetLayers TrackingTools/GeomPropagators TrackingTools/KalmanUpdators TrackingTools/PatternTools TrackingTools/Records TrackingTools/TrackFitters TrackingTools/TrackRefitter TrackingTools/TrajectoryState,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoMuonStandAloneTrackFinder_EX_LIB   := RecoMuonStandAloneTrackFinder
ALL_EXTERNAL_PRODS += RecoMuonStandAloneTrackFinder
endif
ifeq ($(strip $(RecoMuon/DetLayers)),)
RecoMuonDetLayers := self/RecoMuon/DetLayers
RecoMuon/DetLayers := RecoMuonDetLayers
RecoMuonDetLayers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoMuonDetLayers_EX_USE := $(foreach d, self  DataFormats/GeometrySurface DataFormats/GeometryVector DataFormats/MuonDetId FWCore/Framework FWCore/MessageLogger FWCore/Utilities TrackingTools/DetLayers Utilities/BinningTools,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoMuonDetLayers_EX_LIB   := RecoMuonDetLayers
ALL_EXTERNAL_PRODS += RecoMuonDetLayers
endif
ifeq ($(strip $(GeneratorInterface/PyquenInterface)),)
GeneratorInterfacePyquenInterface := self/GeneratorInterface/PyquenInterface
GeneratorInterface/PyquenInterface := GeneratorInterfacePyquenInterface
GeneratorInterfacePyquenInterface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfacePyquenInterface_EX_USE := $(foreach d, self  boost FWCore/Framework GeneratorInterface/Core GeneratorInterface/HiGenCommon SimDataFormats/GeneratorProducts clhep f77compiler GeneratorInterface/Pythia6Interface GeneratorInterface/ExternalDecays,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeneratorInterfacePyquenInterface_EX_LIB   := GeneratorInterfacePyquenInterface
ALL_EXTERNAL_PRODS += GeneratorInterfacePyquenInterface
endif
ifeq ($(strip $(DataFormats/FEDRawData)),)
DataFormatsFEDRawData := self/DataFormats/FEDRawData
DataFormats/FEDRawData := DataFormatsFEDRawData
DataFormatsFEDRawData_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsFEDRawData_EX_USE := $(foreach d, self  DataFormats/Common FWCore/Utilities rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsFEDRawData_LCGDICTS  := x 
DataFormatsFEDRawData_EX_LIB   := DataFormatsFEDRawData
ALL_EXTERNAL_PRODS += DataFormatsFEDRawData
endif
ifeq ($(strip $(SimDataFormats/HcalTestBeam)),)
SimDataFormatsHcalTestBeam := self/SimDataFormats/HcalTestBeam
SimDataFormats/HcalTestBeam := SimDataFormatsHcalTestBeam
SimDataFormatsHcalTestBeam_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsHcalTestBeam_EX_USE := $(foreach d, self  DataFormats/Common FWCore/MessageLogger rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsHcalTestBeam_LCGDICTS  := x 
SimDataFormatsHcalTestBeam_EX_LIB   := SimDataFormatsHcalTestBeam
ALL_EXTERNAL_PRODS += SimDataFormatsHcalTestBeam
endif
ifeq ($(strip $(Alignment/CocoaDDLObjects)),)
AlignmentCocoaDDLObjects := self/Alignment/CocoaDDLObjects
Alignment/CocoaDDLObjects := AlignmentCocoaDDLObjects
AlignmentCocoaDDLObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentCocoaDDLObjects_EX_USE := $(foreach d, self  clhep Alignment/CocoaUtilities,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentCocoaDDLObjects_EX_LIB   := AlignmentCocoaDDLObjects
ALL_EXTERNAL_PRODS += AlignmentCocoaDDLObjects
endif
ifeq ($(strip $(Utilities/XrdAdaptor)),)
UtilitiesXrdAdaptor := self/Utilities/XrdAdaptor
Utilities/XrdAdaptor := UtilitiesXrdAdaptor
UtilitiesXrdAdaptor_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
UtilitiesXrdAdaptor_EX_USE := $(foreach d, self  Utilities/StorageFactory FWCore/Utilities FWCore/MessageLogger xrootd,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
UtilitiesXrdAdaptor_EX_LIB   := UtilitiesXrdAdaptor
ALL_EXTERNAL_PRODS += UtilitiesXrdAdaptor
endif
ifeq ($(strip $(HLTrigger/Timer)),)
HLTriggerTimer := self/HLTrigger/Timer
HLTrigger/Timer := HLTriggerTimer
HLTriggerTimer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
HLTriggerTimer_EX_USE := $(foreach d, self  DataFormats/HLTReco DataFormats/Provenance FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities DQMServices/Core sigcpp sockets,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
HLTriggerTimer_EX_LIB   := HLTriggerTimer
ALL_EXTERNAL_PRODS += HLTriggerTimer
endif
ifeq ($(strip $(OnlineDB/SiStripConfigDb)),)
OnlineDBSiStripConfigDb := self/OnlineDB/SiStripConfigDb
OnlineDB/SiStripConfigDb := OnlineDBSiStripConfigDb
OnlineDBSiStripConfigDb_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
OnlineDBSiStripConfigDb_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/SiStripCommon FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities tkonlineswdb boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
OnlineDBSiStripConfigDb_EX_LIB   := OnlineDBSiStripConfigDb
ALL_EXTERNAL_PRODS += OnlineDBSiStripConfigDb
endif
ifeq ($(strip $(CommonTools/TriggerUtils)),)
CommonToolsTriggerUtils := self/CommonTools/TriggerUtils
CommonTools/TriggerUtils := CommonToolsTriggerUtils
CommonToolsTriggerUtils_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CommonToolsTriggerUtils_EX_USE := $(foreach d, self  CondFormats/DataRecord CondFormats/L1TObjects DataFormats/Common DataFormats/Scalers DataFormats/L1GlobalTrigger FWCore/Framework L1Trigger/GlobalTriggerAnalyzer HLTrigger/HLTcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CommonToolsTriggerUtils_EX_LIB   := CommonToolsTriggerUtils
ALL_EXTERNAL_PRODS += CommonToolsTriggerUtils
endif
ifeq ($(strip $(Validation/EventGenerator)),)
ValidationEventGenerator := self/Validation/EventGenerator
Validation/EventGenerator := ValidationEventGenerator
ValidationEventGenerator_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
ValidationEventGenerator_EX_USE := $(foreach d, self  hepmc SimDataFormats/GeneratorProducts FWCore/Framework FWCore/ParameterSet DataFormats/Common clhep root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ValidationEventGenerator_EX_LIB   := ValidationEventGenerator
ALL_EXTERNAL_PRODS += ValidationEventGenerator
endif
ifeq ($(strip $(CalibFormats/HcalObjects)),)
CalibFormatsHcalObjects := self/CalibFormats/HcalObjects
CalibFormats/HcalObjects := CalibFormatsHcalObjects
CalibFormatsHcalObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibFormatsHcalObjects_EX_USE := $(foreach d, self  FWCore/Framework DataFormats/HcalDetId DataFormats/HcalDigi CalibFormats/CaloObjects CondFormats/HcalObjects CondFormats/DataRecord boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibFormatsHcalObjects_EX_LIB   := CalibFormatsHcalObjects
ALL_EXTERNAL_PRODS += CalibFormatsHcalObjects
endif
ifeq ($(strip $(RecoVertex/LinearizationPointFinders)),)
RecoVertexLinearizationPointFinders := self/RecoVertex/LinearizationPointFinders
RecoVertex/LinearizationPointFinders := RecoVertexLinearizationPointFinders
RecoVertexLinearizationPointFinders_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoVertexLinearizationPointFinders_EX_USE := $(foreach d, self  DataFormats/GeometryVector FWCore/Utilities RecoVertex/VertexPrimitives RecoVertex/VertexTools TrackingTools/PatternTools TrackingTools/TrajectoryState TrackingTools/TransientTrack,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoVertexLinearizationPointFinders_EX_LIB   := RecoVertexLinearizationPointFinders
ALL_EXTERNAL_PRODS += RecoVertexLinearizationPointFinders
endif
ifeq ($(strip $(DataFormats/TauReco)),)
DataFormatsTauReco := self/DataFormats/TauReco
DataFormats/TauReco := DataFormatsTauReco
DataFormatsTauReco_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsTauReco_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/RecoCandidate DataFormats/Candidate DataFormats/Math DataFormats/TrackReco DataFormats/JetReco DataFormats/ParticleFlowCandidate rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsTauReco_LCGDICTS  := x 
DataFormatsTauReco_EX_LIB   := DataFormatsTauReco
ALL_EXTERNAL_PRODS += DataFormatsTauReco
endif
ifeq ($(strip $(Geometry/CommonTopologies)),)
GeometryCommonTopologies := self/Geometry/CommonTopologies
Geometry/CommonTopologies := GeometryCommonTopologies
GeometryCommonTopologies_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryCommonTopologies_EX_USE := $(foreach d, self  FWCore/MessageLogger Utilities/General,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryCommonTopologies_EX_LIB   := GeometryCommonTopologies
ALL_EXTERNAL_PRODS += GeometryCommonTopologies
endif
ifeq ($(strip $(SimDataFormats/RandomEngine)),)
SimDataFormatsRandomEngine := self/SimDataFormats/RandomEngine
SimDataFormats/RandomEngine := SimDataFormatsRandomEngine
SimDataFormatsRandomEngine_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsRandomEngine_EX_USE := $(foreach d, self  DataFormats/Common FWCore/Utilities boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsRandomEngine_LCGDICTS  := x 
SimDataFormatsRandomEngine_EX_LIB   := SimDataFormatsRandomEngine
ALL_EXTERNAL_PRODS += SimDataFormatsRandomEngine
endif
ifeq ($(strip $(MagneticField/VolumeGeometry)),)
MagneticFieldVolumeGeometry := self/MagneticField/VolumeGeometry
MagneticField/VolumeGeometry := MagneticFieldVolumeGeometry
MagneticFieldVolumeGeometry_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
MagneticFieldVolumeGeometry_EX_USE := $(foreach d, self  DataFormats/GeometrySurface DataFormats/GeometryVector MagneticField/Engine,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
MagneticFieldVolumeGeometry_EX_LIB   := MagneticFieldVolumeGeometry
ALL_EXTERNAL_PRODS += MagneticFieldVolumeGeometry
endif
ifeq ($(strip $(DataFormats/CastorReco)),)
DataFormatsCastorReco := self/DataFormats/CastorReco
DataFormats/CastorReco := DataFormatsCastorReco
DataFormatsCastorReco_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsCastorReco_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/Candidate rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsCastorReco_LCGDICTS  := x 
DataFormatsCastorReco_EX_LIB   := DataFormatsCastorReco
ALL_EXTERNAL_PRODS += DataFormatsCastorReco
endif
ifeq ($(strip $(CondTools/Ecal)),)
CondToolsEcal := self/CondTools/Ecal
CondTools/Ecal := CondToolsEcal
CondToolsEcal_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondToolsEcal_EX_USE := $(foreach d, self  CondCore/DBCommon CondCore/DBOutputService CondCore/PopCon CondFormats/DataRecord CondFormats/EcalObjects CondFormats/ESObjects DataFormats/Common DataFormats/EcalDetId DataFormats/Provenance FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/ServiceRegistry OnlineDB/EcalCondDB OnlineDB/Oracle SimCalorimetry/EcalSelectiveReadoutProducers Geometry/EcalMapping root rootcore rootphysics rootgraphics boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondToolsEcal_EX_LIB   := CondToolsEcal
ALL_EXTERNAL_PRODS += CondToolsEcal
endif
ifeq ($(strip $(PhysicsTools/JetCharge)),)
PhysicsToolsJetCharge := self/PhysicsTools/JetCharge
PhysicsTools/JetCharge := PhysicsToolsJetCharge
PhysicsToolsJetCharge_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsJetCharge_EX_USE := $(foreach d, self  DataFormats/Common FWCore/ParameterSet clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsJetCharge_EX_LIB   := PhysicsToolsJetCharge
ALL_EXTERNAL_PRODS += PhysicsToolsJetCharge
endif
ifeq ($(strip $(DQM/EcalBarrelMonitorModule)),)
DQMEcalBarrelMonitorModule := self/DQM/EcalBarrelMonitorModule
DQM/EcalBarrelMonitorModule := DQMEcalBarrelMonitorModule
DQMEcalBarrelMonitorModule_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMEcalBarrelMonitorModule_EX_USE := $(foreach d, self  DQM/EcalCommon DQMServices/Core DataFormats/EcalDetId DataFormats/EcalDigi DataFormats/EcalRawData DataFormats/EcalRecHit FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMEcalBarrelMonitorModule_EX_LIB   := DQMEcalBarrelMonitorModule
ALL_EXTERNAL_PRODS += DQMEcalBarrelMonitorModule
endif
ifeq ($(strip $(Geometry/EcalTestBeam)),)
GeometryEcalTestBeam := self/Geometry/EcalTestBeam
Geometry/EcalTestBeam := GeometryEcalTestBeam
GeometryEcalTestBeam_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryEcalTestBeam_EX_USE := $(foreach d, self  FWCore/Utilities FWCore/MessageLogger Geometry/CaloGeometry Geometry/EcalCommonData SimDataFormats/EcalTestBeam clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryEcalTestBeam_EX_LIB   := GeometryEcalTestBeam
ALL_EXTERNAL_PRODS += GeometryEcalTestBeam
endif
ifeq ($(strip $(RecoMuon/MuonIsolation)),)
RecoMuonMuonIsolation := self/RecoMuon/MuonIsolation
RecoMuon/MuonIsolation := RecoMuonMuonIsolation
RecoMuonMuonIsolation_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoMuonMuonIsolation_EX_USE := $(foreach d, self  DataFormats/Candidate DataFormats/MuonReco DataFormats/RecoCandidate DataFormats/TrackReco FWCore/MessageLogger FWCore/ParameterSet PhysicsTools/IsolationAlgos,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoMuonMuonIsolation_EX_LIB   := RecoMuonMuonIsolation
ALL_EXTERNAL_PRODS += RecoMuonMuonIsolation
endif
ifeq ($(strip $(FastSimulation/PileUpProducer)),)
FastSimulationPileUpProducer := self/FastSimulation/PileUpProducer
FastSimulation/PileUpProducer := FastSimulationPileUpProducer
FastSimulationPileUpProducer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationPileUpProducer_EX_USE := $(foreach d, self  FastSimulation/Event FastSimulation/Particle hepmc,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationPileUpProducer_EX_LIB   := FastSimulationPileUpProducer
ALL_EXTERNAL_PRODS += FastSimulationPileUpProducer
endif
ifeq ($(strip $(CommonTools/Clustering1D)),)
CommonToolsClustering1D := self/CommonTools/Clustering1D
CommonTools/Clustering1D := CommonToolsClustering1D
CommonToolsClustering1D_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CommonToolsClustering1D_EX_USE := $(foreach d, self  DataFormats/GeometryCommonDetAlgo FWCore/Utilities,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CommonToolsClustering1D_EX_LIB   := CommonToolsClustering1D
ALL_EXTERNAL_PRODS += CommonToolsClustering1D
endif
ifeq ($(strip $(SimG4Core/GFlash)),)
SimG4CoreGFlash := self/SimG4Core/GFlash
SimG4Core/GFlash := SimG4CoreGFlash
SimG4CoreGFlash_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CoreGFlash_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/PluginManager SimG4Core/Physics SimG4Core/PhysicsLists SimGeneral/GFlash geant4core clhep boost root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CoreGFlash_EX_LIB   := SimG4CoreGFlash
ALL_EXTERNAL_PRODS += SimG4CoreGFlash
endif
ifeq ($(strip $(RecoTauTag/RecoTau)),)
RecoTauTagRecoTau := self/RecoTauTag/RecoTau
RecoTauTag/RecoTau := RecoTauTagRecoTau
RecoTauTagRecoTau_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTauTagRecoTau_EX_USE := $(foreach d, self  MagneticField/Engine MagneticField/Records DataFormats/Math DataFormats/TauReco DataFormats/VertexReco DataFormats/ParticleFlowCandidate DataFormats/TrackReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager Geometry/CaloGeometry Geometry/CaloTopology Geometry/Records Geometry/CommonDetUnit TrackingTools/TransientTrack TrackingTools/IPTools RecoTauTag/TauTagTools RecoVertex/KalmanVertexFit RecoParticleFlow/PFClusterTools TrackingTools/TrackAssociator PhysicsTools/JetMCUtils roottmva,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTauTagRecoTau_EX_LIB   := RecoTauTagRecoTau
ALL_EXTERNAL_PRODS += RecoTauTagRecoTau
endif
ifeq ($(strip $(Fireworks/FWInterface)),)
FireworksFWInterface := self/Fireworks/FWInterface
Fireworks/FWInterface := FireworksFWInterface
FireworksFWInterface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FireworksFWInterface_EX_USE := $(foreach d, self  FWCore/PluginManager FWCore/Framework DataFormats/Provenance DataFormats/TrackReco TrackingTools/TrajectoryState TrackingTools/PatternTools CondFormats/DataRecord CondFormats/RunInfo Fireworks/Core Fireworks/Geometry rootcore rootinteractive,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FireworksFWInterface_ROOTDICT  := LinkDef
FireworksFWInterface_EX_LIB   := FireworksFWInterface
ALL_EXTERNAL_PRODS += FireworksFWInterface
endif
ifeq ($(strip $(DQM/EcalBarrelMonitorDbModule)),)
DQMEcalBarrelMonitorDbModule := self/DQM/EcalBarrelMonitorDbModule
DQM/EcalBarrelMonitorDbModule := DQMEcalBarrelMonitorDbModule
DQMEcalBarrelMonitorDbModule_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMEcalBarrelMonitorDbModule_EX_USE := $(foreach d, self  CoralBase DQMServices/Core FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry RelationalAccess rootcore rootgraphics xerces-c,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMEcalBarrelMonitorDbModule_EX_LIB   := DQMEcalBarrelMonitorDbModule
ALL_EXTERNAL_PRODS += DQMEcalBarrelMonitorDbModule
endif
ifeq ($(strip $(CalibCalorimetry/EcalLaserAnalyzer)),)
CalibCalorimetryEcalLaserAnalyzer := self/CalibCalorimetry/EcalLaserAnalyzer
CalibCalorimetry/EcalLaserAnalyzer := CalibCalorimetryEcalLaserAnalyzer
CalibCalorimetryEcalLaserAnalyzer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibCalorimetryEcalLaserAnalyzer_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet root rootgraphics DataFormats/EcalDigi DataFormats/EcalRecHit Geometry/EcalMapping,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibCalorimetryEcalLaserAnalyzer_EX_LIB   := CalibCalorimetryEcalLaserAnalyzer
ALL_EXTERNAL_PRODS += CalibCalorimetryEcalLaserAnalyzer
endif
ifeq ($(strip $(CondFormats/OptAlignObjects)),)
CondFormatsOptAlignObjects := self/CondFormats/OptAlignObjects
CondFormats/OptAlignObjects := CondFormatsOptAlignObjects
CondFormatsOptAlignObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsOptAlignObjects_EX_USE := $(foreach d, self  CondFormats/Common DataFormats/Common FWCore/Utilities rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsOptAlignObjects_LCGDICTS  := x 
CondFormatsOptAlignObjects_EX_LIB   := CondFormatsOptAlignObjects
ALL_EXTERNAL_PRODS += CondFormatsOptAlignObjects
endif
ifeq ($(strip $(FastSimulation/MaterialEffects)),)
FastSimulationMaterialEffects := self/FastSimulation/MaterialEffects
FastSimulation/MaterialEffects := FastSimulationMaterialEffects
FastSimulationMaterialEffects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationMaterialEffects_EX_USE := $(foreach d, self  FWCore/ParameterSet FWCore/Utilities FastSimulation/Event FastSimulation/Utilities rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationMaterialEffects_EX_LIB   := FastSimulationMaterialEffects
ALL_EXTERNAL_PRODS += FastSimulationMaterialEffects
endif
ifeq ($(strip $(L1Trigger/DTUtilities)),)
L1TriggerDTUtilities := self/L1Trigger/DTUtilities
L1Trigger/DTUtilities := L1TriggerDTUtilities
L1TriggerDTUtilities_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerDTUtilities_EX_USE := $(foreach d, self  FWCore/PluginManager FWCore/ParameterSet Geometry/DTGeometry L1TriggerConfig/DTTPGConfig clhep root rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerDTUtilities_EX_LIB   := L1TriggerDTUtilities
ALL_EXTERNAL_PRODS += L1TriggerDTUtilities
endif
ifeq ($(strip $(TrackingTools/RecoGeometry)),)
TrackingToolsRecoGeometry := self/TrackingTools/RecoGeometry
TrackingTools/RecoGeometry := TrackingToolsRecoGeometry
TrackingToolsRecoGeometry_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsRecoGeometry_EX_USE := $(foreach d, self  FWCore/Framework RecoTracker/Record RecoMuon/Records boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsRecoGeometry_EX_LIB   := TrackingToolsRecoGeometry
ALL_EXTERNAL_PRODS += TrackingToolsRecoGeometry
endif
ifeq ($(strip $(DataFormats/DetId)),)
DataFormatsDetId := self/DataFormats/DetId
DataFormats/DetId := DataFormatsDetId
DataFormatsDetId_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsDetId_EX_USE := $(foreach d, self  boost rootrflx DataFormats/Common,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsDetId_LCGDICTS  := x 
DataFormatsDetId_EX_LIB   := DataFormatsDetId
ALL_EXTERNAL_PRODS += DataFormatsDetId
endif
ifeq ($(strip $(Alignment/OfflineValidation)),)
AlignmentOfflineValidation := self/Alignment/OfflineValidation
Alignment/OfflineValidation := AlignmentOfflineValidation
AlignmentOfflineValidation_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AlignmentOfflineValidation_EX_USE := $(foreach d, self  DataFormats/TrackReco FWCore/PluginManager FWCore/Framework FWCore/Utilities FWCore/ParameterSet FWCore/ServiceRegistry Geometry/TrackerGeometryBuilder TrackingTools/TrackFitters MagneticField/Engine rootrflx clhep rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AlignmentOfflineValidation_LCGDICTS  := x 
AlignmentOfflineValidation_EX_LIB   := AlignmentOfflineValidation
ALL_EXTERNAL_PRODS += AlignmentOfflineValidation
endif
ifeq ($(strip $(TauAnalysis/MCEmbeddingTools)),)
TauAnalysisMCEmbeddingTools := self/TauAnalysis/MCEmbeddingTools
TauAnalysis/MCEmbeddingTools := TauAnalysisMCEmbeddingTools
TauAnalysisMCEmbeddingTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TauAnalysisMCEmbeddingTools_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet rootmath boost SimDataFormats/GeneratorProducts DataFormats/HepMCCandidate RecoMuon/MuonIsolation DataFormats/DetId RecoTracker/RingRecord TrackingTools/TrackAssociator TrackingTools/RoadSearchHitAccess DataFormats/VertexReco CommonTools/Utils CommonTools/UtilAlgos GeneratorInterface/TauolaInterface DataFormats/MuonReco DataFormats/EcalRecHit pythia6 GeneratorInterface/Pythia6Interface GeneratorInterface/Core,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TauAnalysisMCEmbeddingTools_EX_LIB   := TauAnalysisMCEmbeddingTools
ALL_EXTERNAL_PRODS += TauAnalysisMCEmbeddingTools
endif
ifeq ($(strip $(OnlineDB/Oracle)),)
OnlineDBOracle := self/OnlineDB/Oracle
OnlineDB/Oracle := OnlineDBOracle
OnlineDBOracle_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
OnlineDBOracle_EX_USE := $(foreach d, self  oracle oracleocci,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
OnlineDBOracle_EX_LIB   := OnlineDBOracle
ALL_EXTERNAL_PRODS += OnlineDBOracle
endif
ifeq ($(strip $(RecoEcal/EgammaCoreTools)),)
RecoEcalEgammaCoreTools := self/RecoEcal/EgammaCoreTools
RecoEcal/EgammaCoreTools := RecoEcalEgammaCoreTools
RecoEcalEgammaCoreTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoEcalEgammaCoreTools_EX_USE := $(foreach d, self  DataFormats/EcalRecHit DataFormats/EgammaReco DataFormats/Math FWCore/Framework FWCore/Utilities FWCore/MessageLogger Geometry/CaloGeometry Geometry/CaloTopology Geometry/EcalAlgo RecoLocalCalo/EcalRecAlgos Geometry/Records CalibCalorimetry/EcalLaserCorrection clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoEcalEgammaCoreTools_EX_LIB   := RecoEcalEgammaCoreTools
ALL_EXTERNAL_PRODS += RecoEcalEgammaCoreTools
endif
ifeq ($(strip $(FWCore/TFWLiteSelectorTest)),)
FWCoreTFWLiteSelectorTest := self/FWCore/TFWLiteSelectorTest
FWCore/TFWLiteSelectorTest := FWCoreTFWLiteSelectorTest
FWCoreTFWLiteSelectorTest_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCoreTFWLiteSelectorTest_EX_USE := $(foreach d, self  DataFormats/Common FWCore/TFWLiteSelector rootgraphics,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCoreTFWLiteSelectorTest_LCGDICTS  := x 
FWCoreTFWLiteSelectorTest_EX_LIB   := FWCoreTFWLiteSelectorTest
ALL_EXTERNAL_PRODS += FWCoreTFWLiteSelectorTest
endif
ifeq ($(strip $(DataFormats/HcalCalibObjects)),)
DataFormatsHcalCalibObjects := self/DataFormats/HcalCalibObjects
DataFormats/HcalCalibObjects := DataFormatsHcalCalibObjects
DataFormatsHcalCalibObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsHcalCalibObjects_EX_USE := $(foreach d, self  DataFormats/Common rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsHcalCalibObjects_LCGDICTS  := x 
DataFormatsHcalCalibObjects_EX_LIB   := DataFormatsHcalCalibObjects
ALL_EXTERNAL_PRODS += DataFormatsHcalCalibObjects
endif
ifeq ($(strip $(L1Trigger/DTSectorCollector)),)
L1TriggerDTSectorCollector := self/L1Trigger/DTSectorCollector
L1Trigger/DTSectorCollector := L1TriggerDTSectorCollector
L1TriggerDTSectorCollector_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerDTSectorCollector_EX_USE := $(foreach d, self  FWCore/PluginManager FWCore/ParameterSet Geometry/DTGeometry L1TriggerConfig/DTTPGConfig L1Trigger/DTUtilities L1Trigger/DTBti L1Trigger/DTTraco L1Trigger/DTTriggerServerTheta L1Trigger/DTTriggerServerPhi clhep root rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerDTSectorCollector_EX_LIB   := L1TriggerDTSectorCollector
ALL_EXTERNAL_PRODS += L1TriggerDTSectorCollector
endif
ifeq ($(strip $(CalibCalorimetry/CastorCalib)),)
CalibCalorimetryCastorCalib := self/CalibCalorimetry/CastorCalib
CalibCalorimetry/CastorCalib := CalibCalorimetryCastorCalib
CalibCalorimetryCastorCalib_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibCalorimetryCastorCalib_EX_USE := $(foreach d, self  boost root clhep FWCore/Framework FWCore/MessageLogger DataFormats/HcalDetId CondFormats/HcalObjects DataFormats/HcalDigi CalibFormats/HcalObjects CalibFormats/CastorObjects Geometry/ForwardGeometry,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibCalorimetryCastorCalib_EX_LIB   := CalibCalorimetryCastorCalib
ALL_EXTERNAL_PRODS += CalibCalorimetryCastorCalib
endif
ifeq ($(strip $(SimG4CMS/ShowerLibraryProducer)),)
SimG4CMSShowerLibraryProducer := self/SimG4CMS/ShowerLibraryProducer
SimG4CMS/ShowerLibraryProducer := SimG4CMSShowerLibraryProducer
SimG4CMSShowerLibraryProducer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CMSShowerLibraryProducer_EX_USE := $(foreach d, self  SimG4Core/Watcher SimG4Core/SensitiveDetector SimG4Core/Notification SimG4Core/Application SimG4CMS/Calo SimG4CMS/Forward DataFormats/Math SimDataFormats/SimHitMaker SimDataFormats/HcalTestBeam SimDataFormats/CaloHit SimDataFormats/Forward DetectorDescription/Core FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/ServiceRegistry CommonTools/UtilAlgos boost geant4core root rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CMSShowerLibraryProducer_EX_LIB   := SimG4CMSShowerLibraryProducer
ALL_EXTERNAL_PRODS += SimG4CMSShowerLibraryProducer
endif
ifeq ($(strip $(RecoPixelVZero/PixelVZeroFinding)),)
src_RecoPixelVZero_PixelVZeroFinding := self/RecoPixelVZero/PixelVZeroFinding
RecoPixelVZero/PixelVZeroFinding  := src_RecoPixelVZero_PixelVZeroFinding
src_RecoPixelVZero_PixelVZeroFinding_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_RecoPixelVZero_PixelVZeroFinding_EX_USE := $(foreach d, self,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_RecoPixelVZero_PixelVZeroFinding
endif

ifeq ($(strip $(DataFormats/L1GlobalTrigger)),)
DataFormatsL1GlobalTrigger := self/DataFormats/L1GlobalTrigger
DataFormats/L1GlobalTrigger := DataFormatsL1GlobalTrigger
DataFormatsL1GlobalTrigger_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsL1GlobalTrigger_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/Provenance DataFormats/StdDictionaries FWCore/MessageLogger FWCore/Utilities boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsL1GlobalTrigger_LCGDICTS  := x 
DataFormatsL1GlobalTrigger_EX_LIB   := DataFormatsL1GlobalTrigger
ALL_EXTERNAL_PRODS += DataFormatsL1GlobalTrigger
endif
ifeq ($(strip $(PhysicsTools/RecoUtils)),)
PhysicsToolsRecoUtils := self/PhysicsTools/RecoUtils
PhysicsTools/RecoUtils := PhysicsToolsRecoUtils
PhysicsToolsRecoUtils_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsRecoUtils_EX_USE := $(foreach d, self  RecoVertex/VertexPrimitives RecoVertex/KinematicFit TrackingTools/TransientTrack MagneticField/Records DataFormats/RecoCandidate heppdt PhysicsTools/KinFitter FWCore/ParameterSet boost RecoTracker/DebugTools DataFormats/VertexReco,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsRecoUtils_EX_LIB   := PhysicsToolsRecoUtils
ALL_EXTERNAL_PRODS += PhysicsToolsRecoUtils
endif
ifeq ($(strip $(RecoTracker/DebugTools)),)
RecoTrackerDebugTools := self/RecoTracker/DebugTools
RecoTracker/DebugTools := RecoTrackerDebugTools
RecoTrackerDebugTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTrackerDebugTools_EX_USE := $(foreach d, self  clhep rootmath boost SimDataFormats/TrackingHit Geometry/CommonDetUnit TrackingTools/TrajectoryParametrization TrackingTools/TrajectoryState TrackingTools/TransientTrack TrackingTools/KalmanUpdators TrackingTools/GeomPropagators RecoTracker/Record MagneticField/Records MagneticField/Engine RecoTracker/TkNavigation RecoTracker/TkDetLayers RecoTracker/MeasurementDet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTrackerDebugTools_EX_LIB   := RecoTrackerDebugTools
ALL_EXTERNAL_PRODS += RecoTrackerDebugTools
endif
ifeq ($(strip $(SimG4Core/Watcher)),)
SimG4CoreWatcher := self/SimG4Core/Watcher
SimG4Core/Watcher := SimG4CoreWatcher
SimG4CoreWatcher_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CoreWatcher_EX_USE := $(foreach d, self  FWCore/ParameterSet boost sigcpp,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CoreWatcher_EX_LIB   := SimG4CoreWatcher
ALL_EXTERNAL_PRODS += SimG4CoreWatcher
endif
ifeq ($(strip $(DataFormats/EcalRawData)),)
DataFormatsEcalRawData := self/DataFormats/EcalRawData
DataFormats/EcalRawData := DataFormatsEcalRawData
DataFormatsEcalRawData_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsEcalRawData_EX_USE := $(foreach d, self  DataFormats/Common boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsEcalRawData_LCGDICTS  := x 
DataFormatsEcalRawData_EX_LIB   := DataFormatsEcalRawData
ALL_EXTERNAL_PRODS += DataFormatsEcalRawData
endif
ifeq ($(strip $(FastSimulation/CaloGeometryTools)),)
FastSimulationCaloGeometryTools := self/FastSimulation/CaloGeometryTools
FastSimulation/CaloGeometryTools := FastSimulationCaloGeometryTools
FastSimulationCaloGeometryTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationCaloGeometryTools_EX_USE := $(foreach d, self  DataFormats/DetId DataFormats/EcalDetId DataFormats/GeometryVector DataFormats/Math FWCore/MessageLogger FWCore/ParameterSet FastSimulation/CalorimeterProperties Geometry/CaloGeometry Geometry/CaloTopology Geometry/EcalAlgo clhep rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationCaloGeometryTools_EX_LIB   := FastSimulationCaloGeometryTools
ALL_EXTERNAL_PRODS += FastSimulationCaloGeometryTools
endif
ifeq ($(strip $(DataFormats/MuonReco)),)
DataFormatsMuonReco := self/DataFormats/MuonReco
DataFormats/MuonReco := DataFormatsMuonReco
DataFormatsMuonReco_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsMuonReco_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/RecoCandidate DataFormats/ParticleFlowCandidate DataFormats/TrackReco DataFormats/DTRecHit DataFormats/CSCRecHit DataFormats/VertexReco rootrflx rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsMuonReco_LCGDICTS  := x 
DataFormatsMuonReco_EX_LIB   := DataFormatsMuonReco
ALL_EXTERNAL_PRODS += DataFormatsMuonReco
endif
ifeq ($(strip $(GeneratorInterface/Pythia6Interface)),)
GeneratorInterfacePythia6Interface := self/GeneratorInterface/Pythia6Interface
GeneratorInterface/Pythia6Interface := GeneratorInterfacePythia6Interface
GeneratorInterfacePythia6Interface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfacePythia6Interface_EX_USE := $(foreach d, self  boost FWCore/Framework SimDataFormats/GeneratorProducts GeneratorInterface/Core clhep pythia6 f77compiler,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeneratorInterfacePythia6Interface_EX_LIB   := GeneratorInterfacePythia6Interface
ALL_EXTERNAL_PRODS += GeneratorInterfacePythia6Interface
endif
ifeq ($(strip $(TrackingTools/TrajectoryParametrization)),)
TrackingToolsTrajectoryParametrization := self/TrackingTools/TrajectoryParametrization
TrackingTools/TrajectoryParametrization := TrackingToolsTrajectoryParametrization
TrackingToolsTrajectoryParametrization_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsTrajectoryParametrization_EX_USE := $(foreach d, self  boost rootmath FWCore/Utilities,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsTrajectoryParametrization_EX_LIB   := TrackingToolsTrajectoryParametrization
ALL_EXTERNAL_PRODS += TrackingToolsTrajectoryParametrization
endif
ifeq ($(strip $(HiggsAnalysis/CombinedLimit)),)
HiggsAnalysisCombinedLimit := self/HiggsAnalysis/CombinedLimit
HiggsAnalysis/CombinedLimit := HiggsAnalysisCombinedLimit
HiggsAnalysisCombinedLimit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
HiggsAnalysisCombinedLimit_EX_USE := $(foreach d, self  root rootmath roofit roostats histfactory boost_program_options boost_filesystem,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
HiggsAnalysisCombinedLimit_ROOTDICT  := LinkDef
HiggsAnalysisCombinedLimit_EX_LIB   := HiggsAnalysisCombinedLimit
ALL_EXTERNAL_PRODS += HiggsAnalysisCombinedLimit
endif
ifeq ($(strip $(RecoTauTag/TauTagTools)),)
RecoTauTagTauTagTools := self/RecoTauTag/TauTagTools
RecoTauTag/TauTagTools := RecoTauTagTauTagTools
RecoTauTagTauTagTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTauTagTauTagTools_EX_USE := $(foreach d, self  DataFormats/Math DataFormats/TauReco DataFormats/Candidate FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager PhysicsTools/IsolationUtils PhysicsTools/MVAComputer TrackingTools/GeomPropagators TrackingTools/TransientTrack RecoVertex/VertexPrimitives DataFormats/HepMCCandidate root,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTauTagTauTagTools_EX_LIB   := RecoTauTagTauTagTools
ALL_EXTERNAL_PRODS += RecoTauTagTauTagTools
endif
ifeq ($(strip $(DataFormats/StdDictionaries)),)
DataFormatsStdDictionaries := self/DataFormats/StdDictionaries
DataFormats/StdDictionaries := DataFormatsStdDictionaries
DataFormatsStdDictionaries_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsStdDictionaries_EX_USE := $(foreach d, self  rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsStdDictionaries_LCGDICTS  := x 
DataFormatsStdDictionaries_EX_LIB   := DataFormatsStdDictionaries
ALL_EXTERNAL_PRODS += DataFormatsStdDictionaries
endif
ifeq ($(strip $(TrackingTools/KalmanUpdators)),)
TrackingToolsKalmanUpdators := self/TrackingTools/KalmanUpdators
TrackingTools/KalmanUpdators := TrackingToolsKalmanUpdators
TrackingToolsKalmanUpdators_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsKalmanUpdators_EX_USE := $(foreach d, self  boost clhep RecoTracker/TransientTrackingRecHit TrackingTools/TransientTrackingRecHit TrackingTools/TrajectoryState TrackingTools/PatternTools Geometry/CommonDetUnit Geometry/CommonTopologies FWCore/Utilities,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsKalmanUpdators_EX_LIB   := TrackingToolsKalmanUpdators
ALL_EXTERNAL_PRODS += TrackingToolsKalmanUpdators
endif
ifeq ($(strip $(SimG4CMS/Calo)),)
SimG4CMSCalo := self/SimG4CMS/Calo
SimG4CMS/Calo := SimG4CMSCalo
SimG4CMSCalo_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CMSCalo_EX_USE := $(foreach d, self  FWCore/PluginManager SimGeneral/GFlash SimG4Core/SensitiveDetector SimG4Core/Notification DataFormats/EcalDetId DataFormats/HcalDetId DataFormats/Math SimDataFormats/SimHitMaker SimDataFormats/CaloHit SimDataFormats/CaloTest Geometry/HcalCommonData Geometry/EcalCommonData DetectorDescription/Core FWCore/ParameterSet FWCore/MessageLogger FWCore/ServiceRegistry CommonTools/UtilAlgos boost geant4core hepmc root rootrflx rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CMSCalo_EX_LIB   := SimG4CMSCalo
ALL_EXTERNAL_PRODS += SimG4CMSCalo
endif
ifeq ($(strip $(FastSimulation/TrackerSetup)),)
FastSimulationTrackerSetup := self/FastSimulation/TrackerSetup
FastSimulation/TrackerSetup := FastSimulationTrackerSetup
FastSimulationTrackerSetup_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationTrackerSetup_EX_USE := $(foreach d, self  DataFormats/GeometrySurface FWCore/Framework FWCore/ParameterSet FWCore/Utilities RecoTracker/Record boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationTrackerSetup_EX_LIB   := FastSimulationTrackerSetup
ALL_EXTERNAL_PRODS += FastSimulationTrackerSetup
endif
ifeq ($(strip $(TrackPropagation/NavPropagator)),)
TrackPropagationNavPropagator := self/TrackPropagation/NavPropagator
TrackPropagation/NavPropagator := TrackPropagationNavPropagator
TrackPropagationNavPropagator_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackPropagationNavPropagator_EX_USE := $(foreach d, self  MagneticField/VolumeBasedEngine TrackPropagation/NavGeometry TrackPropagation/RungeKutta TrackingTools/MaterialEffects FWCore/MessageLogger,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackPropagationNavPropagator_EX_LIB   := TrackPropagationNavPropagator
ALL_EXTERNAL_PRODS += TrackPropagationNavPropagator
endif
ifeq ($(strip $(CommonTools/Statistics)),)
CommonToolsStatistics := self/CommonTools/Statistics
CommonTools/Statistics := CommonToolsStatistics
CommonToolsStatistics_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CommonToolsStatistics_EX_USE := $(foreach d, self  clhep boost DataFormats/CLHEP FWCore/MessageLogger,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CommonToolsStatistics_EX_LIB   := CommonToolsStatistics
ALL_EXTERNAL_PRODS += CommonToolsStatistics
endif
ifeq ($(strip $(DataFormats/TrajectoryState)),)
DataFormatsTrajectoryState := self/DataFormats/TrajectoryState
DataFormats/TrajectoryState := DataFormatsTrajectoryState
DataFormatsTrajectoryState_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsTrajectoryState_EX_USE := $(foreach d, self  rootrflx boost_header,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsTrajectoryState_LCGDICTS  := x 
DataFormatsTrajectoryState_EX_LIB   := DataFormatsTrajectoryState
ALL_EXTERNAL_PRODS += DataFormatsTrajectoryState
endif
ifeq ($(strip $(DQM/SiStripCommissioningAnalysis)),)
DQMSiStripCommissioningAnalysis := self/DQM/SiStripCommissioningAnalysis
DQM/SiStripCommissioningAnalysis := DQMSiStripCommissioningAnalysis
DQMSiStripCommissioningAnalysis_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMSiStripCommissioningAnalysis_EX_USE := $(foreach d, self  CondFormats/SiStripObjects DataFormats/SiStripCommon FWCore/MessageLogger FWCore/ParameterSet roothistmatrix boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMSiStripCommissioningAnalysis_EX_LIB   := DQMSiStripCommissioningAnalysis
ALL_EXTERNAL_PRODS += DQMSiStripCommissioningAnalysis
endif
ifeq ($(strip $(FastSimulation/BaseParticlePropagator)),)
FastSimulationBaseParticlePropagator := self/FastSimulation/BaseParticlePropagator
FastSimulation/BaseParticlePropagator := FastSimulationBaseParticlePropagator
FastSimulationBaseParticlePropagator_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationBaseParticlePropagator_EX_USE := $(foreach d, self  FastSimulation/Particle,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationBaseParticlePropagator_EX_LIB   := FastSimulationBaseParticlePropagator
ALL_EXTERNAL_PRODS += FastSimulationBaseParticlePropagator
endif
ifeq ($(strip $(MuonAnalysis/MomentumScaleCalibration)),)
MuonAnalysisMomentumScaleCalibration := self/MuonAnalysis/MomentumScaleCalibration
MuonAnalysis/MomentumScaleCalibration := MuonAnalysisMomentumScaleCalibration
MuonAnalysisMomentumScaleCalibration_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
MuonAnalysisMomentumScaleCalibration_EX_USE := $(foreach d, self  hepmc heppdt clhep rootminuit rootrflx roothistmatrix FWCore/Framework FWCore/Utilities FWCore/ParameterSet FWCore/PluginManager DataFormats/Candidate DataFormats/Common SimDataFormats/Track SimDataFormats/GeneratorProducts CondFormats/RecoMuonObjects DataFormats/PatCandidates PhysicsTools/TagAndProbe,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
MuonAnalysisMomentumScaleCalibration_ROOTDICT  := LinkDef
MuonAnalysisMomentumScaleCalibration_EX_LIB   := MuonAnalysisMomentumScaleCalibration
ALL_EXTERNAL_PRODS += MuonAnalysisMomentumScaleCalibration
endif
ifeq ($(strip $(DataFormats/TestObjects)),)
DataFormatsTestObjects := self/DataFormats/TestObjects
DataFormats/TestObjects := DataFormatsTestObjects
DataFormatsTestObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsTestObjects_EX_USE := $(foreach d, self  DataFormats/Common rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsTestObjects_LCGDICTS  := x 
DataFormatsTestObjects_EX_LIB   := DataFormatsTestObjects
ALL_EXTERNAL_PRODS += DataFormatsTestObjects
endif
ifeq ($(strip $(DataFormats/Alignment)),)
DataFormatsAlignment := self/DataFormats/Alignment
DataFormats/Alignment := DataFormatsAlignment
DataFormatsAlignment_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsAlignment_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/TrackingRecHit DataFormats/SiStripDetId FWCore/Utilities rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsAlignment_LCGDICTS  := x 
DataFormatsAlignment_EX_LIB   := DataFormatsAlignment
ALL_EXTERNAL_PRODS += DataFormatsAlignment
endif
ifeq ($(strip $(FWCore/Utilities)),)
FWCoreUtilities := self/FWCore/Utilities
FWCore/Utilities := FWCoreUtilities
FWCoreUtilities_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCoreUtilities_EX_USE := $(foreach d, self  boost boost_filesystem boost_regex rootcintex rootcore rootrflx libuuid uuid,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCoreUtilities_EX_LIB   := FWCoreUtilities
ALL_EXTERNAL_PRODS += FWCoreUtilities
endif
ifeq ($(strip $(DataFormats/EgammaTrackReco)),)
DataFormatsEgammaTrackReco := self/DataFormats/EgammaTrackReco
DataFormats/EgammaTrackReco := DataFormatsEgammaTrackReco
DataFormatsEgammaTrackReco_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsEgammaTrackReco_EX_USE := $(foreach d, self  DataFormats/Common rootrflx clhepheader,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsEgammaTrackReco_LCGDICTS  := x 
DataFormatsEgammaTrackReco_EX_LIB   := DataFormatsEgammaTrackReco
ALL_EXTERNAL_PRODS += DataFormatsEgammaTrackReco
endif
ifeq ($(strip $(IOPool/Output)),)
IOPoolOutput := self/IOPool/Output
IOPool/Output := IOPoolOutput
IOPoolOutput_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
IOPoolOutput_EX_USE := $(foreach d, self  DataFormats/Common DataFormats/Provenance FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities FWCore/Version IOPool/Common boost rootcore,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
IOPoolOutput_EX_LIB   := IOPoolOutput
ALL_EXTERNAL_PRODS += IOPoolOutput
endif
ifeq ($(strip $(RecoMuon/TransientTrackingRecHit)),)
RecoMuonTransientTrackingRecHit := self/RecoMuon/TransientTrackingRecHit
RecoMuon/TransientTrackingRecHit := RecoMuonTransientTrackingRecHit
RecoMuonTransientTrackingRecHit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoMuonTransientTrackingRecHit_EX_USE := $(foreach d, self  DataFormats/TrackingRecHit FWCore/Framework FWCore/MessageLogger FWCore/Utilities Geometry/CommonDetUnit TrackingTools/TransientTrackingRecHit,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoMuonTransientTrackingRecHit_EX_LIB   := RecoMuonTransientTrackingRecHit
ALL_EXTERNAL_PRODS += RecoMuonTransientTrackingRecHit
endif
ifeq ($(strip $(DataFormats/EgammaReco)),)
DataFormatsEgammaReco := self/DataFormats/EgammaReco
DataFormats/EgammaReco := DataFormatsEgammaReco
DataFormatsEgammaReco_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DataFormatsEgammaReco_EX_USE := $(foreach d, self  DataFormats/Common rootrflx clhepheader DataFormats/CaloRecHit,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsEgammaReco_LCGDICTS  := x 
DataFormatsEgammaReco_EX_LIB   := DataFormatsEgammaReco
ALL_EXTERNAL_PRODS += DataFormatsEgammaReco
endif
ifeq ($(strip $(TrackingTools/RoadSearchHitAccess)),)
TrackingToolsRoadSearchHitAccess := self/TrackingTools/RoadSearchHitAccess
TrackingTools/RoadSearchHitAccess := TrackingToolsRoadSearchHitAccess
TrackingToolsRoadSearchHitAccess_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsRoadSearchHitAccess_EX_USE := $(foreach d, self  FWCore/MessageLogger DataFormats/Common DataFormats/TrackerRecHit2D DataFormats/SiStripDetId DataFormats/SiPixelDetId Utilities/General,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsRoadSearchHitAccess_EX_LIB   := TrackingToolsRoadSearchHitAccess
ALL_EXTERNAL_PRODS += TrackingToolsRoadSearchHitAccess
endif
ifeq ($(strip $(FastSimDataFormats/L1GlobalMuonTrigger)),)
FastSimDataFormatsL1GlobalMuonTrigger := self/FastSimDataFormats/L1GlobalMuonTrigger
FastSimDataFormats/L1GlobalMuonTrigger := FastSimDataFormatsL1GlobalMuonTrigger
FastSimDataFormatsL1GlobalMuonTrigger_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimDataFormatsL1GlobalMuonTrigger_EX_USE := $(foreach d, self  DataFormats/L1GlobalMuonTrigger DataFormats/Math SimDataFormats/Track,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimDataFormatsL1GlobalMuonTrigger_EX_LIB   := FastSimDataFormatsL1GlobalMuonTrigger
ALL_EXTERNAL_PRODS += FastSimDataFormatsL1GlobalMuonTrigger
endif
ifeq ($(strip $(CondCore/DBOutputService)),)
CondCoreDBOutputService := self/CondCore/DBOutputService
CondCore/DBOutputService := CondCoreDBOutputService
CondCoreDBOutputService_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondCoreDBOutputService_EX_USE := $(foreach d, self  FWCore/Framework CondCore/DBCommon CondCore/MetaDataService CondCore/IOVService boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondCoreDBOutputService_EX_LIB   := CondCoreDBOutputService
ALL_EXTERNAL_PRODS += CondCoreDBOutputService
endif
ifeq ($(strip $(TrackingTools/GsfTracking)),)
TrackingToolsGsfTracking := self/TrackingTools/GsfTracking
TrackingTools/GsfTracking := TrackingToolsGsfTracking
TrackingToolsGsfTracking_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsGsfTracking_EX_USE := $(foreach d, self  boost clhep DataFormats/TrajectorySeed FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities DataFormats/GeometrySurface TrackingTools/GeomPropagators TrackingTools/GsfTools TrackingTools/KalmanUpdators TrackingTools/PatternTools TrackingTools/Records TrackingTools/TrackFitters TrackingTools/TrajectoryState TrackingTools/TransientTrackingRecHit DataFormats/BeamSpot DataFormats/VertexReco DataFormats/GsfTrackReco Geometry/Records Geometry/TrackerGeometryBuilder MagneticField/Engine MagneticField/Records,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsGsfTracking_LCGDICTS  := x 
TrackingToolsGsfTracking_EX_LIB   := TrackingToolsGsfTracking
ALL_EXTERNAL_PRODS += TrackingToolsGsfTracking
endif
ifeq ($(strip $(AnalysisDataFormats/EWK)),)
AnalysisDataFormatsEWK := self/AnalysisDataFormats/EWK
AnalysisDataFormats/EWK := AnalysisDataFormatsEWK
AnalysisDataFormatsEWK_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
AnalysisDataFormatsEWK_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/Common DataFormats/Candidate DataFormats/JetReco DataFormats/METReco CommonTools/CandUtils CommonTools/UtilAlgos CommonTools/RecoAlgos rootrflx clhep,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
AnalysisDataFormatsEWK_LCGDICTS  := x 
AnalysisDataFormatsEWK_EX_LIB   := AnalysisDataFormatsEWK
ALL_EXTERNAL_PRODS += AnalysisDataFormatsEWK
endif
ifeq ($(strip $(SimCalorimetry/EcalTrigPrimProducers)),)
src_SimCalorimetry_EcalTrigPrimProducers := self/SimCalorimetry/EcalTrigPrimProducers
SimCalorimetry/EcalTrigPrimProducers  := src_SimCalorimetry_EcalTrigPrimProducers
src_SimCalorimetry_EcalTrigPrimProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_SimCalorimetry_EcalTrigPrimProducers_EX_USE := $(foreach d, boost CalibCalorimetry/EcalTPGTools FWCore/Framework self DataFormats/EcalDigi CondFormats/DataRecord SimCalorimetry/EcalTrigPrimAlgos root FWCore/PluginManager hepmc DataFormats/EcalDetId CondFormats/L1TObjects DataFormats/FEDRawData FWCore/Utilities FWCore/ParameterSet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_SimCalorimetry_EcalTrigPrimProducers
endif

ifeq ($(strip $(ElectroWeakAnalysis/ZMuMu)),)
ElectroWeakAnalysisZMuMu := self/ElectroWeakAnalysis/ZMuMu
ElectroWeakAnalysis/ZMuMu := ElectroWeakAnalysisZMuMu
ElectroWeakAnalysisZMuMu_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
ElectroWeakAnalysisZMuMu_EX_USE := $(foreach d, self  PhysicsTools/Utilities,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ElectroWeakAnalysisZMuMu_EX_LIB   := ElectroWeakAnalysisZMuMu
ALL_EXTERNAL_PRODS += ElectroWeakAnalysisZMuMu
endif
ifeq ($(strip $(TrackingTools/TransientTrackingRecHit)),)
TrackingToolsTransientTrackingRecHit := self/TrackingTools/TransientTrackingRecHit
TrackingTools/TransientTrackingRecHit := TrackingToolsTransientTrackingRecHit
TrackingToolsTransientTrackingRecHit_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsTransientTrackingRecHit_EX_USE := $(foreach d, self  boost clhep FWCore/Utilities FWCore/Framework DataFormats/Common DataFormats/TrackingRecHit DataFormats/TrackerRecHit2D FWCore/ServiceRegistry Geometry/CommonDetUnit DataFormats/GeometrySurface,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsTransientTrackingRecHit_EX_LIB   := TrackingToolsTransientTrackingRecHit
ALL_EXTERNAL_PRODS += TrackingToolsTransientTrackingRecHit
endif
ifeq ($(strip $(CondCore/TagCollection)),)
CondCoreTagCollection := self/CondCore/TagCollection
CondCore/TagCollection := CondCoreTagCollection
CondCoreTagCollection_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondCoreTagCollection_EX_USE := $(foreach d, self  CondCore/DBCommon,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondCoreTagCollection_EX_LIB   := CondCoreTagCollection
ALL_EXTERNAL_PRODS += CondCoreTagCollection
endif
ifeq ($(strip $(SimDataFormats/CaloTest)),)
SimDataFormatsCaloTest := self/SimDataFormats/CaloTest
SimDataFormats/CaloTest := SimDataFormatsCaloTest
SimDataFormatsCaloTest_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimDataFormatsCaloTest_EX_USE := $(foreach d, self  DataFormats/Common FWCore/MessageLogger SimDataFormats/CaloHit boost rootrflx,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimDataFormatsCaloTest_LCGDICTS  := x 
SimDataFormatsCaloTest_EX_LIB   := SimDataFormatsCaloTest
ALL_EXTERNAL_PRODS += SimDataFormatsCaloTest
endif
ifeq ($(strip $(FastSimulation/Event)),)
FastSimulationEvent := self/FastSimulation/Event
FastSimulation/Event := FastSimulationEvent
FastSimulationEvent_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationEvent_EX_USE := $(foreach d, self  DataFormats/HepMCCandidate DataFormats/Candidate DataFormats/Math DataFormats/Provenance FWCore/ParameterSet FastSimulation/BaseParticlePropagator FastSimulation/Particle FastSimulation/Utilities SimDataFormats/Track SimDataFormats/Vertex SimDataFormats/GeneratorProducts FastSimDataFormats/NuclearInteractions SimGeneral/HepPDTRecord hepmc,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationEvent_EX_LIB   := FastSimulationEvent
ALL_EXTERNAL_PRODS += FastSimulationEvent
endif
ifeq ($(strip $(CalibCalorimetry/CaloMiscalibTools)),)
CalibCalorimetryCaloMiscalibTools := self/CalibCalorimetry/CaloMiscalibTools
CalibCalorimetry/CaloMiscalibTools := CalibCalorimetryCaloMiscalibTools
CalibCalorimetryCaloMiscalibTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibCalorimetryCaloMiscalibTools_EX_USE := $(foreach d, self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet CondFormats/DataRecord DataFormats/EcalDetId DataFormats/HcalDetId CondFormats/EcalObjects CondFormats/HcalObjects DataFormats/DetId DataFormats/EcalRecHit DataFormats/HcalRecHit Geometry/CaloTopology CondCore/DBCommon CondCore/DBOutputService xerces-c,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibCalorimetryCaloMiscalibTools_EX_LIB   := CalibCalorimetryCaloMiscalibTools
ALL_EXTERNAL_PRODS += CalibCalorimetryCaloMiscalibTools
endif
ifeq ($(strip $(TrackingTools/MaterialEffects)),)
TrackingToolsMaterialEffects := self/TrackingTools/MaterialEffects
TrackingTools/MaterialEffects := TrackingToolsMaterialEffects
TrackingToolsMaterialEffects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TrackingToolsMaterialEffects_EX_USE := $(foreach d, self  FWCore/Framework FWCore/ParameterSet FWCore/Utilities MagneticField/Engine TrackingTools/GeomPropagators TrackingTools/TrajectoryState TrackPropagation/RungeKutta DataFormats/GeometryCommonDetAlgo boost,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
TrackingToolsMaterialEffects_EX_LIB   := TrackingToolsMaterialEffects
ALL_EXTERNAL_PRODS += TrackingToolsMaterialEffects
endif
ifeq ($(strip $(SimGeneral/NoiseGenerators)),)
SimGeneralNoiseGenerators := self/SimGeneral/NoiseGenerators
SimGeneral/NoiseGenerators := SimGeneralNoiseGenerators
SimGeneralNoiseGenerators_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimGeneralNoiseGenerators_EX_USE := $(foreach d, self  clhep gsl,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimGeneralNoiseGenerators_EX_LIB   := SimGeneralNoiseGenerators
ALL_EXTERNAL_PRODS += SimGeneralNoiseGenerators
endif
ifeq ($(strip $(PhysicsTools/IsolationUtils)),)
PhysicsToolsIsolationUtils := self/PhysicsTools/IsolationUtils
PhysicsTools/IsolationUtils := PhysicsToolsIsolationUtils
PhysicsToolsIsolationUtils_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
PhysicsToolsIsolationUtils_EX_USE := $(foreach d, self  DataFormats/Math FWCore/MessageLogger rootmath,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsIsolationUtils_LCGDICTS  := x 
PhysicsToolsIsolationUtils_EX_LIB   := PhysicsToolsIsolationUtils
ALL_EXTERNAL_PRODS += PhysicsToolsIsolationUtils
endif
