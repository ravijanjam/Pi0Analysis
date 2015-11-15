rootguihtml             := rootguihtml
ALL_TOOLS      += rootguihtml
rootguihtml_LOC_LIB := GuiHtml
rootguihtml_EX_LIB  := $(rootguihtml_LOC_LIB)
rootguihtml_LOC_USE := rootinteractive
rootguihtml_EX_USE  := $(rootguihtml_LOC_USE)
rootguihtml_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootguihtml,,,rootguihtml))

