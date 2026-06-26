DESTDIR=
PREFIX=/usr/local
BINDIR=$(PREFIX)/bin
MANDIR=$(PREFIX)/share/man

all: README

README: slackfetch.1
	man ./$< | col -bx > $@

install:
	mkdir -p $(DESTDIR)$(BINDIR)
	mkdir -p $(DESTDIR)$(MANDIR)/man1
	install -m0755 slackfetch $(DESTDIR)$(BINDIR)
	install -m0644 slackfetch.1 $(DESTDIR)$(MANDIR)/man1

clean:
	rm -f README

.PHONY: all install clean
