clear
reset

set terminal png
set output "./figures/P_01_0005.png"
set title 'Trajectory of 1 particle with dt = 0.005'
set xlabel 'x'
set ylabel 'y'


plot './data/P_01_0005.dat' using 1:2 with points pt 7 ps 1 lc rgb '#ff0000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/P_01_0005.tex"

replot