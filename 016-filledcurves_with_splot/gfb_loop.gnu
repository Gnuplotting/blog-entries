# Loop to plot gammatone filters as filledcurves within a 3D plot
# NOTE: the variables i and maxi have to exists
# AUTHOR: Hagen Wierstorf
splot 'gfb.dat' u 2:1:(column(data(i))) w filledcurves ls sty(data(i)), \
      ''        u 2:1:(column(data(i))) ls 4
i = i+1
if (i<maxi) reread
