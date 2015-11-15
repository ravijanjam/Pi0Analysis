geant4core             := geant4core
ALL_TOOLS      += geant4core
geant4core_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/geant4/9.4.p03-cms/include
geant4core_EX_INCLUDE  := $(geant4core_LOC_INCLUDE)
geant4core_LOC_LIB := G4digits_hits G4error_propagation G4event G4geometry G4global G4graphics_reps G4intercoms G4interfaces G4materials G4parmodels G4particles G4persistency G4physicslists G4processes G4readout G4run G4tracking G4track
geant4core_EX_LIB  := $(geant4core_LOC_LIB)
geant4core_LOC_USE := clhep
geant4core_EX_USE  := $(geant4core_LOC_USE)
geant4core_LOC_FLAGS_CPPDEFINES  := -DG4USE_STD_NAMESPACE -DGNU_GCC -DG4V9
geant4core_EX_FLAGS_CPPDEFINES   := $(geant4core_LOC_FLAGS_CPPDEFINES)
geant4core_INIT_FUNC := $$(eval $$(call ProductCommonVars,geant4core,,,geant4core))

