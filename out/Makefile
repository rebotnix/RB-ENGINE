# We borrow heavily from the kernel build setup, though we are simpler since
# we don't have Kconfig tweaking settings on us.

# The implicit make rules have it looking for RCS files, among other things.
# We instead explicitly write all the rules we care about.
# It's even quicker (saves ~200ms) to pass -r on the command line.
MAKEFLAGS=-r

# The source directory tree.
srcdir := ..
abs_srcdir := $(abspath $(srcdir))

# The name of the builddir.
builddir_name ?= /opt/ssd/jetson_rb_webengine/dev/engine_src_github/out

# The V=1 flag on command line makes us verbosely print command lines.
ifdef V
  quiet=
else
  quiet=quiet_
endif

# Specify BUILDTYPE=Release on the command line for a release build.
BUILDTYPE ?= Release

# Directory all our build output goes into.
# Note that this must be two directories beneath src/ for unit tests to pass,
# as they reach into the src/ directory for data with relative paths.
builddir ?= $(builddir_name)/$(BUILDTYPE)
abs_builddir := $(abspath $(builddir))
depsdir := $(builddir)/.deps

# Object output directory.
obj := $(builddir)/obj
abs_obj := $(abspath $(obj))

# We build up a list of every single one of the targets so we can slurp in the
# generated dependency rule Makefiles in one pass.
all_deps :=



CC.target ?= $(CC)
CFLAGS.target ?= $(CPPFLAGS) $(CFLAGS)
CXX.target ?= $(CXX)
CXXFLAGS.target ?= $(CPPFLAGS) $(CXXFLAGS)
LINK.target ?= $(LINK)
LDFLAGS.target ?= $(LDFLAGS)
AR.target ?= $(AR)
PLI.target ?= pli

# C++ apps need to be linked with g++.
LINK ?= $(CXX.target)

# TODO(evan): move all cross-compilation logic to gyp-time so we don't need
# to replicate this environment fallback in make as well.
CC.host ?= gcc
CFLAGS.host ?= $(CPPFLAGS_host) $(CFLAGS_host)
CXX.host ?= g++
CXXFLAGS.host ?= $(CPPFLAGS_host) $(CXXFLAGS_host)
LINK.host ?= $(CXX.host)
LDFLAGS.host ?= $(LDFLAGS_host)
AR.host ?= ar
PLI.host ?= pli

# Define a dir function that can handle spaces.
# http://www.gnu.org/software/make/manual/make.html#Syntax-of-Functions
# "leading spaces cannot appear in the text of the first argument as written.
# These characters can be put into the argument value by variable substitution."
empty :=
space := $(empty) $(empty)

# http://stackoverflow.com/questions/1189781/using-make-dir-or-notdir-on-a-path-with-spaces
replace_spaces = $(subst $(space),?,$1)
unreplace_spaces = $(subst ?,$(space),$1)
dirx = $(call unreplace_spaces,$(dir $(call replace_spaces,$1)))

# Flags to make gcc output dependency info.  Note that you need to be
# careful here to use the flags that ccache and distcc can understand.
# We write to a dep file on the side first and then rename at the end
# so we can't end up with a broken dep file.
depfile = $(depsdir)/$(call replace_spaces,$@).d
DEPFLAGS = -MMD -MF $(depfile).raw

# We have to fixup the deps output in a few ways.
# (1) the file output should mention the proper .o file.
# ccache or distcc lose the path to the target, so we convert a rule of
# the form:
#   foobar.o: DEP1 DEP2
# into
#   path/to/foobar.o: DEP1 DEP2
# (2) we want missing files not to cause us to fail to build.
# We want to rewrite
#   foobar.o: DEP1 DEP2 \
#               DEP3
# to
#   DEP1:
#   DEP2:
#   DEP3:
# so if the files are missing, they're just considered phony rules.
# We have to do some pretty insane escaping to get those backslashes
# and dollar signs past make, the shell, and sed at the same time.
# Doesn't work with spaces, but that's fine: .d files have spaces in
# their names replaced with other characters.
define fixup_dep
# The depfile may not exist if the input file didn't have any #includes.
touch $(depfile).raw
# Fixup path as in (1).
sed -e "s|^$(notdir $@)|$@|" $(depfile).raw >> $(depfile)
# Add extra rules as in (2).
# We remove slashes and replace spaces with new lines;
# remove blank lines;
# delete the first line and append a colon to the remaining lines.
sed -e 's|\\||' -e 'y| |\n|' $(depfile).raw |\
  grep -v '^$$'                             |\
  sed -e 1d -e 's|$$|:|'                     \
    >> $(depfile)
