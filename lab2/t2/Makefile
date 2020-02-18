CC = gcc
CFLAGS = -g -Wall

SRC_DIR := ./src
SRC_FILES := $(wildcard $(SRC_DIR)/*.c)

OUT_FILES := bin/createKeys bin/generate128BitKeyFromEpoch bin/bruteForce

all: ${OUT_FILES}

bin/createKeys: src/createKeys.c
	gcc $< -o $@

bin/generate128BitKeyFromEpoch: src/myGenerate128bitKey.c
	gcc $< -o $@

bin/bruteForce: src/bruteForce.c
	gcc $< -o $@

run: all
	./run.sh

bruteForce:
	./bruteForce

clean:
	rm bin/*
