#!/usr/bin/gnuplot
#
# Plot a map of the USA together with election results in every state
#
# AUTHOR: Hagen Wierstorf
# gnuplot 4.6 patchlevel 0

reset

# wxt
set terminal wxt size 350,262 enhanced persist font 'Verdana'
# png
#set terminal pngcairo size 350,262 enhanced
#set output 'election1.png'

# color definitions
set style line 1 lc rgb '#0088c8' lt 1 lw 0 # --- blue
set style line 2 lc rgb '#cc3333' lt 1 lw 0 # --- red
set style line 3 lc rgb '#ffffff' lt 1 lw 0.5 # --- white

# for wxt terminal
set label '332'   at screen 0.12,0.95 font ',25' center tc ls 1
set label 'votes' at screen 0.12,0.84 font ',16' center tc ls 1
set label '206'   at screen 0.88,0.95 font ',25' center tc ls 2
set label 'votes' at screen 0.88,0.84 font ',16' center tc ls 2
# for png terminal
#set label '332'   at screen 0.1,0.90 font ',25' center tc ls 1
#set label 'votes' at screen 0.1,0.82 font ',16' center tc ls 1
#set label '206'   at screen 0.9,0.90 font ',25' center tc ls 2
#set label 'votes' at screen 0.9,0.82 font ',16' center tc ls 2

unset key
set border 0
unset tics
set tmargin 0
set bmargin 0
set lmargin 0
set rmargin 0

# get election results for every state
ELEC=''
stats 'election.txt' u 1:(ELEC = ELEC.sprintf('%i',$2))

set xrange [-125:-66.7]    
set yrange [24:55]
set size ratio -1

set multiplot
plot for [idx=0:48] 'usa.txt' i idx u 2:1 w filledcurves ls ELEC[idx+1:idx+1],\
                    ''              u 2:1 w l ls 3
unset label
# Alaska
set size 0.4,0.4
set origin 0,0
set xrange [-180:-120]
set yrange [50:75]
plot 'usa.txt' i 50 u 2:1 w filledcurves ls 2
# Hawaii
set origin 0.1,0
set xrange [-180:-150]
set yrange [18:29]
plot 'usa.txt' i 49 u 2:1 w filledcurves ls 1

unset multiplot
