#!/usr/bin/gnuplot
#
# Plotting a color map and scaling the axis
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'color_map3.png'
# svg
#set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial, sans-serif' \
#fsize '10'
#set output 'color_map3.svg'

set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
unset key
set cbrange [0:0.05]
unset colorbox
set palette grey
set size ratio -1

set xrange [-5.88:5.88]
set yrange [-4.88:4.88]
set xlabel 'x (mm^{-1})'
set ylabel 'y (mm^{-1})'
set tics out nomirror scale 0.5
set ytics 2

plot 'xy_MTF.dat' u (($1-116)/19.813):(($2-116)/19.813):3 matrix w image
