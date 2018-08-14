include config.mk

all:
	@echo -e "Nothing to make. Use \`[sudo] \033[32mmake install\033[0m\` to install."

install: binaries manpages
	@echo -e "Installed. Use \`[sudo] \033[32mmake uninstall\033[0m\` to remove the package."

uninstall:
	-@rm  $(BINDIR)/wpmstats.awk        \
	      $(BINDIR)/wpmtable.awk        \
	      $(MANDIR)/man1/wpmstats.1.gz  \
	      $(MANDIR)/man1/wpmtable.1.gz  >/dev/null 2>/dev/null
	@echo -en " → Files removed successfully.\n → Building man database..."
	@mandb 2>/dev/null >/dev/null
	@echo " done"

binaries: $(BINDIR)/wpmstats.awk $(BINDIR)/wpmtable.awk
	@echo " → Binaries installed"

manpages: $(MANDIR)/man1/wpmstats.1.gz $(MANDIR)/man1/wpmtable.1.gz
	@echo " → Man pages installed"
	@echo -n " → Building man database..."
	@mandb >/dev/null 2>/dev/null
	@echo " done"

$(BINDIR)/wpmstats.awk: wpmstats.awk
	@cp $< $@ >/dev/null 2>/dev/null

$(BINDIR)/wpmtable.awk: wpmtable.awk
	@cp $< $@ >/dev/null 2>/dev/null

$(MANDIR)/man1/wpmstats.1.gz: wpmstats.1
	@gzip <$< >$@

$(MANDIR)/man1/wpmtable.1.gz: wpmtable.1
	@gzip <$< >$@
