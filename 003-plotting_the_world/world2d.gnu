#!/usr/bin/gnuplot
#
# Plotting Gnuplots world.dat
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font "Helvetica,10" persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'world2d.png'
# svg
#set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial,sans-serif' \
#fsize 10
#set output 'world2d.svg'

# color definitions
set border lw 1.5
set style line 1 lc rgb 'black' lt 1 lw 2

unset key
set format ''
set tics scale 0
set grid

plot 'world.dat' with lines linestyle 1