rm $(depfile).raw
endef

# Command definitions:
# - cmd_foo is the actual command to run;
# - quiet_cmd_foo is the brief-output summary of the command.

quiet_cmd_cc = CC($(TOOLSET)) $@
cmd_cc = $(CC.$(TOOLSET)) -o $@ $< $(GYP_CFLAGS) $(DEPFLAGS) $(CFLAGS.$(TOOLSET)) -c

quiet_cmd_cxx = CXX($(TOOLSET)) $@
cmd_cxx = $(CXX.$(TOOLSET)) -o $@ $< $(GYP_CXXFLAGS) $(DEPFLAGS) $(CXXFLAGS.$(TOOLSET)) -c

quiet_cmd_touch = TOUCH $@
cmd_touch = touch $@

quiet_cmd_copy = COPY $@
# send stderr to /dev/null to ignore messages when linking directories.
cmd_copy = ln -f "$<" "$@" 2>/dev/null || (rm -rf "$@" && cp -af "$<" "$@")

quiet_cmd_symlink = SYMLINK $@
cmd_symlink = ln -sf "$<" "$@"

quiet_cmd_alink = AR($(TOOLSET)) $@
cmd_alink = rm -f $@ && $(AR.$(TOOLSET)) crs $@ $(filter %.o,$^)

quiet_cmd_alink_thin = AR($(TOOLSET)) $@
cmd_alink_thin = rm -f $@ && $(AR.$(TOOLSET)) crsT $@ $(filter %.o,$^)

# Due to circular dependencies between libraries :(, we wrap the
# special "figure out circular dependencies" flags around the entire
# input list during linking.
quiet_cmd_link = LINK($(TOOLSET)) $@
cmd_link = $(LINK.$(TOOLSET)) -o $@ $(GYP_LDFLAGS) $(LDFLAGS.$(TOOLSET)) -Wl,--start-group $(LD_INPUTS) $(LIBS) -Wl,--end-group

# Note: this does not handle spaces in paths
define xargs
  $(1) $(word 1,$(2))
$(if $(word 2,$(2)),$(call xargs,$(1),$(wordlist 2,$(words $(2)),$(2))))
endef

define write-to-file
  @: >$(1)
$(call xargs,@printf "%s\n" >>$(1),$(2))
endef

OBJ_FILE_LIST := ar-file-list

define create_archive
        rm -f $(1) $(1).$(OBJ_FILE_LIST); mkdir -p `dirname $(1)`
        $(call write-to-file,$(1).$(OBJ_FILE_LIST),$(filter %.o,$(2)))
        $(AR.$(TOOLSET)) crs $(1) @$(1).$(OBJ_FILE_LIST)
endef

define create_thin_archive
        rm -f $(1) $(OBJ_FILE_LIST); mkdir -p `dirname $(1)`
        $(call write-to-file,$(1).$(OBJ_FILE_LIST),$(filter %.o,$(2)))
        $(AR.$(TOOLSET)) crsT $(1) @$(1).$(OBJ_FILE_LIST)
endef

# We support two kinds of shared objects (.so):
# 1) shared_library, which is just bundling together many dependent libraries
# into a link line.
# 2) loadable_module, which is generating a module intended for dlopen().
#
# They differ only slightly:
# In the former case, we want to package all dependent code into the .so.
# In the latter case, we want to package just the API exposed by the
# outermost module.
# This means shared_library uses --whole-archive, while loadable_module doesn't.
# (Note that --whole-archive is incompatible with the --start-group used in
# normal linking.)

# Other shared-object link notes:
# - Set SONAME to the library filename so our binaries don't reference
# the local, absolute paths used on the link command-line.
quiet_cmd_solink = SOLINK($(TOOLSET)) $@
cmd_solink = $(LINK.$(TOOLSET)) -o $@ -shared $(GYP_LDFLAGS) $(LDFLAGS.$(TOOLSET)) -Wl,-soname=$(@F) -Wl,--whole-archive $(LD_INPUTS) -Wl,--no-whole-archive $(LIBS)

quiet_cmd_solink_module = SOLINK_MODULE($(TOOLSET)) $@
cmd_solink_module = $(LINK.$(TOOLSET)) -o $@ -shared $(GYP_LDFLAGS) $(LDFLAGS.$(TOOLSET)) -Wl,-soname=$(@F) -Wl,--start-group $(filter-out FORCE_DO_CMD, $^) -Wl,--end-group $(LIBS)


