CC = oscar64.exe
CFLAGS = -O3 -tm=c64 -tf=prg
SRC = src\main.c
OUT = build\main.prg
VICE = "C:\Program Files\GTK3VICE-3.9-win64\bin\x64sc.exe"

all:
	if not exist build mkdir build
	$(CC) $(CFLAGS) $(SRC) -o=$(OUT)
	$(VICE) --autostart $(OUT)

clean:
	del .\build\*