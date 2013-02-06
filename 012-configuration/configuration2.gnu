#!/usr/bin/gnuplot
#
# Plotting using the starup settings file. 
#
# AUTHOR: Hagen Wierstorf 

# wxt
@WXT
# png
#@PNG
#set output 'configuration2.png'
# svg
#@SVG
#set output 'configuration2.svg'

# Line styles
set border linewidth 1.5
# Legend
set key at 6.1,1.3
# Axes label 
set xlabel 'x'
set ylabel 'y'


# Axis ranges
set xrange[-2*pi:2*pi]
set yrange[-1.5:1.5]
# Axis labels
set xtics ("-2π" -2*pi, "-π" -pi, 0, "π" pi, "2π" 2*pi)
set ytics 1
set tics scale 0.75
# Functions to plot
a = 0.9
f(x) = a * sin(x)
g(x) = a * cos(x)
# Plot
plot f(x) title 'sin(x)' with lines ls @BLUE, \
     g(x) notitle with lines ls @RED lw 1
