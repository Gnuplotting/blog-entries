#!/usr/bin/gnuplot
#
# Plotting relative coordinate points 
#
# AUTHOR: Hagen Wierstorf
# gnuplot 4.6 patchlevel 0

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'relative_data.png'

# color definitions
set border linewidth 1.5
set style line 1 lc rgb '#0060ad' pt 7 ps 1.5 lt 1 lw 2 # --- blue
set style line 2 lc rgb '#949599' lt 1 lw 2 # --- grey

unset key

# Axes
set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror out scale 0.75
# Grid
set style line 12 lc rgb'#808080' lt 0 lw 1
set grid back ls 12

set xrange [0:5]
set yrange [0:4]

# define starting point
x=0.; y=0.
a=0;  b=0
plot 'relative_data.txt' u (x=x+$1):(y=y+$2) w steps ls 2,\
     ''                  u (a=a+$1):(b=b+$2) w points ls 1
