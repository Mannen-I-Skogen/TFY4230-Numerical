clear
reset

set term gif animate delay 1
set output "./figures/trajectoryAni.gif"
set xrange[-2:12]
set yrange[-2:12]
stats "trajectoryAni0250steps.dat" name "A"

do for [i=0:A_blocks-1] { plot "trajectoryAni0250steps.dat" using 1:2 index i with points pt 6 title "Ball"}
