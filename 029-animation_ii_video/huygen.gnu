#!/usr/bin/gnuplot
#
# Creating an animation of the Huygens–Fresnel principle as a movie 
# NOTE: this files creates multiple png images, the movie file is then created
# using Mencoder
#
# AUTHOR: Hagen Wierstorf

reset
set macros
set terminal pngcairo size 350,262 enhanced font 'Verdana,10'

set style line 1 lc rgb '#0060ad' lt 1 lw 4 # --- blue
set style line 2 lc rgb '#8cccff' lt 1 lw 2 # --- lightblue

set size ratio -1
unset key; unset colorbox; unset border; unset tics

set lmargin at screen 0
set bmargin at screen 0
set rmargin at screen 1 
set tmargin at screen 1

set parametric
# Circle
r = 1
cx(t,x) = r*cos(t)+x
cy(t,y) = r*sin(t)+y
# Plane wave string function
wave(y) = sprintf('set arrow from -1.5,%f to 1.5,%f front nohead ls 1',y,y)
# Outfile string function
outfile(n) = sprintf('animation/huygen%03.0f.png',n)

set trange [0:pi]
set xrange [-2:2]
set yrange [-0.5:2.5]

# initializing values for the loop and start the loop
LAMBDA = 1.0/3
r = 0
dr = 0.01
y = 0
YMAX = 1.5
counter = 0
pw = wave(y)
system('mkdir -p animation')
load 'huygen.plt'

# Create movie with mencoder
ENCODER = system('which mencoder');
if (strlen(ENCODER)==0) print '=== mencoder not found ==='; exit
CMD = 'mencoder mf://animation/*.png -mf fps=25:type=png -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell -oac copy -o huygen.avi'
system(CMD)

# Create webm
ENCODER = system('which ffmpeg')
if (strlen(ENCODER)==0) print '=== ffmpeg not found, exit ==='; exit
CMD = 'ffmpeg -i huygen.avi huygen.webm'
system(CMD)

# Clear directory
system('rm animation/*')
