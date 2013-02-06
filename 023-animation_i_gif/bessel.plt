# bessel loop
t = t + 0.02
outfile = sprintf('animation/bessel%03.0f.png',50*t)
set output outfile
splot u*sin(v),u*cos(v),bessel(u,t) w pm3d ls 1
if(t<end_time) reread;
