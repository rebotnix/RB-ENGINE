# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := brotli
DEFS_Debug := \
	'-D_GLIBCXX_USE_CXX11_ABI=1' \
	'-DNODE_OPENSSL_CONF_NAME=nodejs_conf' \
	'-DNODE_OPENSSL_HAS_QUIC' \
	'-DICU_NO_USER_DATA_OVERRIDE' \
	'-D__STDC_FORMAT_MACROS' \
	'-DOPENSSL_NO_PINSHARED' \
	'-DOPENSSL_THREADS' \
	'-DOS_LINUX' \
	'-DDEBUG' \
	'-D_DEBUG'

# Flags passed to all source files.
CFLAGS_Debug := \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-g \
	-O0

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++17

INCS_Debug := \
	-I$(srcdir)/deps/brotli/c/include

DEFS_Release := \
	'-D_GLIBCXX_USE_CXX11_ABI=1' \
	'-DNODE_OPENSSL_CONF_NAME=nodejs_conf' \
	'-DNODE_OPENSSL_HAS_QUIC' \
	'-DICU_NO_USER_DATA_OVERRIDE' \
	'-D__STDC_FORMAT_MACROS' \
	'-DOPENSSL_NO_PINSHARED' \
	'-DOPENSSL_THREADS' \
	'-DOS_LINUX'

# Flags passed to all source files.
CFLAGS_Release := \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-O3 \
	-fno-omit-frame-pointer

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++17

INCS_Release := \
	-I$(srcdir)/deps/brotli/c/include

OBJS := \
	$(obj).target/$(TARGET)/deps/brotli/c/common/constants.o \
	$(obj).target/$(TARGET)/deps/brotli/c/common/context.o \
	$(obj).target/$(TARGET)/deps/brotli/c/common/dictionary.o \
	$(obj).target/$(TARGET)/deps/brotli/c/common/platform.o \
	$(obj).target/$(TARGET)/deps/brotli/c/common/shared_dictionary.o \
	$(obj).target/$(TARGET)/deps/brotli/c/common/transform.o \
	$(obj).target/$(TARGET)/deps/brotli/c/dec/bit_reader.o \
	$(obj).target/$(TARGET)/deps/brotli/c/dec/decode.o \
	$(obj).target/$(TARGET)/deps/brotli/c/dec/huffman.o \
	$(obj).target/$(TARGET)/deps/brotli/c/dec/state.o \
	$(obj).target/$(TARGET)/deps/brotli/c/enc/backward_references.o \
	$(obj).target/$(TARGET)/deps/brotli/c/enc/backward_references_hq.o \
	$(obj).target/$(TARGET)/deps/brotli/c/enc/bit_cost.o \
	$(obj).target/$(TARGET)/deps/brotli/c/enc/block_splitter.o \
	$(obj).target/$(TARGET)/deps/brotli/c/enc/brotli_bit_stream.o \
	$(obj).target/$(TARGET)/deps/brotli/c/enc/cluster.o \
	$(obj).target/$(TARGET)/deps/brotli/c/enc/command.o \
	$(obj).target/$(TARGET)/deps/brotli/c/enc/compound_dictionary.o \
	$(obj).target/$(TARGET)/deps/brotli/c/enc/compress_fragment.o \
	$(obj).target/$(TARGET)/deps/brotli/c/enc/compress_fragment_two_pass.o \
	$(obj).target/$(TARGET)/deps/brotli/c/enc/dictionary_hash.o \
	$(obj).target/$(TARGET)/deps/brotli/c/enc/encode.o \
	$(obj).target/$(TARGET)/deps/brotli/c/enc/encoder_dict.o \
	$(obj).target/$(TARGET)/deps/brotli/c/enc/entropy_encode.o \
	$(obj).target/$(TARGET)/deps/brotli/c/enc/fast_log.o \
	$(obj).target/$(TARGET)/deps/brotli/c/enc/histogram.o \
	$(obj).target/$(TARGET)/deps/brotli/c/enc/literal_cost.o \
	$(obj).target/$(TARGET)/deps/brotli/c/enc/memory.o \
	$(obj).target/$(TARGET)/deps/brotli/c/enc/metablock.o \
	$(obj).target/$(TARGET)/deps/brotli/c/enc/static_dict.o \
	$(obj).target/$(TARGET)/deps/brotli/c/enc/utf8_util.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.c FORCE_DO_CMD
	@$(call do_cmd,cc,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.c FORCE_DO_CMD
	@$(call do_cmd,cc,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.c FORCE_DO_CMD
	@$(call do_cmd,cc,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-pthread \
	-rdynamic

LDFLAGS_Release := \
	-pthread \
	-rdynamic

LIBS := \
	-lm

$(obj).target/deps/brotli/libbrotli.a: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/deps/brotli/libbrotli.a: LIBS := $(LIBS)
$(obj).target/deps/brotli/libbrotli.a: TOOLSET := $(TOOLSET)
$(obj).target/deps/brotli/libbrotli.a: $(OBJS)
	$(call create_thin_archive,$@,$^)

# Add target alias
.PHONY: brotli
brotli: $(obj).target/deps/brotli/libbrotli.a

# Add target alias to "all" target.
.PHONY: all
all: brotli

