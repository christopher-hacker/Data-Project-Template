SHELL := /bin/bash

# DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
# export PROCESSOR_DIR := $(DIR)/processors

# TASKS := $(sort $(wildcard tasks/*))
# all: $(TASKS)

# $(TASKS):
#	$(MAKE) -C $@

setup: \
	venv/bin/activate \
	os-dependencies.log \
	git-lfs

git-lfs:
	git lfs install
	git lfs pull

os-dependencies.log: apt.txt
	sudo apt-get install -y $$(cat $<) > $@

venv/bin/activate: requirements.txt
	if [ ! -f $@ ]; then virtualenv venv; fi
	source $@ && pip install -r $<
	touch $@

cleanup-all:
	find tasks -type f -path "*\output/*" -delete
