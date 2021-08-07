# osx-xdg-basedir $Id$
UNAME_S ?= $(shell uname -s)
UNAME_S != uname -s
#
PREFIX ?= ~
#
sinclude $(UNAME_S).xdg.mk
#

prefix ?= $(PREFIX)/.local# ~/Library
XDG_DATA_HOME ?= $(prefix)/share# ~/Library/Application\ Support
XDG_CONFIG_HOME ?= $(PREFIX)/.config# ~/Library/Preferences
XDG_STATE_HOME ?= $(PREFIX)/.savedState# ~/Library/Saved\ Application\ State
#XDG_RUNTIME_DIR ?= $TMPDIR

datarootdir ?= $(XDG_DATA_HOME)
sysconfdir ?= $(XDG_CONFIG_HOME)

exec_prefix ?= $(prefix)
includerootdir ?= $(prefix)/include
docrootdir ?= $(datarootdir)/doc
librootdir ?= $(exec_prefix)/lib

bindir ?= $(exec_prefix)/bin
libdir ?= $(librootdir)/$(pkgname)
datadir ?= $(datarootdir)/$(pkgname)
includedir ?= $(includerootdir)/$(pkgname)
docdir ?= $(docrootdir)/$(pkgname)
infodir ?= $(datarootdir)/info
mandir ?= $(datarootdir)/man
#man1dir ?= $(mandir)/man1
#
#sharedstatedir ?= $(prefix)/com
#localstatedir ?= $(prefix)/var
#runstatedir ?= $(localstatedir)/run
#
oldincludedir ?= /usr/include
