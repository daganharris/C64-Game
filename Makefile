CC = oscar64.exe
CFLAGS = -O3 -tm=c64 -tf=prg
SRC = src\main.c
OUT = build\main.prg

all:
	$(CC) $(CFLAGS) $(SRC) -o=$(OUT)

clean:
	del .\build\*