# Define an escape_quotes function to escape single quotes.
# This allows us to handle quotes properly as long as we always use
# use single quotes and escape_quotes.
escape_quotes = $(subst ','\'',$(1))
# This comment is here just to include a ' to unconfuse syntax highlighting.
# Define an escape_vars function to escape '$' variable syntax.
# This allows us to read/write command lines with shell variables (e.g.
# $LD_LIBRARY_PATH), without triggering make substitution.
escape_vars = $(subst $$,$$$$,$(1))
# Helper that expands to a shell command to echo a string exactly as it is in
# make. This uses printf instead of echo because printf's behaviour with respect
# to escape sequences is more portable than echo's across different shells
# (e.g., dash, bash).
exact_echo = printf '%s\n' '$(call escape_quotes,$(1))'

# Helper to compare the command we're about to run against the command
# we logged the last time we ran the command.  Produces an empty
# string (false) when the commands match.
# Tricky point: Make has no string-equality test function.
# The kernel uses the following, but it seems like it would have false
# positives, where one string reordered its arguments.
#   arg_check = $(strip $(filter-out $(cmd_$(1)), $(cmd_$@)) \
#                       $(filter-out $(cmd_$@), $(cmd_$(1))))
# We instead substitute each for the empty string into the other, and
# say they're equal if both substitutions produce the empty string.
# .d files contain ? instead of spaces, take that into account.
command_changed = $(or $(subst $(cmd_$(1)),,$(cmd_$(call replace_spaces,$@))),\
                       $(subst $(cmd_$(call replace_spaces,$@)),,$(cmd_$(1))))

# Helper that is non-empty when a prerequisite changes.
# Normally make does this implicitly, but we force rules to always run
# so we can check their command lines.
#   $? -- new prerequisites
#   $| -- order-only dependencies
prereq_changed = $(filter-out FORCE_DO_CMD,$(filter-out $|,$?))

# Helper that executes all postbuilds until one fails.
define do_postbuilds
  @E=0;\
  for p in $(POSTBUILDS); do\
    eval $$p;\
    E=$$?;\
    if [ $$E -ne 0 ]; then\
      break;\
    fi;\
  done;\
  if [ $$E -ne 0 ]; then\
    rm -rf "$@";\
    exit $$E;\
  fi
endef

# do_cmd: run a command via the above cmd_foo names, if necessary.
# Should always run for a given target to handle command-line changes.
# Second argument, if non-zero, makes it do asm/C/C++ dependency munging.
# Third argument, if non-zero, makes it do POSTBUILDS processing.
# Note: We intentionally do NOT call dirx for depfile, since it contains ? for
# spaces already and dirx strips the ? characters.
define do_cmd
$(if $(or $(command_changed),$(prereq_changed)),
  @$(call exact_echo,  $($(quiet)cmd_$(1)))
  @mkdir -p "$(call dirx,$@)" "$(dir $(depfile))"
  $(if $(findstring flock,$(word 1,$(cmd_$1))),
    @$(cmd_$(1))
    @echo "  $(quiet_cmd_$(1)): Finished",
    @$(cmd_$(1))
  )
  @$(call exact_echo,$(call escape_vars,cmd_$(call replace_spaces,$@) := $(cmd_$(1)))) > $(depfile)
  @$(if $(2),$(fixup_dep))
  $(if $(and $(3), $(POSTBUILDS)),
    $(call do_postbuilds)
  )
)
endef

# Declare the "all" target first so it is the default,
# even though we don't have the deps yet.
.PHONY: all
all:

# make looks for ways to re-generate included makefiles, but in our case, we
# don't have a direct way. Explicitly telling make that it has nothing to do
# for them makes it go faster.
%.d: ;

# Use FORCE_DO_CMD to force a target to run.  Should be coupled with
# do_cmd.
.PHONY: FORCE_DO_CMD
FORCE_DO_CMD:

TOOLSET := target
# Suffix rules, putting all outputs into $(obj).
$(obj).$(TOOLSET)/%.o: $(srcdir)/%.c FORCE_DO_CMD
	@$(call do_cmd,cc,1)
$(obj).$(TOOLSET)/%.o: $(srcdir)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)
$(obj).$(TOOLSET)/%.o: $(srcdir)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)
$(obj).$(TOOLSET)/%.o: $(srcdir)/%.cxx FORCE_DO_CMD
	@$(call do_cmd,cxx,1)
