#!/usr/bin/gnuplot
#
# Plot some photon flux density with the epslatex terminal and change the font
# size of the labels
#
# AUTHOR: Hagen Wierstorf
# gnuplot 4.6 patchlevel 0

reset

# epslatex
set terminal epslatex size 9cm,7cm color colortext standalone header \
"\\newcommand{\\ft}[0]{\\footnotesize}"
set output 'photo_luminescense2.tex'

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

set xrange [0.6:1.9]
set xtics 0.1,0.2,1.9
set xlabel 'Photon energy / eV'
set ylabel 'Phot. flux density / m$^{-2}$s$^{-1}$eV$^{-1}$sr$^{-1}$' offset 1,-0.5
set logscale y
set yrange [1e7:1e22]
set format '$%g$'
set format y '$10^{%T}$'

set datafile separator ","

# getting slope for text placing
set label 2 '\ft $5$\,meV'         at 1.38,4e9     rotate by  78.5 center tc ls 1
set label 3 '\ft $10$\,meV'        at 1.24,2e10    rotate by  71.8 center tc ls 2
set label 4 '\ft $20$\,meV'        at 1.01,9e11    rotate by  58.0 center tc ls 3
set label 5 '\ft $40$\,meV'        at 0.81,1e15    rotate by  43.0 center tc ls 4
set label 6 '\ft $60$\,meV'        at 0.76,9e16    rotate by  33.0 center tc ls 5
set label 7 '\ft $80$\,meV'        at 0.74,2.5e18  rotate by  22.0 center tc ls 6
set label 8 '\ft $E_0 = 100$\,meV' at 1.46,5e18    rotate by -40.5 center tc ls 7
 
plot 'PL_spectrum_mu_1.0eV_E0_05meV_300K.dat'  u 1:2 w l ls 1, \
     'PL_spectrum_mu_1.0eV_E0_10meV_300K.dat'  u 1:2 w l ls 2, \
     'PL_spectrum_mu_1.0eV_E0_20meV_300K.dat'  u 1:2 w l ls 3, \
     'PL_spectrum_mu_1.0eV_E0_40meV_300K.dat'  u 1:2 w l ls 4, \
     'PL_spectrum_mu_1.0eV_E0_60meV_300K.dat'  u 1:2 w l ls 5, \
     'PL_spectrum_mu_1.0eV_E0_80meV_300K.dat'  u 1:2 w l ls 6, \
     'PL_spectrum_mu_1.0eV_E0_100meV_300K.dat' u 1:2 w l ls 7
