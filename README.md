# data-project-template

This is my template repo for data journalism projects. It is heavily based on [Datamade's guidelines](https://github.com/datamade/data-making-guidelines) and Patrick Ball's [The Task Is A Quantum Of Workflow](https://hrdag.org/2016/06/14/the-task-is-a-quantum-of-workflow/).

## Task structure
This approach is based on the idea that better structure leads to more reproducible data analyses. It achieves that by splitting the project into separate tasks.

Each task is contained in its own directory, each with `input/`, `output/` and `src/` directories. Files in `input/` are read-only and come eitiher from previous tasks or from the [`frozen/`](/frozen) directory. `frozen/` contains raw data in its original format data, which is kept under version control so any changes are tracked. Output files from one task are then symlinked to the input files of the next.

Each folder in this template repo has a README in it explaining more about what that directory does. 

For more on this system and a pretty good explanation of how Make works, read [Datamade's guide](https://github.com/datamade/data-making-guidelines/blob/master/README.md).

## Additional folders
I frequently use additional folders to store files that are not used in this template repo. 

They are: 
- `scripts`: contains any scripts, usually bash scripts, that help develop and maintain the pipeline, e.g. a script that helps quickly inspect unique values in raw data files or a script that symlinks files from one task to another.
- `shared/src`: any scripts that are not processors and that are used across multiple files live here and are symlinked to the appropriate directory
- `shared/bin`: any binary files that are used across multiple tasks live here and are symlinked to the appropriate directory
- `documents`: contains any text documents that are not part of the pipeline, e.g. pdf documents containing data definitions or documentation for data files used in the pipeline
