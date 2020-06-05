LANGUAGE=python
COUNT_SRC=src/countwords.py
COUNT_EXE=$(LANGUAGE) $(COUNT_SRC)
PLOT_SRC=src/plotcounts.py
PLOT_EXE=$(LANGUAGE) $(PLOT_SRC)
ZIPF_SRC=src/testzipf.py
ZIPF_EXE=$(LANGUAGE) $(ZIPF_SRC)
TXT_FILES=$(wildcard books/*.txt)
DAT_FILES=$(patsubst books/%.txt, %.dat, $(TXT_FILES))
PNG_FILES=$(patsubst books/%.txt, %.png, $(TXT_FILES))
