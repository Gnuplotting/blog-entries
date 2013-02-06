#!/usr/bin/gnuplot
#
# Plotting the world with the natural earth data set (3D)
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Helvetica,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'world3d_revisited.png'

# color definitions
set border lw 1.5
set linetype 1 lc rgb '#000000' lt 1 lw 1
set linetype 2 lc rgb '#c0c0c0' lt 2 lw 1

unset key; unset border
set tics scale 0
set lmargin screen 0
set bmargin screen 0
set rmargin screen 1
set tmargin screen 1
set format ''

set mapping spherical
set angles degrees
set hidden3d
# Set xy-plane to intersect z axis at -1 to avoid an offset between the lowest z
# value and the plane
set xyplane at -1
set view 56,81

set parametric
set isosamples 25
set urange[0:360]
set vrange[-90:90]

r = 0.99
splot r*cos(v)*cos(u),r*cos(v)*sin(u),r*sin(v) with lines lt 2, \
      'world_110m.txt' with lines lt 1
