#! /usr/bin/gnuplot
# generate a PCA plot
# AUTHOR: Hagen Wierstorf
reset

set terminal epslatex standalone
set output 'line_break.tex'

# Use commata in file
set datafile separator ','

# Styling
set style line 1 lc rgb '#949599' pt 6 lt 1 lw 1 # grey
set style line 2 lc rgb '#000000' pt 7 lt 1 lw 2 # black
set style line 3 lc rgb '#d6d7d9' lt 2 lw 1 # lightgrey

set size ratio -1
unset key

set tics scale 0.75
set format '$%g$'
set xtics ('' -1.5,-1,'' -0.5,0,'' 0.5,1,'' 1.5)
set ytics (-1,'' -0.5,0,'' 0.5,1)
set yrange[-1.4:1.4]
set xrange[-1.7:1.7]
set xlabel "Principal Component 1"
set ylabel "Principal Component 2"

# Set Grid on x- and y-axis
set xzeroaxis ls 3
set yzeroaxis ls 3

# Labels for the positive attributes
s = '\scriptsize{'
set label s.'center}' at -0.98,1.1 textcolor ls 1
set label s.'non-phasey}' at -1.2,0.42 textcolor ls 1
set label s.'few artifacts}' at -1.2,-1.02 textcolor ls 1
set label s.'\shortstack{natural +\\little comb filter}}' \
    at -1.65,-0.35 textcolor ls 1
set label s.'little coloration}' at -1.55,0.16 textcolor ls 1
# Labels for the negative attributes
set label s.'off-center}' at 0.68,-1.1 textcolor ls 1
set label s.'phasey}' at 0.95,-0.38 textcolor ls 1
set label s.'many artifacts}' at 0.7,1.0 textcolor ls 1
set label s.'\shortstack{unnatural +\\much comb filter}}' \
    at 0.83,0.32 textcolor ls 1
set label s.'much coloration}' at 0.85,-0.1 textcolor ls 1

# Labels for the conditions
set label '$S_1$' at -1.48,0.45 textcolor ls 2
set label '$S_2$' at -0.88,-0.25 textcolor ls 2
set label '$S_3$' at -0.33,-0.5 textcolor ls 2
set label '$S_4$' at 0.61,-0.42 textcolor ls 2
set label '$S_5$' at -0.5,0.3 textcolor ls 2
set label '$S_6$' at 0.55,0.29 textcolor ls 2
set label '$S_7$' at 1.14,0.11 front textcolor ls 2

plot 'stim.dat' u 2:3 with points ls 2, \
     'attr.dat' u 2:3 with points ls 1, \
     ''         u (-$2):(-$3) with points ls 1, \
     ''         u (-$2):(-$3):(2*$2):(2*$3) with vectors nohead ls 1
