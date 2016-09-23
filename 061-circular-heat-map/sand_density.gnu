#!/usr/bin/gnuplot
#
# Interpolate your measurement data to a grid and limit it to a circular grid
# during plotting.
#
# AUTHOR: Hagen Wierstorf
# gnuplot 5.0 patchlevel 3

reset

set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
#set terminal pngcairo size 350,262 enhanced font "Verdana,10"
#set output "sand_density.png"

load 'sand.pal'
set cbrange [0:1]

# Fit data to grid and store result in grid_data.txt
set table "tmp.txt"
set dgrid3d 200,200,2
splot "sand_density.txt" u 2:3:5
unset table

set tmargin 0
set bmargin 0
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
# Define circle to which the data should be limited
circle(x,y,z) = sqrt(x**2+y**2)>r ? NaN : z

set multiplot

###=== Plot heat map of interpolated data ===###
plot "tmp.txt" u 1:2:(circle($1,$2,$3)) w image

###=== Plot actual measurement points ===###
unset object
r = 1.49 # make radius smaller to exclude interpolated edge points
set label 'normal' at -1,0.2 center front tc ls 1
set label 'dense' at 0.5,0.75 center front tc ls 1
set label 'very dense' at 0.3,-0.3 center front tc ls 1
plot "sand_density.txt" \
         u (circle($2,$3,$2)):(circle($2,$3,$3)) w p ls 1

unset multiplot

!rm tmp.txt
