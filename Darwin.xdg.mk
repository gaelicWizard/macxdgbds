# osx-xdg-basedir $Id$
PREFIX ?= ~

prefix ?= $(PREFIX)/Library
exec_prefix ?= $(PREFIX)
bindir ?= $(exec_prefix)/Tools
XDG_DATA_HOME ?= $(prefix)/Application\ Support
XDG_CONFIG_HOME ?= $(prefix)/Preferences
XDG_STATE_HOME ?= $(XDG_DATA_HOME)
XDG_RUNTIME_DIR ?= $(TMPDIR)
docrootdir ?= $(prefix)/Documentation
mandir ?= $(docrootdir)/man
infodir ?= $(docrootdir)/info
includerootdir ?= $(prefix)/Headers
librootdir ?= $(prefix)/Libraries
sbindir ?= $(bindir)/Admin
libexecdir ?= $(prefix)/Bundles/$(pkgname)

datarootdir ?= $(XDG_DATA_HOME)
sysconfdir ?= $(XDG_CONFIG_HOME)

libdir ?= $(librootdir)/$(pkgname)
datadir ?= $(datarootdir)/$(pkgname)
includedir ?= $(includerootdir)/$(pkgname)
docdir ?= $(docrootdir)/$(pkgname)
#
#sharedstatedir ?= $(prefix)/com
#localstatedir ?= $(prefix)/var
#runstatedir ?= $(localstatedir)/run
#
oldincludedir ?= /usr/include
