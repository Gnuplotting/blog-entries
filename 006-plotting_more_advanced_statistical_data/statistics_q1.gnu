#!/usr/bin/gnuplot
#
# Plot statistics for three groups under two different conditions and indicate a
# significant difference between the groups (p < 0.01)
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'statistics_q1.png'

# color definitions
set border linewidth 1.5
set style line 1 lc rgb 'gray30' lt 1 lw 2
set style line 2 lc rgb 'gray40' lt 1 lw 2
set style line 3 lc rgb 'gray70' lt 1 lw 2
set style line 4 lc rgb 'gray90' lt 1 lw 2
set style line 5 lc rgb 'black' lt 1 lw 1.5

set style fill solid 1.0 border rgb 'grey30'

set key right top
set border 3

set tics scale 0.75
set xtics nomirror out ('Condition 1' 0,'Condition 2' 1)
set ytics nomirror out 0.5 

set yrange [0:1.3]
set xrange [-0.6:2]

# Draw line for significant test
set arrow 1 from 0,1 to 1,1 nohead ls 5
set arrow 2 from 0,1 to 0,0.95 nohead ls 5
set arrow 3 from 1,1 to 1,0.95 nohead ls 5
set label '**' at 0.5,1.05 center 

# Size of one box
bs = 0.15

# Plot mean with variance (std^2) as boxes with yerrorbar
plot 'statistics.dat' i 0 u ($0-1.5*bs):1:($2**2) notitle w yerrorb ls 1, \
     ''               i 0 u ($0-1.5*bs):1:(bs) t 'A' w boxes ls 2, \
     ''               i 1 u ($0-0.5*bs):1:($2**2) notitle w yerrorb ls 1, \
     ''               i 1 u ($0-0.5*bs):1:(bs) t 'B' w boxes ls 3, \
     ''               i 2 u ($0+0.5*bs):1:($2**2) notitle w yerrorb ls 1, \
     ''               i 2 u ($0+0.5*bs):1:(bs) t 'C' w boxes ls 4, \
     ''               i 3 u ($0+1.5*bs):1:($2**2) notitle w yerrorb ls 1, \
     ''               i 3 u ($0+1.5*bs):1:(bs) t 'D' w boxes lt 1 lw 2 \
        lc rgb 'white'
