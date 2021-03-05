clear
reset

set terminal png
set output "./figures/P_02_0005.png"
set title 'Trajectory of 2 particle with dt = 0.005'
set xlabel 'x'
set ylabel 'y'


plot './data/P_02_0005.dat' using 1:2 with points pt 6 lc rgb '#ff0000' title "Particle 1",\
'./data/P_02_0005.dat' using 3:4 with points pt 6 lc rgb '#00ff00' title "Particle 2"

set terminal epslatex color
set output "../Report/figures/P_02_0005.tex"

replot