#!/usr/bin/gnuplot
#
# Plotting sparse data with transparent circles
#
# AUTHOR: Hagen Wierstorf
# gnuplot 4.6 patchlevel 0

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'sparse_image_data2.png'

unset key

# Axes
set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror out scale 0.75

set xrange [0:105]
set yrange [0:101]
set size ratio -1

set xrange [1:106]
set yrange [1:106]

set palette negative defined ( \
    0 '#D53E4F',\
    1 '#F46D43',\
    2 '#FDAE61',\
    3 '#FEE08B',\
    4 '#E6F598',\
    5 '#ABDDA4',\
    6 '#66C2A5',\
    7 '#3288BD' )

f(x) = x>2 ? x : 1/0
set style fill transparent solid 0.8 noborder
plot '<sort -g -k3 vector_projection.txt' u 1:2:(1):(f($3)) w circles lc palette
