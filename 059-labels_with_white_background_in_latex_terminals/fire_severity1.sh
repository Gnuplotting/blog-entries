#!/bin/bash
FILE=fire_severity1
gnuplot ${FILE}.gnu
gnuplot ${FILE}_small.gnu
pdflatex ${FILE}.tex
pdflatex ${FILE}_small.tex
rm ${FILE}-inc.pdf ${FILE}.tex ${FILE}.log ${FILE}.aux
rm ${FILE}_small-inc.pdf ${FILE}_small.tex ${FILE}_small.log ${FILE}_small.aux
