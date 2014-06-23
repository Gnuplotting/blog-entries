#!/usr/bin/gnuplot
#
# Plot a historgram from a one dimensional data array
# compare: http://stackoverflow.com/questions/2471884/histogram-using-gnuplot
#
# AUTHOR: Hagen Wierstorf
# gnuplot 4.6 patchlevel 0

reset
set macros

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'histogram3.png'

# colors
set style line 1 lt 1 lc rgb '#FB9A99' # light red
set style line 2 lt 1 lc rgb '#A6CEE3' # light blue

unset key

# axes
set style line 11 lc rgb '#808080' lt 1
set border 3 front ls 11
set tics nomirror out scale 0.75
# grid
set style line 12 lc rgb'#808080' lt 0 lw 1
set grid back ls 12
set grid xtics ytics mxtics



set xrange [-100:100]
set yrange [0:27]
set xlabel 'angle' offset 0,0.5
set ylabel 'number of occurence' offset 1,0
set xtics 45
set mxtics 2

# call histogram function
binwidth = 4
binstart = -2
load 'hist.fct'

# store data in a temporary file for fitting
set table 'hist.txt'
plot 'histogram.txt' i 0 @hist ls 1
unset table

# fit Gaussian
Gauss(x) = a/(sigma*sqrt(2*pi)) * exp( -(x-mu)**2 / (2*sigma**2) )
a = 30.
mu = 3.
sigma = 3.
fit Gauss(x) 'hist.txt' every ::0::7 u 1:2 via a,mu,sigma


set format x '%g°'
plot 'hist.txt' every ::0::7 using 1:2 w boxes ls 1,\
     Gauss(x) w lines ls 2 lw 2
