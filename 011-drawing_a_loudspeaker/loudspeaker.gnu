#!/usr/bin/gnuplot
#
# Plotting a loudspeaker object with Gnuplot
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'loudspeaker.png'
# svg
#set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial, sans-serif' \
#fsize '10'
#set output 'loudspeaker.svg'

# color definitions
set style line 1 lc rgb '#0060ad' lt 1 lw 4 # --- blue

unset key
unset border
unset tics

set xrange [-1.5:4.5]
set yrange [-3:3]
set size ratio -1

a = 1.0/3
set object 1 polygon from \
    -1, 1 to \
     0, 1 to \
     0, a to \
     1, 1 to \
     1,-1 to \
     0,-a to \
     0,-1 to \
    -1,-1 to \
    -1, 1
set object 1 fc rgb '#000000' fillstyle solid lw 0

set parametric
set trange [-pi/6:pi/6]
fx(t,r) = r*cos(t)
fy(t,r) = r*sin(t)
plot fx(t,2),fy(t,2) with lines ls 1, \
     fx(t,3),fy(t,3) with lines ls 1, \
     fx(t,4),fy(t,4) with lines ls 1
