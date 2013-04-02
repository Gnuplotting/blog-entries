#!/usr/bin/gnuplot
#
# Show Mercator projection input-output-function
#
# AUTHOR: Hagen Wierstorf
# gnuplot 4.6 patchlevel 0

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'mercator_input_output.png'

# color definitions
set border linewidth 1.5
set style line 1 lc rgb '#0060ad' lt 1 lw 2 # --- blue

unset key

# Axes
set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror out scale 0.75
# Grid
set style line 12 lc rgb'#808080' lt 0 lw 1
set grid back ls 12

set angles degrees
mercator(x) = log( tan(180/4.0 + x/2.0) )

set format '%g°'
set xrange [-90:90]
set yrange [-3.1:3.1]

set ytics 0
do for [angle=-80:80:20] {
    set ytics add (sprintf('%.0f°',angle) mercator(angle))
}

plot mercator(x) w l ls 1
