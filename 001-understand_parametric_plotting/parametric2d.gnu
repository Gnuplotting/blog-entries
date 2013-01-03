#!/usr/bin/gnuplot
#
# Explaining the 2D paramteric plotting
#
# AUTHOR: Hagen Wierstorf
# VERSION: gnuplot 4.6 patchlevel 0

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'parametric2d.png'
# svg
#set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial, sans-serif' \
#fsize '10'
#set output 'parametric2d.svg'

# color definitions
set border lw 1.5
set style line 1 lc rgb '#00ad06' lt 1 lw 2     # --- green
set style line 2 lc rgb '#dd181f' lt 1 lw 2     # --- red
set style line 3 lc rgb '#0060ad' lt 1 lw 2     # --- blue

unset key; unset tics
set border 1+2
set xlabel 'x'
set ylabel 'y'

# Arrows
set arrow from 0,0 to 1,1 front ls 2
set arrow from 1,0 to 1,1 nohead ls 3
set arrow from 0,1 to 1,1 nohead ls 3

# Labels
set label 't' at 0.25,0.13 textcolor ls 1
set label 'r' at 0.5,0.6 textcolor ls 2
set label 'r cos(t)' at 0.4,1.06 textcolor ls 3
set label 'r sin(t)' at 1.05,0.4 rotate by 90 textcolor ls 3

set parametric

set xrange [0:1.2]
set yrange [0:1.2]
set trange [0:pi/4]

r = 0.4
fx(t) = r*cos(t)
fy(t) = r*sin(t)

plot fx(t), fy(t) ls 1
