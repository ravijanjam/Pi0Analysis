sherpa             := sherpa
ALL_TOOLS      += sherpa
sherpa_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/sherpa/1.4.2/include/SHERPA-MC
sherpa_EX_INCLUDE  := $(sherpa_LOC_INCLUDE)
sherpa_LOC_LIB := AhadicDecays AhadicFormation AhadicMain AhadicTools Amegic AmegicCluster AmegicPSGen Amisic AmisicModel AmisicTools Amplitude Beam CSCalculators CSMain CSShowers CSTools CTEQ6Sherpa Comix ComixAmplitude ComixCluster ComixPhasespace CT10Sherpa DipoleSubtraction ExtraXS ExtraXS1_2 ExtraXS1_3 ExtraXS2_2 ExtraXSCluster ExtraXSNLO GRVSherpa HadronsCurrents HadronsMEs HadronsMain HadronsPSs LHAPDFSherpa LundTools MCatNLOCalculators MCatNLOMain MCatNLOShowers MCatNLOTools METoolsColors METoolsCurrents METoolsExplicit METoolsLoops METoolsMain METoolsSpinCorrelations METoolsVertices MRST01LOSherpa MRST04QEDSherpa MRST99Sherpa MSTW08Sherpa ModelInteractions ModelMain PDF PDFESherpa POWHEGCalculators POWHEGMain POWHEGShowers POWHEGTools PhasicChannels PhasicDecays PhasicEnhance PhasicMain PhasicProcess PhasicScales PhasicSelectors PhotonsMEs PhotonsMain PhotonsPhaseSpace PhotonsTools Remnant SherpaAnalyses SherpaAnalysis SherpaAnalysisTools SherpaAnalysisTrigger SherpaInitialization SherpaMain SherpaObservables SherpaPerturbativePhysics SherpaSingleEvents SherpaSoftPhysics SherpaTools ShrimpsBeamRemnants ShrimpsEikonals ShrimpsEvents ShrimpsMain ShrimpsTools ShrimpsXsecs String ToolsMath ToolsOrg ToolsPhys Zfunctions
sherpa_EX_LIB  := $(sherpa_LOC_LIB)
sherpa_LOC_USE := hepmc lhapdf
sherpa_EX_USE  := $(sherpa_LOC_USE)
sherpa_INIT_FUNC := $$(eval $$(call ProductCommonVars,sherpa,,,sherpa))

