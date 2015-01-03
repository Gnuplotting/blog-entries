#!/usr/bin/gnuplot
#
# Plotting a sphere with Gnuplots parametric mode
#
# AUTHOR: Hagen Wierstorf
# VERSION: gnuplot 4.6 patchlevel 0

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'sphere.png'
# svg
#set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial, sans-serif' \
#fsize '10'
#set output 'sphere.svg'

# Style definitions
set border lw 1.5
set linetype 1   lc rgb '#0060ad' lt 1 lw 2     # --- blue
set linetype 2   lc rgb '#0060ad' lt 1 lw 2     # --- blue
set style line 2 lc rgb '#dd181f' lt 1 lw 3     # --- red

unset key; unset tics; unset border
set lmargin screen 0
set rmargin screen 1
set tmargin screen 1
set bmargin screen 0
set size ratio -1
set view 53,16

set parametric
set isosamples 30
set hidden3d

# Radius
r = 1.0
h = r / sqrt(2.)
set arrow from 0,0,0 to h,0,h front nohead ls 2
set label 'r' at 0.28,0,0.42 textcolor ls 2

set xrange [-1.2:1.2]
set yrange [-1.2:1.2]
set zrange [-1.2:1.2]
set urange [0:3.0/2*pi]
set vrange [-pi/2:pi/2]

# Parametric functions for the sphere
fx(v,u) = r*cos(v)*cos(u)
fy(v,u) = r*cos(v)*sin(u)
fz(v)   = r*sin(v)

splot fx(v,u),fy(v,u),fz(v)
