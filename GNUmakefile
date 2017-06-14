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

CMDS = $(patsubst src/jagitor/%.sh,%,$(shell echo src/jagitor/*))
MANS = $(patsubst Documentation/%.rst,%.1,$(shell echo Documentation/jagitor*))

.PHONY: build
build:  $(BMANDIR) $(BBINDIR)/jagitor $(addprefix $(BBINDIR)/jagitor-,$(CMDS)) $(addprefix $(BMANDIR)/,$(MANS))

$(BBINDIR)/jagitor-%: src/jagitor/%.sh

	install -m755 -D $< $@

$(BBINDIR)/jagitor: src/jagitor.sh

	install -m755 -D $< $@

$(BMANDIR):

	install -d $@

$(BMANDIR)/%.1: Documentation/%.rst

	rst2man $< $@

.PHONY: install
install: $(MANDIR) $(BINDIR)/jagitor $(addprefix $(BINDIR)/jagitor-,$(CMDS)) $(addprefix $(MANDIR)/,$(MANS))

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
