#!/usr/bin/gnuplot
#
# Plotting a vector field from a data file
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'vector_fields1.png'

unset key
unset tics
unset colorbox
set border 0

set palette defined ( 0 '#ffffff', \
1 '#ffee00',\
2 '#ff7000',\
3 '#ee0000',\
4 '#7f0000')

set xrange [-2.13:2.13]
set yrange [-3.3:0.2]
set cbrange [0:40]

# functions to calculate the arrow offsets
h = 0.1 # vector size
xf(phi) = h*cos(phi/180.0*pi+pi/2)
yf(phi) = h*sin(phi/180.0*pi+pi/2)

# setting loudspeaker
call 'set_loudspeaker.gnu' '-1.425' '0' '-1.5708' '0.15'
call 'set_loudspeaker.gnu' '0'      '0' '-1.5708' '0.15'
call 'set_loudspeaker.gnu' '1.425'  '0' '-1.5708' '0.15'

plot 'localization_data.txt' \
    u ($1-xf($3)):($2-yf($3)):(2*xf($3)):(2*yf($3)):4 \
    with vectors head size 0.1,20,60 filled lc palette
