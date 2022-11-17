SHELL := /bin/bash

TASKS = $(wildcard tasks/*)

$(TASKS): venv/bin/activate
	source $< && $(MAKE) -C $@

venv/bin/activate: requirements.txt
	if [ ! -f $@ ]; then virtualenv venv; fi
	source $@ && pip install -r $<
	touch $@

cleanup:
	$(MAKE) cleanup -C $(TASKS)