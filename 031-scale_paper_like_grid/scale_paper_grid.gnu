#!/usr/bin/gnuplot
#
# Designing a scale paper like grid for your data
#
# AUTHOR: Hagen Wierstorf
# VERSION: gnuplot 4.4 patchlevel 3

reset

# wxt
set terminal wxt size 350,200 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,200 enhanced font 'Verdana,10'
#set output 'scale_paper_grid.png'

# color definitions
set border linewidth 1.5
set style line 1 lc rgb '#0060ad' lt 1 lw 1.5 # --- blue

unset key

set style line 11 lc rgb '#ffffff' lt 1
set border 0 back ls 11
set tics out nomirror scale 0,0.001
set format ''
set mxtics
set mytics

# Grid
set style line 12 lc rgb '#ddccdd' lt 1 lw 1.5 # --- red
set style line 13 lc rgb '#ddccdd' lt 1 lw 0.5
set style line 14 lc rgb '#ccdddd' lt 1 lw 1.5 # --- green
set style line 15 lc rgb '#ccdddd' lt 1 lw 0.5
set style line 16 lc rgb '#ddddcc' lt 1 lw 1.5 # --- yellow
set style line 17 lc rgb '#ddddcc' lt 1 lw 0.5
set grid xtics mxtics ytics mytics back ls 12, ls 13

set size ratio -1
set xtics 0.5
set ytics 0.5
set xrange [0:10]
set yrange [-1:1]

set samples 2000
tc1(x) = x>0.5&x<9.5 ? (sin(10*x)+sin(20*x)+sin(30*x)+sin(40*x))/5 : 1/0
tc2(x) = x>0.5&x<9.5 ? (sin(10*x)+sin(20*x)+sin(30*x))/4 : 1/0

set lmargin screen 0.02
set rmargin screen 0.98

set multiplot layout 2,1
set tmargin screen 0.96
set bmargin screen 0.52
plot tc1(x) ls 1
set tmargin screen 0.48
set bmargin screen 0.14
plot tc2(x) ls 1
unset multiplot
