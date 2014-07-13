#!/usr/bin/gnuplot
#
# Plotting boxes with color given by a palette
#
# AUTHOR: Hagen Wierstorf
# gnuplot 4.6 patchlevel 3

reset

# wxt
set terminal wxt size 350,131 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,131 enhanced font 'Verdana,10'
#set output 'boxes-58585.png'

unset key
unset colorbox

set palette defined (1 '#9ECAE1',2 '#4292C6',3 '#084594' )

# Axes
set style line 11 lc rgb '#808080' lt 1
set border 1 front ls 11
unset tics
set xtics 1
set xtics nomirror out scale 0.75

set yrange [0:1]
set xrange [0.5:4.5]

set boxwidth 0.75
set style fill solid 0.7 border
plot 'data-58585.txt' u 1:2:3 w boxes lc palette
