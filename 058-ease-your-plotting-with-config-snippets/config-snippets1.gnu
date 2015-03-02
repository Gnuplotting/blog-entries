#!/usr/bin/gnuplot
#
# Plot bessel functions and highlight use of config files
#
# AUTHOR: Hagen Wierstorf
# gnuplot 4.6 patchlevel 6

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'config-snippets1.png'

# set path of config snippets
set loadpath './config'
# load config snippets
load 'dark2.pal'
load 'xyborder.cfg'
load 'grid.cfg'
load 'mathematics.cfg'

set xrange [0:15]
unset key

set label 'J_0' at 1.4,0.90 center tc ls 1
set label 'J_1' at 1.9,0.67 center tc ls 2
set label 'J_2' at 3.2,0.57 center tc ls 3
set label 'J_3' at 4.3,0.51 center tc ls 4
set label 'J_4' at 5.4,0.48 center tc ls 5
set label 'J_5' at 6.5,0.45 center tc ls 6
set label 'J_6' at 7.6,0.43 center tc ls 7

plot besj0(x) ls 1 lw 2, \
     besj1(x) ls 2 lw 2, \
     besj2(x) ls 3 lw 2, \
     besj3(x) ls 4 lw 2, \
     besj4(x) ls 5 lw 2, \
     besj5(x) ls 6 lw 2, \
     besj6(x) ls 7 lw 2
