#!/usr/bin/gnuplot
#
# Demonstration of a common use scenario of the multiplot environment.
#
# AUTHOR: Hagen Wierstorf
#

reset

# wxt terminal
set terminal wxt size 350,350 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,350 enhanced font 'Verdana,10'
#set output 'multiplot4.png'

# color definitions
set style line  1 lc rgb '#0060ad' pt 5 ps 0.2 lt 1 lw 2    # blue

unset key

# Enable the use of macros
set macros

# Functions (1/0 means not defined)
a = 0.9
f(x) = abs(x)<2*pi ? a*sin(x)           : 1/0
g(x) = abs(x)<2*pi ? a*sin(x+pi/2)      : 1/0
h(x) = abs(x)<2*pi ? a*sin(x+pi)        : 1/0
k(x) = abs(x)<2*pi ? a*sin(x+3.0/2*pi)  : 1/0

set tics scale 0.5
set ytics 1
set xrange [-2.5*pi:2.5*pi]
set yrange [-1.5:1.5]

# MACROS
# x- and ytics for each row resp. column
NOXTICS = "set xtics ('' -2*pi, '' -pi,'' 0, '' pi, '' 2*pi); \
          unset xlabel"
XTICS = "set xtics ('-2π' -2*pi, '-π' -pi,'0' 0, 'π' pi, '2π' 2*pi);\
          set xlabel 'x'"
NOYTICS = "set format y ''; unset ylabel"
YTICS = "set format y '%.0f'; set ylabel 'y'"
# Margins for each row resp. column
TMARGIN = "set tmargin at screen 0.95; set bmargin at screen 0.55"
BMARGIN = "set tmargin at screen 0.55; set bmargin at screen 0.15"
LMARGIN = "set lmargin at screen 0.15; set rmargin at screen 0.55"
RMARGIN = "set lmargin at screen 0.55; set rmargin at screen 0.95"
# Placement of the a,b,c,d labels in the graphs
POS = "at graph 0.92,0.9 font ',8'"

### Start multiplot (2x2 layout)
set multiplot layout 2,2 rowsfirst
# --- GRAPH a
@TMARGIN; @LMARGIN
@NOXTICS; @YTICS
set label 1 'a' @POS
plot f(x) with lines ls 1
# --- GRAPH b
@TMARGIN; @RMARGIN
@NOXTICS; @NOYTICS
set label 1 'b' @POS
plot g(x) with lines ls 1
# --- GRAPH c
@BMARGIN; @LMARGIN
@XTICS; @YTICS
set label 1 'c' @POS
plot h(x) with lines ls 1
# --- GRAPH d
@BMARGIN; @RMARGIN
@XTICS; @NOYTICS
set label 1 'd' @POS
plot k(x) with lines ls 1
unset multiplot
### End multiplot
