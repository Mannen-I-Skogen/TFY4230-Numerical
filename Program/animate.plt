clear
reset

set term gif animate delay 1
set output "./figures/Animation.gif"
set xrange[-2:12]
set yrange[-2:12]
stats "./data/animate.dat" name "A"

do for [i=0:A_blocks-1] { plot "./data/animate.dat"  index i with points pt 6 ps 5 lc rgb '#ff0000' title "Particles"}