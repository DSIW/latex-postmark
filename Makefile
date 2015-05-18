CONTENTDIR=.
COMPILEDIR=tmp
LATEX=pdflatex
CFLAGS=-file-line-error --shell-escape -interaction=nonstopmode -output-directory $(COMPILEDIR) # -- nonstopmode | batchmode
SCRIPT=letter
PDFVIEWER=evince

COMPILE=-$(LATEX) $(CFLAGS) $(SCRIPT).tex # ignoring return -ne 0

all: stamped_pdf

stamped_pdf: pdf
	./stamp.sh example_postmark.pdf

pdf: $(SCRIPT).pdf

$(SCRIPT).pdf: $(SCRIPT).tex $(COMPILEDIR)
	$(COMPILE)
	mv $(COMPILEDIR)/$(SCRIPT).pdf $(COMPILEDIR)/..

view: $(COMPILEDIR)/$(SCRIPT).pdf
	$(PDFVIEWER) $(COMPILEDIR)/$(SCRIPT).pdf

$(COMPILEDIR):
	mkdir -p $(COMPILEDIR)

cleanall: clean
	-rm letter.pdf
	-rm letter-stamped.pdf

clean:
	-rm -rf $(COMPILEDIR)

sizeopt:
	pdfsizeopt $(COMPILEDIR)/$(SCRIPT).pdf
	mv $(COMPILEDIR)/$(SCRIPT).psom.pdf $(COMPILEDIR)/$(SCRIPT).pdf

.PHONY: clean cleanall view sizeopt
