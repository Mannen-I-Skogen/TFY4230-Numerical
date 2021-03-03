clear
reset

set terminal png
set output "./figures/trajectory_02particles_0005dt.png"
set title 'Trajectory of 2 particle with dt = 0.005'
set xlabel 'x'
set ylabel 'y'


plot './data/trajectory_02particles_0005dt.dat' using 1:2 with points pt 6 lc rgb '#ff0000' title "Particle 1",\
'./data/trajectory_02particles_0005dt.dat' using 3:4 with points pt 6 lc rgb '#00ff00' title "Particle 2"

set terminal epslatex color
set output "../Report/figures/trajectory_02particles_0005dt.tex"

replot


set terminal png
set output "./figures/trajectory_03particles_0005dtt.png"
set title 'Trajectory of 3 particle with dt = 0.005'
set xlabel 'x'
set ylabel 'y'


plot './data/trajectory_03particles_0005dt.dat' using 1:2 with points pt 6 lc rgb '#ff0000' title "Particle 1",\
'./data/trajectory_03particles_0005dt.dat' using 3:4 with points pt 6 lc rgb '#00ff00' title "Particle 2",\
'./data/trajectory_03particles_0005dt.dat' using 5:6 with points pt 6 lc rgb '#0000ff' title "Particle 3"

set terminal epslatex color
set output "../Report/figures/trajectory_02particles_0005dt.tex"

replot