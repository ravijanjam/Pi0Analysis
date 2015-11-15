geant4vis             := geant4vis
ALL_TOOLS      += geant4vis
geant4vis_LOC_LIB := G4FR G4modeling G4RayTracer G4Tree G4visHepRep G4vis_management G4visXXX G4VRML
geant4vis_EX_LIB  := $(geant4vis_LOC_LIB)
geant4vis_LOC_USE := geant4core
geant4vis_EX_USE  := $(geant4vis_LOC_USE)
geant4vis_INIT_FUNC := $$(eval $$(call ProductCommonVars,geant4vis,,,geant4vis))

