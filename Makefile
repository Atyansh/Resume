# Builds resume.pdf with Tectonic, a self-contained XeTeX engine that fetches
# the LaTeX packages it needs on first run (`brew install tectonic`). The
# fonts are bundled in fonts/.
TEX_SOURCES := $(wildcard *.tex) awesome-cv.cls fontawesome.sty

default: resume.pdf

resume.pdf: $(TEX_SOURCES) $(wildcard fonts/*) $(wildcard images/*)
	tectonic -X compile resume.tex

# Copies the built PDF into the website repo (served at atyansh.com/resume.pdf).
# Commit it there as well.
WEBSITE ?= ../atyansh-website
publish: resume.pdf
	cp resume.pdf $(WEBSITE)/public/resume.pdf

clean:
	rm -rf *.aux *.log *.out *.xdv

.PHONY: default publish clean
