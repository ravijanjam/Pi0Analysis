rootthread             := rootthread
ALL_TOOLS      += rootthread
rootthread_LOC_LIB := Thread
rootthread_EX_LIB  := $(rootthread_LOC_LIB)
rootthread_LOC_USE := rootrio
rootthread_EX_USE  := $(rootthread_LOC_USE)
rootthread_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootthread,,,rootthread))

