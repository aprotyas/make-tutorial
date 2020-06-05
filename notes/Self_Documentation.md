### Lesson 8 - Self Documentation (optional)  
In this lesson, `sed` (stream editor) is used in a rule to output help
documentation from Makefile comments.

In doing so, we must distinguish regular commennts from documentation comments.
As such, all documentation comments are prependend with `##` rather than `#`.
The rule used to perform the documentation is as follows:
```make
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<
```
The rule depends on the Makefile itself. It runs `sed` on the first dependency
(Makefile), searches for all lines beginning with `##`, and prints them out.
Hence, with `make help`, we get:
```
 results.txt : Generate Zipf summary table.
 dats        : Count words in text files.
 clean       : Remove auto-generated files.
 variables   : Print variables.
```

