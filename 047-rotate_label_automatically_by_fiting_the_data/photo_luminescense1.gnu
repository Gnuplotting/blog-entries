#!/usr/bin/gnuplot
#
# Plot some photon flux density and rotate labels by the slope we get by fiting
# the data
#
# AUTHOR: Hagen Wierstorf
# gnuplot 4.6 patchlevel 0

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
set output 'photo_luminescense1.png'

# color definitions
set border linewidth 1.5
set style line 1 lc rgb '#800000' lt 1 lw 2
set style line 2 lc rgb '#ff0000' lt 1 lw 2
set style line 3 lc rgb '#ff4500' lt 1 lw 2
set style line 4 lc rgb '#ffa500' lt 1 lw 2
set style line 5 lc rgb '#006400' lt 1 lw 2
set style line 6 lc rgb '#0000ff' lt 1 lw 2
set style line 7 lc rgb '#9400d3' lt 1 lw 2

unset key

# Axes
set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror out scale 0.75
# Grid
set style line 12 lc rgb'#808080' lt 0 lw 1
set grid back ls 12

set mxtics 2
set mytics 10

xmin = 0.6
xmax = 1.9
ymin = 1e7
ymax = 1e22
set xrange [xmin:xmax]
set xtics 0.1,0.2,1.9
set xlabel 'Photon energy / eV'
set ylabel 'Phot. flux density / m^{-2}s^{-1}eV^{-1}sr^{-1}' offset -1,0
set logscale y
set yrange [ymin:ymax]
set format y '10^{%T}'

# get the relation of x- and y-range
dx = xmax-xmin
dy = log(ymax)-log(ymin)
s1 = dx/dy
# get the ratio of the axes (because we do not use set size ratio due
# to the log scale of the y-axis)
s2 = 5/6.7
# function for fiting
f(x) = a*x+b
# helper function for getting the rotation angle of the labels in degree
deg(x) = x/pi*180.0
r(x) = deg(atan(s1*s2*x))

set datafile separator ","

# getting slope for text placing
fit [1.30:1.34] [*:*] f(x) 'PL_spectrum_mu_1.0eV_E0_05meV_300K.dat' u 1:(log($2)) via a,b
set label 2 '5 meV'         at 1.38,4e9   rotate by r(a) center tc ls 1
fit [1.13:1.27] [*:*] f(x) 'PL_spectrum_mu_1.0eV_E0_10meV_300K.dat' u 1:(log($2)) via a,b
set label 3 '10 meV'        at 1.24,2e10  rotate by r(a) center tc ls 2
fit [0.92:0.96] [*:*] f(x) 'PL_spectrum_mu_1.0eV_E0_20meV_300K.dat' u 1:(log($2)) via a,b
set label 4 '20 meV'        at 1.01,9e11  rotate by r(a) center tc ls 3
fit [0.79:0.83] [*:*] f(x) 'PL_spectrum_mu_1.0eV_E0_40meV_300K.dat' u 1:(log($2)) via a,b
set label 5 '40 meV'        at 0.81,1e15  rotate by r(a) center tc ls 4
fit [0.73:0.77] [*:*] f(x) 'PL_spectrum_mu_1.0eV_E0_60meV_300K.dat' u 1:(log($2)) via a,b
set label 6 '60 meV'        at 0.76,9e16  rotate by r(a) center tc ls 5
fit [0.71:0.75] [*:*] f(x) 'PL_spectrum_mu_1.0eV_E0_80meV_300K.dat' u 1:(log($2)) via a,b
set label 7 '80 meV'        at 0.74,2.5e18  rotate by r(a) center tc ls 6
fit [1.22:1.61] [*:*] f(x) 'PL_spectrum_mu_1.0eV_E0_100meV_300K.dat' u 1:(log($2)) via a,b
set label 8 'E_0 = 100 meV' at 1.46,5e18  rotate by r(a) center tc ls 7
 
plot 'PL_spectrum_mu_1.0eV_E0_05meV_300K.dat'  u 1:2 w l ls 1, \
     'PL_spectrum_mu_1.0eV_E0_10meV_300K.dat'  u 1:2 w l ls 2, \
     'PL_spectrum_mu_1.0eV_E0_20meV_300K.dat'  u 1:2 w l ls 3, \
     'PL_spectrum_mu_1.0eV_E0_40meV_300K.dat'  u 1:2 w l ls 4, \
     'PL_spectrum_mu_1.0eV_E0_60meV_300K.dat'  u 1:2 w l ls 5, \
     'PL_spectrum_mu_1.0eV_E0_80meV_300K.dat'  u 1:2 w l ls 6, \
     'PL_spectrum_mu_1.0eV_E0_100meV_300K.dat' u 1:2 w l ls 7
