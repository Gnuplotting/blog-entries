#!/usr/bin/gnuplot
#
# Defining and plotting a step function
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'step2.png'
# svg
#set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial, sans-serif' \
#fsize '10'
#set output 'step2.svg'

# color definitions
set border linewidth 1.5
set style line 1 lc rgb '#0060ad' lt 1 lw 2 # --- blue

unset key

set xrange [-2:2]
set yrange [-0.5:1.5]

set tics scale 0.75
set xtics 1
set ytics 0.5

# Defining a step function
f(x) = x<0  ? 0 : 1/0
g(x) = x>=0 ? 1 : 1/0

plot f(x) with lines ls 1,g(x) with lines ls 1
