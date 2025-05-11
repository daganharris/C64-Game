ifeq ($(OS),Windows_NT)
    IS_WINDOWS := 1
    CC = oscar64.exe
    CFLAGS = -O3 -tm=c64 -tf=prg -rmp
    SRC = src\main.c
    OUT = build\main.prg
    VICE = "C:\Program Files\VICE\bin\x64sc.exe"
    MKDIR = if not exist build mkdir build
    RM = del /Q build\*
    SLASH = \

else
    IS_WINDOWS := 0
    CC = /home/dagantgh/oscar64-1.31.260/bin/oscar64
    CFLAGS = -O3 -tm=c64 -tf=prg
    SRC = src/main.c
    OUT = build/main.prg
    VICE = flatpak run --branch=stable --arch=x86_64 --command=x64sc net.sf.VICE
    MKDIR = mkdir -p build
    RM = rm -f build/*
    SLASH = /
endif

all: run

build:
	$(MKDIR)

$(OUT): $(SRC) | build
	$(CC) $(CFLAGS) -o=$(OUT) $(SRC)

run: $(OUT)
	$(VICE) --autostart $(OUT)

clean:
	$(RM)
