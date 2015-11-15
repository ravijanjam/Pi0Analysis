src_CmsHi_JetAnalysis_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/CmsHi/JetAnalysis/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_CmsHi_JetAnalysis_scripts,src/CmsHi/JetAnalysis/scripts,$(SCRAMSTORENAME_BIN),*))