$(obj).$(TOOLSET)/%.o: $(srcdir)/%.s FORCE_DO_CMD
	@$(call do_cmd,cc,1)
$(obj).$(TOOLSET)/%.o: $(srcdir)/%.S FORCE_DO_CMD
	@$(call do_cmd,cc,1)

# Try building from generated source, too.
$(obj).$(TOOLSET)/%.o: $(obj).$(TOOLSET)/%.c FORCE_DO_CMD
	@$(call do_cmd,cc,1)
$(obj).$(TOOLSET)/%.o: $(obj).$(TOOLSET)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)
$(obj).$(TOOLSET)/%.o: $(obj).$(TOOLSET)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)
$(obj).$(TOOLSET)/%.o: $(obj).$(TOOLSET)/%.cxx FORCE_DO_CMD
	@$(call do_cmd,cxx,1)
$(obj).$(TOOLSET)/%.o: $(obj).$(TOOLSET)/%.s FORCE_DO_CMD
	@$(call do_cmd,cc,1)
$(obj).$(TOOLSET)/%.o: $(obj).$(TOOLSET)/%.S FORCE_DO_CMD
	@$(call do_cmd,cc,1)

$(obj).$(TOOLSET)/%.o: $(obj)/%.c FORCE_DO_CMD
	@$(call do_cmd,cc,1)
$(obj).$(TOOLSET)/%.o: $(obj)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)
$(obj).$(TOOLSET)/%.o: $(obj)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)
$(obj).$(TOOLSET)/%.o: $(obj)/%.cxx FORCE_DO_CMD
	@$(call do_cmd,cxx,1)
$(obj).$(TOOLSET)/%.o: $(obj)/%.s FORCE_DO_CMD
	@$(call do_cmd,cc,1)
