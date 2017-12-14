@echo off
rem creates a pdf from the latex sources
rem be sure that the xelatex and bibtex binaries are
rem in your PATH environment variable

rem Delete old version
del index.pdf

rem first run detects citation needs
xelatex -interaction=nonstopmode index

rem bibliography
bibtex8 index

rem second run fills in references and detects cross-references
xelatex -interaction=nonstopmode index

rem third run finally resolved cross-references also
xelatex -interaction=nonstopmode index

rem fourth run if you need backreferences
xelatex -interaction=nonstopmode index

rem uncomment the line below if you want to check log files
REM pause

rem Cleaning up...
del *.aux
del *.bbl
rem del *.log
del *.out
del *.blg
del *.lot
del *.lof
del *.toc
del *.tmp
del *.ent
del *.mtc
del *.mtc0
del *.lnk
del *.brf
del *.maf
del *.tdo

rem showtime
start index.pdf
