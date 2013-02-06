#!/usr/bin/gnuplot
#
# Plotting a heat map on Gnuplots world.dat
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Helvetica,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'heatmap3d.png'
# svg
#set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial, sans-serif' \
#fsize '10'
#set output 'heatmap3d.svg'

# color definitions
set border lw 1.5
set style line 1 lc rgb '#000000' lt 1 lw 2
set style line 2 lc rgb '#c0c0c0' lt 2 lw 1

unset key; unset border
set tics scale 0
set lmargin screen 0
set bmargin screen 0
set rmargin screen 1
set tmargin screen 1
set format ''

set mapping spherical
set angles degrees
set hidden3d front
# Set xy-plane to intersect z axis at -1 to avoid an offset between the lowest z
# value and the plane
set xyplane at -1
set view 56,81

set parametric
set isosamples 25
set urange[0:360]
set vrange[-90:90]
set cbrange[-5:10]
set xrange[-1:1]
set yrange[-1:1]
set zrange[-1:1]
set palette defined (0 "blue",17 "#00ffff",33 "white",50 "yellow",66 "red",\
    100 "#990000",101 "grey")

r = 0.99
splot 'temperature.dat' u 2:1:(1):3 w pm3d, \
      r*cos(v)*cos(u),r*cos(v)*sin(u),r*sin(v) w l ls 2, \
      'world.dat' u 1:2:(1) w l ls 1
