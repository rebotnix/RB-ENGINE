# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := v8_pch
### Rules for final target.
$(obj).target/tools/v8_gypfiles/v8_pch.stamp: TOOLSET := $(TOOLSET)
$(obj).target/tools/v8_gypfiles/v8_pch.stamp:  FORCE_DO_CMD
	$(call do_cmd,touch)

all_deps += $(obj).target/tools/v8_gypfiles/v8_pch.stamp
# Add target alias
.PHONY: v8_pch
v8_pch: $(obj).target/tools/v8_gypfiles/v8_pch.stamp

# Add target alias to "all" target.
.PHONY: all
all: v8_pch

