#!/usr/bin/gnuplot
#
# Plotting a bunch of lines with varying color
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'colored_lines1.png'

# color definitions
set border linewidth 1.5
set style line 2  lc rgb '#0025ad' lt 1 lw 1.5 # --- blue
set style line 3  lc rgb '#0042ad' lt 1 lw 1.5 #      .
set style line 4  lc rgb '#0060ad' lt 1 lw 1.5 #      .
set style line 5  lc rgb '#007cad' lt 1 lw 1.5 #      .
set style line 6  lc rgb '#0099ad' lt 1 lw 1.5 #      .
set style line 7  lc rgb '#00ada4' lt 1 lw 1.5 #      .
set style line 8  lc rgb '#00ad88' lt 1 lw 1.5 #      .
set style line 9  lc rgb '#00ad6b' lt 1 lw 1.5 #      .
set style line 10 lc rgb '#00ad4e' lt 1 lw 1.5 #      .
set style line 11 lc rgb '#00ad31' lt 1 lw 1.5 #      .
set style line 12 lc rgb '#00ad14' lt 1 lw 1.5 #      .
set style line 13 lc rgb '#09ad00' lt 1 lw 1.5 # --- green

unset key
# border
set style line 101 lc rgb '#808080' lt 1
set border 3 back ls 101
set tics nomirror out scale 0.75
# define grid
set style line 102 lc rgb'#808080' lt 0 lw 1
set grid back ls 102

set format x '%g°'
set xlabel 'Azimuth angle'
set ylabel 'Time (ms)'

set xrange [-90:0]
set yrange [0:0.9]
set xtics 15

set label 1 'ITD' at -22.5,0.75 front center
set label 2 'f = 236 Hz' at -27,0.45 textcolor ls 2
set label 3 'f = 1296 Hz' at -22,0.15 right textcolor ls 13

plot for [n=2:13] 'itd.txt' u 1:(column(n)*1000) w lines ls n
