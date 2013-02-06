# huygen loop
counter = counter+1
r = r+dr 
set output outfile(counter)
@pw
plot for [x=-15:15] cx(t,x/10.0),cy(t,y) ls 2
if (r<=LAMBDA) \
    reread; \
else if (y<YMAX-LAMBDA) \
    y=y+LAMBDA; r=0; \
    pw = pw.'; '.wave(y); \
    reread;
