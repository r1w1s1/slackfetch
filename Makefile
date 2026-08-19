DESTDIR=
PREFIX=/usr/local
BINDIR=$(PREFIX)/bin
MANDIR=$(PREFIX)/share/man

all:

install:
	mkdir -p $(DESTDIR)$(BINDIR)
	mkdir -p $(DESTDIR)$(MANDIR)/man1
	install -m0755 slackfetch $(DESTDIR)$(BINDIR)
	install -m0644 slackfetch.1 $(DESTDIR)$(MANDIR)/man1

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/slackfetch
	rm -f $(DESTDIR)$(MANDIR)/man1/slackfetch.1

clean:
	rm -f README

.PHONY: all install uninstall clean
