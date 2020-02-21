CC = gcc
CFLAGS = -g -Wall

SRC_DIR := ./src
SRC_FILES := $(wildcard $(SRC_DIR)/*.c)

OUT_FILES := bin/gen

all: ${OUT_FILES}

bin/gen: src/genKeys.c
	gcc $< -o $@

bin/brute: src/bruteForce.c
	gcc $< -o $@

brute: all
	python3 pythonBrute.py | tee out.txt

createKeys: all
	./bin/gen | tee out/keys.csv

run: createKeys brute

clean:
	rm bin/*
