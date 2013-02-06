#!/usr/bin/gnuplot
#
# Plotting a sweep with color coding of the frequencies
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'sweep.png'

# color definitions
set border linewidth 1.5

unset key
unset colorbox

# start value for H
h1 = 117/360.0
# end value for H
h2 = 227/360.0
# creating the palette (its the same as the above defined one)
set palette model HSV functions (1-gray)*(h2-h1)+h1,1,0.68
# Axes
set style line 11 lc rgb '#808080' lt 1
set border 1 back ls 11
set xtics nomirror out scale 0.75
unset ytics

set xrange [0:1]
set yrange [-1.2:1]
set cbrange [0:100]
set xlabel 'x / t' offset 0,0.5

plot 'logarithmic_sweep.txt' u 1:2:3 w l lc palette 
