pdf:
	mkdir -p build
	@TEXINPUTS=.//: pdflatex -synctex=1 -interaction=nonstopmode -output-directory build --shell-escape paper
all:
	mkdir -p build
	@TEXINPUTS=.//: pdflatex -synctex=1 -interaction=nonstopmode -output-directory build --shell-escape paper
	bibtex build/paper
	pdflatex -synctex=1 -interaction=nonstopmode -output-directory build paper
	pdflatex -synctex=1 -interaction=nonstopmode -output-directory build paper
fig:
	rm figures/cache/*
	pdflatex -interaction=nonstopmode -output-directory build --shell-escape paper
clean:
	rm -rf build
	find . -type f \( -name '*.aux' -or -name  '*.auxlock' -or -name '*.figlist' -or -name '*eps-converted-to.pdf' -or -name '*.bbl' -or -name '*.fdb_latexmk' -or -name '*.synctex.gz' -or -name '*.blg' -or -name '*.log' -or -name '*.out' -or -name '*.toc' -or -name '*.lot' -or -name '*.lof' -or -name '*.loa' -or -name '*.fls' \) -exec rm -f '{}' \;
	find . -type f \( -name 'paper.pdf' \) -exec rm -f '{}' \;
edit:
	subl paper.sublime-project
