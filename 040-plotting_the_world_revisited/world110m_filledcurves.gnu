#!/usr/bin/gnuplot
#
# Plotting Antarctica
#
# AUTHOR: Hagen Wierstorf
# VERSION: gnuplot 4.6 patchlevel 0

reset

# png
set terminal pngcairo size 350,177 enhanced font 'Verdana,10'

# color definitions
set border lw 1.5
set style line 1 lc rgb 'gray' lt 1 lw 1
set style line 2 lc rgb 'black' lt 1 lw 1

unset key
set border 0
unset tics

set size ratio -1

set lmargin 0
set rmargin 0
set tmargin 0
set bmargin 0

set xrange [-180:180]
set yrange [-90:90]

set output 'world110m_filledcurves1.png'
plot 'world_110m.txt' w filledcu ls 1, \
     ''               w l ls 2

set output 'world110m_filledcurves2.png'
plot 'world_110m.txt' i 0 w filledcu ls 1, \
     ''               i 1 w filledcu x1 ls 1, \
     ''               w l ls 2
