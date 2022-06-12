TEX := $(shell ls *.tex)
FOLDER = /home/saul/Insync/sauld@cimat.mx/Google\ Drive/UNISON/Ponencias/2022/xxxii-semana-unison-2022/AppliedMathWorkshop
OTHER = *~ *.aux *.dvi *.toc *.bbl *.blg *.out *.thm *.ps *.idx *.ilg *.ind *.tdo *.pdf *.tar.gz *.log *.spl *.synctex.gz
LATEX	= latex
BIBTEX	= bibtex
MAKEINDEX = makeindex
XDVI	= xdvi -gamma 4
DVIPS	= dvips
DVIPDF  = dvipdft
L2H	= latex2html
GH	= gv
FILES = *.tex *.sty *.bbl *.bib *.pdf Makefile  
FOLDERS = \assets 
NAMETAR1 := $(shell date '+%Y%b%d_%H_%M')
NAMETAR = "$(NAMETAR1)_Beamer_xxxii_semana_unison_AMW.tar.gz"
NAMEZIP = "$(NAMETAR1)_Beamer_xxxii_semana_unison_AMW.zip"
#main.aux
pdflatex:main.tex
	/usr/local/texlive/2022/bin/x86_64-linux/pdflatex --synctex=1 main.tex
	sh biblio.sh
	/usr/local/texlive/2022/bin/x86_64-linux/bibtex main.aux
	/usr/local/texlive/2022/bin/x86_64-linux/pdflatex --synctex=1 main.tex
	/usr/local/texlive/2022/bin/x86_64-linux/pdflatex --synctex=1 main.tex

clean:
	rm -f $(OTHER) 

tar: $(FILES)
	tar -cvf $(NAMETAR) $(FOLDER)

zip: $(FILES)
	zip -r $(NAMEZIP) $(FOLDER)
