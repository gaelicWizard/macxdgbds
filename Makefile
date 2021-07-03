pkgname = osx-xdg-basedir
include xdgbasedir.mk

agentdir ?= $(prefix)/LaunchAgents# ~/Library/LaunchAgents
envdir ?= $(datarootdir)/MacOSX# ~/Library/Application Support/MacOSX
oldenvdir ?= $(PREFIX)/.MacOSX# ~/.MacOSX
modereadonly ?= 444 # ugo=r
makefilesdir ?= $(prefix)/Makefiles# ~/Library/Makefiles

INSTALL ?= install -bCpSv -m $(modereadonly)
INSTALL_DIR ?= install -d -v -m 755

# First target is the default target which will be invoked when typing `make`.
all: print-help
install: install-agent-xdg install-makefile-xdg

install-agent-xdg: org.freedesktop.xdg.basedir.plist $(agentdir)/
	$(INSTALL) org.freedesktop.xdg.basedir.plist $(agentdir)/

install-makefile-xdg: xdgbasedir.mk $(makefilesdir)/
	$(INSTALL) xdgbasedir.mk $(makefilesdir)/

$(makefilesdir)/:
	$(INSTALL_DIR) $(makefilesdir)

$(agentdir)/:
	$(INSTALL_DIR) $(agentdir)

print-help:
	@echo "Run 'make install' to install to '~'" 

