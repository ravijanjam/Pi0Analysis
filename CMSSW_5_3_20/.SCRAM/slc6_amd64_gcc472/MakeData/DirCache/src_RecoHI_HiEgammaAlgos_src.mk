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
