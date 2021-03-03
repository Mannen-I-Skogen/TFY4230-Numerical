clear
reset

set terminal png
set output "./figures/trajectory_01particles_0040dt.png"
set title 'Trajectory of 1 particle with dt = 0.04'
set xlabel 'x'
set ylabel 'y'


plot './data/trajectory_01particles_0040dt.dat' using 1:2 with points pt 6 lc rgb '#000000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/trajectory_01particles_0040dt.tex"

replot

set terminal png
set output "./figures/trajectory_01particles_0020dt.png"
set title 'Trajectory of 1 particle with dt = 0.02'
set xlabel 'x'
set ylabel 'y'


plot './data/trajectory_01particles_0020dt.dat' using 1:2 with points pt 6 lc rgb '#000000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/trajectory_01particles_0020dt.tex"

replot


set terminal png
set output "./figures/trajectory_01particles_0010dt.png"
set title 'Trajectory of 1 particle with dt = 0.01'
set xlabel 'x'
set ylabel 'y'


plot './data/trajectory_01particles_0010dt.dat' using 1:2 with points pt 6 lc rgb '#000000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/trajectory_01particles_0010dt.tex"

replot



set terminal png
set output "./figures/trajectory_01particles_0005dt.png"
set title 'Trajectory of 1 particle with dt = 0.005'
set xlabel 'x'
set ylabel 'y'


plot './data/trajectory_01particles_0005dt.dat' using 1:2 with points pt 6 lc rgb '#000000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/trajectory_01particles_0005dt.tex"

replot