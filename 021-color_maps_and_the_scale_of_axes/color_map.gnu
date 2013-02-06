#!/usr/bin/gnuplot
#
# Plotting a color map
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'color_map.png'
# svg
#set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial, sans-serif' \
#fsize '10'
#set output 'color_map.svg'

set border linewidth 0
unset key
unset colorbox
set palette grey
set xrange [-0.5:8.5]
set yrange [-0.5:7.5]

plot 'color_map.dat' matrix with image
