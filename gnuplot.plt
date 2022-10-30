# plot.plt
set title "TEMPERATURE PROFILE"
set nokey
set autoscale
set grid
set xlabel "TEMPERATURE"
set ylabel "LAYER NUMBER"
unset label
m="data.txt"
plot m using 1:2 with linespoints

