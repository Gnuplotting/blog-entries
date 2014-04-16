#!/usr/bin/gnuplot
#
# Plot a historgram from a one dimensional data array
# compare: http://stackoverflow.com/questions/2471884/histogram-using-gnuplot
#
# AUTHOR: Hagen Wierstorf
# gnuplot 4.6 patchlevel 0

reset
set macros

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'histogram1.png'

# colors
set style line 1 lt 1 lc rgb '#FB9A99' # light red
set style line 2 lt 1 lc rgb '#A6CEE3' # light blue

unset key

# axes
set style line 11 lc rgb '#808080' lt 1
set border 3 front ls 11
set tics nomirror out scale 0.75
# grid
set style line 12 lc rgb'#808080' lt 0 lw 1
set grid back ls 12
set grid xtics ytics mxtics



set xrange [-100:100]
set yrange [0:27]
set xlabel 'angle' offset 0,0.5
set ylabel 'number of occurence' offset 1,0
set format x '%g°'
set xtics 45
set mxtics 2

set label 'first distribution' at -50,23 center front tc ls 11
set arrow from -51,21 to -16,14 nohead front ls 11
set label 'second distribution' at 70,13 center front tc ls 11
set arrow from 70,11 to 42,6.4 nohead front ls 11

# call histogram function
binwidth = 4
binstart = -100
load 'hist.fct'

plot 'histogram.txt' i 0 @hist ls 1,\
     ''              i 1 @hist ls 2
