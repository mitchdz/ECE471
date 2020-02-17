CC = gcc
CFLAGS = -g -Wall

all: bin/createKeys bin/generate128BitKeyFromEpoch

bin/createKeys: src/createKeys.c
	gcc $< -o $@

bin/generate128BitKeyFromEpoch: src/myGenerate128bitKey.c
	gcc $< -o $@


clean:
	rm bin/*
