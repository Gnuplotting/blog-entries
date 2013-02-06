#!/usr/bin/gnuplot
#
# Demonstration of a common use scenario of the multiplot environment.
#
# AUTHOR: Hagen Wierstorf
#

reset

# wxt terminal
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'multiplot1.png'
# svg
#set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial, sans-serif' \
#fsize '10'
#set output 'multiplot1.svg'

# color definitions
set style line  1 lc rgb '#0060ad' pt 5 ps 0.2 lt 1 lw 2    # blue

unset key

# Functions (1/0 means not defined)
a = 0.9
f(x) = abs(x)<2*pi ? a*sin(x)           : 1/0
g(x) = abs(x)<2*pi ? a*sin(x+pi/2)      : 1/0
h(x) = abs(x)<2*pi ? a*sin(x+pi)        : 1/0
k(x) = abs(x)<2*pi ? a*sin(x+3.0/2*pi)  : 1/0

set tics scale 0.5
set xrange [-2.5*pi:2.5*pi]
set yrange [-1.5:1.5]

set xtics ('-2π' -2*pi, '-π' -pi,'0' 0, 'π' pi, '2π' 2*pi)
set ytics 1
set xlabel 'x'
set ylabel 'y'

### Start multiplot (2x2 layout)
set multiplot layout 2,2 rowsfirst
# --- GRAPH a
set label 1 'a' at graph 0.92,0.9 font ',8'
plot f(x) with lines ls 1
# --- GRAPH b
set label 1 'b' at graph 0.92,0.9 font ',8'
plot g(x) with lines ls 1
# --- GRAPH c
set label 1 'c' at graph 0.92,0.9 font ',8'
plot h(x) with lines ls 1
# --- GRAPH d
set label 1 'd' at graph 0.92,0.9 font ',8'
plot k(x) with lines ls 1
unset multiplot
### End multiplot