$(obj).$(TOOLSET)/%.o: $(obj)/%.S FORCE_DO_CMD
	@$(call do_cmd,cc,1)


ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,cctest.target.mk)))),)
  include cctest.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/ada/ada.target.mk)))),)
  include deps/ada/ada.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/base64/base64.target.mk)))),)
  include deps/base64/base64.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/base64/base64_avx.target.mk)))),)
  include deps/base64/base64_avx.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/base64/base64_avx2.target.mk)))),)
  include deps/base64/base64_avx2.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/base64/base64_avx512.target.mk)))),)
  include deps/base64/base64_avx512.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/base64/base64_neon32.target.mk)))),)
  include deps/base64/base64_neon32.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/base64/base64_neon64.target.mk)))),)
  include deps/base64/base64_neon64.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/base64/base64_sse41.target.mk)))),)
  include deps/base64/base64_sse41.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/base64/base64_sse42.target.mk)))),)
  include deps/base64/base64_sse42.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/base64/base64_ssse3.target.mk)))),)
  include deps/base64/base64_ssse3.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/brotli/brotli.target.mk)))),)
  include deps/brotli/brotli.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/cares/cares.target.mk)))),)
  include deps/cares/cares.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/googletest/gtest.target.mk)))),)
  include deps/googletest/gtest.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/googletest/gtest_main.target.mk)))),)
  include deps/googletest/gtest_main.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/googletest/gtest_prod.target.mk)))),)
  include deps/googletest/gtest_prod.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/histogram/histogram.target.mk)))),)
  include deps/histogram/histogram.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/llhttp/llhttp.target.mk)))),)
  include deps/llhttp/llhttp.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/nghttp2/nghttp2.target.mk)))),)
  include deps/nghttp2/nghttp2.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/ngtcp2/nghttp3.target.mk)))),)
  include deps/ngtcp2/nghttp3.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/ngtcp2/ngtcp2.target.mk)))),)
  include deps/ngtcp2/ngtcp2.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/openssl/openssl-cli.target.mk)))),)
  include deps/openssl/openssl-cli.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/openssl/openssl-fipsmodule.target.mk)))),)
  include deps/openssl/openssl-fipsmodule.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/openssl/openssl.target.mk)))),)
  include deps/openssl/openssl.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/simdjson/simdjson.target.mk)))),)
  include deps/simdjson/simdjson.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/simdutf/simdutf.target.mk)))),)
  include deps/simdutf/simdutf.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/uv/libuv.target.mk)))),)
  include deps/uv/libuv.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/uvwasi/uvwasi.target.mk)))),)
  include deps/uvwasi/uvwasi.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/zlib/zlib.target.mk)))),)
  include deps/zlib/zlib.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/zlib/zlib_adler32_simd.target.mk)))),)
  include deps/zlib/zlib_adler32_simd.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/zlib/zlib_arm_crc32.target.mk)))),)
  include deps/zlib/zlib_arm_crc32.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,deps/zlib/zlib_inflate_chunk_simd.target.mk)))),)
  include deps/zlib/zlib_inflate_chunk_simd.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,embedtest.target.mk)))),)
  include embedtest.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,fuzz_env.target.mk)))),)
  include fuzz_env.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,libnode.target.mk)))),)
  include libnode.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,node.target.mk)))),)
  include node.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,node_js2c.target.mk)))),)
  include node_js2c.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,node_mksnapshot.target.mk)))),)
  include node_mksnapshot.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,node_text_start.target.mk)))),)
  include node_text_start.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,overlapped-checker.target.mk)))),)
  include overlapped-checker.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/icu/genccode.target.mk)))),)
  include tools/icu/genccode.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/icu/genrb.target.mk)))),)
  include tools/icu/genrb.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/icu/icu_implementation.target.mk)))),)
  include tools/icu/icu_implementation.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/icu/icu_uconfig.target.mk)))),)
  include tools/icu/icu_uconfig.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/icu/icu_uconfig_target.target.mk)))),)
  include tools/icu/icu_uconfig_target.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/icu/icudata.target.mk)))),)
  include tools/icu/icudata.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/icu/icui18n.target.mk)))),)
  include tools/icu/icui18n.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/icu/iculslocs.target.mk)))),)
  include tools/icu/iculslocs.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/icu/icupkg.target.mk)))),)
  include tools/icu/icupkg.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/icu/icustubdata.target.mk)))),)
  include tools/icu/icustubdata.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/icu/icutools.target.mk)))),)
  include tools/icu/icutools.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/icu/icuuc.target.mk)))),)
  include tools/icu/icuuc.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/icu/icuucx.target.mk)))),)
  include tools/icu/icuucx.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/bytecode_builtins_list_generator.target.mk)))),)
  include tools/v8_gypfiles/bytecode_builtins_list_generator.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/cppgc_base.target.mk)))),)
  include tools/v8_gypfiles/cppgc_base.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/gen-regexp-special-case.target.mk)))),)
  include tools/v8_gypfiles/gen-regexp-special-case.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/generate_bytecode_builtins_list.target.mk)))),)
  include tools/v8_gypfiles/generate_bytecode_builtins_list.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/mksnapshot.target.mk)))),)
  include tools/v8_gypfiles/mksnapshot.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/postmortem-metadata.target.mk)))),)
  include tools/v8_gypfiles/postmortem-metadata.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/run_gen-regexp-special-case.target.mk)))),)
  include tools/v8_gypfiles/run_gen-regexp-special-case.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/run_torque.target.mk)))),)
  include tools/v8_gypfiles/run_torque.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/torque-language-server.target.mk)))),)
  include tools/v8_gypfiles/torque-language-server.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/torque.target.mk)))),)
  include tools/v8_gypfiles/torque.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/torque_base.target.mk)))),)
  include tools/v8_gypfiles/torque_base.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/torque_generated_definitions.target.mk)))),)
  include tools/v8_gypfiles/torque_generated_definitions.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/torque_generated_initializers.target.mk)))),)
  include tools/v8_gypfiles/torque_generated_initializers.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/torque_ls_base.target.mk)))),)
  include tools/v8_gypfiles/torque_ls_base.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/torque_runtime_support.target.mk)))),)
  include tools/v8_gypfiles/torque_runtime_support.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8.target.mk)))),)
  include tools/v8_gypfiles/v8.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_base.target.mk)))),)
  include tools/v8_gypfiles/v8_base.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_base_without_compiler.target.mk)))),)
  include tools/v8_gypfiles/v8_base_without_compiler.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_bigint.target.mk)))),)
  include tools/v8_gypfiles/v8_bigint.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_compiler.target.mk)))),)
  include tools/v8_gypfiles/v8_compiler.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_compiler_for_mksnapshot.target.mk)))),)
  include tools/v8_gypfiles/v8_compiler_for_mksnapshot.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_compiler_for_mksnapshot_source_set.target.mk)))),)
  include tools/v8_gypfiles/v8_compiler_for_mksnapshot_source_set.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_compiler_sources.target.mk)))),)
  include tools/v8_gypfiles/v8_compiler_sources.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_config_headers.target.mk)))),)
  include tools/v8_gypfiles/v8_config_headers.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_flags.target.mk)))),)
  include tools/v8_gypfiles/v8_flags.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_headers.target.mk)))),)
  include tools/v8_gypfiles/v8_headers.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_heap_base.target.mk)))),)
  include tools/v8_gypfiles/v8_heap_base.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_heap_base_headers.target.mk)))),)
  include tools/v8_gypfiles/v8_heap_base_headers.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_init.target.mk)))),)
  include tools/v8_gypfiles/v8_init.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_initializers.target.mk)))),)
  include tools/v8_gypfiles/v8_initializers.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_internal_headers.target.mk)))),)
  include tools/v8_gypfiles/v8_internal_headers.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_libbase.target.mk)))),)
  include tools/v8_gypfiles/v8_libbase.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_libplatform.target.mk)))),)
  include tools/v8_gypfiles/v8_libplatform.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_libsampler.target.mk)))),)
  include tools/v8_gypfiles/v8_libsampler.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_maybe_icu.target.mk)))),)
  include tools/v8_gypfiles/v8_maybe_icu.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_pch.target.mk)))),)
  include tools/v8_gypfiles/v8_pch.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_shared_internal_headers.target.mk)))),)
  include tools/v8_gypfiles/v8_shared_internal_headers.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_snapshot.target.mk)))),)
  include tools/v8_gypfiles/v8_snapshot.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_turboshaft.target.mk)))),)
  include tools/v8_gypfiles/v8_turboshaft.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_version.target.mk)))),)
  include tools/v8_gypfiles/v8_version.target.mk
