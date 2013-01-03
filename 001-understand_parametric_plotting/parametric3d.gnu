#!/usr/bin/gnuplot
#
# Explaining the 3D paramteric plotting
#
# AUTHOR: Hagen Wierstorf
# VERSION: gnuplot 4.6 patchlevel 0

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'parametric3d.png'
# svg
#set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial, sans-serif' \
#fsize '10'
#set output 'parametric3d.svg'

# color definitions
set border lw 1.5
set style line 1 lc rgb '#00ad06' lt 1 lw 1.5   # --- green
set style line 2 lc rgb '#dd181f' lt 1 lw 2     # --- red
set style line 3 lc rgb '#949599' lt 1 lw 2     # --- grey
set style line 4 lc rgb '#0060ad' lt 1 lw 2     # --- blue

unset key; unset tics
set lmargin screen 0.18
set rmargin screen 0.98
set tmargin screen 0.88
set bmargin screen 0.28
set xlabel 'x' offset graph 0,0.08
set ylabel 'y' offset graph -1.3,0.13
set zlabel 'z' offset graph 0.18,0
set border 1+2+16
set view 37,11

# Arrows
h = sqrt(2)
set arrow from 0,0,0 to 1,1,h front ls 2
set arrow from 1,1,0 to 1,1,h nohead ls 4
set arrow from 0,0 to 1,1 nohead back ls 3
set arrow from 1,0 to 1,1 nohead back ls 4 
set arrow from 0,1 to 1,1 nohead back ls 4

# Labels
set label 'u' at 0.25,0.13,0 textcolor ls 1
set label 'v' at 0.23,0.23,0.18 textcolor ls 1
set label 'r' at 0.6,0.6,1.1 textcolor ls 2
set label 'r cos(v)' at 0.5,0.4,0 rotate by 12 textcolor ls 3
set label 'r cos(v) cos(u)' at 0.48,1.1,0 rotate by -4 textcolor ls 4
set label 'r cos(v) sin(u)' at 1.05,0.1,0 rotate by 67 textcolor ls 4
set label 'r sin(v)' at 1.05,1,0.4 rotate by 90 textcolor ls 4

set parametric

set xrange [0:1.2]
set yrange [0:1.2]
set zrange [0:1.2]
set xyplane at 0
set urange [0:pi/4]
set vrange [0:pi/4]

# Angle between r' and x axis
r0 = 0.4
fvx(v) = r0*cos(v)
fvy(v) = r0*sin(v)
fvz = 0
# Angle between r and r'
r = 0.5
fux(u) = r*cos(u)*cos(pi/4)
fuy(u) = r*cos(u)*sin(pi/4)
fuz(u) = r*sin(u)

splot fvx(v),fvy(v),fvz ls 1, \
      fux(u),fuy(u),fuz(u) ls 1
