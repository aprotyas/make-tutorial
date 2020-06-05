### Lesson 3 - Automatic Variables  
Make essentially provides a programming language, and as such we should try to
limit repetition in the code. To avoid repeating code, we can make use of
*Automatic Variables*.

+ `$@` is a Make automatic variable which means 'the target of the current rule'.
+ `$^` is a Make automatic variable which means 'all the dependencies of the
current rule'.
Hence, the rule that used to be:
```make
results.txt : isles.dat abyss.dat last.dat
	python testzipf.py abyss.dat isles.dat last.dat > results.txt
```
Can now be written as:
```make
results.txt : isles.dat abyss.dat last.dat
	python testzipf.py $^ > $@
```
+ `$<` is a Make automatic variable which means 'the first dependency of the
current rule'.
Hence, the rule that used to be:
```make
isles.dat : books/isles.txt
	python countwords.py books/isles.txt isles.dat
```
Can now be written as:
```make
isles.dat : books/isles.txt
	python countwords.py $< $@
```