endif
ifeq ($(strip $(foreach prefix,$(NO_LOAD),\
    $(findstring $(join ^,$(prefix)),\
                 $(join ^,tools/v8_gypfiles/v8_zlib.target.mk)))),)
  include tools/v8_gypfiles/v8_zlib.target.mk
endif

quiet_cmd_regen_makefile = ACTION Regenerating $@
cmd_regen_makefile = cd $(srcdir); ./configure -fmake --ignore-environment "-Dconfiguring_node=1" "-Dbuild_type=Release" "-Dpython=/usr/bin/python3.9" "-Dcomponent=static_library" "-Dlibrary=static_library" "--depth=/opt/ssd/jetson_rb_webengine/dev/engine_src_github" "-Goutput_dir=/opt/ssd/jetson_rb_webengine/dev/engine_src_github/out" "--generator-output=/opt/ssd/jetson_rb_webengine/dev/engine_src_github/out" -I/opt/ssd/jetson_rb_webengine/dev/engine_src_github/common.gypi -I/opt/ssd/jetson_rb_webengine/dev/engine_src_github/config.gypi "--toplevel-dir=/opt/ssd/jetson_rb_webengine/dev/engine_src_github" node.gyp
Makefile: $(srcdir)/deps/uvwasi/uvwasi.gyp $(srcdir)/deps/openssl/config/archs/VC-WIN64A/asm_avx2/openssl.gypi $(srcdir)/deps/openssl/config/archs/darwin64-arm64-cc/no-asm/openssl-fips.gypi $(srcdir)/tools/v8_gypfiles/v8.gyp $(srcdir)/node.gypi $(srcdir)/deps/openssl/config/archs/linux-elf/asm_avx2/openssl-fips.gypi $(srcdir)/src/inspector/node_inspector.gypi $(srcdir)/deps/openssl/openssl.gyp $(srcdir)/deps/openssl/config/archs/solaris64-x86_64-gcc/asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/linux-ppc64le/no-asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/linux-elf/no-asm/openssl.gypi $(srcdir)/deps/histogram/histogram.gyp $(srcdir)/deps/openssl/config/archs/linux64-riscv64/no-asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/linux-aarch64/asm_avx2/openssl.gypi $(srcdir)/deps/openssl/config/archs/VC-WIN64-ARM/no-asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/linux64-s390x/no-asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/linux-elf/no-asm/openssl-fips.gypi $(srcdir)/icu_config.gypi $(srcdir)/deps/openssl/config/archs/solaris-x86-gcc/no-asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/darwin64-x86_64-cc/no-asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/darwin64-arm64-cc/asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/darwin64-arm64-cc/asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/linux64-mips64/no-asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/linux-ppc64le/no-asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/VC-WIN32/no-asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/VC-WIN32/asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/VC-WIN32/asm_avx2/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/linux64-riscv64/no-asm/openssl-cl.gypi $(srcdir)/deps/simdjson/simdjson.gyp $(srcdir)/deps/openssl/config/archs/linux-aarch64/asm_avx2/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/linux-ppc64le/no-asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/darwin-i386-cc/asm_avx2/openssl.gypi $(srcdir)/deps/openssl/config/archs/darwin-i386-cc/no-asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/solaris64-x86_64-gcc/asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/VC-WIN32/asm_avx2/openssl.gypi $(srcdir)/deps/openssl/config/archs/linux-x86_64/no-asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/darwin-i386-cc/asm_avx2/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/darwin64-arm64-cc/asm_avx2/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/solaris64-x86_64-gcc/no-asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/solaris-x86-gcc/asm_avx2/openssl-fips.gypi $(srcdir)/config.gypi $(srcdir)/deps/uv/uv.gyp $(srcdir)/deps/openssl/config/archs/BSD-x86_64/asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/BSD-x86/no-asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/BSD-x86/asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/darwin-i386-cc/no-asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/linux64-mips64/asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/BSD-x86_64/no-asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/aix64-gcc-as/asm_avx2/openssl.gypi $(srcdir)/deps/openssl/config/archs/BSD-x86_64/no-asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/VC-WIN64-ARM/no-asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/darwin64-x86_64-cc/asm_avx2/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/darwin64-x86_64-cc/asm_avx2/openssl.gypi $(srcdir)/deps/openssl/openssl_asm_avx2.gypi $(srcdir)/deps/openssl/config/archs/darwin64-x86_64-cc/asm/openssl-cl.gypi $(srcdir)/deps/openssl/openssl-cl_asm.gypi $(srcdir)/deps/openssl/config/archs/solaris64-x86_64-gcc/asm_avx2/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/solaris-x86-gcc/no-asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/darwin64-arm64-cc/no-asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/aix64-gcc-as/asm_avx2/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/linux-elf/asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/linux-elf/no-asm/openssl-cl.gypi $(srcdir)/deps/cares/cares.gyp $(srcdir)/deps/openssl/config/archs/darwin64-x86_64-cc/asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/solaris-x86-gcc/no-asm/openssl.gypi $(srcdir)/common.gypi $(srcdir)/deps/openssl/config/archs/solaris-x86-gcc/asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/linux-elf/asm/openssl.gypi $(srcdir)/tools/v8_gypfiles/toolchain.gypi $(srcdir)/deps/openssl/config/archs/solaris64-x86_64-gcc/asm_avx2/openssl.gypi $(srcdir)/deps/openssl/config/archs/darwin-i386-cc/asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/linux-x86_64/asm/openssl-cl.gypi $(srcdir)/deps/nghttp2/nghttp2.gyp $(srcdir)/deps/openssl/config/archs/VC-WIN64-ARM/no-asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/linux64-s390x/asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/solaris64-x86_64-gcc/no-asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/BSD-x86/no-asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/linux-aarch64/asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/BSD-x86/asm_avx2/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/aix64-gcc-as/asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/linux64-loongarch64/no-asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/linux-ppc64le/asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/VC-WIN32/asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/linux64-mips64/no-asm/openssl.gypi $(srcdir)/deps/openssl/openssl-cl_no_asm.gypi $(srcdir)/deps/openssl/openssl_common.gypi $(srcdir)/deps/openssl/openssl_no_asm.gypi $(srcdir)/tools/icu/icu-generic.gyp $(srcdir)/deps/openssl/config/archs/linux64-mips64/no-asm/openssl-cl.gypi $(srcdir)/tools/v8_gypfiles/inspector.gypi $(srcdir)/deps/openssl/config/archs/VC-WIN64A/no-asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/solaris64-x86_64-gcc/asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/linux64-mips64/asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/VC-WIN64A/asm_avx2/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/linux-ppc64le/asm_avx2/openssl.gypi $(srcdir)/deps/openssl/config/archs/BSD-x86_64/no-asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/darwin64-arm64-cc/no-asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/linux-aarch64/asm/openssl-fips.gypi $(srcdir)/deps/simdutf/simdutf.gyp $(srcdir)/deps/openssl/config/archs/VC-WIN64A/no-asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/darwin-i386-cc/asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/darwin64-arm64-cc/asm_avx2/openssl.gypi $(srcdir)/deps/openssl/config/archs/darwin-i386-cc/no-asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/linux64-s390x/asm_avx2/openssl.gypi $(srcdir)/deps/openssl/config/archs/linux-x86_64/asm/openssl.gypi $(srcdir)/deps/zlib/zlib.gyp $(srcdir)/deps/ada/ada.gyp $(srcdir)/deps/openssl/config/archs/linux-x86_64/no-asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/darwin64-arm64-cc/asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/VC-WIN64A/asm/openssl.gypi $(srcdir)/deps/openssl/openssl-fips_no_asm.gypi $(srcdir)/deps/openssl/config/archs/linux64-s390x/no-asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/aix64-gcc-as/asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/solaris-x86-gcc/asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/linux64-s390x/asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/BSD-x86_64/asm_avx2/openssl.gypi $(srcdir)/deps/openssl/config/archs/linux-armv4/no-asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/linux-x86_64/asm_avx2/openssl.gypi $(srcdir)/deps/openssl/config/archs/linux64-s390x/asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/darwin64-x86_64-cc/no-asm/openssl.gypi $(srcdir)/deps/openssl/openssl-fips_asm_avx2.gypi $(srcdir)/deps/openssl/config/archs/BSD-x86_64/asm_avx2/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/linux-armv4/asm_avx2/openssl.gypi $(srcdir)/deps/openssl/config/archs/VC-WIN64A/asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/BSD-x86/asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/linux64-loongarch64/no-asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/linux-armv4/asm_avx2/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/linux-aarch64/no-asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/linux-aarch64/asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/VC-WIN64A/no-asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/aix64-gcc-as/no-asm/openssl-fips.gypi $(srcdir)/node.gyp $(srcdir)/deps/openssl/config/archs/linux-armv4/no-asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/linux-armv4/asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/VC-WIN64A/asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/linux-elf/asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/solaris-x86-gcc/asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/VC-WIN32/asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/linux-x86_64/no-asm/openssl-cl.gypi $(srcdir)/deps/brotli/brotli.gyp $(srcdir)/deps/openssl/config/archs/BSD-x86_64/asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/darwin64-x86_64-cc/asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/linux-elf/asm_avx2/openssl.gypi $(srcdir)/deps/openssl/config/archs/BSD-x86/asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/linux-ppc64le/asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/linux64-loongarch64/no-asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/linux-aarch64/no-asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/darwin-i386-cc/asm/openssl.gypi $(srcdir)/tools/v8_gypfiles/features.gypi $(srcdir)/deps/openssl/config/archs/solaris-x86-gcc/asm_avx2/openssl.gypi $(srcdir)/deps/openssl/config/archs/aix64-gcc-as/no-asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/BSD-x86_64/asm/openssl-fips.gypi $(srcdir)/deps/base64/base64.gyp $(srcdir)/deps/openssl/config/archs/linux-ppc64le/asm_avx2/openssl-fips.gypi $(srcdir)/deps/ngtcp2/ngtcp2.gyp $(srcdir)/deps/openssl/config/archs/aix64-gcc-as/no-asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/solaris64-x86_64-gcc/no-asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/BSD-x86/asm_avx2/openssl.gypi $(srcdir)/deps/openssl/config/archs/linux-x86_64/asm/openssl-fips.gypi $(srcdir)/deps/openssl/openssl-fips_asm.gypi $(srcdir)/deps/openssl/config/archs/linux64-mips64/asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/linux-aarch64/no-asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/linux64-s390x/asm_avx2/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/linux-armv4/asm/openssl-fips.gypi $(srcdir)/deps/llhttp/llhttp.gyp $(srcdir)/deps/openssl/config/archs/BSD-x86/no-asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/VC-WIN32/no-asm/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/linux-armv4/no-asm/openssl.gypi $(srcdir)/deps/openssl/config/archs/linux64-s390x/no-asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/darwin64-x86_64-cc/no-asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/linux-x86_64/asm_avx2/openssl-fips.gypi $(srcdir)/deps/openssl/config/archs/aix64-gcc-as/asm/openssl-fips.gypi $(srcdir)/deps/openssl/openssl_asm.gypi $(srcdir)/deps/openssl/config/archs/linux-ppc64le/asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/VC-WIN32/no-asm/openssl-cl.gypi $(srcdir)/deps/openssl/config/archs/linux-armv4/asm/openssl.gypi $(srcdir)/deps/googletest/googletest.gyp $(srcdir)/deps/openssl/config/archs/linux64-riscv64/no-asm/openssl.gypi
	$(call do_cmd,regen_makefile)

# "all" is a concatenation of the "all" targets from all the included
# sub-makefiles. This is just here to clarify.
all:

# Add in dependency-tracking rules.  $(all_deps) is the list of every single
# target in our tree. Only consider the ones with .d (dependency) info:
d_files := $(wildcard $(foreach f,$(all_deps),$(depsdir)/$(f).d))
ifneq ($(d_files),)
  include $(d_files)
endif
