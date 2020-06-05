### Lesson 6 - Variables  
+ Note that the makefile still has repeated content. `python` and the source
file names `countwords.py`, `testzipf.py` have to be edited on a per-case basis
if they must be changed.
+ Can use a Make *variable/macro* to hold these names:  
```make
COUNT_SRC=countwords.py
LANGUAGE=python
```
+ `$(var)` is used to replace the value of variable `var` within a rule. It is
a variable *reference*.  
+ Where is it useful? I might want to change `python` to `python3` and I would
not have to edit every single instance.

Complementing variables is the use of config files. Config files can simply
hold variable definitions (among other things) where they can easily be found
and modified. For this tutorial, we can use `config.mk`:

```make
# Count words script.
LANGUAGE=python
COUNT_SRC=countwords.py
COUNT_EXE=$(LANGUAGE) $(COUNT_SRC)

# Test Zipf's rule
ZIPF_SRC=testzipf.py
ZIPF_EXE=$(LANGUAGE) $(ZIPF_SRC)
```

We can then import `config.mk` into the Makefile using `import config.mk`.

____

At the end of this lesson, we have two files - a Makefile and its associated
`config.mk` file.

Makefile:
```make
include config.mk

# Generate summary table.
results.txt : $(ZIPF_SRC) isles.dat abyss.dat last.dat
	$(ZIPF_EXE) *.dat > $@

# Count words.
.PHONY : dats
dats : isles.dat abyss.dat last.dat

%.dat : books/%.txt $(COUNT_SRC)
	$(COUNT_EXE) $< $@

.PHONY : clean
clean :
	rm -f *.dat
	rm -f results.txt
```

`config.mk`:
```make
# Count words script.
LANGUAGE=python
COUNT_SRC=countwords.py
COUNT_EXE=$(LANGUAGE) $(COUNT_SRC)

# Test Zipf's rule
ZIPF_SRC=testzipf.py
ZIPF_EXE=$(LANGUAGE) $(ZIPF_SRC)
```
