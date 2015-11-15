src_CmsHi_Analysis2010_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/CmsHi/Analysis2010/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_CmsHi_Analysis2010_scripts,src/CmsHi/Analysis2010/scripts,$(SCRAMSTORENAME_BIN),*))
