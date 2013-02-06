#!/usr/bin/gnuplot
# AUTHOR: Hagen Wierstorf

reset

# wxt terminal
#set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
#png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'wave_field.png'
#svg
set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial, sans-serif' \
fsize '10'
set output 'wave_field.svg'

set border linewidth 1.5

unset key

set size ratio -1

# ---  Image plot settings ---
# Use clipping to show a reasonable range of colors
set cbrange [-1:1]
set colorbox
set palette gray

set xrange [-2:2]
set yrange [0:4]
set tics scale 0.75
set xtics 1
set ytics 1
set xlabel 'x (m)'
set ylabel 'y (m)'

plot 'wave_field.dat' binary matrix with image

