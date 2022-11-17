SHELL := /bin/bash

TASKS = $(wildcard tasks/*)

.PHONY: all $(TASKS)

all: $(TASKS)

$(TASKS):
	$(MAKE) -C $@

venv/bin/activate: requirements.txt
	if [ ! -f $@ ]; then virtualenv venv; fi
	source $@ && pip install -r $<
	touch $@

cleanup:
	find tasks -type f -path "*\output/*" -delete