MODULES = my_convert
EXTENSION = my_convert
DATA = my_convert--1.0.sql
PGFILEDESC = "Convert data between different character sets"
REGRESS = my_convert
EXTRA_INSTALL = contrib/hstore

ifdef USE_PGXS
PG_CONFIG = PG_CONFIG
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
PG_CPPFLAGS = -I$(top_srcdir)/contrib
subdir = contrib/my_convert
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif