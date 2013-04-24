#!/usr/bin/gnuplot
#
# Plot some points on top of the map of Denmark
#
# AUTHOR: Hagen Wierstorf
# gnuplot 4.6 patchlevel 0

reset

# png
set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
set output 'points_on_top.png'

# color definitions
set border lw 1.5
set style line 1 lc rgb 'gray' lt 1 lw 1
set style line 2 lc rgb 'black' lt 1 lw 1
set style line 3 lc rgb '#dd181f' pt 2 ps 2 lw 2

unset key
set border 0
unset tics

#set size ratio -1

# Plot only Denmark
set xrange [7.5:13]
set yrange [54.5:58]

# plotting in different resolutions
plot 'world_10m.txt' with filledcurves ls 1, \
     '' with l ls 2, \
     'points.txt' w p ls 3
