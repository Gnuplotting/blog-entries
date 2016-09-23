#!/usr/bin/gnuplot
#
# Extraplate your measurement data to a grid.
#
# AUTHOR: Hagen Wierstorf
# gnuplot 5.0 patchlevel 3

reset

set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
#set terminal pngcairo size 350,262 enhanced font "Verdana,10"
#set output "sand_density2.png"

load 'sand.pal'
set cbrange [0:1]

set tmargin screen 1
set bmargin screen 0
set border 0 back
set size square
set xrange [-1.55:1.55]
set yrange [-1.55:1.55]
unset key
unset colorbox
unset tics

# Draw container
r = 1.5
set object 1 circle front at 0,0 size r fillcolor rgb "black" lw 4

set multiplot

# === Plot heat map of interpolated data ===
set view map
set pm3d at b map
set dgrid3d 200,200,2
splot "sand_density_orig.txt" u 2:3:5

# === Plot measurement points ===
unset object
unset dgrid3d
unset pm3d
splot "sand_density_orig.txt" u 2:3:(0) w p ls 1

unset multiplot
