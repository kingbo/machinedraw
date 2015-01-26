LATEX = xelatex
MAKEINDEX=makeindex

SOURCEFILE = autocad.tex
INDEXFILE = autocad.idx
CLEANFILES = *.fmt *.aux *.log _*.prv *.out *.nav *.snm *.dvi *.toc *.lof *.idx *.lot
TARGET = $(SOURCEFILE:.tex=.pdf)

.PHONY: all
all:$(TARGET) clean

$(TARGET):
        $(LATEX) -interaction=nonstopmode $(SOURCEFILE)
		$(MAKEINDEX) $(INDEXFILE)
        $(LATEX) -interaction=nonstopmode $(SOURCEFILE)

.PHONY: clean
clean:
        rm -rf $(CLEANFILES)

.PHONY: distclean
distclean:
        rm -rf $(CLEANFILES) $(TARGET)