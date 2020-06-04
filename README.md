## Make tutorial  
GNU Make tutorial for my personal use. All examples and notes based off of
[swcarpentry's tutorial](https://swcarpentry.github.io/make-novice). Notes have been
taken in passing and for the most part, have been lifted verbatim from the
source. Not claiming IP!  
### Make  
#### What is Make?  
GNU Make is a tool which can run commands to read files, process these files in
some way, and write out the processed files. It is a *build* tool - tracking
the dependencies between the files it creates and the files used to create
these.  
A more esoteric description would be that Make traverses an acyclic directed
graph of dependencies in building specified targets with customized rules, and
performs necessary tasks if any dependency has been updated more recently than
the corresponding target has.  
#### Why learn Make?  
Make can be used in implementing reproducible research workflows, automating
data analysis, and combining text with figures to produce reports.
Furthermore, the fundamental concepts of Make are common across many contemporary
build tools.
### Tutorial  
To not risk running this README too long, my main notes can be found in this
[Tutorial](Tutorial.md) file.
