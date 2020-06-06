include config.mk

## all        : Generate all outputs (results.txt and plots)
.PHONY : all
all : $(ZIPF_ARCHIVE)

$(ZIPF_ARCHIVE) : $(ZIPF_DIR)
	tar -czf $@ $^

$(ZIPF_DIR) : Makefile config.mk $(RESULTS_FILE) \
							$(DAT_FILES) $(PNG_FILES) $(TXT_DIR) \
							$(SRC_FILES)
	mkdir -p $@
	cp -r $^ $@
	touch $@

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
	rm -f $(RESULTS_FILE)
	rm -rf $(ZIPF_DIR)
	rm -f $(ZIPF_ARCHIVE)

## variables  : Print variables.
.PHONY : variables
variables:
	@echo TXT_DIR     :    $(TXT_DIR)
	@echo TXT_FILES   :    $(TXT_FILES)
	@echo DAT_FILES   :    $(DAT_FILES)
	@echo PNG_FILES   :    $(PNG_FILES)
	@echo SRC_FILES   :    $(SRC_FILES)
	@echo ZIPF_DIR    :    $(ZIPF_DIR)
	@echo ZIPF_ARCHIVE:    $(ZIPF_ARCHIVE)

.PHONE : help
help: Makefile
	@sed -n 's/^##//p' $<
