#!/usr/bin/gnuplot
#
# Example how to use http://github.com/aschn/gnuplot-colorbrewer with lines
#
# AUTHOR: Hagen Wierstorf
# gnuplot 4.6 patchlevel 0

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'colorbrewer_line_example.png'

unset key

# Axes
set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror out scale 0.75
# Grid
set style line 12 lc rgb'#808080' lt 0 lw 1
set grid back ls 12

set xrange [0:pi]

# set up function to plot
f(x,i) = cos(x - 1.0 + i/10.0)

load 'Paired.plt'
plot for [ii=1:8] f(x,ii) ls ii lw 2
