clear
reset

set terminal png
set output "./figures/energy_01particles_0040dt.png"
set title 'Total energy of 1 particle with dt = 0.04'
set xlabel 'T'
set ylabel 'E'
stats "./data/energy_01particles_0040dt.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/energy_01particles_0040dt.dat' using 1:2 with lines lt 2 lc rgb '#000000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/energy_01particles_0040dtsteps.tex"

replot


set terminal png
set output "./figures/energy_01particles_0020dt.png"
set title 'Total energy of 1 particle with dt = 0.02'
set xlabel 'T'
set ylabel 'E'

plot './data/energy_01particles_0020dt.dat' using 1:2 with lines lt 2 lc rgb '#000000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/energy_01particles_0020dt.tex"

replot


set terminal png
set output "./figures/energy_01particles_0010dt.png"
set title 'Total energy of 1 particle with dt = 0.01'
set xlabel 'T'
set ylabel 'E'

plot './data/energy_01particles_0010dt.dat' using 1:2 with lines lt 2 lc rgb '#000000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/energy_01particles_0010dt.tex"

replot


set terminal png
set output "./figures/energy_01particles_0005dt.png"
set title 'Total energy of 1 particle with dt = 0.005'
set xlabel 'T'
set ylabel 'E'

plot './data/energy_01particles_0005dt.dat' using 1:2 with lines lt 2 lc rgb '#000000' title "Energy"

set terminal epslatex
set output "../Report/figures/energy_01particles_0005dt.tex"

replot

reset
clear
set terminal png
set output "./figures/energy_02particles_0005dt.png"
set title 'Total energy of 2 particles with dt = 0.005'
set xlabel 'T'
set ylabel 'E'
stats "./data/energy_02particles_0005dt.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/energy_02particles_0005dt.dat' using 1:2 with lines lt 2 lc rgb '#000000' title "Energy"

set terminal epslatex
set output "../Report/figures/energy_02particles_0005dt.tex"

replot


reset
clear
set terminal png
set output "./figures/energy_02particles_0010dt.png"
set title 'Total energy of 2 particles with dt = 0.01'
set xlabel 'T'
set ylabel 'E'
stats "./data/energy_02particles_0010dt.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/energy_02particles_0010dt.dat' using 1:2 with lines lt 2 lc rgb '#000000' title "Energy"

set terminal epslatex
set output "../Report/figures/energy_02particles_0010dt.tex"

replot


reset
clear
set terminal png
set output "./figures/energy_03particles_0005dt.png"
set title 'Total energy of 3 particles with dt = 0.005'
set xlabel 'T'
set ylabel 'E'
stats "./data/energy_03particles_0005dt.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/energy_03particles_0005dt.dat' using 1:2 with lines lt 2 lc rgb '#000000' title "Energy"

set terminal epslatex
set output "../Report/figures/energy_03particles_0005dt.tex"

replot