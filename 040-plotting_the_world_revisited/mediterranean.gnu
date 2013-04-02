#!/usr/bin/gnuplot
#
# Plotting of the Mediterranean region and Italy
#
# AUTHOR: Hagen Wierstorf
# VERSION: gnuplot 4.6 patchlevel 0

reset

# png
set terminal pngcairo size 350,262 enhanced font 'Verdana,10'

# color definitions
set border lw 1.5
set style line 1 lc rgb 'gray' lt 1 lw 1
set style line 2 lc rgb 'black' lt 1 lw 1

unset key
set border 0
unset tics

set size ratio -1

# Plot the mediterranean region
set xrange [5:35]
set yrange [25:50]
set output 'mediterrenean.png'
plot 'world_10m.txt' w filledcu ls 1, \
     ''              w l ls 2

# Plot Italy
set xrange [8:19]
set yrange [35:48]
set output 'italy.png'
plot 'world_10m.txt' w filledcu ls 1, \
     ''              w l ls 2

# Plot Italy with two regions
region1_x(x,y) = (x<11.3 && y<37.5) ? 1/0 : x
region1_y(x,y) = (x<11.3 && y<37.5) ? 1/0 : y
region2_x(x,y) = (x<11.3 && y<37.5) ? x : 1/0
region2_y(x,y) = (x<11.3 && y<37.5) ? y : 1/0
set output 'italy_corrected.png'
plot 'world_10m.txt' \
        u (region1_x($1,$2)):(region1_y($1,$2)) \
        with filledcurves below y1=50 ls 1, \
    '' u (region2_x($1,$2)):(region2_y($1,$2)) \
        with filledcurves above y1=25 ls 1, \
    '' with l ls 2
