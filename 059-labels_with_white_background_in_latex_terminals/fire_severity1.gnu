#!/usr/bin/gnuplot
#
# Fire severity in cairolatex with white background labels
#
# AUTHOR: Hagen Wierstorf
# gnuplot 4.6 patchlevel 6

reset

set terminal cairolatex standalone pdf size 16cm,10.5cm dashed transparent \
monochrome header '\newcommand{\hl}[1]{\setlength{\fboxsep}{0.75pt}\colorbox{white}{#1}}'
set output 'fire_severity1.tex'

unset key
set grid xtics ytics ls 3 lw 1 lc rgb 'gray'

set xlabel 'Time / min.'
set ylabel 'Room temperature / $^\circ$C'
set xrange [0:180]
set yrange [0:1200]

set label 1 at  50, 250 '\hl{\small $t_\textrm{Nc}$}' center rotate by 45 front
set label 2 at  90, 100 '\small \shortstack[l]{\hl{Temperature of reference point} \\ \hl{during construction $t_\textrm{Nc} / t_\textrm{rc}$}}' front
set label 3 at  80, 250 '\hl{\small $t_\textrm{rc}$}' center rotate by 35 front
set label 4 at  40, 490 '\hl{\small Critical temperature $t_\textrm{crit}$}' center front
set label 5 at 130,1100 '\hl{\small Standard temperature $t_\textrm{N}$}' center rotate by   6 front
set label 6 at 110, 700 '\hl{\small Real fire temperature $t_\textrm{s}$}' center rotate by -38 front

TN(x)    = 345*log10(8*x+1)+20
TNc(x)   = (x >= 0 && x <=  80) ? 0.08*x*x  : 1/0
Trc(x)   = (x >= 0 && x <= 120) ? 0.034*x*x : 1/0
Tcrit(x) = 450

plot  TN(x)    lw 3, \
      TNc(x)   lw 3 lt 1, \
      Trc(x)   lw 3 lt 2, \
      'fire_severity.txt' u 1:2 w l lt 2 lw 3, \
      Tcrit(x) lw 3 lt 5

# vim: set tw=200:
