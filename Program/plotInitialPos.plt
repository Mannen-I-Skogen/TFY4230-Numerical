clear
reset

set terminal png
set output "./figures/initialPos.png"
set title 'Initial position of particles'
set xlabel 'x'
set ylabel 'y'
stats './data/initialPos.dat' using 1 name "X"
stats './data/initialPos.dat' using 2 name "Y"
set xrange[X_min-2:X_max+2]
set yrange[Y_min-2:Y_max+2]

plot './data/initialPos.dat' using 1:2 with points pt 6 ps 5 lc rgb '#ff0000' title 'particles'