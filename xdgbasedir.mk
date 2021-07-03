UNAME_S := $(shell uname -s)

ifeq ($(shell id -u), 0)
PREFIX ?= /usr/local
prefix ?= $(PREFIX)
sysconfdir ?= $(prefix)/etc # TODO
else # not-root

PREFIX ?= ~

ifeq ($(UNAME_S), Darwin)
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
else # not-Darwin

prefix ?= $(PREFIX)/.local
XDG_DATA_HOME ?= $(PREFIX)/share
XDG_CONFIG_HOME ?= $(PREFIX)/.config
#XDG_STATE_HOME ?= 
#XDG_RUNTIME_DIR ?= 
#exec_prefix ?= $(PREFIX)

endif # -Darwin

datarootdir ?= $(XDG_DATA_HOME)
sysconfdir ?= $(XDG_CONFIG_HOME)

endif # -root

exec_prefix ?= $(prefix)
datarootdir ?= $(prefix)/share
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
