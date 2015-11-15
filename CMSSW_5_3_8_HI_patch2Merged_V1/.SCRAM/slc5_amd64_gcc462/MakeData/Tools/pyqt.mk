pyqt             := pyqt
ALL_TOOLS      += pyqt
pyqt_LOC_USE := python qt sip
pyqt_EX_USE  := $(pyqt_LOC_USE)
pyqt_INIT_FUNC := $$(eval $$(call ProductCommonVars,pyqt,,,pyqt))

