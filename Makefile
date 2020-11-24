SRCDIR = Source
OBJDIR = Objects
OUTDIR = Out
SHAREDLIB = libNuklear.a
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	SHAREDLIBPATH = /usr/lib
endif
ifeq ($(UNAME_S),Darwin)
	SHAREDLIBPATH = /usr/local/lib
endif

all: $(SHAREDLIB)

$(SHAREDLIB): libNuklear.o Out
	libtool -static $(OBJDIR)/libNuklear.o -o $(OUTDIR)/$(SHAREDLIB)
	cp $(OUTDIR)/$(SHAREDLIB) $(SHAREDLIBPATH)

libNuklear.o: $(SRCDIR)/libNuklear.c Objects
	clang -c $(SRCDIR)/libNuklear.c -o $(OBJDIR)/libNuklear.o

Out: Objects
	mkdir -p $(OUTDIR)

Objects:
	mkdir -p $(OBJDIR)

clean:
	-rm -rf $(OUTDIR) $(OBJDIR)
	-rm -f $(SHAREDLIBPATH)/$(SHAREDLIB)