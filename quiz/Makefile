include config.mk

## all        : Generate all outputs (results.txt and plots)
.PHONY : all
all : results.txt pngs

## results.txt: Generate Zipf summary table.
results.txt : $(ZIPF_SRC) $(DAT_FILES) 
	$(ZIPF_EXE) $(DAT_FILES) > $@

## dats       : Count words in text files.
.PHONY : dats
dats : $(DAT_FILES) 

%.dat : books/%.txt $(COUNT_SRC)
	$(COUNT_EXE) $< $@

## pngs       : Plot word counts.
.PHONY : pngs
pngs : $(PNG_FILES)

%.png : %.dat $(PLOT_SRC)
	$(PLOT_EXE) $< $@

## clean      : Remove auto-generated files.
.PHONY : clean
clean:
	rm -f $(DAT_FILES) 
	rm -f $(PNG_FILES)
	rm -f results.txt

## variables  : Print variables.
.PHONY : variables
variables:
	@echo TXT_FILES: $(TXT_FILES)
	@echo DAT_FILES: $(DAT_FILES)
	@echo PNG_FILES: $(PNG_FILES)

.PHONE : help
help: Makefile
	@sed -n 's/^##//p' $<
