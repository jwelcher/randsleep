###
## Basic Makefile for randsleep
###

SHELL   = /bin/sh
CC      = gcc
RM      = /bin/rm
CWD     = `pwd`

TARGET          = randsleep
SOURCES         = randsleep.c
COMMON          =
#HEADERS        = $(shell echo include/*.h)
HEADERS         =
OBJECTS         = $(SOURCES:.c=.o) a.out

#CFLAGS         = -pedantic -Wall -Wextra -march=native -ggdb3
FLAGS           =
CFLAGS          = 
DEBUGFLAGS      = -O0 -D _DEBUG
RELEASEFLAGS    = -O2 -D NDEBUG -combine -fwhole-program

PREFIX          = $(DESTDIR)/usr/local
BINDIR          = $(PREFIX)/bin
INSTALL_PROGRAM = install

all: $(TARGET)

$(TARGET): $(OBJECTS) $(COMMON)
        $(CC) $(FLAGS) $(CFLAGS) $(DEBUGFLAGS) -o $(TARGET) $(OBJECTS)

release: $(SOURCES) $(HEADERS) $(COMMON)
        $(CC) $(FLAGS) $(CFLAGS) $(RELEASEFLAGS) -o $(TARGET) $(SOURCES)

profile: CFLAGS += -pg
profile: $(TARGET)

install: release
        $(INSTALL_PROGRAM) $(TARGET) $(BINDIR)/$(TARGET)

install-strip: release
        $(INSTALL_PROGRAM) -s $(TARGET) $(BINDIR)/$(TARGET)

uninstall:
        $(RM) $(BINDIR)/$(TARGET)

clean:
        $(RM) -f $(OBJECTS)

distclean: clean
        $(RM) -f $(TARGET)
