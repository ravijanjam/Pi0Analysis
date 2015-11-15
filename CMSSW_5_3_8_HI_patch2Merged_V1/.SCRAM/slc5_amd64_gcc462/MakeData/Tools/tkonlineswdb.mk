tkonlineswdb             := tkonlineswdb
ALL_TOOLS      += tkonlineswdb
tkonlineswdb_LOC_LIB := DeviceDescriptions Fed9UDeviceFactory
tkonlineswdb_EX_LIB  := $(tkonlineswdb_LOC_LIB)
tkonlineswdb_LOC_USE := tkonlinesw oracle oracleocci
tkonlineswdb_EX_USE  := $(tkonlineswdb_LOC_USE)
tkonlineswdb_INIT_FUNC := $$(eval $$(call ProductCommonVars,tkonlineswdb,,,tkonlineswdb))

