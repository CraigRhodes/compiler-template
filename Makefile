.PHONY: default build clean test all
default: build

build:
	make -C NewLanguage

test:
	make -C Test

clean:
	rm -rf .build

all: clean default
