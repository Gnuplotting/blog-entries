#electron draws a electron as an gnuplot object
#
# Usage: call 'electron.gnu' 'x' 'y' 'size'
#

# AUTHOR: Hagen Wierstorf

# Getting the input parameters
x = $0
y = $1
s = $2

# Initialize an object number
if (!exists("object_number")) object_number = 1;
# Initialize a label number
if (!exists("label_number")) label_number = 1;

# Functions
size(x,n) = s*(1-0.8*x/n)
r(x,n) = floor(240.0*x/n)
g(x,n) = floor(144.0*x/n)+96
b(x,n) = floor(67.0*x/n)+173
blue(x,n) = sprintf("#%02X%02X%02X",r(x,n),g(x,n),b(x,n))
posx(X,x,n) = X + 0.03*x/n
posy(Y,x,n) = Y + 0.03*x/n

# Draw circles
max = 30
set for [n=0:max-1] object n+object_number circle \
    at posx(x,n,max/1.0),posy(y,n,max/1.0) size size(n,max/1.0)
set for [n=0:max-1] object n+object_number \
    fc rgb blue(n,max/1.0) fillstyle solid noborder lw 0
# Draw label
#set label label_number '-' at x,y center

# Set new object and label number
object_number = object_number+max
label_number = label_number+1
