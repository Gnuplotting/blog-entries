#!/usr/bin/gnuplot
#
# Creating a video animation with the do command
#
# AUTHOR: Hagen Wierstorf
# GNUPLOT: 4.6 patchlevel 0

reset

# png
set terminal pngcairo size 350,200 enhanced font 'Verdana,10'

# color definitions
set style line 1 lc rgb '#0060ad' lt 1 lw 1.5 # --- blue
# border
set style line 101 lc rgb '#808080' lt 1
set border 0 back ls 101
set tics out nomirror scale 0
set format ''
# grid
set style line 102 lc rgb '#ddccdd' lt 1 lw 0.5 # --- red
set grid xtics ytics back ls 102

unset key
set xtics 0.1
set ytics 0.15
set xrange [0:4.8]
set yrange [-0.75:0.75]
set lmargin screen 0.02
set rmargin screen 0.98

do for [ii=1:360] {
    set output sprintf('hrir_frame%03.0f.png',ii)
    set multiplot layout 2,1
    set tmargin screen 0.95
    set bmargin screen 0.60
    set label 1 'Left' at 0.1,0.55 left front
    set label 2 sprintf('%d°',ii-181) at 4.8,0.6 right front font 'Verdana,12'
    plot 'ir.txt' u ($1*1000):2*ii w l ls 1
    set tmargin screen 0.55
    set bmargin screen 0.20
    set label 1 'Right'
    unset label 2
    # x axis
    set arrow from 0,-1.3 to 4.8,-1.3 nohead front
    set for [jj=0:4] arrow from jj,-1.35 to jj,-1.25 nohead \
        front ls 101
    set for [jj in '0 2 4'] label jj.' ms' at jj-0.05,-1.1 front tc ls 101
    plot 'ir.txt' u ($1*1000):2*ii+1 w l ls 1
    unset arrow
    unset label
    unset multiplot
}

# Create movie with mencoder
ENCODER = system('which mencoder');
if (strlen(ENCODER)==0) print '=== mencoder not found ==='; exit
CMD = 'mencoder mf://*.png -mf fps=25:type=png -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell -oac copy -o hrir.avi'
system(CMD)

# Create webm
ENCODER = system('which ffmpeg')
if (strlen(ENCODER)==0) print '=== ffmpeg not found, exit ==='; exit
CMD = 'ffmpeg -i hrir.avi hrir.webm'
system(CMD)

# Clear directory
system('rm *.png')
