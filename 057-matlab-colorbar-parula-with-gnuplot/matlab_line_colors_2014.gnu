#!/usr/bin/gnuplot
#
# Plot bessel functions to highlight default Matlab R2014b line colors
#
# AUTHOR: Hagen Wierstorf
# gnuplot 4.6 patchlevel 6

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'matlab_line_colors_2014.png'

# load line style definitions
load 'parula.pal'

# Axes
set style line 101 lc rgb '#808080' lt 1
set border 3 back ls 101
set tics nomirror out scale 0.75
# Grid
set style line 102 lc rgb'#808080' lt 0 lw 1
set grid back ls 102

set xrange [0:15]
unset key

# Bessel functions (after Bronstein 2001, eq. 9.54a)
besj2(x) = 2*1/x * besj1(x) - besj0(x)
besj3(x) = 2*2/x * besj2(x) - besj1(x)
besj4(x) = 2*3/x * besj3(x) - besj2(x)
besj5(x) = 2*4/x * besj4(x) - besj3(x)
besj6(x) = 2*5/x * besj5(x) - besj4(x)
besj0_(x) = x<5 ? besj0(x) : 1/0

set label 'J_0' at 1.4,0.90 center tc ls 11
set label 'J_1' at 1.9,0.67 center tc ls 12
set label 'J_2' at 3.2,0.57 center tc ls 13
set label 'J_3' at 4.3,0.51 center tc ls 14
set label 'J_4' at 5.4,0.48 center tc ls 15
set label 'J_5' at 6.5,0.45 center tc ls 16
set label 'J_6' at 7.6,0.43 center tc ls 17

plot besj0(x) ls 11 lw 2, \
     besj1(x) ls 12 lw 2, \
     besj2(x) ls 13 lw 2, \
     besj3(x) ls 14 lw 2, \
     besj4(x) ls 15 lw 2, \
     besj5(x) ls 16 lw 2, \
     besj6(x) ls 17 lw 2
