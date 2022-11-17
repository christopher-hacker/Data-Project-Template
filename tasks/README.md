# Tasks

The `tasks` folder contains all tasks that must run in the pipeline.

Each subfolder should contain one task that runs a single time, or subtasks that each run a single time and don't relate to one another (e.g. data transformations for multiple data datasets). Each task folder should use the following naming convention: 

> [task number]-[task description]

This keeps the tasks in the correct order so you don't have to explicitly tell `make` in which order to run things (as long as you're using GNU make >= 4.3). 

For example, the tasks folder structure might look like this: 

```
tasks/
├── 1-extract-data/
│   ├── Makefile
│   ├── input/
│   └── output/
├── 2-clean-data
|   ├── Makefile
|   ├── dataset1-subtask/
|   │   ├── Makefile
|   │   ├── input/
|   │   └── output/
|   └── datset2-subtask/
|       ├── Makefile
|       ├── input/
|       └── output/
└── 3-merge-data/
    ├── Makefile
    ├── input/
    └── output/
```