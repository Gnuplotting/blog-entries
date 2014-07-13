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
#set output 'sweep-66590.png'

# color definitions
set border linewidth 1.5

unset key
unset colorbox

# Axes
set style line 11 lc rgb '#808080' lt 1
set border 1 back ls 11
set xtics nomirror out scale 0.75
unset ytics

set xrange [0:1]
set yrange [-0.8:0.8]
set xlabel 'x / t' offset 0,0.5

set palette defined (1 'blue', 2 'red' )
f(x) = 0.5*exp(-x**2)*cos(15*x)
plot '+' u 1:(f($1)):1 w l lc palette lw 2
