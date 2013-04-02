#!/usr/bin/gnuplot
#
# Plotting the world with Mercator projection
#
# AUTHOR: Hagen Wierstorf
# VERSION: gnuplot 4.6 patchlevel 0

reset

# png
set terminal pngcairo size 350,175 background '#c8ebff' \
    enhanced font 'Verdana,10'

# color definitions
set border lw 1.5
set linetype 1 lc rgb '#000000' lt 1 lw 1
set linetype 2 lc rgb '#fefee4' lt 2 lw 1

unset key; unset border
set grid front lc rgb '#808080' lt 0 lw 1 
set tics scale 0
set lmargin screen 0
set bmargin screen 0
set rmargin screen 1
set tmargin screen 1
set format ''

set mapping spherical
set angles degrees

set yrange [-90:90]
set xrange [-180:180]
set ytics 20
set xtics 20

# === Equirectangular projection ===
set output 'equirectangular_projection.png'
plot 'world_110m.txt' i 0 w filledcu ls 2, \
     ''               i 1 w filledcu x1 ls 2, \
     ''                   w l ls 1

# === Mercator projection ===
set terminal pngcairo size 350,350
set output 'mercator_projection.png'
mercator(latitude) = log( tan(180/4.0 + latitude/2.0) )
set yrange [-3.1:3.1]
set ytics 0
do for [angle=-80:80:20] {
    set ytics add (sprintf('%.0f',angle) mercator(angle))
}
plot 'world_110m.txt' i 0 u 1:((mercator($2))) w filledcu ls 2, \
     ''               i 1 u 1:((mercator($2))) w filledcu x1 ls 2, \
     ''               u 1:((mercator($2))) w l ls 1
