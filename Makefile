pkgname = osx-xdg-basedir
include xdgbasedir.mk

agentdir ?= $(prefix)/LaunchAgents# ~/Library/LaunchAgents
envdir ?= $(datarootdir)/MacOSX# ~/Library/Application Support/MacOSX
oldenvdir ?= $(PREFIX)/.MacOSX# ~/.MacOSX
modereadonly ?= 444# ugo=r
moderwdir ?= 755# u=rwx,go=rx
makefilesdir ?= $(prefix)/Makefiles# ~/Library/Makefiles

INSTALL ?= install -bCpSv -m $(modereadonly)
INSTALL_DIR ?= install -d -v -m $(moderwdir)

# First target is the default target which will be invoked when typing `make`.
all: print-help
install: install-agent-xdg install-makefile-xdg

install-agent-xdg: org.freedesktop.xdg.basedir.plist $(agentdir)/
	$(INSTALL) $< $(agentdir)/

install-makefile-xdg: xdgbasedir.mk $(makefilesdir)/
	$(INSTALL) $< $(makefilesdir)/

$(makefilesdir)/:
	$(INSTALL_DIR) $@

$(agentdir)/:
	$(INSTALL_DIR) $@

print-help:
	@echo "Run 'make install' to install to '~'" 

