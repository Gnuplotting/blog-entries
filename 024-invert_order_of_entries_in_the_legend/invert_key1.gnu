#!/usr/bin/gnuplot
#
# Inverts the order of legend entries
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'invert_key1.png'
# svg
#set terminal svg size 350,262 enhanced \
#fname 'Verdana, Helvetica, Arial, sans-serif' fsize '10'
#set output 'invert_key1.svg'

# color definitions
set border linewidth 1.5
set style line 1 lc rgb '#000000' lt 1 lw 2 # --- black
set style line 2 lc rgb '#949599' lt 1 lw 2 # --- grey

# grid
set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror out scale 0.75

# legend
set key at graph 0.7,0.95

set xlabel 'Frequency (Hz)'
set ylabel 'Amplitude (dB)' offset 1,0
set logscale x
set xrange[10:20000]
set yrange[-15:20]
set xtics nomirror autofreq
set ytics -10,10,10
plot 'freq.txt' u 1:3 t 'x_2' w l ls 2, \
     ''         u 1:2 t 'x_1' w l ls 1
