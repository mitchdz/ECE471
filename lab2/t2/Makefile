CC = gcc
CFLAGS = -g -Wall

SRC_DIR := ./src
SRC_FILES := $(wildcard $(SRC_DIR)/*.c)

OUT_FILES := bin/gen bin/brute

all: ${OUT_FILES}

bin/gen: src/genKeys.c
	gcc $< -o $@

bin/brute: src/bruteForce.c
	gcc $< -o $@

brute: all
	./bin/brute

run: all
	./bin/gen | tee out/keys.csv


clean:
	rm bin/*
