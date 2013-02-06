#!/usr/bin/gnuplot
#
# Generate an animated spiral
#
# AUTHOR: Hagen Wierstorf

reset

# png
set terminal pngcairo size 350,262 enhanced font 'Verdana,10'

# color definitions
set style line 1 lc rgb '#0060ad' lt 1 lw 2 pt 7 ps 2 # --- blue

unset key
set border 0
unset tics
set view 342,0
set xrange [-1:1]
set yrange [0:20]
set zrange [-1:1]
# spiral upwards
n=0
do for [ii=1:99] {
    n=n+1
    set output sprintf('png/spiral%03.0f.png',n)
    splot 'spiral.txt' every ::1::ii w l ls 1, \
          'spiral.txt' every ::ii::ii w p ls 1
}
# spiral downwards
do for [ii=99:1:-1] {
    n=n+1
    set output sprintf('png/spiral%03.0f.png',n)
    splot 'spiral.txt' every ::1::ii w l ls 1, \
          'spiral.txt' every ::ii::ii w p ls 1
}
