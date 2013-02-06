#!/usr/bin/gnuplot
#
# Plotting a jpg image with Gnuplot
#
# AUTHOR: Hagen Wierstorf
# VERSION: gnuplot 4.4 patchlevel 3

reset

# wxt
set terminal wxt size 350,239 enhanced font 'Verdana,8' persist
# png
#set terminal pngcairo size 350,239 enhanced font 'Verdana,8'
#set output 'image.png'

# color definitions
set style line 1 lc rgb '#ffffff' lt 1 lw 1.5 # --- white

unset key; unset tics; unset border
set size ratio -1
set lmargin screen 0
set bmargin screen 0
set rmargin screen 1
set tmargin screen 1

# adding a scale axis
set arrow from 31,40 to 495,40 nohead front ls 1
set for [ii=0:11] arrow from 31+ii*40,35 to 31+ii*40,45 nohead front ls 1
# set number and unit as different labels in order
# to get a smaller distance between them
set label '0'  at  25,57 front tc ls 1
set label 'cm' at  37,57 front tc ls 1
set label '5'  at 225,57 front tc ls 1
set label 'cm' at 237,57 front tc ls 1
set label '10' at 420,57 front tc ls 1
set label 'cm' at 442,57 front tc ls 1

plot 'fish.jpg' binary filetype=jpg with rgbimage
