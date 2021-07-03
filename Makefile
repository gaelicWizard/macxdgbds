pkgname = org.freedesktop.xdg.basedir# $Id$
include xdgbasedir.mk# ~/Library/Makefiles

laxdg ?= $(agentdir)/$(pkgname).plist

agentdir ?= $(prefix)/LaunchAgents# ~/Library/LaunchAgents
envdir ?= $(datarootdir)/MacOSX# ~/Library/Application Support/MacOSX
oldenvdir ?= $(PREFIX)/.MacOSX# ~/.MacOSX
makefilesdir ?= $(prefix)/Makefiles# ~/Library/Makefiles

moderobin ?= 555# ugo=rx
moderodata ?= 444# ugo=r
moderw ?= 755# u=rwx,go=rx

INSTALL_BIN ?= install -bCpSv -m $(modeobin)
INSTALL_DATA ?= install -bCpSv -m $(moderodata)
INSTALL_DIR ?= install -d -v -m $(moderw)

GIT ?= /usr/bin/git

# First target is the default target which will be invoked when typing `make`.
all: print-help #autoinstall

autoinstall: $(GIT)
# clone to $TMPDIR/$pkgname then `make -C $TMPDIR/$pkgname install`...

git-pull: $(GIT)
	@$(GIT) pull

install: $(laxdg) install-makefile-xdg

$(laxdg): $(pkgname).plist |$(agentdir)/
	$(INSTALL_DATA) $< $@
	launchctl unload $@
	launchctl load -w $@

install-makefile-xdg: xdgbasedir.mk Darwin.xdg.mk |$(makefilesdir)/
	$(INSTALL_DATA) $^ $(makefilesdir)/

$(makefilesdir)/:
	$(INSTALL_DIR) $@

$(agentdir)/:
	$(INSTALL_DIR) $@

print-help:
	@echo "Run 'make install' to install to '~'" 

