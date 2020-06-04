### Lesson 1 - Intro  
+ Lines starting with `#` are comments.
+ A *target* is a file to be created.
+ A *dependency* is a file needed to build or update a target. Targets may have
zero or more dependencies.
+ An *action* is a command to build or update the target using its dependencies.
For example: `python countwords.py books/isles.txt isles.dat` is an action.
+ A *rule* consists of a target, its dependencies, and the associated action.
+ A *tab* (NOT a space) needs to begin the line succeeding the targets and
dependencies. The action goes in this line.

_____

At the end of this chapter, we did not actually have a working makefile.
Rather, we realized that these multi-step build pipelines involving multiple
files can quickly get out of hand. As illustrated in this example shell script.

```bash
#!/bin/sh

# USAGE: bash run_pipeline.sh
# to produce plots for isles and abyss
# and the summary table for the Zipf's law tests

python countwords.py books/isles.txt isles.dat
python countwords.py books/abyss.txt abyss.dat

python plotcounts.py isles.dat isles.png
python plotcounts.py abyss.dat abyss.png

# Generate summary table
python testzipf.py abyss.dat isles.dat > results.txt
```
