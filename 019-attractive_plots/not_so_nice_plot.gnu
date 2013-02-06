#!/usr/bin/gnuplot
#
# Ugly default Gnuplot output 
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 410,308 enhanced font 'Verdana,9' persist
# png
#set terminal pngcairo size 410,308 enhanced font 'Verdana,9'
#set output 'not_so_nice_plot.png'

set key bottom right
set xlabel 'x axis label'
set ylabel 'y axis label'
set xrange [0:1]
set yrange [0:1]
plot 'nice_web_plot.dat' u 1:2 t 'Example line' w lp ls 1, \
     ''                  u 1:3 t 'Another example' w lp ls 2
