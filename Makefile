TEXNAME=Calculus-Text

export TEXINPUTS=.:../styles:

all: $(TEXNAME).pdf

print-cover: print-cover.pdf

print-cover: print-cover.pdf
print-cover.dvi: $(TEXNAME).tex
	latex --jobname print-cover $<
	latex --jobname print-cover $<
	latex --jobname print-cover $<
	
print-cover-lulu: print-cover-lulu.pdf
print-cover-lulu.dvi: $(TEXNAME).tex
	latex --jobname print-cover-lulu $<
	latex --jobname print-cover-lulu $<
	latex --jobname print-cover-lulu $<

interior: interior.pdf
interior.dvi: $(TEXNAME).tex
	latex --jobname interior $<
	latex --jobname interior $<
	latex --jobname interior $<

%.dvi : %.tex
	latex $<
	latex $<
	latex $<

%.ps : %.dvi
	dvips -o $*.ps $< 

%.pdf : %.ps
	ps2pdf -r300 -dPDFSETTINGS=/printer -dColorConversionStrategy=/LeaveColorUnchanged -dGrayImageResolution=300 -dColorImageResolution=300 $<


# Intermediate and target files that Latex will output
suffixes := .dvi .ps .pdf .out .log .toc .aux .bbl .blg .tps .glo .ist .acn

rmfiles := $(foreach f,$(suffixes),$(TEXNAME)$(f))

.PHONY: clean
clean:
	rm -f $(foreach f,$(suffixes),$(TEXNAME)$(f)) solutions/*.tex interior.*
	rm -f $(foreach f,$(suffixes),$(EXNAME)$(f))
	rm -f $(foreach f,$(suffixes),print-cover$(f))
	rm -f $(foreach f,$(suffixes),print-cover-lulu$(f))
	rm -f ex.te