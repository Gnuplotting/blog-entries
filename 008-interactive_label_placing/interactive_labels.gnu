#! /usr/bin/gnuplot
#
# Place the labels interactive in a given plot. The positions of the labels are
# promted to the console in order to use them in a next step in the plot
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist

# Styling
set border linewidth 1.5
set style line 1 lc rgb 'black' pt 5 ps 2   # square
set style line 2 lc rgb 'black' pt 7 ps 2   # circle
set style line 3 lc rgb 'black' pt 9 ps 2   # triangle

unset key

set tics scale 0.75
set xtics 1
set ytics 1
set yrange[0:3]
set xrange[0.5:3.5]
set xlabel 'x' 
set ylabel 'y'

# Plot some points 
plot "<echo '1 2'"   with points ls 1, \
     "<echo '2 1'"   with points ls 2, \
     "<echo '3 1.5'" with points ls 3


# Enable interactive use of the mouse
set mouse

# Adding the labels (INTERACTIVE)
print "\nPosition the labels with your left mouse until you are convinced \
with their position by pressing another key.\n"

call 'label_loop.gnu' 'square'
call 'label_loop.gnu' 'circle'
call 'label_loop.gnu' 'triangle'

print "Done"
