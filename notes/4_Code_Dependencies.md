### Lesson 4 - Code Dependencies  
+ The output produced in such processes is a product of both the input data and
the script used. As such, the code used for a certain rule should also be listed
as a dependency.  
+ To perform a *dry run*, use `make -n`. This outputs the commands Make would
run on a regular run without actually running them. Good for debugging.  
+ Note that in the example used for this tutorial, we do not have to list
`countwords.py` as a dependency for `results.txt`, even though it technically is.
This is because `countwords.py` has already been listed as a dependency for
each of the `.dat` files being generated. Since the `.dat` files are
dependencies for `results.txt`, a change in `countwords.py` triggers the entire
pipeline of Make anyway.  
+ Dependencies are transitive: if A depends on B and B depends on C, a change
to C will indirectly trigger an update to A.  

____

After this lesson, our makefile looks as follows.
```make
# Generate summary table.
results.txt : testzipf.py isles.dat abyss.dat last.dat
	python $< *.dat > $@

# Count words.
.PHONY : dats
dats : isles.dat abyss.dat last.dat

isles.dat : books/isles.txt countwords.py
	python countwords.py $< $@

abyss.dat : books/abyss.txt countwords.py
	python countwords.py $< $@

last.dat : books/last.txt countwords.py
	python countwords.py $< $@

.PHONY : clean
clean :
	rm -f *.dat
	rm -f results.txt
```
