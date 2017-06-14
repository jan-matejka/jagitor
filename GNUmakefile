.DEFAULT_GOAL := build
CXX       ?= c++
CRAMOPTS  ?= --shell=/usr/bin/zsh
CRAM_ROOT ?= cram
CRAM_PATH ?= $(CRAM_ROOT)

PREFIX   ?= /usr/local
LIBDIR   ?= $(DESTDIR)$(PREFIX)/lib
BINDIR   ?= $(DESTDIR)$(PREFIX)/bin
MANDIR   ?= $(DESTDIR)$(PREFIX)/man/man1

BROOTDIR   = _build
BLIBDIR    = $(BROOTDIR)/lib
BBINDIR    = $(BROOTDIR)/bin
BMANDIR    = $(BROOTDIR)/man/man1

DIRS = $(BLIBDIR) $(BBINDIR)

CMDS     = $(patsubst src/jagitor/%.sh,%,$(shell echo src/jagitor/*))
GIT_CMDS = $(patsubst src/git/%.sh,%,$(shell echo src/git/*))
MANS     = $(patsubst Documentation/%.rst,%.1,$(shell echo Documentation/{jagitor,git-jg}*))

BUILD_DEPS  =
BUILD_DEPS += $(BMANDIR)
BUILD_DEPS += $(BBINDIR)/jagitor
BUILD_DEPS += $(addprefix $(BBINDIR)/jagitor-,$(CMDS))
BUILD_DEPS += $(addprefix $(BBINDIR)/git-,$(GIT_CMDS))
BUILD_DEPS += $(addprefix $(BMANDIR)/,$(MANS))

INSTALL_DEPS += $(MANDIR)
INSTALL_DEPS += $(BINDIR)/jagitor
INSTALL_DEPS += $(addprefix $(BINDIR)/jagitor-,$(CMDS))
INSTALL_DEPS += $(addprefix $(MANDIR)/,$(MANS))

.PHONY: build
build: $(BUILD_DEPS)

$(BBINDIR)/jagitor-%: src/jagitor/%.sh

	install -m755 -D $< $@

$(BBINDIR)/git-%: src/git/%.sh

	install -m755 -D $< $@

$(BBINDIR)/jagitor: src/jagitor.sh

	install -m755 -D $< $@

$(BMANDIR):

	install -d $@

$(BMANDIR)/%.1: Documentation/%.rst

	rst2man $< $@

.PHONY: install
install: $(INSTALL_DEPS)

$(BINDIR)/%:

	install -m755 $(BBINDIR)/$(@F) $(BINDIR)

$(MANDIR):

	install -d $@

$(MANDIR)/%: $(BMANDIR)/%

	install -m644 $< $@

.PHONY: clean
clean:

	$(RM) -r $(BROOTDIR) $(CRAM_ROOT)/*.t.err

.PHONY: check
check: build

	cram $(CRAMOPTS) $(CRAM_PATH)
