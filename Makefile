CC = gcc
LIBS = -lpam

FILES = pam_cgm.so
RM = rm -rf
FLAGS = -fPIC -shared

all: pam_cgm.so

NIH_CFLAGS = 
NIH_DBUS_CFLAGS = -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include 
CGMANAGER_CFLAGS = -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include 
CGMANAGER_LIBS = -lcgmanager
NIH_DBUS_LIBS = -lnih-dbus -ldbus-1 
NIH_LIBS = -lnih 
ALL_LIBS = $(DBUS_LIBS) $(NIH_LIBS) $(NIH_DBUS_LIBS) $(CGMANAGER_LIBS)
ALL_CFLAGS = -Wall -ggdb -D_GNU_SOURCE $(DBUS_CFLAGS) $(NIH_CFLAGS) \
	$(NIH_DBUS_CFLAGS) $(CGMANAGER_CFLAGS)

pam_cgm.so: pam_cgm.c cgmanager.c cgmanager.h
	$(CC) $(FLAGS) $(ALL_CFLAGS) -o pam_cgm.so pam_cgm.c cgmanager.c $(LIBS) $(ALL_LIBS)

install: pam_cgm.so
	install -m 0755 pam_cgm.so $(DESTDIR)/lib/security

clean:
	$(RM) $(FILES)
