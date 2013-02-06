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
#set output 'color_map2.png'
# svg
#set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial, sans-serif' \
#fsize '10'
#set output 'color_map2.svg'

set border linewidth 0
unset key
unset colorbox
set palette grey
set xrange [-0.45:0.45]
set yrange [-0.5:7.5]
set xtics 0.2

plot 'color_map.dat' u (($1-4)/10):2:3 matrix w image
