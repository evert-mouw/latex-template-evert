#!/bin/sh

# The "-src-specials" argument is only useful when you want
# integration between your source editor and your DVI viewer,
# like going to the right page in Yap

# remove all temporary files
./clean.sh

# first run detects citation needs
xelatex -interaction=nonstopmode index.tex

# bibliography
bibtex index

# second run fills in references and detects cross-references
xelatex -interaction=nonstopmode index.tex

# third run finally resolved cross-references also
#xelatex -interaction=nonstopmode index.tex

# fourth run if you need backreferences
#xelatex -interaction=nonstopmode index
