opengl             := opengl
ALL_TOOLS      += opengl
opengl_LOC_LIB := GL GLU
opengl_EX_LIB  := $(opengl_LOC_LIB)
opengl_LOC_USE := x11
opengl_EX_USE  := $(opengl_LOC_USE)
opengl_INIT_FUNC := $$(eval $$(call ProductCommonVars,opengl,,,opengl))

