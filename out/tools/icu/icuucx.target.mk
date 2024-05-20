# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := icuucx
DEFS_Debug := \
	'-D_GLIBCXX_USE_CXX11_ABI=1' \
	'-DNODE_OPENSSL_CONF_NAME=nodejs_conf' \
	'-DNODE_OPENSSL_HAS_QUIC' \
	'-DICU_NO_USER_DATA_OVERRIDE' \
	'-D__STDC_FORMAT_MACROS' \
	'-DOPENSSL_NO_PINSHARED' \
	'-DOPENSSL_THREADS' \
	'-DU_COMMON_IMPLEMENTATION=1' \
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
CFLAGS_C_Debug := \
	-std=c99

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
	'-DU_COMMON_IMPLEMENTATION=1' \
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
CFLAGS_C_Release := \
	-std=c99

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-exceptions \
	-std=gnu++17 \
	-frtti

INCS_Release := \
	-I$(srcdir)/deps/icu-small/source/common

OBJS := \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/restrace.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/utrace.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uresdata.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucharstriebuilder.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/normalizer2impl.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/udata.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/util_props.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnvbocu.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uvector.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uvectr64.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/rbbi.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uhash.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/unistr.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/cstr.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/servlkf.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/unifunct.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/dictionarydata.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/rbbidata.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uidna.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucase.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uts46.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/edits.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnv_lmb.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/lsr.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/bmpset.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/bytestrieiterator.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ustr_cnv.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uiter.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ubidiln.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uenum.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uchar.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/dtintrv.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/filteredbrk.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/servlk.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/localebuilder.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/serv.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/rbbi_cache.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/util.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/caniter.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ustr_wcs.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/unistr_case_locale.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uloc_keytype.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uvectr32.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/simpleformatter.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/umath.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/propsvec.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/umapfile.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uhash_us.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/servslkf.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ulist.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ubidi.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/appendable.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnv_io.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnvhz.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucln_cmn.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uloc.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/locmap.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/propname.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ulocale.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/errorcode.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/utrie2.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ustrcase.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/stringpiece.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/usetiter.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/rbbitblb.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/locdspnm.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uniset_closure.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/brkeng.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/sharedobject.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/normlzr.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ulocbuilder.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/unifilt.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnvisci.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uarrsort.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/umutex.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/utext.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucharstrie.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/servls.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ustring.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uniset_props.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnvscsu.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnv_ct.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/chariter.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucasemap.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/schriter.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/characterproperties.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/rbbirb.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/messagepattern.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/locdistance.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/bytesinkutil.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/utrie.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucptrie.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucmndata.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/rbbinode.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uscript_props.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/localematcher.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/locutil.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucasemap_titlecase_brkiter.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/rbbiscan.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/resource.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnv_cb.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ustr_titlecase_brkiter.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ustrfmt.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/emojiprops.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ures_cnv.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnvlat1.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/bytestriebuilder.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/unistr_cnv.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucurr.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/pluralmap.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/servnotf.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/static_unicode_sets.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/locresdata.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/servrbf.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ubiditransform.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/cstring.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ruleiter.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/resbund.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnvsel.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnv_u32.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/unifiedcache.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnv_set.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ubidiwrt.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnv.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/punycode.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnvmbcs.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/cwchar.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnv2022.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnv_cnv.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/rbbisetb.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnv_err.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/resbund_cnv.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/bytestrie.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/utypes.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ustrenum.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uinvchar.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/loclikely.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/icudataver.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ustack.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/putil.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uset.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/locbased.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucol_swp.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucat.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/utrie_swap.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/usprep.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/stringtriebuilder.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/filterednormalizer2.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/unisetspan.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/udatamem.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/locid.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/rbbistbl.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ubrk.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/charstr.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/dictbe.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnv_ext.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/unames.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uobject.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/bytestream.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/parsepos.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/brkiter.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/lstmbe.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/unorm.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnv_u7.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/unistr_case.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnvdisp.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/locdispnames.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ubidi_props.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/patternprops.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uset_props.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/usc_impl.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/udataswp.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/loadednormalizer2impl.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/cmemory.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uloc_tag.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/unistr_props.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ustrtrns.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/utrie2_builder.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ustrcase_locale.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/utf_impl.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/localeprioritylist.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uniset.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/unormcmp.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/icuplug.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/umutablecptrie.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uresbund.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/normalizer2.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnv_u8.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/loclikelysubtags.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/mlbe.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnv_bld.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uinit.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uprops.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/locavailable.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/unistr_titlecase_brkiter.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uchriter.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/wintz.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ushape.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/uscript.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucnv_u16.o \
	$(obj).target/$(TARGET)/deps/icu-small/source/common/ucharstrieiterator.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# Make sure our dependencies are built before any of us.
$(OBJS): | $(obj).target/tools/icu/icu_implementation.stamp $(obj).target/tools/icu/icu_uconfig.stamp $(obj).target/tools/icu/icu_uconfig_target.stamp

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cpp FORCE_DO_CMD
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

$(obj).target/tools/icu/libicuucx.a: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/tools/icu/libicuucx.a: LIBS := $(LIBS)
$(obj).target/tools/icu/libicuucx.a: TOOLSET := $(TOOLSET)
$(obj).target/tools/icu/libicuucx.a: $(OBJS)
	$(call create_thin_archive,$@,$^)

# Add target alias
.PHONY: icuucx
icuucx: $(obj).target/tools/icu/libicuucx.a

# Add target alias to "all" target.
.PHONY: all
all: icuucx

