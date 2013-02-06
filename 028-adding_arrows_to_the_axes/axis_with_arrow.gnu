#!/usr/bin/gnuplot
#
# Drawing arrow on the axes 
#
# AUTHOR: Hagen Wierstorf
# GNUPLOT: 4.4.3

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'axis_with_arrow.png'

# Color definitions
set border linewidth 1.5
set style line 1 lc rgb '#0060ad' lt 1 lw 2 # --- blue
set style line 2 lc rgb '#dd181f' lt 1 lw 2 pt 7 # --- red

# Axes
set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror out scale 0.75
set arrow from graph 1,0 to graph 1.05,0 size screen 0.025,15,60 filled ls 11
set arrow from graph 0,1 to graph 0,1.05 size screen 0.025,15,60 filled ls 11
# Grid
set style line 12 lc rgb'#808080' lt 0 lw 1
set grid back ls 12

set key at 50,112
set xlabel 'Resistance (Ω)'
set ylabel 'Power (mW)' offset 1,0
set tics scale 0.75

# Therotecial curve
P(x) = 1.53**2 * x/(5.67+x)**2 * 1000

plot [-3:52][0:110] 'battery.dat' u 1:($2*1000):($4*1000) \
                        t 'Power' w yerrorbars ls 2, \
                    P(x) t 'Theory' w lines ls 1
