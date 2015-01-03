#!/usr/bin/gnuplot
#
# Using multiplot to include a zoomed in version into your plot
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'zoom_plot2.png'

# color definitions
set style line 2  lc rgb '#0025ad' lt 1 lw 2
set style line 3  lc rgb '#0042ad' lt 1 lw 2
set style line 4  lc rgb '#0060ad' lt 1 lw 2
set style line 5  lc rgb '#007cad' lt 1 lw 2
set style line 6  lc rgb '#0099ad' lt 1 lw 2
set style line 7  lc rgb '#00ada4' lt 1 lw 2
set style line 8  lc rgb '#00ad88' lt 1 lw 2
set style line 9  lc rgb '#00ad6b' lt 1 lw 2
set style line 10 lc rgb '#00ad4e' lt 1 lw 2
set style line 11 lc rgb '#00ad31' lt 1 lw 2
set style line 12 lc rgb '#00ad14' lt 1 lw 2
set style line 13 lc rgb '#09ad00' lt 1 lw 2

unset key

# Axes
set style line 101 lc rgb '#808080' lt 1
set border 3 back ls 101
set tics nomirror out scale 0.75
# Grid
set style line 102 lc rgb'#808080' lt 0 lw 1
set grid back ls 102

set format x '%g°'
set xlabel 'azimuth angle'
set ylabel 'time / ms' offset 1,0

set xrange [-90:0]
set yrange [0:0.9]

set label 1 'interaural time differences' at -15,0.85 front right
set label 2 'f = 236Hz' at -28,0.45 textcolor ls 2
set label 3 'f = 1296Hz' at -12,0.05 right textcolor ls 13

set multiplot

# === large plot ===
plot for [n=2:13] 'itd.txt' u 1:(column(n)*1000) w lines ls n

# === small plot ===
do for [n=2:13] { set style line n lw 1 }
set origin 0.2,0.23
set size 0.35,0.31
clear # erase grid in this small area
set xrange [-10:0]
set yrange [0:0.1]
unset xlabel
unset ylabel
unset label
set bmargin 1; set tmargin 0.5; set lmargin 4; set rmargin 1
set tics scale 0.5 front
set xtics 10 offset 0,0.5
set ytics 0.1 offset 0.5,0
plot for [n=2:13] 'itd.txt' u 1:(column(n)*1000) w lines ls n 

unset multiplot
