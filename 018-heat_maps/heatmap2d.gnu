#!/usr/bin/gnuplot
#
# Plotting a heat map on Gnuplots world.dat
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font "Helvetica,10" persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'heatmap2d.png'
# svg
#set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial,sans-serif' \
#fsize 10
#set output 'heatmap2d.svg'

# color definitions
set border lw 1.5
set style line 1 lc rgb 'black' lt 1 lw 2

set rmargin screen 0.85

unset key
set tics scale 0.5
unset xtics
unset ytics
set cbrange [-5:10]
set xrange[-179:179]
set yrange[-89:89]
set format '%g°'
set palette defined (0 "blue",17 "#00ffff",33 "white",50 "yellow",66 "red",\
    100 "#990000",101 "grey")
plot 'temperature.dat' u 2:1:3 w image, \
     'world.dat' with lines linestyle 1
