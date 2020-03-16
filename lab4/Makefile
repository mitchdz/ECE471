CC = gcc
CFLAGS = -g -Wall

SRC_DIR := ./src
SRC_FILES := $(wildcard $(SRC_DIR)/*.c)

OUT_FILES := bin/flow

all: directories ${OUT_FILES}

directories:
	mkdir -p bin

bin/flow: src/flow.c
	gcc $< -o $@ -lcrypto

run: all
	./bin/flow

clean:
	rm bin/*
