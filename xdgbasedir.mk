# osx-xdg-basedir $Id$
UNAME_S ?= $(shell uname -s)
UNAME_S != uname -s

sinclude $(UNAME_S).xdg.mk
