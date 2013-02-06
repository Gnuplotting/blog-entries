#!/usr/bin/gnuplot
#
# Plotting activity of the basilar membran in pseudo 3D
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'pseudo3d.png'
# svg
#set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial, sans-serif' \
#fsize '10'
#set output 'pseudo3d.svg'

# color definitions
set style line 1 lc rgb '#ffffff' lt 1 lw 1.5 # --- white
# remove border on top and right and set color to gray
set style line 11 lc rgb '#808080' lt 1
set border 3 front ls 11
set tics nomirror out scale 0.75

unset key
set xrange [0:1300]
set yrange [-2:49]
set xtics 300
set ytics 0,5,30

set xlabel 'Time (ms)'
set ylabel 'Centre Frequency (ERB)'
set style fill solid 1.0 border rgb 'black'

erb(f) = 11.17268 * log(1+(46.06538*f)/(f+14678.49))
f(x) = x>0 ? erb(x) : -erb(-x)
plot for [ii=25:1:-1] 'bmm.txt' u (f(column(ii))+ii) w filledcu y1=-2 ls 1
