PDF_OUT := dist/paper.pdf

watch: init
	typst watch main.typ $(PDF_OUT)

compile: init
	typst compile main.typ $(PDF_OUT)

init:
	mkdir -p dist
