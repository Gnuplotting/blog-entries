#!/usr/bin/gnuplot
#
# Plot simple mean values with variance and indicate significant differences 
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'simple_statistics.png'
# svg
#set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial, sans-serif' \
#fsize '10'
#set output 'simple_statistics.svg'

# color definitions
set border linewidth 1.5
set style line 1 lc rgb 'grey30' ps 0 lt 1 lw 2
set style line 2 lc rgb 'grey70' lt 1 lw 2

set style fill solid 1.0 border rgb 'grey30'

unset key
set border 3
set xtics nomirror scale 0
set ytics nomirror out scale 0.75 0.5
set yrange [0:1.1]
set xrange [-1:5]

set xlabel 'Conditions'

# Add significants indicator
set label '*' at 3,0.8 center
set label '*' at 4,0.8 center

# Plot mean with variance (std^2) as boxes with yerrorbar and use the first row
# in the data file as xtic labels
plot 'simple_statistics.dat' u 0:2:($3**2) w yerrorbars ls 1, \
     ''                      u 0:2:(0.7):xtic(1) w boxes ls 2
