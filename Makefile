PDF=build/main.pdf
SRC=src/main.tex

all: $(PDF)

$(PDF): $(SRC)
	latexmk -pdf -output-directory=build $(SRC)

clean:
	latexmk -C -output-directory=build

distclean: clean
	rm -rf build
