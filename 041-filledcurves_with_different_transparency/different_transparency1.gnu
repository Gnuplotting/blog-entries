#!/usr/bin/gnuplot
#
# Plotting filledcurves with different transparencies
#
# AUTHOR: Hagen Wierstorf
# VERSION: gnuplot 4.6 patchlevel 0

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'different_transparency1.png'

set border linewidth 1.5
# Axes
set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror out scale 0.75
# Grid
set style line 12 lc rgb'#808080' lt 0 lw 1
set grid back ls 12

set style fill transparent solid 0.5 noborder
set style function filledcurves y1=0
set clip two

Gauss(x,mu,sigma) = 1./(sigma*sqrt(2*pi)) * exp( -(x-mu)**2 / (2*sigma**2) )
d1(x) = Gauss(x, 0.5, 0.5)
d2(x) = Gauss(x,  2.,  1.)
d3(x) = Gauss(x, -1.,  2.)

set xrange [-5:5]
set yrange [0:1]

unset colorbox

set key title "Gaussian Distribution"
set key top left Left reverse samplen 1

set lmargin 6
plot d1(x) fs solid 1.0 lc rgb "forest-green" title 'µ= 0.5 σ=0.5', \
     d2(x) lc rgb "gold" title 'µ= 2.0 σ=1.0', \
     d3(x) lc rgb "red" title 'µ=-1.0 σ=2.0'
