#!/usr/bin/gnuplot
#
# Plotting a color map using the default gnuplot palette
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'default_color_palette2.png'

unset key

# border
set style line 11 lc rgb '#808080' lt 1
set border 3 front ls 11
set tics nomirror out scale 0.75

set xrange [0:59]
set yrange [0:59]
set xlabel 'x (µm)'
set ylabel 'y (µm)'

# disable colorbar tics
set cbtics scale 0

plot 'matlab_colormap.txt' u ($1/3.0):($2/3.0):($3/1000.0) matrix with image
