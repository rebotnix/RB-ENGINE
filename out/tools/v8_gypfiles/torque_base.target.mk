# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := torque_base
DEFS_Debug := \
	'-D_GLIBCXX_USE_CXX11_ABI=1' \
	'-DNODE_OPENSSL_CONF_NAME=nodejs_conf' \
	'-DNODE_OPENSSL_HAS_QUIC' \
	'-DICU_NO_USER_DATA_OVERRIDE' \
	'-DV8_GYP_BUILD' \
	'-DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=64' \
	'-D__STDC_FORMAT_MACROS' \
	'-DOPENSSL_NO_PINSHARED' \
	'-DOPENSSL_THREADS' \
	'-DV8_TARGET_ARCH_ARM64' \
	'-DV8_HAVE_TARGET_OS' \
	'-DV8_TARGET_OS_LINUX' \
	'-DV8_EMBEDDER_STRING="-node.19"' \
	'-DENABLE_DISASSEMBLER' \
	'-DV8_PROMISE_INTERNAL_FIELD_COUNT=1' \
	'-DV8_ENABLE_PRIVATE_MAPPING_FORK_OPTIMIZATION' \
	'-DOBJECT_PRINT' \
	'-DV8_INTL_SUPPORT' \
	'-DV8_ATOMIC_OBJECT_FIELD_WRITES' \
	'-DV8_ENABLE_LAZY_SOURCE_POSITIONS' \
	'-DV8_USE_SIPHASH' \
	'-DV8_SHARED_RO_HEAP' \
	'-DV8_WIN64_UNWINDING_INFO' \
	'-DV8_ENABLE_REGEXP_INTERPRETER_THREADED_DISPATCH' \
	'-DV8_USE_ZLIB' \
	'-DV8_ENABLE_TURBOFAN' \
	'-DV8_ENABLE_WEBASSEMBLY' \
	'-DV8_ENABLE_JAVASCRIPT_PROMISE_HOOKS' \
	'-DV8_ALLOCATION_FOLDING' \
	'-DV8_ALLOCATION_SITE_TRACKING' \
	'-DV8_ADVANCED_BIGINT_ALGORITHMS' \
	'-DDEBUG' \
	'-D_DEBUG' \
	'-DV8_ENABLE_CHECKS' \
	'-DV8_TRACE_MAPS' \
	'-DV8_ENABLE_ALLOCATION_TIMEOUT' \
	'-DV8_ENABLE_FORCE_SLOW_PATH' \
	'-DENABLE_HANDLE_ZAPPING'

# Flags passed to all source files.
CFLAGS_Debug := \
	-pthread \
	-Wno-unused-parameter \
	-Wno-return-type \
	-flax-vector-conversions \
	-Wno-invalid-offsetof \
	-fno-strict-aliasing \
	-g \
	-fdata-sections \
	-ffunction-sections \
	-O3

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-fno-rtti \
	-std=gnu++17 \
	-fexceptions

INCS_Debug := \
	-I$(srcdir)/deps/v8 \
	-I$(srcdir)/deps/v8/include

DEFS_Release := \
	'-D_GLIBCXX_USE_CXX11_ABI=1' \
	'-DNODE_OPENSSL_CONF_NAME=nodejs_conf' \
	'-DNODE_OPENSSL_HAS_QUIC' \
	'-DICU_NO_USER_DATA_OVERRIDE' \
	'-DV8_GYP_BUILD' \
	'-DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=64' \
	'-D__STDC_FORMAT_MACROS' \
	'-DOPENSSL_NO_PINSHARED' \
	'-DOPENSSL_THREADS' \
	'-DV8_TARGET_ARCH_ARM64' \
	'-DV8_HAVE_TARGET_OS' \
	'-DV8_TARGET_OS_LINUX' \
	'-DV8_EMBEDDER_STRING="-node.19"' \
	'-DENABLE_DISASSEMBLER' \
	'-DV8_PROMISE_INTERNAL_FIELD_COUNT=1' \
	'-DV8_ENABLE_PRIVATE_MAPPING_FORK_OPTIMIZATION' \
	'-DOBJECT_PRINT' \
	'-DV8_INTL_SUPPORT' \
	'-DV8_ATOMIC_OBJECT_FIELD_WRITES' \
	'-DV8_ENABLE_LAZY_SOURCE_POSITIONS' \
	'-DV8_USE_SIPHASH' \
	'-DV8_SHARED_RO_HEAP' \
	'-DV8_WIN64_UNWINDING_INFO' \
	'-DV8_ENABLE_REGEXP_INTERPRETER_THREADED_DISPATCH' \
	'-DV8_USE_ZLIB' \
	'-DV8_ENABLE_TURBOFAN' \
	'-DV8_ENABLE_WEBASSEMBLY' \
	'-DV8_ENABLE_JAVASCRIPT_PROMISE_HOOKS' \
	'-DV8_ALLOCATION_FOLDING' \
	'-DV8_ALLOCATION_SITE_TRACKING' \
	'-DV8_ADVANCED_BIGINT_ALGORITHMS'

# Flags passed to all source files.
CFLAGS_Release := \
	-pthread \
	-Wno-unused-parameter \
	-Wno-return-type \
	-flax-vector-conversions \
	-Wno-invalid-offsetof \
	-fno-strict-aliasing \
	-O3 \
	-fno-omit-frame-pointer \
	-fdata-sections \
	-ffunction-sections \
	-O3

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-rtti \
	-std=gnu++17 \
	-fexceptions

INCS_Release := \
	-I$(srcdir)/deps/v8 \
	-I$(srcdir)/deps/v8/include

OBJS := \
	$(obj).target/$(TARGET)/deps/v8/src/torque/cc-generator.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/cfg.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/class-debug-reader-generator.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/cpp-builder.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/csa-generator.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/declarable.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/declaration-visitor.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/declarations.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/earley-parser.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/global-context.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/implementation-visitor.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/instance-type-generator.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/instructions.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/kythe-data.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/server-data.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/source-positions.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/torque-code-generator.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/torque-compiler.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/torque-parser.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/type-inference.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/type-oracle.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/type-visitor.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/types.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/utils.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# Make sure our dependencies are built before any of us.
$(OBJS): | $(obj).target/tools/v8_gypfiles/v8_shared_internal_headers.stamp

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-pthread \
	-rdynamic

LDFLAGS_Release := \
	-pthread \
	-rdynamic

LIBS :=

$(obj).target/tools/v8_gypfiles/libtorque_base.a: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/tools/v8_gypfiles/libtorque_base.a: LIBS := $(LIBS)
$(obj).target/tools/v8_gypfiles/libtorque_base.a: TOOLSET := $(TOOLSET)
$(obj).target/tools/v8_gypfiles/libtorque_base.a: $(OBJS)
	$(call create_thin_archive,$@,$^)

# Add target alias
.PHONY: torque_base
torque_base: $(obj).target/tools/v8_gypfiles/libtorque_base.a

# Add target alias to "all" target.
.PHONY: all
all: torque_base

