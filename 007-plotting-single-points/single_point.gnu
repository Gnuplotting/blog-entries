#! /usr/bin/gnuplot
#
# Plot a single point with Gnuplot without using a data file
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'single_point.png'
# svg
#set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial, sans-serif' \
#fsize '10'
#set output 'single_point.svg'

# Styling
set border linewidth 1.5
set pointsize 1.5
set style line 1 lc rgb '#0060ad' pt 5   # square
set style line 2 lc rgb '#0060ad' pt 7   # circle
set style line 3 lc rgb '#0060ad' pt 9   # triangle

unset key

set tics scale 0.75
set xtics 1
set ytics 1
set yrange[0:3]
set xrange[0.5:3.5]
set xlabel 'x' 
set ylabel 'y'

# Plot some points 
plot '-' w p ls 1, '-' w p ls 2, '-' w p ls 3
1 2
e
2 1
e
3 1.5
e
