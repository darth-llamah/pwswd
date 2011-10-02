BINARY:=pwswd

OBJS:=event_listener.o shortcut_handler.o main.o
OBJS += backend/brightness/brightness.o
OBJS += backend/volume/volume.o
OBJS += backend/poweroff/poweroff.o
OBJS += backend/reboot/reboot.o
OBJS += backend/screenshot/screenshot.o
OBJS += backend/suspend/suspend.o
OBJS += backend/kill/kill.o


CROSS_COMPILE:=arm-linux-
CC:=$(CROSS_COMPILE)gcc


CFLAGS:=-Wall -O2
INCLUDES:=
LDFLAGS:=-s
LIBS:=-lasound -lpng


.PHONY: all clean

all: $(BINARY)

$(BINARY): $(OBJS)
	$(CC) $(addprefix -Wl,,$(LDFLAGS)) -o $@ $(OBJS) $(LIBS)

$(OBJS): %.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ -c $<

clean:
	rm -f $(BINARY) $(OBJS)
