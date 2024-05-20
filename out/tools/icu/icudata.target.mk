# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := icudata
### Rules for action "icupkg":
quiet_cmd__opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_icupkg = ACTION _opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_icupkg $@
cmd__opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_icupkg = LD_LIBRARY_PATH=$(builddir)/lib.host:$(builddir)/lib.target:$$LD_LIBRARY_PATH; export LD_LIBRARY_PATH; cd $(srcdir)/tools/icu; mkdir -p $(obj)/gen; "$(builddir)/icupkg" -tl ../../deps/icu-tmp/icudt74l.dat "$(obj)/gen/icudt74l.dat"

$(obj)/gen/icudt74l.dat: obj := $(abs_obj)
$(obj)/gen/icudt74l.dat: builddir := $(abs_builddir)
$(obj)/gen/icudt74l.dat: TOOLSET := $(TOOLSET)
$(obj)/gen/icudt74l.dat: $(srcdir)/deps/icu-tmp/icudt74l.dat FORCE_DO_CMD
	$(call do_cmd,_opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_icupkg)

all_deps += $(obj)/gen/icudt74l.dat
action__opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_icupkg_outputs := $(obj)/gen/icudt74l.dat

### Rules for action "copy":
quiet_cmd__opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_copy = ACTION _opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_copy $@
cmd__opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_copy = LD_LIBRARY_PATH=$(builddir)/lib.host:$(builddir)/lib.target:$$LD_LIBRARY_PATH; export LD_LIBRARY_PATH; cd $(srcdir)/tools/icu; mkdir -p $(obj)/gen; cp "$(obj)/gen/icudt74l.dat" "$(obj)/gen/icudt74.dat"

$(obj)/gen/icudt74.dat: obj := $(abs_obj)
$(obj)/gen/icudt74.dat: builddir := $(abs_builddir)
$(obj)/gen/icudt74.dat: TOOLSET := $(TOOLSET)
$(obj)/gen/icudt74.dat: $(obj)/gen/icudt74l.dat FORCE_DO_CMD
	$(call do_cmd,_opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_copy)

all_deps += $(obj)/gen/icudt74.dat
action__opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_copy_outputs := $(obj)/gen/icudt74.dat

### Rules for action "icudata":
quiet_cmd__opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_icudata = ACTION _opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_icudata $@
cmd__opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_icudata = LD_LIBRARY_PATH=$(builddir)/lib.host:$(builddir)/lib.target:$$LD_LIBRARY_PATH; export LD_LIBRARY_PATH; cd $(srcdir)/tools/icu; mkdir -p $(obj)/gen; "$(builddir)/genccode" -e icudt74 -d "$(obj)/gen" -a gcc -f icudt74_dat "$(obj)/gen/icudt74.dat"

$(obj)/gen/icudt74_dat.S: obj := $(abs_obj)
$(obj)/gen/icudt74_dat.S: builddir := $(abs_builddir)
$(obj)/gen/icudt74_dat.S: TOOLSET := $(TOOLSET)
$(obj)/gen/icudt74_dat.S: $(obj)/gen/icudt74.dat FORCE_DO_CMD
	$(call do_cmd,_opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_icudata)

all_deps += $(obj)/gen/icudt74_dat.S
action__opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_icudata_outputs := $(obj)/gen/icudt74_dat.S


DEFS_Debug := \
	'-D_GLIBCXX_USE_CXX11_ABI=1' \
	'-DNODE_OPENSSL_CONF_NAME=nodejs_conf' \
	'-DNODE_OPENSSL_HAS_QUIC' \
	'-DICU_NO_USER_DATA_OVERRIDE' \
	'-D__STDC_FORMAT_MACROS' \
	'-DOPENSSL_NO_PINSHARED' \
	'-DOPENSSL_THREADS' \
	'-DU_ATTRIBUTE_DEPRECATED=' \
	'-DU_STATIC_IMPLEMENTATION=1' \
	'-DUCONFIG_NO_SERVICE=1' \
	'-DU_ENABLE_DYLOAD=0' \
	'-DU_HAVE_STD_STRING=1' \
	'-DUCONFIG_NO_BREAK_ITERATION=0' \
	'-DDEBUG' \
	'-D_DEBUG'

