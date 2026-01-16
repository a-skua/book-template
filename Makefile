SRC := $(shell find ./src)
OUTPUT := $(shell find . -name '*.pdf' -or -name '*.aux' -or -name '*.log' -or -name '*.out' -or -name '*.toc')

.PHONY: all
all: example.pdf printable/book_gray.pdf

example.pdf: book.pdf METADATA.txt
	pdftk $< update_info_utf8 $(word 2, $^) output $@

printable/%_gray.pdf: printable/%.pdf
	gs -sOutputFile=$@ \
		-dEmbedAllFonts=true -dSubsetFonts=true \
		-sDEVICE=pdfwrite -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray -dCompatibilityLevel=1.4 -dNOPAUSE -dBATCH $<

printable/%.pdf: %.tex $(SRC)
	@mkdir -p printable
	lualatex --interaction=batchmode --output-directory=$(dir $@) --draftmode --shell-escape "\def\showTrimmarks{} \input{$<}"
	lualatex --interaction=batchmode --output-directory=$(dir $@) --shell-escape "\def\showTrimmarks{} \input{$<}"

%.pdf: %.tex $(SRC)
	lualatex --interaction=batchmode --draftmode --shell-escape $<
	lualatex --interaction=batchmode --shell-escape $<

.PHONY: clean
clean:
	@rm -rf $(OUTPUT)

# e.g. make preview TEX=src/chapter1.tex
.PHONY: preview
preview:
	@mkdir -p preview
	lualatex --interaction=batchmode --shell-escape --output-directory=preview --jobname=$(notdir $(TEX)) "\input{src/_config}\begin{document}\input{$(TEX)}\end{document}"
