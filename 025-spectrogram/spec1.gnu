#!/usr/bin/gnuplot
#
# Plotting a spectrogram
#
# AUTHOR: Hagen Wierstorf

reset

# wxt terminal
set terminal wxt size 410,250 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 410,250 enhanced font 'Verdana,10'
#set output 'spec1.png'
# svg
#set terminal svg size 410,250 fname 'Verdana, Helvetica, Arial, sans-serif' \
#fsize '10'
#set output 'spec1.svg'

# remove border on top and right and set color to gray
set style line 11 lc rgb '#808080' lt 1
set border 3 front ls 11
set tics nomirror out scale 0.75

unset key
set tmargin 4

set palette gray negative
unset colorbox
set cbrange[0:1.5]

set xrange[0:1.61]
set yrange[0:6200]
set xtics 0.5
set ytics (0,"3" 3000,"6" 6000)
set xlabel 'Time (s)'
set ylabel 'Frequency (kHz)'

# Adding the syllables 
syl  = 'A    ch   te   a    u    f    d    ie   A    u    t    o    s   '
xpos = '0.15 0.22 0.36 0.44 0.49 0.56 0.62 0.66 0.89 1.01 1.16 1.26 1.42'
set for [n=1:words(syl)] label word(syl,n) at word(xpos,n),6800

plot 'spec.dat' binary matrix with image
