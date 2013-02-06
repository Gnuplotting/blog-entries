#!/usr/bin/gnuplot
#
# Colored tics with the epslatex terminal
#
# AUTHOR: Hagen Wierstorf

reset

# epslatex
set terminal epslatex size 10.4cm,6.35cm color colortext standalone 'phv,9' \
header '\definecolor{t}{rgb}{0.5,0.5,0.5}'
set output 'epslatex_correct.tex'

# define axis
# remove border on top and right and set color to gray
set style line 11 lc rgb '#808080' lt 1
set border 3 front ls 11
set tics nomirror
# define grid
set style line 12 lc rgb'#808080' lt 0 lw 1
set grid back ls 12

# color definitions
set style line 1 lc rgb '#8b1a0e' pt 1 ps 1.5 lt 1 lw 5 # --- red
set style line 2 lc rgb '#5e9c36' pt 6 ps 1.5 lt 1 lw 5 # --- green

set key bottom right

set format '\color{t}$%g$'
set xlabel 'x axis label'
set ylabel 'y axis label'
set xrange [0:1]
set yrange [0:1]

plot 'nice_web_plot.dat' u 1:2 t 'Example line' w lp ls 1, \
     ''                  u 1:3 t 'Another example' w lp ls 2
