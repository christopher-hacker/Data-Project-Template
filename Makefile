SHELL := /bin/bash

# makes the absolute path of the src/ directory of the
# project available to makefiles, so they can use project
# scripts as prerequisites
DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
export SRC_DIR := $(DIR)/src

.PHONY: \
	all \
	$(TASKS) \
	setup \
	cleanup-all \
	git-lfs

# uncomment this if you use the recursive task structure. if
# left commented, the "make" command will just run the installation
# all: $(TASKS)
# TASKS := $(sort $(wildcard tasks/*))
# $(TASKS):
#	$(MAKE) -C $@

setup: \
	.venv/bin/python \
	os-dependencies.log \
	git-lfs

# by default, uses git lfs for pretty much any data file
# see .gitattributes for more.
git-lfs:
	git lfs install
	git lfs pull

# os-dependencies.log is a file that contains the output of
# installing a list of packages that I commonly use and want to
# always be installed on my vm
os-dependencies.log: apt.txt
	sudo apt-get install -y $$(cat $<) > $@

.venv/bin/python: pyproject.toml poetry.toml
	poetry install

cleanup-all:
	find tasks -type f -path "*\output/*" -delete
	# add commands to cleanup any folders 
