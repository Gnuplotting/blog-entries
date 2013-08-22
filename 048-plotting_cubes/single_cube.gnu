#!/usr/bin/gnuplot
#
# Plot a single cube
#
# AUTHOR: Hagen Wierstorf
# gnuplot 4.6 patchlevel 1

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'single_cube.png'

# color definitions
set cbrange [0.9:1]
set palette defined (1 '#ce4c7d')
set style line 1 lc rgb '#b90046' lt 1 lw 0.5

unset key
set border 0
unset tics
unset colorbox
set view 61,120,2
set view equal xyz
set pm3d depthorder hidden3d
set pm3d implicit
unset hidden3d
set xrange [-1:1]
set yrange [-1:1]
set zrange [-1:1]

# plot cube at center of coordinate system
splot 'cube.txt' u 1:2:3:(1) w l ls 1
