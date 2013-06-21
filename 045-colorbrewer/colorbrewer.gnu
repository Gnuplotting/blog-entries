#!/usr/bin/gnuplot
#
# Showing some of the color maps from http://colorbrewer2.org/
#
# AUTHOR: Hagen Wierstorf
# gnuplot 4.6 patchlevel 0

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'colorbrewer.png'

unset key
set border 0
unset tics
unset colorbox

set xrange [0.5:32.5]
set yrange [-1:8.5]

set multiplot

distance = 2
ii=0
set label 1 'diverging' at 4.5,-0.5 center
set label 2 'sequential' at 16.5,-0.5 center
set label 3 'qualitative' at 28.5,-0.5 center
do for [pal in "BrBG RdBu Spectral"] {
    filename = pal . '.plt'
    load filename
    plot 'colorbrewer.txt' u ($1+ii):2:3 w image
    unset label
    ii=ii+3
}
ii=ii+3
do for [pal in "Greens YlGnBu YlOrRd"] {
    filename = pal . '.plt'
    load filename
    plot 'colorbrewer.txt' u ($1+ii):2:3 w image
    ii=ii+3
}
ii=ii+3
do for [pal in "Accent Paired Set1"] {
    filename = pal . '.plt'
    load filename
    plot 'colorbrewer.txt' u ($1+ii):2:3 w image
    ii=ii+3
}

unset multiplot
