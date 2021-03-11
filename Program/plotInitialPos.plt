clear
reset

set terminal png size 1024,768
set output "./figures/initialPos.png"
set title 'Initial position of particles'
set xlabel 'x'
set ylabel 'y'
set size ratio -1
set grid
set xtics 1
set ytics 1
stats './data/initialPos.dat' index 0 using 1 name "X"
stats './data/initialPos.dat' index 0 using 2 name "Y"
stats './data/initialPos.dat' index 1 using 1 name "LX"
stats './data/initialPos.dat' index 1 using 2 name "LY"
set xrange[0-2:LX_max+2]
set yrange[0-2:LY_max+2]

plot './data/initialPos.dat' index 0 using 1:2 with points pt 6 ps 5 lc rgb '#ff0000' title 'particles'