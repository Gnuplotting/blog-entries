#!/usr/bin/gnuplot
#
# Equipotential lines
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'equipotential_lines.png'

# color definitions
set border linewidth 1.5
set style line 1 lc rgb '#0060ad' lt 1 lw 2 # --- blue

unset key; unset border; unset tics
set size ratio -1

# source positions
q = 1; y0 = 1; x0 = 1;
dx = 0.25
# functions
r(x,y) = sqrt(x*x+y*y)
v_(x,y,x0)=  q/r(x-x0,y-y0)
v(x,y) = v_(x,y,x0+0*dx) + \
         v_(x,y,x0+1*dx) + \
         v_(x,y,x0+2*dx) + \
         v_(x,y,x0+3*dx) + \
         v_(x,y,x0+4*dx) + \
         v_(x,y,x0+5*dx)

set xrange [0:3.25]
set yrange [0:2]

# calculate and save equipotential lines
set view map
unset surface
set contour base
# distance between contour lines according to 1/r
# => equal distance between lines
set cntrparam levels discrete 4,5,6.67,10
set isosam 31,31
set table 'equipotential_lines.txt'
splot v(x,y) w l ls 1
unset table

# draw sources
set object 1 rectangle from x0-dx/2,y0-dx/2.5 to x0+11*dx/2,y0+dx/2.5
set object 1 fc rgb '#d6d7d9' fillstyle solid
set for [n=0:5] label n+1 '+' at x0+n*dx,y0 center

plot 'equipotential_lines.txt' u 1:2 w l ls 1
