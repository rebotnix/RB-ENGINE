# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := v8
### Rules for final target.
LDFLAGS_Debug := \
	-pthread \
	-rdynamic

LDFLAGS_Release := \
	-pthread \
	-rdynamic

LIBS :=

$(obj).target/tools/v8_gypfiles/libv8.a: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/tools/v8_gypfiles/libv8.a: LIBS := $(LIBS)
$(obj).target/tools/v8_gypfiles/libv8.a: TOOLSET := $(TOOLSET)
$(obj).target/tools/v8_gypfiles/libv8.a: 
	$(call create_thin_archive,$@,$^)

# Add target alias
.PHONY: v8
v8: $(obj).target/tools/v8_gypfiles/libv8.a