# Flags passed to all source files.
CFLAGS_Debug := \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-Wno-deprecated-declarations \
	-Wno-strict-aliasing \
	-g \
	-O0

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-fno-exceptions \
	-std=gnu++17 \
	-frtti

INCS_Debug := \
	-I$(srcdir)/deps/icu-small/source/common

DEFS_Release := \
	'-D_GLIBCXX_USE_CXX11_ABI=1' \
	'-DNODE_OPENSSL_CONF_NAME=nodejs_conf' \
	'-DNODE_OPENSSL_HAS_QUIC' \
	'-DICU_NO_USER_DATA_OVERRIDE' \
	'-D__STDC_FORMAT_MACROS' \
	'-DOPENSSL_NO_PINSHARED' \
	'-DOPENSSL_THREADS' \
	'-DU_ATTRIBUTE_DEPRECATED=' \
	'-DU_STATIC_IMPLEMENTATION=1' \
	'-DUCONFIG_NO_SERVICE=1' \
	'-DU_ENABLE_DYLOAD=0' \
	'-DU_HAVE_STD_STRING=1' \
	'-DUCONFIG_NO_BREAK_ITERATION=0'

# Flags passed to all source files.
CFLAGS_Release := \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-Wno-deprecated-declarations \
	-Wno-strict-aliasing \
	-O3 \
	-fno-omit-frame-pointer

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-exceptions \
	-std=gnu++17 \
	-frtti

INCS_Release := \
	-I$(srcdir)/deps/icu-small/source/common

OBJS := \
	$(obj).target/$(TARGET)/gen/icudt74_dat.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# Make sure our dependencies are built before any of us.
$(OBJS): | $(builddir)/genccode $(builddir)/icupkg $(obj).target/tools/icu/icu_implementation.stamp $(obj).target/tools/icu/icu_uconfig.stamp

# Make sure our actions/rules run before any of us.
$(OBJS): | $(action__opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_icupkg_outputs) $(action__opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_copy_outputs) $(action__opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_icudata_outputs)

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.S FORCE_DO_CMD
	@$(call do_cmd,cc,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.S FORCE_DO_CMD
	@$(call do_cmd,cc,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.S FORCE_DO_CMD
	@$(call do_cmd,cc,1)

# End of this set of suffix rules
### Rules for final target.
# Build our special outputs first.
$(obj).target/tools/icu/libicudata.a: | $(action__opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_icupkg_outputs) $(action__opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_copy_outputs) $(action__opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_icudata_outputs)

# Preserve order dependency of special output on deps.
$(action__opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_icupkg_outputs) $(action__opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_copy_outputs) $(action__opt_ssd_jetson_rb_webengine_dev_engine_src_github_tools_icu_icu_generic_gyp_icudata_target_icudata_outputs): | $(builddir)/genccode $(builddir)/icupkg $(obj).target/tools/icu/icu_implementation.stamp $(obj).target/tools/icu/icu_uconfig.stamp

LDFLAGS_Debug := \
	-pthread \
	-rdynamic

LDFLAGS_Release := \
	-pthread \
	-rdynamic

LIBS :=

$(obj).target/tools/icu/libicudata.a: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/tools/icu/libicudata.a: LIBS := $(LIBS)
$(obj).target/tools/icu/libicudata.a: TOOLSET := $(TOOLSET)
$(obj).target/tools/icu/libicudata.a: $(OBJS)
	$(call create_thin_archive,$@,$^)

# Add target alias
.PHONY: icudata
icudata: $(obj).target/tools/icu/libicudata.a

# Add target alias to "all" target.
.PHONY: all
all: icudata

