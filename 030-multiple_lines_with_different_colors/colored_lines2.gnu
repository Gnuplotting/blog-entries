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
#set output 'colored_lines2.png'

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

set colorbox user horizontal origin 0.32,0.385 size 0.18,0.035 front
set cbrange [236:1296]
set cbtics ('236 Hz' 236,'1296 Hz' 1296) offset 0,0.5 scale 0
set palette defined (\
    1  '#0025ad', \
    2  '#0042ad', \
    3  '#0060ad', \
    4  '#007cad', \
    5  '#0099ad', \
    6  '#00ada4', \
    7  '#00ad88', \
    8  '#00ad6b', \
    9  '#00ad4e', \
    10 '#00ad31', \
    11 '#00ad14', \
    12 '#09ad00' \
    )
plot for [n=2:13] 'itd.txt' u 1:(column(n)*1000) w lines ls n, 1/0 w image

