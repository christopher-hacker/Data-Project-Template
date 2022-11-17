# data-project-template

This is my template repo for data journalism projects. It is heavily based on [Datamade's guidelines](https://github.com/datamade/data-making-guidelines) and Patrick Ball's [The Task Is A Quantum Of Workflow](https://hrdag.org/2016/06/14/the-task-is-a-quantum-of-workflow/).

## Task structure
This approach is based on the idea that better structure leads to more reproducible data analyses. It achieves that by splitting the project into separate tasks.

Each task is contained in its own directory, each with `input/`, `output/` and `src/` directories. Files in `input/` are read-only and come eitiher from previous tasks or from the [`frozen/`](/frozen) directory. `frozen/` contains raw data in its original format data, which is kept under version control so any changes are tracked. Output files from one task are then symlinked to the input files of the next.

Each folder in this template repo has a README in it explaining more about what that directory does. 

For more on this system and a pretty good explanation of how Make works, read [Datamade's guide](https://github.com/datamade/data-making-guidelines/blob/master/README.md).