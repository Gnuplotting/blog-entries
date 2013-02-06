#!/usr/bin/gnuplot
#
# Draw equipotential lines of two sources with different charge
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'electric_field2.png'

# color definitions
set border linewidth 1.5
set style line 1 lc rgb '#0060ad' lt 1 lw 2 # --- blue
set style line 2 lc rgb '#dd181f' lt 1 lw 2 # --- red

unset key; unset border; unset tics
set size ratio -1

r(x,y) = sqrt(x*x+y*y)
v1(x,y)=  q1/r(x-x1,y-y1)
v2(x,y)=  q2/r(x-x2,y-y2)
v(x,y) = v1(x,y)+v2(x,y)

# position of positive charge
x1 = 2
y1 = 1
q1 = 1
# position of negative charge
x2 = 1
y2 = 1
q2 = -2

set xrange [-1:3]
set yrange [-0.5:2.5]

set view map
unset surface
set contour base
set cntrparam order 4
set cntrparam points 5
set cntrparam linear

set isosam 61,61
# negative source
set cntrparam levels discrete \
    -5,-2.5,-1.67,-1.25,-1,-0.83,-0.71,-0.63,-0.55,-0.5,-0.45,-0.42,-0.38,-0.36
set table 'electron.txt'
splot v(x,y) w l ls 1
# positive source
unset table
set cntrparam levels discrete \
    0.36,0.38,0.42,0.45,0.5,0.55,0.63,0.71,0.83,1,1.25,1.67,2.5,5
set table 'positron.txt'
splot v(x,y) w l ls 1
unset table

# Draw sources
call 'positron.gnu' x1 y1 '0.1'
call 'electron.gnu' x2 y2 '0.2'
plot 'electron.txt' u 1:2 w l ls 1, \
     'positron.txt' u 1:2 w l ls 2
