### Lesson 9 - Summary  

+ Makefiles save time by automating repetitive work, and save thinking by
documenting how to reproduce results.  

#### Intro  
+ `#` denote comments in Makefiles.  
+ Write rules as `<targets> : <dependencies>`  
+ Specify update actions in a tab-indented block under the rule.  
+ Use `.PHONY` to mark targets that don't correspond to files.  

#### Automatic Variables  
+ Use `$@` to refer to the target of the current rule.  
+ Use `$^` to refer to all the dependencies of the current rule.  
+ Use `$<` to refer to the first dependency of the current rule.  

#### Dependencies  
+ Note that Make results depend on both input data and source code!  
+ Dependencies are transitive (directed acyclic graph).  

#### Patterns  
+ Use the wildcard `%` as a placeholder in targets and dependencies.  
+ Use the special variable `$*` to refer to matching sets of files in actions.
`$*` replaces the stem of the matched wildcard from earlier in the rule.  

#### Variables  
+ Define variables by assigning values to names.  
+ Reference variables using `$(...)`.  

#### Functions  
+ Make is actually a small programming language with many [in-built functions](https://www.gnu.org/software/make/manual/html_node/Functions.html).  
+ Use `wildcard` function to get lists of files matching a pattern.  
+ Use `patsubst` function to rewrite file names.  
