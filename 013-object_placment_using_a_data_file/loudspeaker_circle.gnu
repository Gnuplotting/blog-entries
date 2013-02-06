#!/usr/bin/gnuplot
#
# Plotting a circular loudspeaker array after a data file
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'loudspeaker_circle.png'
# svg
#set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial, sans-serif' \
#fsize '10'
#set output 'loudspeaker_circle.svg'

# color definitions
set border linewidth 1.5
set style line 1 lc rgb '#0060ad' lt 1 lw 2 # --- blue
set style line 2 lc rgb '#8cccff' lt 1 lw 2 # --- lightblue

unset key
unset border
unset tics

set xrange [-1.7:1.7]
set yrange [-1.7:1.7]
set size ratio -1

# --- Read loudspeaker placement from data file
# Set the output of the following plot to a table in order to achieve that it is
# not shown in the current terminal
set table '/dev/null'
# Function to create the right call function
add_loudspeaker(x,y,phi) = sprintf(\
    'call "set_loudspeaker.gnu" "%f" "%f" "%f" "%f";',x,y,phi,0.2)
# Initialize command string
CMD = ''
# Do a dummy plot to read the loudspeaker position data
plot 'loudspeaker_pos.dat' u 1:(CMD = CMD.add_loudspeaker($1,$2,$3))
# Execute the loudspeaker drawing command
eval(CMD)
# Restore the terminal
unset table

# --- Plot loudspeaker activity
set parametric
fx(t,r,phi) = -1.5*cos(phi)+r*cos(t)
fy(t,r,phi) = -1.5*sin(phi)+r*sin(t)
set multiplot
set trange [-pi/6+pi/8:pi/6+pi/8]
plot for [n=1:3] fx(t,n*0.25,pi/8),fy(t,n*0.25,pi/8) w l ls 2
unset object
set trange [-pi/6-pi/8:pi/6-pi/8]
plot for [n=1:3] fx(t,n*0.25,-pi/8),fy(t,n*0.25,-pi/8) w l ls 2
set trange [-pi/6:pi/6]
plot for [n=1:3] fx(t,n*0.25,0),fy(t,n*0.25,0) w l ls 1
unset multiplot
