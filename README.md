# Methodology Report

This repository stores the midterm report for the Smart Canteen AR project.

## Structure

- `src/` contains the LaTeX source files.
- `images/` holds all figure assets referenced by the document.
- `build/` is created when compiling the PDF and is ignored in version control.

## Building

Run `make` to compile `src/main.tex` with `latexmk`. The resulting PDF
`build/main.pdf` will be generated if a full \LaTeX{} environment is available.
