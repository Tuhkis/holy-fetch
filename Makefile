HC = hc2c
CC = gcc

CFLAGS = -O3
LIBS = -lm

all: src/*.HC
	cp src/*.h bin/
	$(HC) src/main.HC bin/main.c
	$(CC) bin/main.c -o bin/holy-fetch $(LIBS)
