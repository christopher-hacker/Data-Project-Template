SHELL := /bin/bash

BUILD_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
export PROCESSOR_DIR := $(BUILD_DIR)/processors

TASKS := $(wildcard tasks/*)

.PHONY: all $(TASKS)

all: $(TASKS)

$(TASKS):
	$(MAKE) -C $@

venv/bin/activate: requirements.txt
	if [ ! -f $@ ]; then virtualenv venv; fi
	source $@ && pip install -r $<
	touch $@

cleanup-all:
	find tasks -type f -path "*\output/*" -delete