import FWCore.ParameterSet.Config as cms
process = cms.Process("PAMINBIASSKIM")

process.load('Configuration.StandardSequences.Services_cff')
process.load('FWCore.MessageService.MessageLogger_cfi')
process.load('Configuration.EventContent.EventContentHeavyIons_cff')

process.source = cms.Source("PoolSource",
   fileNames = cms.untracked.vstring(
'file:/scratch/appelte1/PAPilot/express/202792/0C1A6637-60FD-E111-A1EF-001D09F2B30B.root',
'file:/scratch/appelte1/PAPilot/express/202792/146D7F23-5AFD-E111-A78F-001D09F253D4.root',
'file:/scratch/appelte1/PAPilot/express/202792/2E7BFDC8-40FD-E111-B485-001D09F25109.root',
'file:/scratch/appelte1/PAPilot/express/202792/3EECF720-40FD-E111-9956-0015C5FDE067.root',
'file:/scratch/appelte1/PAPilot/express/202792/420ED559-63FD-E111-9DAE-001D09F2437B.root',
'file:/scratch/appelte1/PAPilot/express/202792/52BAD173-68FD-E111-99F9-003048D374F2.root',
'file:/scratch/appelte1/PAPilot/express/202792/6A245A63-5AFD-E111-9391-003048D3733E.root',
'file:/scratch/appelte1/PAPilot/express/202792/767C257C-3AFD-E111-8E85-003048D2BE08.root',
'file:/scratch/appelte1/PAPilot/express/202792/82402D21-40FD-E111-942B-003048D2BD66.root',
'file:/scratch/appelte1/PAPilot/express/202792/989399B5-4EFD-E111-944E-001D09F2A465.root',
'file:/scratch/appelte1/PAPilot/express/202792/A42E2746-5CFD-E111-AF5E-001D09F290BF.root',
'file:/scratch/appelte1/PAPilot/express/202792/B2F0AEB4-4AFD-E111-8191-003048D375AA.root',
'file:/scratch/appelte1/PAPilot/express/202792/C81A2C46-3DFD-E111-8AFD-001D09F295A1.root',
'file:/scratch/appelte1/PAPilot/express/202792/DA4C97E5-61FD-E111-8C37-001D09F28E80.root',
'file:/scratch/appelte1/PAPilot/express/202792/E6F56423-47FD-E111-9D34-003048D374CA.root',
'file:/scratch/appelte1/PAPilot/express/202792/F4525EE5-61FD-E111-B9DC-001D09F2AD84.root'
)
)

# =============== Other Statements =====================
process.maxEvents = cms.untracked.PSet(input = cms.untracked.int32(-1))
process.options = cms.untracked.PSet(wantSummary = cms.untracked.bool(True))

#Trigger Selection
### Comment out for the timing being assuming running on secondary dataset with trigger bit selected already
import HLTrigger.HLTfilters.hltHighLevel_cfi
process.hltHIHighPt = HLTrigger.HLTfilters.hltHighLevel_cfi.hltHighLevel.clone()
process.hltHIHighPt.HLTPaths = ['HLT_PAMinBiasHfOrBSC_v1'] # for allphysics
process.hltHIHighPt.andOr = cms.bool(True)
process.hltHIHighPt.throw = cms.bool(False)

process.eventFilter_step = cms.Path( process.hltHIHighPt )

process.output = cms.OutputModule("PoolOutputModule",
    outputCommands = process.RECOEventContent.outputCommands,
    fileName = cms.untracked.string('hiPAMinBias.root'),
    SelectEvents = cms.untracked.PSet(SelectEvents = cms.vstring('eventFilter_step')),
    dataset = cms.untracked.PSet(
      dataTier = cms.untracked.string('RECO'),
      filterName = cms.untracked.string('hiHighPt'))
)

process.output_step = cms.EndPath(process.output)

process.schedule = cms.Schedule(
    process.eventFilter_step,
    process.output_step
)

