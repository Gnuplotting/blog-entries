#!/usr/bin/gnuplot
# 3d plot of the comodulation masking release
# AUTHOR: Hagen Wierstorf

reset

# wxt terminal
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'cmr2.png'

# color definitions
slw = .8   # line width signals
elw = 1.6  # line width envelopes
set style line  1 lc rgb 'grey90'  lw slw lt 1 # light grey
set style line  2 lc rgb 'grey40'  lw slw lt 1 # grey
set style line  3 lc rgb 'grey30'  lw slw lt 1 # dark grey
set style line  4 lc rgb '#111111' lw elw lt 1 # filter envelope
set style line 11 lc rgb '#ff928f' lw slw lt 1 # light red
set style line 12 lc rgb '#ff534f' lw slw lt 1 # red
set style line 13 lc rgb '#ff231e' lw slw lt 1 # dark red
set style line 14 lc rgb '#000000' lw elw lt 1 # signal envelope

set border linewidth 1.5
set style data line
unset key
set xrange [0:1400]
set yrange [0:.5]
set zrange [0:7.2]
set tics scale 0.75
set xtics (300,400,700,1000,1100)
set ytics offset 0.4,0
set grid x y z back
set xyplane 0
set view 30,30,1,1.5

# In order to get more beautiful labels and tics in a 3D plot, use the set label
# command to place them
unset xlabel
unset ylabel
unset zlabel
set format x ''
set format z ''
# axis
set label 'Frequency (Hz)' at 400,-.22,0 rotate by -15    # x-axis
set label 'Time (s)'       at 1750,.1,0  rotate by 45     # y-axis
set label 'Amplitude'      at -150,0,0.5 rotate by 90     # z-axis
# set xtic labels
set label '300'  at  300,-.02,0 right rotate by 45;
set label '400'  at  400,-.02,0 right rotate by 45;
set label '700'  at  700,-.02,0 right rotate by 45;
set label '1000' at 1000,-.02,0 right rotate by 45;
set label '1100' at 1100,-.02,0 right rotate by 45;
# CM for comodulation masking release 
set label 'CM'   at 0,.1,9      norotate font 'Helvetica,16'

set multiplot
# Doing a dummy plot for the axes, border, tics, etc.
f(x) = 1/0
splot f(x) with points ls 1
unset border
unset tics
unset label
# --- Plot a gammatone filterbank
# see: http://en.wikipedia.org/wiki/Gammatone_filter
# line style and data function for the filter bank
sty(x) = x<7 ? 1 : x<10 ? 2 : x<12 ? 1 : x==12 ? 3 : x<15 ? 1 : x==15 ? 2 : 1
data(x) = x<12 ? x : 29-x
i=3; maxi = 18; call 'gfb_loop.gnu'
# --- Plot the signals
splot 'noise.dat' u  (300):1:2 ls 11, \
      ''          u  (300):1:3 ls 14, \
      ''          u  (400):1:2 ls 12, \
      ''          u  (400):1:3 ls 14, \
      ''          u  (700):1:2 ls 13, \
      ''          u  (700):1:3 ls 14, \
      ''          u (1000):1:2 ls 12, \
      ''          u (1000):1:3 ls 14, \
      ''          u (1100):1:2 ls 11, \
      ''          u (1100):1:3 ls 14
set samples 500
# Define the sinusoid signal to be plotted
sig(y) = y>0.1 && y<0.4 ? 0.45*sin(2*pi*100*y)+2 : 2
# The desired range is 0:0.5, but the samples were created for the x-axis, which
# has a range of 0:1400, therefore we calculate an factor to do the plot
fact = 1400/0.5
splot '+' u (700):($1/fact):(sig($1/fact)) w l ls 14

unset multiplot
