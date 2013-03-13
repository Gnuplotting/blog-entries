#!/usr/bin/gnuplot
#
# Interpolating a heat map
#
# AUTHOR: Hagen Wierstorf
# VERSION: gnuplot 4.6 patchlevel 0

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'heat_map_interpolation2.png'

set border linewidth 0
unset key
unset colorbox
unset tics
set lmargin screen 0.1
set rmargin screen 0.9
set tmargin screen 0.9
set bmargin screen 0.1
set palette grey

set pm3d map
set pm3d interpolate 2,2
splot 'heat_map_data.txt' matrix
