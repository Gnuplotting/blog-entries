#!/usr/bin/gnuplot
#
# Plot a rectangular function
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'boxcar.png'
# svg
#set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial, sans-serif' \
#fsize '10'
#set output 'boxcar.svg'

# color definitions
set border linewidth 1.5
set style line 1 lc rgb '#0060ad' lt 1 lw 2 # --- blue

unset key

set xrange [-1.5:1.5]
set yrange [-0.5:1.5]

set tics scale 0.75
set xtics 1
set ytics 0.5

# Defining a step function
s(x) = abs(x)<0.5 ? 1 : abs(x)>0.5 ? 0 : 1/2

set samples 1000
plot s(x) with lines ls 1
