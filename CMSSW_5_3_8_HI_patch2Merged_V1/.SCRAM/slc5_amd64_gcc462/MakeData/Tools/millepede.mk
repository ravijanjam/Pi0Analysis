millepede             := millepede
ALL_TOOLS      += millepede
millepede_LOC_USE := sockets pcre zlib
millepede_EX_USE  := $(millepede_LOC_USE)
millepede_INIT_FUNC := $$(eval $$(call ProductCommonVars,millepede,,,millepede))

