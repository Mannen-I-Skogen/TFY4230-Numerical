clear
reset

set term gif animate delay 1
set output "./figures/trajectoryAni_02particles_0010dt.gif"
set xrange[-2:12]
set yrange[-2:12]
stats "./data/trajectoryAni_02particles_0010dt.dat" name "A"

do for [i=0:A_blocks-1] { plot "./data/trajectoryAni_02particles_0010dt.dat"  index i with points pt 6 title "Particles"}


set term gif animate delay 1
set output "./figures/trajectoryAni_03particles_0010dt.gif"
set xrange[-2:12]
set yrange[-2:12]
stats "./data/trajectoryAni_03particles_0010dt.dat" name "A"

do for [i=0:A_blocks-1] { plot "./data/trajectoryAni_03particles_0010dt.dat"  index i with points pt 6 title "Particles"}
