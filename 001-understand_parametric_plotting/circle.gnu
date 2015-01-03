#!/usr/bin/gnuplot
#
# Plotting a circle in 2D parametric mode
#
# AUTHOR: Hagen Wierstorf
# VERSION: gnuplot 4.6 patchlevel 0

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'circle.png'
# svg
#set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial, sans-serif' \
#fsize '10'
#set output 'circle.svg'

# Style definitions
set border lw 1.5
set style line 1 lc rgb '#0060ad' lt 1 lw 2     # --- blue
set style line 2 lc rgb '#dd181f' lt 1 lw 2     # --- red

unset key; unset tics; unset border
set lmargin 0
set rmargin 1
set tmargin 1
set bmargin 0

set size ratio -1
set xrange [-1.2:1.2]
set yrange [-1.2:1.2]
set trange [0:2*pi]

set parametric

# Radius
r = 1.0
h = r / sqrt(2.)
set arrow from 0,0 to h,h nohead ls 2
set label 'r' at 0.28,0.45 textcolor ls 2

# Parametric functions for a circle
fx(t) = r*cos(t)
fy(t) = r*sin(t)

plot fx(t),fy(t) ls 1
