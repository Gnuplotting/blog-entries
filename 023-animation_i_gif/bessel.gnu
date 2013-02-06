#!/usr/bin/gnuplot
#
# Creating an animation gif of the Bessel function
# NOTE: this files creates multiple png images, the gif file is then created
# using GIMP
#
# AUTHOR: Hagen Wierstorf

reset
set terminal pngcairo size 350,262 enhanced font 'Verdana,10'

# color definitions
set palette rgb 3,9,9

unset key; unset colorbox; unset border; unset tics
set lmargin at screen 0.03
set bmargin at screen 0
set rmargin at screen 0.97
set tmargin at screen 1

set parametric
# Bessel function, which is moving in time
bessel(x,t) = besj0(x) * cos(2*pi*t)
# calculate the zeros for the bessel function (see Watson, "A Treatise on the
# Theory of Bessel Functions", 1966, page 505)
n = 6 # number of zeros
k = (n*pi-1.0/4*pi)
u_0 = k + 1/(8*k) - 31/(384*k)**3 + 3779/(15360*k)**5
set urange [0:u_0]
set vrange[0:1.5*pi]
set cbrange [-1:1]
set zrange[-1:1]

set isosamples 200,100
set pm3d depthorder
set view 40,200

# initializing values for the loop and start the loop
t = 0
end_time = 1
system('mkdir -p animation')
load 'bessel.plt'
