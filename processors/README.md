# Processors

The `processors` folder contains scripts that are used during tasks in the [`tasks`](/tasks/) folder.

Each processor should accept input from `STDIN` and print outputs to `STDOUT` so they can be chained together in your makefiles.

## Using processors in tasks

To reference a processor in a task Makefile, use the `include` directive, which imports variables from one makefile into another: 

```make
include ../../Makefile # or whatever the relative path to the root Makefile is
```

The root Makefile exports a variable called PROCESSOR_DIR, which is the absolute path to the `processors/` folder.

You can use it to call a processor like so: 

```make
include ../../../Makefile

output/testoutput.csv: $(PROCESSOR_DIR)/script.py
    python $< > $@
```