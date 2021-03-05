clear
reset

set terminal png
set output "./figures/K_01_0005.png"
set title 'Kinetic energy of particle 1 with dt = 0.005'
set xlabel 'T'
set ylabel 'E'
stats "./data/K_01_0005.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/K_01_0005.dat' using 1:2 with lines lt 2 lc rgb '#000000' title "Particle 1"

set terminal epslatex color
set output "../Report/figures/K_01_0005.tex"

replot


clear
reset


set terminal png
set output "./figures/K_02_0005.png"
set title 'Kinetic energy of paticles with dt = 0.005'
set xlabel 'T'
set ylabel 'E'
stats "./data/K_02_0005.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/K_02_0005.dat' using 1:2 with lines lt 2 lc rgb '#0000ff' title "Particle 1", \
'./data/K_02_0005.dat' using 1:3 with lines lt 2 lc rgb '#00ff00' title "Particle 2"

set terminal epslatex color
set output "../Report/figures/K_02_0005.tex"

replot