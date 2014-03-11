#!/usr/bin/gnuplot
#
# Plot sketch for explaining diffraction
#
# AUTHOR: Hagen Wierstorf
# gnuplot 4.6 patchlevel 3
reset
set macros

# wxt. Note, that the italic option only seems to work for the pngcairo terminal
set terminal wxt size 350,230 enhanced font 'Verdana-Italic,10' persist
# png
#set terminal pngcairo size 350,230 enhanced font 'Verdana-Italic,10'
#set output 'diffraction.png'


# create data for sinc function
set table 'sinc.txt'
set xrange [-2*pi:2*pi]
set yrange [-1:1]
f(y) = (sin(y)/y)**2
plot f(x)
unset table

# line styles
set style line 1   lc rgb '#A6CEE3' lt 1 lw 3 # light blue
set style line 2   lc rgb '#1F78B4' lt 1 lw 3 # dark blue
set style line 101 lc rgb '#808080' lt 1 lw 1 # grey
set style line 201 lc rgb '#000000' lt 1 lw 1 # black

unset key
set border 0
unset tics

set rmargin 1
set lmargin 1
set bmargin 1
set tmargin 1

set xrange [-25:10]
set yrange [-2*pi:3*pi]
set size ratio -1

# define arrow with T-shaped heads
Theads = 'heads size 0.4,90 front ls 201'

# add slit
set arrow from -22,-2 to -22,2    nohead back ls 101 lw 3
# add light beams
set arrow from -22, 0    to   0,-pi   nohead front ls 2
set arrow from -22, 2    to   0, 2-pi nohead front ls 1
set arrow from -22,-2    to   0,-2-pi nohead front ls 1
# add descriptive arrows
set label 'd'  at -25,0 center
set arrow from -24,-2 to -24, 2       @Theads
set label 'λ'  at -21.7,3 center
set arrow from -22, 2 to -21.44,1.92  @Theads
set label 'Δs' at 3.2,0 center
set arrow from 1.5,-pi to 1.5,pi      @Theads
set label 'a'  at -11,3*pi center
set arrow from -22,2.5*pi to 0,2.5*pi @Theads
# set open circle for angle
set object circle at -22,0 size 6 arc [-8:0]
set label 'θ' at -15,0 center
# plot sinc function
plot 'sinc.txt' u ($2*7+3):1 w l ls 2
