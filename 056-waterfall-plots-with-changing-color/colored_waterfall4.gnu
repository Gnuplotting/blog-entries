#!/usr/bin/gnuplot
#
# Plot a waterfall plot
#
# AUTHOR: Hagen Wierstorf
# gnuplot 4.6 patchlevel 0

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'colored_waterfall4.png'

unset key

# Axes
set style line 11 lc rgb '#808080' lt 1
set border 0 back
set tics nomirror out scale 1.5
set label 'time / ms' at 1,-60 center front
set arrow from 0,-95 to 2,-95 nohead ls 11

set xtics offset 0,0.25
set xrange [-0.1:2.1]
set ytics (0,60,120,180,240,300,360) offset 1,0 scale 0.0
set format y '%g°'

set lmargin 4
set tmargin 0
set rmargin 0
set bmargin 1.7

set style fill solid 0.0 border rgb 'black'

limit360(x) = x<1?x+360:x
amplitude_scaling = 200
plot for [angle=360:0:-1] 'head_related_impulse_responses.txt' \
    u 1:(amplitude_scaling*column(limit360(angle)+1)+angle) \
    w filledcu y1=-360 lw 0.5
