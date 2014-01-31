#!/usr/bin/gnuplot
#
# Make a 3D plot of the shaded relief data from Natural Earth
# http://www.naturalearthdata.com/downloads/50m-raster-data/50m-natural-earth-2/
#
# AUTHOR: Hagen Wierstorf
# gnuplot 4.6 patchlevel 3

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'world_color_3d.png'

unset key
set border 0
unset tics
unset colorbox

# convert single rgb values in one value for gnuplot
rgb(r,g,b) = 65536 * int(r) + 256 * int(g) + int(b)

set datafile separator ','

set mapping spherical
set angles degrees
set view 67,113,1.75
splot 'NE2_50M_SR_W_700px.txt' u 1:2:(1):(rgb($3,$4,$5)) w pm3d lc rgb variable
