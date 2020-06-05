### Lesson 5 - Pattern Rules  
+ Note that there is still some repetition in the makefile. Each `.dat` rule
follows the same format: To build `[something].dat` (target), find a file named
`books/[something].txt` (dependency) and run `countwords.py [dependency] [target]`.  
+ This repetition can be fixed using a Make *Wildcard* and a single *pattern
rule*.
+ `%` is a Make wildcard. Can be used for pattern matching!  
+ `$*` is a Make automatic variable. It gets replaced by the stem with which
the pattern rule matched (obviously, using a wildcard).  

Hence, each of the `.dat` rules can now be rewritten to one single rule.
```make
%.dat : books/%.txt countwords.py
	python countwords.py $< $*.dat
```
+ Note that a more natural solution to the previous line would be to use `$@`
instead of `$*.dat`!
+ Note that the `%` wildcard can only be used in a target/dependency and not in
the action itself. You need to use `$*` instead, which replaces itself with the
stem of the pattern matched.  

____

The makefile now looks like this.

```make
# Generate summary table.
results.txt : testzipf.py isles.dat abyss.dat last.dat
	python $< *.dat > $@

# Count words.
.PHONY : dats
dats : isles.dat abyss.dat last.dat

%.dat : books/%.txt countwords.py
	python countwords.py $< $@

.PHONY : clean
clean :
	rm -f *.dat
	rm -f results.txt
```
